// Functionality that connects to the database and retrieves data

import { Client, ClientOptions } from "../deps.ts"
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



interface Contest {
  id: number,
  name: string,
  shortname: string,
  active: boolean
}


async function getContests(client: Client): Promise<Array<Contest>> {
  return (await client.queryObject<Contest>("select * from contests;")).rows;
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

interface NewUser {
  login: string,
  name: string,
  surname: string,
  email: string,
  password: string,
  password_repeat: string,
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


interface ContestDB {
  getContests(): Promise<Array<Contest>>;
  getSubmits(): Promise<Array<Submit>>;
}

interface UserDB {
  getUserByLogin(login: string): Promise<User | null>;
  addNewUser(user: NewUser): Promise<User | null>;
}

interface CredentialDB {
  getUserByCredentials(credentials: Credentials): Promise<User | null>;
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

export type { ContestDB, UserDB, CredentialDB, User, NewUser };
export { connectNewClient, PostgresContestDB, PostgresCredentialDB, PostgresUserDB };
