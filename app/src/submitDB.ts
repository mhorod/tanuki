import { Client } from "../deps.ts"
import { formatDateWithTime } from "./utils.ts"
import { SourceManager } from "./source.ts"

interface SubmitResults {
    id: number,

    problem_id: number,
    short_problem_name: string,

    contest_id: number,
    contest_name: string,

    user_id: number,
    user_login: string,


    language_name: string,
    submission_time: string,


    source_uri: string,
    src: string,
    status: Status,
    group_results: Array<GroupResult>,
}

interface Status {
    id: number,
    name: string,
    points: number,
    max_points: number,
    score: number,
}

interface GroupResult {
    id: number,
    name: string,
    status: TaskStatus,
    task_results: Array<TaskResult>,
}

interface TaskResult {
    id: number,
    name: string,
    summary: string,
    execution_time: number,
    used_memory: number,
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
                    INSERT INTO task_results VALUES ($1, $2, $3, $4, $5, $6)
                `, [submit_id, new_task_result.task_id, new_task_result.status_id, new_task_result.summary, new_task_result.execution_time, new_task_result.used_memory]);
            }
            await transaction.commit();
            return true;
        } catch (Exception) {
            return false;
        }
    }

    async getSubmitResults(submit_id: number, sourceManager: SourceManager): Promise<SubmitResults> {
        const query = `
        SELECT 
            s.id,

            s.problem_id,
            p.short_name "short_problem_name",

            p.contest_id,
            c.name "contest_name",

            s.user_id,
            u.login "user_login",

            l.name "language_name",
            submission_time,
            source_uri,
            sr.score,
            statuses.name "status",
            statuses.id "status_id"
        FROM
            submits s
            LEFT JOIN submit_results sr ON s.id = sr.submit_id
            LEFT JOIN statuses ON statuses.id = sr.status
            JOIN languages l ON s.language_id = l.id
            JOIN problems p ON s.problem_id = p.id
            JOIN contests c ON p.contest_id = c.id
            JOIN users u ON s.user_id = u.id
        WHERE
            s.id = $1
        `
        const queryResult = await this.client.queryObject<any>(query, [submit_id]);


        const row: any = queryResult.rows[0];
        console.log(row)
        let results: SubmitResults = {
            id: row.id,

            problem_id: row.problem_id,
            short_problem_name: row.short_problem_name,

            contest_id: row.contest_id,
            contest_name: row.contest_name,

            user_id: row.user_id,
            user_login: row.user_login,

            language_name: row.language_name,
            submission_time: formatDateWithTime(row.submission_time),
            source_uri: row.source_uri.trim(),
            src: await sourceManager.loadSource(row.source_uri.trim()) || "",
            status: {
                id: row.status_id,
                name: row.status || "QUE",
                points: 0.5,
                max_points: 0,
                score: row.score,
            },
            group_results: [],
        };

        return results;
    }

}

export type { SubmitResultsDB, NewTaskResult }
export { PostgresSubmitResultsDB }