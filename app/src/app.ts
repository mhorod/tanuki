import {
  renderFileToString,
  Router,
  serveStatic,
  config,
  readAll
} from "../deps.ts";

import {
  opine,
  json,
  urlencoded,
} from "../deps.ts"

import { dirname, join } from "../deps.ts";
import { format } from "../deps.ts"

import { setUpAuthRouter, redirectIfAuthenticated, authorizeUsing, authenticatedOnly } from "./auth.ts"
import { JWTSession } from "./jwt.ts"
import { renderWithUserData, renderStatusWithUserData } from "./utils.ts"

import { connectNewClient, PostgresContestDB, PostgresProblemDB } from "./postgres.ts"
import { BasicSourceManager } from "./source.ts"
import { setUpSubmitRouter } from "./submit.ts"

import { PostgresCredentialDB, PostgresUserDB, PostgresGraphicalProblemDB, PostgresSubmitDB } from "./postgres.ts"
import { PostgresPermissionDB } from "./postgres.ts"
import { PostgresLanguageDB } from "./queries/language.ts"

import { setUpAccountRouter } from "./account.ts"

import { setUpContestRouter } from "./contest.ts"

import { getUnsolvedProblemsThatAreCloseToTheDeadline } from "./queries/submits.ts"

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

const submitDB = new PostgresSubmitDB(client);
const sourceManager = new BasicSourceManager();
const problemDB = new PostgresProblemDB(client);
const permissionDB = new PostgresPermissionDB(client);
const languageDB = new PostgresLanguageDB(client); // TODO: replace with postgres
const graphicaProblemDB = new PostgresGraphicalProblemDB(client);

//test
import { getAllNewestSubmitsInAContest } from "./queries/submits.ts"
console.log(await getAllNewestSubmitsInAContest(client, 3));
console.log(await graphicaProblemDB.getGraphicalProblemsInContest(3, 4));

/**
 * Global application config with all databases and managers
 */
const appConfig = {
  // user session that is also used to authenticate requests
  session: session,
  authenticator: session,

  // takes care of loading and saving files
  sourceManager: sourceManager,

  // database connections in alphabetical order
  contestDB: contestDB,
  credentialDB: credentialDB,
  graphicalProblemDB: graphicaProblemDB,
  languageDB: languageDB,
  permissionDB: permissionDB,
  problemDB: problemDB,
  submitDB: submitDB,
  userDB: userDB,
}


setUpAuthRouter(router, appConfig);
setUpSubmitRouter(router, appConfig);
setUpAccountRouter(router, appConfig);
setUpContestRouter(router, appConfig);



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

router.get("/dashboard/student",
  authenticatedOnly(session),
  async (req, res, next) => {
    const user = await session.authenticateRequest(req);
    if (!user)
      throw Error("User was authorized and should not be null");

    const contests = await contestDB.getContests();
    const submits = await contestDB.getSubmits();
    const due_problems = await getUnsolvedProblemsThatAreCloseToTheDeadline(client, user.id, 5);
    due_problems?.map(p => (p as any).due_date = p.due_date ? format(p.due_date, "dd-MM-yyyy") : null)

    renderWithUserData(session, "student-dashboard", {
      contests: contests,
      submits: submits,
      due_problems: due_problems,
    })(req, res, next);
  });


router.get('/que', authorizeUsing(session, async e => await e.login === "admin"), renderWithUserData(session, "que"));

router.get("/dashboard/teacher", renderWithUserData(session, "teacher-dashboard"));

router.post("/edit/:id", async (req, res, next) => {
  console.log(req.parsedBody);
  const contests = await contestDB.getContests();
  renderWithUserData(session, "teacher/edit-problem", { contest: contests[0], problem: { name: 'Test', id: 1 } })(req, res, next);
});

router.get("/teacher/contest/:id", async (req, res, next) => {
  const contests = await contestDB.getContests();
  renderWithUserData(session, "teacher/contest", { contest: contests[0] })(req, res, next);
});
router.get("/contest/:contestid/problem/:problemid", async (req, res, next) => {
  const contests = await contestDB.getContests();
  renderWithUserData(session, "student/problem", { contest: contests[0], problem: { name: 'Test', id: 1 } })(req, res, next);
});
router.get("/contest/:contestid/problem/:problemid/edit", async (req, res, next) => {
  const contests = await contestDB.getContests();
  renderWithUserData(session, "teacher/edit-problem", { contest: contests[0], problem: { name: 'Test', id: 1 } })(req, res, next);
});
router.get("/contest/:contestid/add", async (req, res, next) => {
  const contests = await contestDB.getContests();
  renderWithUserData(session, "teacher/add-problem", { contest: contests[0], problem: { name: 'Test', id: 1 } })(req, res, next);
});
router.get("/contest/:contestid/users", async (req, res, next) => {
  const contests = await contestDB.getContests();
  renderWithUserData(session, "teacher/contest-users", { contest: contests[0], problem: { name: 'Test', id: 1 } })(req, res, next);
});
router.get("/contest/:contestid/adduser", async (req, res, next) => {
  const contests = await contestDB.getContests();
  renderWithUserData(session, "teacher/add-user", { contest: contests[0], problem: { name: 'Test', id: 1 } })(req, res, next);
});
router.get("/statuses", (req, res, next) => {
  res.render("statuses",
    {
      statuses: ["OK", "QUE", "ANS", "TLE", "RTE", "ERR", "REJ", "CME", "RUL", "INT"]
    });
})

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
app.use(renderStatusWithUserData(session, 404));
export default app;
