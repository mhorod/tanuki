// Functionality that connects to the database and retrieves data

import { Client, ClientOptions } from "./deps.ts"


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



interface Contest {
  id: number,
  name: string,
  shortname: string,
  active: boolean
}


async function getContests(client: Client): Promise<Array<Contest>> {
  const rows: any[][] = (await client.queryArray("select * from contests;")).rows;
  const contests = Array<Contest>();
  for (const row of rows) {
    const contest = { id: row[0], name: row[1], shortname: row[2], active: row[3] }
    contests.push(contest);
  }
  return contests;

}

interface Submit {
  id: number,
  problem: string,
  status: string,
}

interface User {
  id: number,
  login: string,
  name: string,
  surname: string,
  password_hash: string,
  email: string,
}

const submitQuery = `
select 
  s.id, 
  p.name, 
  st.name 
from 
  submits s 
  join submit_results sr on s.id = sr.submit_id 
  join statuses st on sr.status = st.id 
  join problems p on s.problem_id = p.id;
`;
async function getSubmits(client: Client): Promise<Array<Submit>> {
  const rows: any[][] = (await client.queryArray(submitQuery)).rows;
  const submits = Array<Submit>();
  for (const row of rows) {
    const submit: Submit = {
      id: row[0],
      problem: row[1],
      status: row[2]
    }
    submits.push(submit);
  }
  return submits;
}

interface ContestDB {
  getContests(): Promise<Array<Contest>>;
  getSubmits(): Promise<Array<Submit>>;
}

interface UserDB {
  getUserByLogin(login: string): Promise<User | null>;
}


class PostgresContestDB implements ContestDB {
  client: Client;

  constructor(client: Client) { this.client = client; }
  async getContests() {
    return await getContests(this.client);
  }
  async getSubmits() {
    return await getSubmits(this.client);
  }
}



export type { ContestDB, UserDB, User };
export { connectNewClient, PostgresContestDB };
