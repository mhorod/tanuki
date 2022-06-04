import { Client, ClientOptions } from "../../deps.ts"
import { GraphicalProblemStatus } from "../db.ts"

async function getAllNewestSubmitsInAContest(client: Client, contest_id: number): Promise<GraphicalProblemStatus[] | null> {
    const query = `
        SELECT p.id, p.shortname, s.name AS status, np.user_id
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