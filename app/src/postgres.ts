// Postgres connection to the database

import { Client, ClientOptions } from "../deps.ts"

import type { Submit, Contest, Problem } from "./db.ts"
import type { User, NewUser } from "./db.ts";
import type { ContestDB, UserDB, CredentialDB, ProblemDB } from "./db.ts";

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

function getUser(client: Client, credentials: Credentials): User | null {
    if (credentials.login == "admin" && credentials.password == "admin")
        return {
            id: 0,
            login: "admin",
            name: "admin",
            surname: "admin",
            password_hash: "admin",
            email: "admin"
        }
    else
        return null;
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
        return await getUser(this.client, credentials);
    }
}

class PostgresUserDB implements UserDB {
    client: Client;
    constructor(client: Client) { this.client = client; }
    async addNewUser(user: NewUser): Promise<User | null> {
        return await {
            id: 0,
            password_hash: "abc",
            ...user,
        }
    }

    async getUserByLogin(login: string): Promise<User | null> {
        return await getUser(this.client, { login: login, password: "admin" });
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

export { connectNewClient, PostgresContestDB, PostgresCredentialDB, PostgresUserDB, PostgresProblemDB };