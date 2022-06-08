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
                console.log(tasks);
                const results: NewTaskResult[] = [];
                for (const group of tasks.groups) {
                    for (const task of group.tasks) {
                        results.push({
                            task_id: task.id,
                            summary: "",
                            execution_time: Math.random(),
                            used_memory: Math.round(Math.random() * 10000),
                            status_id: statuses[Math.floor(Math.random() * statuses.length)]

                        })
                    }
                }
                const listeners = this.listeners.get(submit.id) || [];
                for (const l of listeners)
                    l("OK");
                this.listeners.delete(submit.id);
                this.setStatus(submit.id, 2, "OK");
                resolve("OK")
            }, 5000))
    }

    listen(submit_id: number, callback: any) {
        if (this.listeners.has(submit_id))
            this.listeners.get(submit_id)?.push(callback);
        else
            this.listeners.set(submit_id, [callback]);
    }

    setStatus(submit_id: number, points: number, status: string) {
        if (this.config == null) throw Error("nope.")
        new PostgresResultDB(this.config.client).addSubmitResults(submit_id, points, status);
    }


    configure(config: CheckerConfig) { this.config = config; }
}



export type { Checker }
export { MockChecker }