// Dummy checker that assigns statuses to problems
import { Client } from "../deps.ts"
import { Submit } from "./db.ts";
import { PostgresResultDB } from "./postgres.ts"
import { SubmitResultsDB, NewTaskResult } from "./submitDB.ts"
import { TaskDB } from "./taskDB.ts"
interface Checker {
    submit(submit: Submit, source_uri: string): Promise<string>;
    listen(submit_id: number, callback: any): void;
}

interface CheckerConfig {
    client: Client,
    submitResultsDB: SubmitResultsDB,
    taskDB: TaskDB,
}

class MockChecker implements Checker {
    config: CheckerConfig | null = null;
    listeners: Map<number, Array<any>>;
    constructor() {
        this.listeners = new Map();
    }

    async submit(submit: Submit, source_uri: string): Promise<string> {
        const statuses = [4, 4, 4, 4, 4, 3, 5, 6, 7];
        return new Promise((resolve, reject) =>
            setTimeout(async () => {
                const tasks = await this.config?.taskDB.getTasks(submit.problem_id);
                const results: NewTaskResult[] = [];
                if (!tasks) throw Error("taski nie dziamają");
                const is_lucky = Math.random() < 0.5;
                for (const group of tasks.groups) {
                    for (const task of group.tasks) {
                        if (!task.id)
                            throw Error("Task id should not be null")
                        results.push({
                            task_id: task.id,
                            points: is_lucky ? task.points : Math.round(Math.random() * task.points * 10) / 10,
                            summary: "",
                            execution_time: Math.random(),
                            used_memory: Math.round(Math.random() * 10000),
                            status_id: is_lucky ? 4 : statuses[Math.floor(Math.random() * statuses.length)]

                        })
                    }
                }

                await this.config?.submitResultsDB.setSubmitResults(submit.id, results)

                const listeners = this.listeners.get(submit.id) || [];
                for (const l of listeners)
                    l("OK");
                this.listeners.delete(submit.id);
                resolve("OK")
            }, 5000))
    }

    listen(submit_id: number, callback: any) {
        if (this.listeners.has(submit_id))
            this.listeners.get(submit_id)?.push(callback);
        else
            this.listeners.set(submit_id, [callback]);
    }

    configure(config: CheckerConfig) { this.config = config; }
}



export type { Checker }
export { MockChecker }