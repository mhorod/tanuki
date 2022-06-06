// Dummy checker that assigns statuses to problems
import { Client } from "../deps.ts"
import { PostgresResultDB } from "./postgres.ts"
interface Checker {
    submit(id: number, source_uri: string): Promise<string>;
}

interface CheckerConfig {
    client: Client,
}

class MockChecker {
    config: CheckerConfig | null = null;

    async submit(id: number, source_uri: string): Promise<string> {
        const statuses = ["RTE", "ANS", "CME", "TLE"];
        return new Promise((resolve, reject) =>
            setTimeout(() => {
                const status = statuses[Math.floor(Math.random() * statuses.length)];
                this.setStatus(id, 2, status);
                resolve(status)
            }
                , 5000))
    }

    setStatus(submit_id: number, points: number, status: string) {
        if (this.config == null) throw Error("nope.")
        new PostgresResultDB(this.config.client).setSubmitResults(submit_id, points, status);
    }


    configure(config: CheckerConfig) { this.config = config; }
}



export type { Checker }
export { MockChecker }