import { Client, ClientOptions } from "../../deps.ts"
import { GraphicalProblemStatus, Problem } from "../db.ts"

async function getAllNewestSubmitsInAContest(client: Client, contest_id: number): Promise<GraphicalProblemStatus[] | null> {
    const query = `
        SELECT p.id, p.short_name, s.name AS status, np.user_id
        FROM newest_submits_in_problems np
        JOIN problems p ON np.problem_id = p.id
        JOIN statuses s ON s.id = np.result 
        WHERE p.contest_id = $1
    `;

    const queryResult = await client.queryObject<GraphicalProblemStatus>(query, [contest_id]);
    //console.log(queryResult);


    return queryResult.rows;
    //return null;
}

export { getAllNewestSubmitsInAContest }

interface simplePair {
    key: number,
    value: Date
}

async function getUnsolvedProblemsThatAreCloseToTheDeadline(client: Client, user_id: number, how_many: number): Promise<Problem[] | null> {
    const allProblemsQuery = `
        SELECT p.id, p.name, p.short_name, p.contest_id, p.statement_uri,
        p.uses_points, p.points, p.due_date, p.closing_date,
        p.published, p.scoring_method, p.source_limit
        FROM users u
        JOIN contests_permissions cp ON cp.user_id = u.id
        JOIN permissions_for_contests pfc ON cp.permission_id = pfc.id
        JOIN contests c ON cp.contest_id = c.id
        JOIN problems p ON p.contest_id = cp.contest_id
        WHERE pfc.name = 'SUBMIT' AND u.id = $1 AND c.is_active = TRUE AND (
            SELECT sr.status
            FROM submit_results sr
            JOIN submits s ON s.id = sr.submit_id
            WHERE sr.status = 1 AND s.problem_id = p.id AND s.user_id = $1 AND p.closing_date > now()
            LIMIT 1
        ) IS NULL
        ORDER BY p.due_date ASC
        LIMIT $2
    `;

    const queryResult = await client.queryObject<Problem>(allProblemsQuery, [user_id, how_many]);

    return queryResult.rows;


}

export { getUnsolvedProblemsThatAreCloseToTheDeadline }
