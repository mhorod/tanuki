import {
  Client,
  opine,
  renderFileToString,
  Router,
  serveStatic,
} from "./deps.ts";

import { dirname, join } from "./deps.ts";

const dir = dirname(import.meta.url);

const router = Router();
const client = new Client({
  user: "tanuki",
  password: "tanuki",
  database: "tanuki",
  hostname: "postgres",
  port: 5432,
});

await client.connect();
console.log("Connected to database!");

async function getContests() {
  return await client.queryArray("select * from contests;");
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

router.get("/", (req, res, next) => {
  res.render("index");
});

router.get("/dashboard", (req, res, next) => {
  res.redirect("/dashboard/student");
});

router.get("/dashboard/student", (req, res, next) => {
  Promise.all([getContests(), getSubmits()]).then(
    (results) => {
      console.log("Contests\n", results[0]);
      console.log("Submits\n", results[1]);
      res.render("student-dashboard", {
        contests: results[0].rows,
        submits: results[1].rows,
      });
    },
  );
});

router.get("/dashboard/teacher", (req, res, next) => {
  res.render("teacher-dashboard");
});

router.get("/log-in", (req, res, next) => {
  res.render("log-in");
});

const app = opine();
app.set("views", join(dir, "views"));
app.set("view engine", "ejs");
app.engine("ejs", renderFileToString);
app.use(serveStatic(join(dir, "public")));
app.use("/", router);

// If router can't handle request send 404
app.use((req, res, next) => {
  res.render("404");
});
export default app;
