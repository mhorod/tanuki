// Postgres connection to the database

import { Client, ClientOptions } from "../deps.ts"

import type { Submit, Contest, Problem, GraphicalProblem } from "./db.ts"
import type { User, NewUser, NewSubmit } from "./db.ts";
import type { ContestDB, UserDB, CredentialDB, ProblemDB, GraphicalProblemDB, SubmitDB, ResultDB } from "./db.ts";

import type { PermissionDB } from "./permissions.ts"

import { bcrypt } from "../deps.ts"


import { Credentials } from "./auth.ts"
/**
 * Creates new connection to the database
 * @param options 
 * @returns 
 */
async function connectNewClient(options: ClientOptions): Promise<Client> {
    const client = new Client(options);
    await client.connect();
    return client;
}

async function getUser(client: Client, login: string): Promise<User | null> {
    const result = await client.queryObject<User>("SELECT * FROM users WHERE users.login = $1", [login]);
    if (result.rowCount == 0) {
        return null;
    }
    else {
        return result.rows[0];
    }
}

const submitQuery = `
select 
  s.id, 
  p.name "problem",
  st.name "status"
from 
  submits s 
  join submit_results sr on s.id = sr.submit_id 
  join statuses st on sr.status = st.id 
  join problems p on s.problem_id = p.id;
`;
async function getSubmits(client: Client): Promise<Array<Submit>> {
    return (await client.queryObject<Submit>(submitQuery)).rows;
}

class PostgresContestDB implements ContestDB {
    client: Client;

    constructor(client: Client) { this.client = client; }
    async getContestById(id: number): Promise<Contest | null> {
        return (await this.client.queryObject<Contest>("select * from contests where id = $1;", [id])).rows[0];
    }
    async getContests() {

        return (await this.client.queryObject<Contest>("select * from contests;")).rows;
    }
    async getSubmits() {
        return await getSubmits(this.client);
    }
}

class PostgresCredentialDB implements CredentialDB {
    client: Client;
    constructor(client: Client) { this.client = client; }
    async getUserByCredentials(credentials: Credentials): Promise<User | null> {
        console.log(credentials);

        const userMatchingByLogin = await getUser(this.client, credentials.login);

        console.log(userMatchingByLogin);

        if (userMatchingByLogin == null) {
            //User doesn't even exist
            return null;
        }

        console.log("Hi!");
        //User exists, time for password validation

        if (await bcrypt.compare(credentials.password, userMatchingByLogin.password_hash.trim())) {
            console.log("Looking good to me");
            //Also matching by password
            return userMatchingByLogin;
        }
        else {
            //Password is incorrect
            return null;
        }
    }
}

class PostgresUserDB implements UserDB {
    client: Client;
    constructor(client: Client) {
        this.client = client;
    }

    async hash(password: string): Promise<string> {
        return await bcrypt.hash(password, await bcrypt.genSalt(8));
    }

    async addNewUser(user: NewUser): Promise<User | null> {
        if (await this.getUserByLogin(user.login) != null) {
            //Such user already exists
            return null;
        }


        const hash = this.hash(user.password);
        const insertTable = [user.login, user.name, user.surname, hash, user.email];

        try {
            const insertionResult = await this.client.queryObject<User>("INSERT INTO users VALUES ($1, $2, $3, $4, $5)", insertTable);
            console.log(insertionResult);
        }
        catch (Exception) {
            return null;
        }


        const newUser = await this.getUserByLogin(user.login);
        return newUser;
    }

    async getUserByLogin(login: string): Promise<User | null> {
        return await getUser(this.client, login);
    }
}

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




}

class PostgresGraphicalProblemDB implements GraphicalProblemDB {
    client: Client;
    constructor(client: Client) { this.client = client; }

    async getGraphicalProblemsInContest(contest_id: number, user_id: number): Promise<GraphicalProblem[]> {
        //TODO: Fix it so that OK is always on top
        //This will need a custom comparator provided by our database!
        const query = `
        SELECT p.id, p.name, p.shortname, p.statement_uri, p.position, p.due_date, p.closing_date, (
            SELECT st.name AS status
            FROM submits s 
            JOIN submit_results sr ON s.id = sr.submit_id
            JOIN statuses st ON st.id = sr.status
            WHERE p.id = s.problem_id AND s.user_id = $2
            ORDER BY  compare_submits(st.id, s.submission_time) DESC
            LIMIT 1
        )
        FROM problems p
        WHERE contest_id = $1
        `;
        const result = await this.client.queryObject<GraphicalProblem>(query, [contest_id, user_id]);

        return result.rows;
    }

