import { renderFileToString, serveStatic, config } from "../deps.ts";
import { Router, opine, json, urlencoded } from "../deps.ts"
import { dirname, join } from "../deps.ts";

import { renderStatusWithUserData } from "./utils.ts"

import { JWTSession } from "./jwt.ts"
import { BasicSourceManager } from "./source.ts"

import { MockChecker } from "./checker.ts"

import setUpRouter from "./setUpRouter.ts"
import setUpDB from "./setUpDB.ts"

const dir = dirname(import.meta.url);
await config({ export: true });

const dbClientOptions = {
  user: Deno.env.get("DB_USER"),
  password: Deno.env.get("DB_PASSWORD"),
  database: Deno.env.get("DB_NAME"),
  hostname: Deno.env.get("DB_HOST"),
  port: 5432,
};

const db = await setUpDB(dbClientOptions)

const router = Router();
const session = new JWTSession();
const sourceManager = new BasicSourceManager();
const checker = new MockChecker();

/**
 * Global application config with all databases and managers
 */
const appConfig = {
  // user session that is also used to authenticate requests
  session: session,
  authenticator: session,

  // takes care of loading and saving files
  sourceManager: sourceManager,
  checker: checker,

  // database connections
  ...db
}
checker.configure(appConfig)

setUpRouter(router, appConfig);

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
