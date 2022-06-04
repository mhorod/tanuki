import {
  renderFileToString,
  Router,
  serveStatic,
  config,
} from "../deps.ts";

import {
  opine,
  json,
  urlencoded,
} from "../deps.ts"

import { dirname, join } from "../deps.ts";

import { setUpAuthRouter, redirectIfAuthenticated, authorizeUsing, UserData } from "./auth.ts"
import { JWTSession } from "./jwt.ts"
import { renderWithUserData } from "./utils.ts"

import { connectNewClient, PostgresContestDB, PostgresProblemDB } from "./postgres.ts"
import { MockClient, MockUserDB, MockCredentialDB, MockSubmitDB, MockPermissionDB } from "./mock/db.ts"
import { BasicSourceManager } from "./source.ts"
import { setUpSubmitRouter } from "./submit.ts"

import { PostgresCredentialDB, PostgresUserDB, PostgresGraphicalProblemDB } from "./postgres.ts"


const dir = dirname(import.meta.url);
await config({ export: true });

const clientOptions = {
  user: Deno.env.get("DB_USER"),
  password: Deno.env.get("DB_PASSWORD"),
  database: Deno.env.get("DB_NAME"),
  hostname: Deno.env.get("DB_HOST"),
  port: 5432,
};

const client = await connectNewClient(clientOptions);
console.log("Connected to the database!");
const contestDB = new PostgresContestDB(client);


const router = Router();
const session = new JWTSession();

// TODO: Replace those with postgres connection when it's implemented
const mockClient = new MockClient();
const userDB = new PostgresUserDB(client);
const credentialDB = new PostgresCredentialDB(client);


//Sanity check - should be rejected by the database
userDB.addNewUser({
  login: "admin",
  name: "",
  surname: "",
  email: "",
  password: "admin",
  password_repeat: "admin"
})

//Not really an admin, but it's a ufesul account for test purposes
userDB.addNewUser({
  login: "admin2",
  name: "Zawodowy",
  surname: "Administrator",
  email: "admin@administracja.pl",
  password: "admin123",
  password_repeat: "admin123"
});


const authConfig = {
  session: session,
  credentialDB: credentialDB,
  userDB: userDB
};
setUpAuthRouter(router, authConfig);

const submitDB = new MockSubmitDB();
const sourceManager = new BasicSourceManager();
const problemDB = new PostgresProblemDB(client);
const permissionDB = new MockPermissionDB();

const graphicaProblemDB = new PostgresGraphicalProblemDB(client);
console.log(await graphicaProblemDB.getGraphicalProblemsInContest(1, 1));


const submitConfig = {
  authenticator: session,
  submitDB: submitDB,
  problemDB: problemDB,
  contestDB: contestDB,
  permissionDB: permissionDB,
  sourceManager: sourceManager,
};

setUpSubmitRouter(router, submitConfig);




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

router.get("/", redirectIfAuthenticated(session, '/dashboard'), (_, res, __) => res.render("index"));

router.get("/dashboard", (_, res, __) => res.redirect("/dashboard/student"));

router.get("/dashboard/student", async (req, res, next) => {
  const contests = await contestDB.getContests();
  const submits = await contestDB.getSubmits();

  renderWithUserData(session, "student-dashboard", {
    contests: contests,
    submits: submits
  })(req, res, next);
});


router.get('/que', authorizeUsing(session, async e => await e.login === "admin"), renderWithUserData(session, "que"));

router.get("/dashboard/teacher", renderWithUserData(session, "teacher-dashboard"));

router.get("/statuses", (req, res, next) => {
  res.render("statuses",
    {
      statuses: ["OK", "QUE", "ANS", "TLE", "RTE", "ERR", "REJ", "CME", "RUL", "INT"]
    });
})

router.get("/contest/:id", async (req, res, next) => {
  const contests = await contestDB.getContests();
  renderWithUserData(session, "student/contest", { contest: contests[0] })(req, res, next);
});

router.get("/contest/:contestid/problem/:problemid", async (req, res, next) => {
  const contests = await contestDB.getContests();
  renderWithUserData(session, "student/problem", { contest: contests[0], problem: { name: 'Test', id: 1 } })(req, res, next);
});

const app = opine();

// Handling of incoming formats
app.use(json())
app.use(urlencoded())

// Frontend configuration
app.set("views", join(dir, "../views"));
app.set("view engine", "ejs");
app.engine("ejs", renderFileToString);
app.use(serveStatic(join(dir, "../public")));

app.use("/", router);

// If router can't handle request send 404
app.use((req, res, next) => {
  res.setStatus(404);
  renderWithUserData(session, "404")(req, res, next);
});
export default app;
