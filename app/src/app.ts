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

import { setUpAuthRouter, redirectIfAuthenticated, authorizeUsing } from "./auth.ts"
import { JWTSession } from "./jwt.ts"
import { renderWithUserData, renderStatusWithUserData } from "./utils.ts"

import { connectNewClient, PostgresContestDB, PostgresProblemDB } from "./postgres.ts"
import { MockClient, MockLanguageDB } from "./mock/db.ts"
import { BasicSourceManager } from "./source.ts"
import { setUpSubmitRouter } from "./submit.ts"

import { PostgresCredentialDB, PostgresUserDB, PostgresGraphicalProblemDB, PostgresSubmitDB } from "./postgres.ts"
import { PostgresPermissionDB } from "./postgres.ts"

import { setUpAccountRouter } from "./account.ts"

import { setUpContestRouter } from "./contest.ts"

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

const submitDB = new PostgresSubmitDB(client);
const sourceManager = new BasicSourceManager();
const problemDB = new PostgresProblemDB(client);
const permissionDB = new PostgresPermissionDB(client);
const languageDB = new MockLanguageDB(); // TODO: replace with postgres
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
