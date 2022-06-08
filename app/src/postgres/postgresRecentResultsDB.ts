export { PostgresRecentResultsDB }

import { Client } from "../../deps.ts"
import { RecentResultsDB, Filters } from "../contest-results.ts"
import { ShortSubmitResults, toShort } from "../submitDB.ts"

class PostgresRecentResultsDB implements RecentResultsDB {
    client: Client

    constructor(client: Client) {
        this.client = client;
    }

    async getSubmits(filters: Filters): Promise<ShortSubmitResults[]> {
        const query = `
            SELECT * 
            FROM 
                short_submit_results
            WHERE 
                TRUE ${this.filtersToSql(filters)}
            LIMIT $LIMIT OFFSET $BEGIN
        `
        const begin = filters.limit * (filters.page - 1)
        const query_params = {
            ...filters,
            begin: begin,
        }
        const queryResult = (await this.client.queryObject<any>(query, query_params));
        const results = queryResult.rows.map(toShort)
        return results
    }

    async getPageCount(filters: Filters): Promise<number> {
        const query = `
            SELECT COUNT(*) 
            FROM 
                short_submit_results
            WHERE 
                TRUE ${this.filtersToSql(filters)}
        `

        const query_params = filters;
        const submit_count = Number((await this.client.queryObject<any>(query, { ...query_params })).rows[0].count);
        return Math.max(1, Math.ceil(submit_count / filters.limit))
    }

    filtersToSql(filters: Filters) {
        const sqls = ["problem_id=$PROBLEM", "contest_id=$CONTEST", "user_id=$USER"]
        const values = [filters.problem, filters.contest, filters.user]
        let result = [0, 1, 2]
            .map(i => [sqls[i], values[i]])
            .filter(e => e[1] != null)
            .map(e => " AND " + e[0])
            .join("")
        return result
    }
}