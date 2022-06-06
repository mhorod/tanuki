// Postgres connection to the database

//TODO: SEPARATE THIS CODE INTO DIFFERENT FILES AND PLACE THEM IN postgres FOLDER

import { Client, ClientOptions } from "../deps.ts"

import type { Submit, Contest, Problem, GraphicalProblem } from "./db.ts"
import type { User, NewUser, NewSubmit, NewContest } from "./db.ts";
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
`;
async function getSubmits(client: Client): Promise<Array<Submit>> {
    return (await client.queryObject<Submit>(submitQuery)).rows;
}

class PostgresContestDB implements ContestDB {
    client: Client;

    constructor(client: Client) { this.client = client; }

    async deleteContest(id: number): Promise<boolean> {
        const query = `
        DELETE FROM contests WHERE id = $1
        `
        try {
            (await this.client.queryObject(query, [id]));
            return true;
        } catch {
            return false;
        }
    }

    async editContest(id: number, contest: NewContest): Promise<boolean> {
        const query = `
        UPDATE contests SET name=$1, shortname=$2, is_active=$3 WHERE id=$4
        `
        try {
            (await this.client.queryObject(query, [contest.name, contest.shortname, contest.is_active, id]));
            return true;
        } catch {
            return false;
        }
    }

    async getUserContests(user_id: number): Promise<Contest[]> {
        const query = `
        SELECT 
            c.* 
        FROM 
            contests c 
            JOIN user_contests uc ON c.id = uc.contest_id
        WHERE 
            uc.user_id = $1
        `
        return (await this.client.queryObject<Contest>(query, [user_id])).rows;
    }

    async addNewContest(contest: NewContest): Promise<Contest | null> {
        console.log(contest);
        const query = `
        INSERT INTO contests VALUES ($1, $2, $3) RETURNING *;
        `;
        try {
            return (await this.client.queryObject<Contest>(query, [contest.name, contest.shortname, contest.is_active])).rows[0];
        } catch {
            return null;
        }
    }


    async getAllContests(): Promise<Contest[]> {
        const query = `
        SELECT * 
        FROM contests
        `;
        return (await this.client.queryObject<Contest>(query)).rows;
    }

    async getUserSubmits(user_id: number, limit: number): Promise<Submit[]> {
        const query = `
        SELECT 
            s.id,
            s.source_uri,
            sr.points,
            st.name "status",
            c.name "contest_name",
            p.name "short_problem_name",
            l.name "language_name",
            s.submission_time
        FROM 
            submits s 
            JOIN submit_results sr on s.id = sr.submit_id 
            JOIN statuses st ON sr.status = st.id 
            JOIN problems p ON s.problem_id = p.id
            JOIN contests c ON p.contest_id = c.id
            JOIN languages l ON s.language_id = l.id
        WHERE
            user_id = $1
        ORDER BY
            s.submission_time DESC
        LIMIT $2
        `
        return (await this.client.queryObject<Submit>(query, [user_id, limit])).rows;
    }

    async getContestById(id: number): Promise<Contest | null> {
        return (await this.client.queryObject<Contest>("select * from contests where id = $1;", [id])).rows[0];
    }
}

class PostgresCredentialDB implements CredentialDB {
    client: Client;
    constructor(client: Client) { this.client = client; }
    async getUserByCredentials(credentials: Credentials): Promise<User | null> {
        const userMatchingByLogin = await getUser(this.client, credentials.login);
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
    async getUserById(id: number): Promise<User | null> {
        const query = `
        SELECT * FROM users WHERE id=$1
        `;

        return (await this.client.queryObject<User>(query, [id])).rows[0] || null;
    }

    async addNewUser(user: NewUser): Promise<User | null> {
        if (await this.getUserByLogin(user.login) != null) {
            //Such user already exists
            return null;
        }


        const hash = await this.hash(user.password);
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
            // TODO: Remove that, it should be done in another place
            const statuses = ["OK", "ANS", "CME", "TLE"];
            const i = Math.floor(Math.random() * statuses.length);
            new PostgresResultDB(this.client).setSubmitResults(submit.id, 1, statuses[i]);
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

//tttt
export { connectNewClient, PostgresContestDB, PostgresCredentialDB, PostgresUserDB, PostgresGraphicalProblemDB };
export { PostgresSubmitDB, PostgresResultDB };