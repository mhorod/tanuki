import type { ProblemDB, Problem, NewProblem } from "./../db.ts"
import { Client, ClientOptions } from "../../deps.ts"

class PostgresProblemDB implements ProblemDB {

    client: Client;
    constructor(client: Client) { this.client = client; }

    async getProblemById(id: number): Promise<Problem | null> {

        const query = `
        select
        p.id,
        p.name,
        shortname,
        contest_id,
        statement_uri,
        uses_points,
        position,
        points,
        due_date,
        closing_date,
        published,
        sm.name "scoring_method",
        source_limit
        from problems p
        join scoring_methods sm on p.scoring_method = sm.id
        where p.id = $1
        `;
        const rows = (await this.client.queryObject<Problem>(query, [id])).rows;
        return rows.length != 1 ? null : rows[0];
    }
    async getProblemsInContest(contest_id: number): Promise<Problem[]> {
        const query = `
        select
        p.id,
        p.name,
        shortname,
        contest_id,
        statement_uri,
        uses_points,
        position,
        points,
        due_date,
        closing_date,
        published,
        sm.name "scoring_method",
        source_limit
        from problems p
        join scoring_methods sm on p.scoring_method = sm.id
        where contest_id = $1
        order by position
        `
        return (await this.client.queryObject<Problem>(query, [contest_id])).rows;
    }

    createProblem(problem: NewProblem): void {
        const insertionQuery = `
            INSERT INTO problems VALUES($1)
        `;
        try {
            this.client.queryArray(insertionQuery, [problem]);
        }
        catch (exception) {
            console.error(exception);
        }

    }

    async updateProblem(newVersion: Problem): Promise<void> {
        //oh well
        const update = `
            UPDATE problems SET
                name = $2,
                shortname = $3,
                contest_id = $4,
                statement_uri = $5,
                uses_points = $6,
                position = $7,
                points = $8,
                due_date = $9,
                closing_date = $10,
                published = $11,
                scoring_method = $12,
                source_limit = $13
            WHERE id = $1
        `;

        try {
            //It's bad, but I've got no idea how to make that prettier
            const valArray = [newVersion.id,
            newVersion.name,
            newVersion.shortname,
            newVersion.contest_id,
            newVersion.statement_uri,
            newVersion.uses_points,
            newVersion.position,
            newVersion.points,
            newVersion.due_date,
            newVersion.closing_date,
            newVersion.published,
            newVersion.scoring_method,
            newVersion.source_limit
            ];

            await this.client.queryArray(update, valArray);
        }
        catch (exception) {
            console.error(exception);
        }
    }

}

export { PostgresProblemDB }