    async getGraphicalProblemById(problem_id: number, user_id: number): Promise<GraphicalProblem | null> {
        const query = `
        SELECT p.id, p.name, p.shortname, p.statement_uri, p.position, p.due_date, p.closing_date, (
            SELECT st.name AS status
            FROM submits s 
            JOIN submit_results sr ON s.id = sr.submit_id
            JOIN statuses st ON st.id = sr.status
            WHERE p.id = $1 AND s.user_id = $2
            ORDER BY  compare_submits(st.id, s.submission_time) DESC
            LIMIT 1
        )
        FROM problems p
        `;
        const result = await this.client.queryObject<GraphicalProblem>(query, [problem_id, user_id]);

        if (result.rowCount == 0) {
            return null;
        } else {
            return result.rows[0];
        }

    }
}

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
        )
        `;
        this.client.queryObject<Submit>(query, insertTable);

        //That's a truly terrible query
        const queryResult = await this.client.queryObject<Submit>("SELECT * FROM submits WHERE source_uri = $1", [newSubmit.source_uri]);

        if (queryResult.rowCount == 0) {
            return null;
        }
        else {
            const submit = queryResult.rows[0];
            new PostgresResultDB(this.client).setSubmitResults(submit.id, 1, "OK");
            return submit;
        }
    }

    async getSubmitById(id: number): Promise<Submit | null> {
        const query = `
        SELECT 
            s.id,
            source_uri,
            sr.points,
            statuses.name "status",
            c.name "contest_name",
            p.shortname "short_problem_name",
            l.name "language_name",
            submission_time
        FROM
            submits s
            JOIN submit_results sr ON s.id = sr.submit_id
            JOIN statuses ON statuses.id = sr.status
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

class PostgresPermissionDB implements PermissionDB {
    client: Client;

    constructor(client: Client) {
        this.client = client;
    }

    async getPermissionType(user: number, contest: number): Promise<number> {
        const query = `
            SELECT permission_id
            FROM contests_permissions
            WHERE user_id = $1 AND contest_id = $2
        `;
        const queryResult = await this.client.queryObject<number>(query, [user, contest]);

        if (queryResult.rowCount == 0) {
            //User has no record in the database, so I'd say that no permissions granted here
            return 0;
        }
        else {
            //There should be only one such record
            return queryResult.rows[0];
        }
    }

    async canSubmit(user: number, contest: number): Promise<boolean> {
        // TODO: remove this line in release
        return true;
        const permissionType = await this.getPermissionType(user, contest);
        if (permissionType >= 2) {
            return true;
        }
        else {
            return false;
        }
    }
    async canViewContest(user: number, contest: number): Promise<boolean> {
        // TODO: remove this line in release
        return true;
        const permissionType = await this.getPermissionType(user, contest);

        if (permissionType >= 1) {
            return true;
        }
        else {
            return false;
        }
    }
    async canViewSubmit(user: number, submit: number): Promise<boolean> {
        // TODO: remove this line in release
        return true;
        //First, we will check the ID of contest that user is in
        //Then, we will check whether such user has permissions to view submits there.

        //I am using 2 separate queries here, so this is likely to be ineffective,
        //however combinig those 2 into 1 big would create an absolute utter mess.

        //(Optimize it at your own risk)

        const gimmeContestIDQuery = `
            SELECT p.contest_id
            FROM submits s
            JOIN problems p ON s.problem_id = p.id
            WHERE s.id = $1
        `;

        const queryResult = await this.client.queryObject<{ contest_id: number }>(gimmeContestIDQuery, [submit]);

        if (queryResult.rowCount == 0) {
            //Submit doesn't even exist, so I'm going to say that you can't view such a submit
            //You may argue with that, I guess
            //However, we're programming, not having fun with the set theory
            return false;
        }
        else {
            const contest = queryResult.rows[0].contest_id;
            const permissionType = await this.getPermissionType(user, contest);

            if (permissionType == 3) {
                return true;
            }
            else {
                return false;
            }
        }

    }
}

class PostgresResultDB implements ResultDB {

    client: Client;

    constructor(client: Client) {
        this.client = client;
    }
    async setSubmitResults(id: number, points: number, status: string): Promise<boolean> {
        const status_id = (await this.client.queryObject<{ id: number }>("SELECT id FROM statuses WHERE name = $1", [status.toUpperCase()])).rows[0].id;
        await this.client.queryArray("INSERT INTO submit_results VALUES ($1, $2, $3)", [id, points, status_id]);
        return true;
    }
}


export { connectNewClient, PostgresContestDB, PostgresCredentialDB, PostgresUserDB, PostgresProblemDB, PostgresGraphicalProblemDB };
export { PostgresSubmitDB, PostgresPermissionDB, PostgresResultDB };