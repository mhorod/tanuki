import type { ProblemDB, Problem, NewProblem } from "./../db.ts"
import { Client, ClientOptions } from "../../deps.ts"

class PostgresProblemDB implements ProblemDB {

    client: Client;
    constructor(client: Client) { this.client = client; }

    async deleteProblem(id: number): Promise<boolean> {
        const query = `
        DELETE FROM problems WHERE id=$1
        `
        try {
            await this.client.queryArray(query, [id]);
            return true;
        }
        catch (exception) {
            console.error(exception);
            return false;
        }
    }

    async getProblemById(id: number): Promise<Problem | null> {
        const query = `SELECT * FROM problems WHERE id = $1`;
        const rows = (await this.client.queryObject<Problem>(query, [id])).rows;
        return rows.length != 1 ? null : rows[0];
    }
    async getProblemsInContest(contest_id: number): Promise<Problem[]> {
        const query = `SELECT * FROM problems WHERE contest_id=$1 ORDER BY short_name`
        return (await this.client.queryObject<Problem>(query, [contest_id])).rows;
    }

    async createProblem(problem: NewProblem): Promise<boolean> {
        const insertionQuery = `
            INSERT INTO problems VALUES($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12)
        `
        try {
            const valArray = [
                problem.name,
                problem.short_name,
                problem.contest_id,
                problem.statement_uri,
                problem.uses_points,
                problem.points,
                problem.due_date,
                problem.closing_date,
                problem.published,
                problem.scoring_method,
                problem.source_limit
            ];

            await this.client.queryArray(insertionQuery, valArray);
            return true;
        } catch (exception) {
            console.error(exception);
            return false;
        }
    }

    async updateProblem(newVersion: Problem): Promise<boolean> {
        //oh well
        const update = `
            UPDATE problems SET
                name = $2,
                short_name = $3,
                contest_id = $4,
                statement_uri = $5,
                uses_points = $6,
                points = $7,
                due_date = $8,
                closing_date = $9,
                published = $10,
                scoring_method = $11,
                source_limit = $12
            WHERE id = $1
        `;

        try {
            //It's bad, but I've got no idea how to make that prettier
            const valArray = [newVersion.id,
            newVersion.name,
            newVersion.short_name,
            newVersion.contest_id,
            newVersion.statement_uri,
            newVersion.uses_points,
            newVersion.points,
            newVersion.due_date,
            newVersion.closing_date,
            newVersion.published,
            newVersion.scoring_method,
            newVersion.source_limit
            ];

            await this.client.queryArray(update, valArray);
            return true;
        }
        catch (exception) {
            console.error(exception);
            return false;
        }
    }

}

export { PostgresProblemDB }