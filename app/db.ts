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


async function getContests() {
  return await client.queryArray("select * from contests;");
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
async function getSubmits() {
  return await client.queryArray(submitQuery);
}

export { getContests, getSubmits };