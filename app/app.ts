import {
  Client,
  opine,
  renderFileToString,
  Router,
  serveStatic,
  config,
} from "./deps.ts";

import { dirname, join } from "./deps.ts";


const dir = dirname(import.meta.url);
await config({ export: true });


const router = Router();
const client = new Client({
  user: Deno.env.get("DB_USER"),
  password: Deno.env.get("DB_PASSWORD"),
  database: Deno.env.get("DB_NAME"),
  hostname: Deno.env.get("DB_HOST"),
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
  if (req.headers.get('upgrade') == 'websocket') {
    const socket = req.upgrade();

    const ok = Math.random() < 0.3;
    setTimeout(
      () => {
        if (socket.readyState == socket.OPEN)
          socket.send(ok ? 'OK' : 'ANS')


        setTimeout(() => {
          if (socket.readyState == socket.OPEN)
            socket.send('REJ');
          socket.close()
        }, 1000)
      },
      2000
    )
  }
  else {
    res.render("index");
  }
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


router.get('/que', (req, res, next) => {
  res.render('que');
})

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
