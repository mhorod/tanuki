import type { NewSubmit, SubmitDB, Submit } from "./../db.ts"
import { Client, ClientOptions } from "../../deps.ts"

import { PostgresResultDB } from "./../postgres.ts"

class PostgresSubmitDB implements SubmitDB {
    client: Client;

    constructor(client: Client) {
        this.client = client;
    }

    async addSubmit(newSubmit: NewSubmit): Promise<Submit | null> {
        const insertTable = [newSubmit.source_uri, newSubmit.user_id, newSubmit.problem_id, newSubmit.language_id];

        const query = `
        INSERT INTO submits VALUES(
            $1,
            $2,
            $3,
            $4,
            current_timestamp
        ) RETURNING id
        `;
        const submit_id = (await this.client.queryObject<{ id: number }>(query, insertTable)).rows[0].id;
        const submit = await this.getSubmitById(submit_id);

        return submit;
    }

    async getSubmitById(id: number): Promise<Submit | null> {
        const query = `
        SELECT 
            s.id,
            s.problem_id,
            source_uri,
            sr.score,
            statuses.name "status",
            c.name "contest_name",
            p.short_name "short_problem_name",
            l.name "language_name",
            submission_time
        FROM
            submits s
            LEFT JOIN submit_results sr ON s.id = sr.submit_id
            LEFT JOIN statuses ON statuses.id = sr.status
            JOIN languages l ON s.language_id = l.id
            JOIN problems p ON s.problem_id = p.id
            JOIN contests c ON p.contest_id = c.id
        WHERE
            s.id = $1
        `
        const queryResult = await this.client.queryObject<Submit>(query, [id]);

        if (queryResult.rowCount == 0) {
            return null;
        }
        else {
            const submit = queryResult.rows[0];
            submit.source_uri = submit.source_uri.trim();
            return submit;
        }
    }

}

export { PostgresSubmitDB }