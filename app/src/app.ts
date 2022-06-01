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
import { MockClient, MockUserDB, MockCredentialDB, MockSubmitDB } from "./mock/db.ts"
import { BasicSourceManager } from "./source.ts"
import { setUpSubmitRouter } from "./submit.ts"

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
const db = new PostgresContestDB(client);


const router = Router();
const session = new JWTSession();

// TODO: Replace those with postgres connection when it's implemented
const mockClient = new MockClient();
const userDB = new MockUserDB(mockClient);
const credentialDB = new MockCredentialDB(mockClient);

userDB.addNewUser({
  login: "admin",
  name: "",
  surname: "",
  email: "",
  password: "admin",
  password_repeat: "admin"
})
const authConfig = {
  session: session,
  credentialDB: credentialDB,
  userDB: userDB
};
setUpAuthRouter(router, authConfig);

const submitDB = new MockSubmitDB();
const sourceManager = new BasicSourceManager();
const problemDB = new PostgresProblemDB(client);
const submitConfig = {
  authenticator: session,
  submitDB: submitDB,
  problemDB: problemDB,
  sourceManager: sourceManager,
  hasSubmitAccess: async (user: UserData, submit_id: number) => await true,
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
  const contests = await db.getContests();
  const submits = await db.getSubmits();

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
app.use((req, res, next) => {
  res.setStatus(404);
  renderWithUserData(session, "404")(req, res, next);
});
export default app;
