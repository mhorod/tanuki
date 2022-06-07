// Dummy checker that assigns statuses to problems
import { Client } from "../deps.ts"
import { PostgresResultDB } from "./postgres.ts"
interface Checker {
    submit(id: number, source_uri: string): Promise<string>;
    listen(submit_id: number, callback: any): void;
}

interface CheckerConfig {
    client: Client,
}

class MockChecker {
    config: CheckerConfig | null = null;
    listeners: Map<number, Array<any>>;
    constructor() {
        this.listeners = new Map();
    }

    async submit(id: number, source_uri: string): Promise<string> {
        const statuses = ["OK", "REJ", "RTE", "TLE", "ANS", "CME"];
        return new Promise((resolve, reject) =>
            setTimeout(() => {
                const status = statuses[Math.floor(Math.random() * statuses.length)];
                const listeners = this.listeners.get(id) || [];
                for (const l of listeners)
                    l(status);
                this.listeners.delete(id);
                this.setStatus(id, 2, status);
                resolve(status)
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