import {
  Client,
  renderFileToString,
  Router,
  serveStatic,
  config,
} from "./deps.ts";

import {
  opine,
  json,
  urlencoded,
} from "./deps.ts"

import { dirname, join } from "./deps.ts";

import { authRouter, verifyRequest, authorizeUsing, redirectIfLoggedIn, getFrontendUserData } from "./auth.ts"


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

router.get("/ws", (req, res, next) => {
  if (req.headers.get('upgrade') == 'websocket') {
    console.log("Hello websocket!")
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
});

router.get("/", redirectIfLoggedIn('/dashboard'), (req, res, next) => res.render("index"));

router.get("/dashboard", (req, res, next) => {
  res.redirect("/dashboard/student");
});

router.get("/dashboard/student", async (req, res, next) => {
  const user = await getFrontendUserData(req);
  Promise.all([getContests(), getSubmits()]).then(
    (results) => {
      res.render("student-dashboard", {
        contests: results[0].rows,
        submits: results[1].rows,
        user: user
      });
    },
  );
});


router.get('/que', authorizeUsing(e => e.login === "admin"), (req, res, next) => {
  res.render('que');
})

router.get("/dashboard/teacher", (req, res, next) => {
  res.render("teacher-dashboard");
});

const app = opine();

import { handleSubmits } from "./submit.ts"
handleSubmits(router);

// Handling of incoming formats
app.use(json())
app.use(urlencoded())

// Frontend configuration
app.set("views", join(dir, "views"));
app.set("view engine", "ejs");
app.engine("ejs", renderFileToString);
app.use(serveStatic(join(dir, "public")));

app.use("/", router);
app.use("/", authRouter);

// If router can't handle request send 404
app.use((req, res, next) => {
  res.render("404");
});
export default app;
