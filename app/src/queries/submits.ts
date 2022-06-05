import { Client, ClientOptions } from "../../deps.ts"
import { GraphicalProblemStatus, Problem } from "../db.ts"

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

interface simplePair {
    key: number,
    value: Date
}

async function getUnsolvedProblemsTharAreClosestToTheDeadline(client: Client, user_id: number, how_many: number): Promise<Problem[] | null> {
    const allProblemsQuery = `
        SELECT p.id
        FROM users u
        JOIN contests_permissions cp ON cp.user_id = u.id
        JOIN contests c ON cp.contest_id = c.id
        JOIN problems p ON p.contest_id = cp.contest_id
        WHERE  cp.permission_id = 1 AND u.id = $1 AND c.is_active = TRUE AND (
            SELECT sr.status
            FROM submit_results sr
            JOIN submits s ON s.id = sr.submit_id
            WHERE sr.status = 1 AND s.problem_id = p.id
            LIMIT 1
        ) IS NOT NULL
    `;

    const queryResult = await client.queryArray(allProblemsQuery, [user_id]);
    console.log(queryResult);

    return null;

    /*

    let allUnsolvedProblems = [];

    for (const itr of queryResult.rows) {
        const problem_id = itr[0] as number; //Don't ask me why, it's just how this works
        //Crazy ineffective part: we're going to check for each of these problems whether they've got an OK status already
        ///Aaaand if not we'll sort them by their due_date. Magnificent!

        //I hope that query optimizer will optimize that, at least somewhat
        const okQuery = `
            SELECT sr.status
            FROM submit_results sr
            JOIN submits s ON s.id = sr.submit_id
            WHERE sr.status = 1 AND s.problem_id = $1
            LIMIT 1
        `;
        const youHaveOkHere = (await client.queryObject(okQuery, [problem_id])).rowCount == 0 ? false : true;

        if (!youHaveOkHere) {
            const due_date = (await client.queryArray("SELECT due_date FROM problems WHERE id = $1", [problem_id])).rows[0][0] as Date; //Ah yes
            console.log(due_date);

            let tmpPair: simplePair = {
                key: problem_id,
                value: due_date
            };

            allUnsolvedProblems.push(tmpPair);

        }
    }

    allUnsolvedProblems.sort(unsolvedProblemsComparator);

    return null;
    */
}

export { getUnsolvedProblemsTharAreClosestToTheDeadline }
