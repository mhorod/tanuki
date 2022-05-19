import {
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

import { authRouter, authorizeUsing, redirectIfLoggedIn, } from "./auth.ts"
import { renderWithUserData } from "./utils.ts"

import { getContests, getSubmits } from "./db.ts"

const dir = dirname(import.meta.url);
await config({ export: true });


const router = Router();


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

router.get("/", redirectIfLoggedIn('/dashboard'), (_, res, __) => res.render("index"));

router.get("/dashboard", (_, res, __) => res.redirect("/dashboard/student"));

router.get("/dashboard/student", async (req, res, _) => {
  const contests = (await getContests()).rows;
  const submits = (await getSubmits()).rows;

  renderWithUserData(req, res, "student-dashboard", {
    contests: contests,
    submits: submits
  });
});


router.get('/que', authorizeUsing(e => e.login === "admin"), (req, res, _) => renderWithUserData(req, res, "que"));

router.get("/dashboard/teacher", (req, res, _) => renderWithUserData(req, res, "teacher-dashboard"));

import { handleSubmits } from "./submit.ts"
handleSubmits(router);

const app = opine();

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
app.use((req, res, __) => {
  res.setStatus(404);
  renderWithUserData(req, res, "404");
});
export default app;
