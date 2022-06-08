export type { ShortSubmitResults, SubmitResultsDB, NewTaskResult }
export { PostgresSubmitResultsDB }
export { toShort }


import { Client } from "../deps.ts"
import { formatDateWithTime } from "./utils.ts"
import { SourceManager } from "./source.ts"

function toShort(results: any): ShortSubmitResults {
    return {
        id: results.id,
        problem_id: results.problem_id,
        short_problem_name: results.short_problem_name,
        contest_id: results.contest_id,
        contest_name: results.short_contest_name,
        user_id: results.user_id,
        user_name: results.user_name,
        submission_time: formatDateWithTime(results.submission_time),
        status: {
            id: results.status_id,
            // If there is no status we return QUE
            name: results.status_name || "QUE",
            points: results.status_name && roundPoints(results.points),
            max_points: results.status_name && roundPoints(results.max_points),
            score: results.status_name && roundPoints(results.score)
        }
    }
}

function roundPoints(value: number) {
    return Math.round(value * 10) / 10
}

interface ShortSubmitResults {
    id: number,

    problem_id: number,
    short_problem_name: string,

    contest_id: number,
    contest_name: string,

    user_id: number,
    user_name: string,

    submission_time: string,
    status: Status,
}

interface SubmitResults extends ShortSubmitResults {
    language_name: string,
    source_uri: string,
    src: string,
    group_results: Array<GroupResult>,
}

interface Status {
    id: number,
    name: string,
    points: number | null,
    max_points: number | null,
    score: number | null,
}

interface GroupResult {
    id: number,
    name: string,
    status: TaskStatus,
    task_results: Array<TaskResult>,
}

interface TaskResult {
    name: string,
    summary: string,
    execution_time: number,
    used_memory: number,
    used_memory_human_readable: string
    status: TaskStatus,
}

interface TaskStatus {
    id: number,
    name: string,
    points: number,
    max_points: number,
}


interface NewTaskResult {
    task_id: number,
    summary: string,
    points: number,
    execution_time: number,
    used_memory: number,
    status_id: number,
}

interface SubmitResultsDB {
    setSubmitResults(submit_id: number, results: Array<NewTaskResult>): Promise<boolean>;
    getSubmitResults(submit_id: number, sourceManager: SourceManager): Promise<SubmitResults>;
}

class PostgresSubmitResultsDB implements SubmitResultsDB {

    client: Client;

    constructor(client: Client) {
        this.client = client;
    }

    async setSubmitResults(submit_id: number, results: Array<NewTaskResult>): Promise<boolean> {
        try {
            const transaction = this.client.createTransaction("adding_submit_results");
            await transaction.begin();
            for (const new_task_result of results) {
                await transaction.queryObject(`
                    INSERT INTO task_results VALUES ($1, $2, $3, $4, $5, $6, $7)
                `, [submit_id, new_task_result.task_id, new_task_result.status_id, new_task_result.points, new_task_result.summary, new_task_result.execution_time, new_task_result.used_memory]);
            }
            transaction.queryObject("SELECT add_submit_results($1)", [submit_id]);
            await transaction.commit();
            return true;
        } catch (Exception) {
            return false;
        }
    }

    async getSubmitResults(submit_id: number, sourceManager: SourceManager): Promise<SubmitResults> {
        const query = `
        SELECT 
            * 
        FROM 
            full_submit_results
        WHERE
            id = $1
        `
        const queryResult = await this.client.queryObject<any>(query, [submit_id]);
        const row: any = queryResult.rows[0];
        const group_results = row.status_name ? await this.getGroupResults(submit_id) : [];
        let short = toShort(row);
        let results: SubmitResults = {
            ...short,
            language_name: row.language_name,
            source_uri: row.source_uri.trim(),
            src: await sourceManager.loadSource(row.source_uri.trim()) || "",
            group_results: group_results,
        };
        return results;
    }

    async getGroupResults(submit_id: number) {
        const query = `
        SELECT 
            ts.*,
            tg.name "group_name" ,
            s.name "status_name"
        FROM
            task_scores ts
            JOIN statuses s ON ts.status_id = s.id
            JOIN task_groups tg ON ts.task_group = tg.id 
        WHERE 
            submit_id = $1
        ORDER BY
            group_name,
            ts.name
        `
        const rows: any[] = (await this.client.queryObject(query, [submit_id])).rows;
        let groups = new Map<number, any>();
        for (const row of rows) {
            if (groups.has(row.task_group))
                groups.get(row.task_group).push(row)
            else
                groups.set(row.task_group, [row])
        }
        const result = []
        for (const group_id of groups.keys())
            result.push(await this.collectSingleGroup(submit_id, group_id, groups.get(group_id)))
        return result
    }

    async collectSingleGroup(submit_id: number, group_id: number, task_data: any[]) {
        const query = `
            SELECT
                task_group_status($1, $2) "status_id",
                (SELECT name FROM statuses WHERE id = task_group_status($1, $2)) "status_name",
                task_group_points($1, $2) "points",
                max_task_group_points($2) "max_points",
                name
            FROM
                task_groups
            WHERE 
                id = $2
        `;
        const row = (await this.client.queryObject<any>(query, [submit_id, group_id])).rows[0];
        const task_results: TaskResult[] = []
        for (const task of task_data) {
            let result: TaskResult = {
                name: task.name,
                summary: task.summary,
                execution_time: task.execution_time,
                used_memory: task.used_memory,
                used_memory_human_readable: this.memory_for_humans(task.used_memory),
                status: {
                    id: task.status_id,
                    name: task.status_name,
                    points: task.points,
                    max_points: task.max_points,
                }
            }
            task_results.push(result)

        }

        let result: GroupResult = {
            id: group_id,
            name: row.name,
            status: {
                id: row.status_id,
                name: row.status_name,
                points: row.points,
                max_points: row.max_points,
            },
            task_results: task_results,
        }
        return result;
    }

    memory_for_humans(mem: number) {
        if (mem < 1024) return mem.toString() + "B"
        else if (mem < 1024 * 1024) return Math.round(mem / 1024).toString() + "KiB"
        else if (mem < 1024 * 1024 * 1024) return Math.round(mem / (1024 * 1024)).toString() + "MiB"
        else return Math.round(mem / (1024 * 1024 * 1024)) + "GiB"
    }
}
