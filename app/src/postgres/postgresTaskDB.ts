import { Client, Transaction } from "../../deps.ts";
import { ProblemTasks, TaskDB, Task, TaskGroup } from '../taskDB.ts';

class PostgresTaskDB implements TaskDB {
    client: Client;

    constructor(client: Client) {
        this.client = client;
    }


    async updateTasks(problem_id: number, new_tasks: ProblemTasks): Promise<boolean> {
        const transaction = this.client.createTransaction("updating_task");
        try {
            await transaction.begin();
            const old_tasks = await this._getTasks(problem_id, transaction);
            const groups_to_remove: TaskGroup[] = [];
            const tasks_to_remove: Task[] = [];
            for (const old_group of old_tasks.groups) {
                const new_group = new_tasks.groups.find(new_group => new_group.id == old_group.id);
                if (!new_group) {
                    groups_to_remove.push(old_group);
                    continue;
                }

                for (const old_task of old_group.tasks) {
                    if (!new_group.tasks.some(new_task => new_task.id == old_task.id))
                        tasks_to_remove.push(old_task);
                }
            }

            const groups_to_add: TaskGroup[] = [];
            const tasks_to_add: { task: Task, group_id: number }[] = [];
            for (const new_group of new_tasks.groups) {
                if (!new_group.id) groups_to_add.push(new_group);
                else for (const new_task of new_group.tasks) {
                    if (!new_task.id) tasks_to_add.push({ task: new_task, group_id: new_group.id });
                }
            }

            if (groups_to_add.length != 0 || tasks_to_add.length != 0) {
                await transaction.queryObject(`SELECT erase_all_task_results($1)`, [problem_id]);
                for (const new_group of groups_to_add) {
                    const new_group_id = (await transaction.queryObject<{ id: number }>('INSERT INTO task_groups VALUES($1, $2, $3) RETURNING id', [problem_id, new_group.name, new_group.requires_all_ok])).rows[0].id;
                    for (const new_task of new_group.tasks) {
                        await transaction.queryObject(`INSERT INTO tasks VALUES ($1, $2, $3, $4, $5, $6, $7)`,
                            [new_group_id, new_task.name, new_task.test_uri, new_task.points, new_task.time_limit, new_task.memory_limit, new_task.show_output]);
                    }
                }
                for (const { task, group_id } of tasks_to_add) {
                    await transaction.queryObject(`INSERT INTO tasks VALUES ($1, $2, $3, $4, $5, $6, $7)`,
                        [group_id, task.name, task.test_uri, task.points, task.time_limit, task.memory_limit, task.show_output]);
                }
            } else {
                for (const removed_group of groups_to_remove)
                    await transaction.queryObject('DELETE FROM task_groups WHERE id=$1', [removed_group.id])
                for (const removed_task of tasks_to_remove)
                    await transaction.queryObject('DELETE FROM tasks WHERE id=$1', [removed_task.id])
            }
            for (const edited_group of new_tasks.groups) {
                if (!edited_group.id) continue;
                await transaction.queryObject('UPDATE task_groups SET name=$2, requires_all_ok=$3 WHERE id=$1', [edited_group.id, edited_group.name, edited_group.requires_all_ok])
                for (const edited_task of edited_group.tasks) {
                    if (!edited_task.id) continue;
                    await transaction.queryObject('UPDATE tasks SET name=$2, test_uri=$3, points=$4, time_limit=$5, memory_limit=$6, show_output=$7  WHERE id=$1',
                        [
                            edited_task.id, edited_task.name, edited_task.test_uri, edited_task.points, edited_task.time_limit, edited_task.memory_limit, edited_task.show_output
                        ]);
                }
            }

            await transaction.commit();
        } catch (Exception) {
            return false;
        }
        return true;
    }
    async getTasks(problem_id: number): Promise<ProblemTasks> {
        const transaction = this.client.createTransaction("getting_tasks");
        await transaction.begin();
        const result = await this._getTasks(problem_id, transaction);
        await transaction.commit();
        return result;
    }

    async _getTasks(problem_id: number, transaction: Transaction): Promise<ProblemTasks> {
        const groups: TaskGroup[] = (await transaction.queryObject<TaskGroup>(`
            SELECT * FROM task_groups WHERE problem_id = $1
        `, [problem_id])).rows;

        for (const group of groups) {
            group.tasks = (await transaction.queryObject<Task>(`
                SELECT * FROM tasks WHERE task_group = $1
            `, [group.id])).rows;
        }
        return { groups };
    }
}

export { PostgresTaskDB }