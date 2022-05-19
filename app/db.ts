// Functionality that connects to the database and retrieves data

import { Client } from "./deps.ts"

const client = new Client({
  user: Deno.env.get("DB_USER"),
  password: Deno.env.get("DB_PASSWORD"),
  database: Deno.env.get("DB_NAME"),
  hostname: Deno.env.get("DB_HOST"),
  port: 5432,
});

await client.connect();
console.log("Connected to database!");

interface Contest {
  id: number,
  name: string,
  shortname: string,
  active: boolean
}


async function getContests(): Promise<Array<Contest>> {
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
async function getSubmits(): Promise<Array<Submit>> {
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

export { getContests, getSubmits };