// App and router
export {
  opine,
  Router,
  serveStatic,
  json,
  urlencoded
} from "https://deno.land/x/opine@2.1.4/mod.ts";
export type { IRouter, OpineRequest, OpineResponse, NextFunction } from "https://deno.land/x/opine@2.1.4/mod.ts";

// EJS frontend
export { renderFileToString } from "https://deno.land/x/dejs@0.10.2/mod.ts";

// Database connection
export type { ClientOptions, Transaction } from "https://deno.land/x/postgres/mod.ts";
export { Client } from "https://deno.land/x/postgres/mod.ts";

// Environment variables
export { dirname, join } from "https://deno.land/std/path/mod.ts";
export { config } from "https://deno.land/std/dotenv/mod.ts";

// Handling submitted files
export { MultipartReader } from "https://deno.land/std@0.131.0/mime/mod.ts";
export * as R from "https://deno.land/x/ramda@v0.27.2/mod.ts";
export { readAll } from "https://deno.land/std@0.141.0/streams/mod.ts"

// JWT for user  verification
export { create, verify } from "https://deno.land/x/djwt@v2.4/mod.ts";

// cookies
export { deleteCookie, setCookie, getCookies } from "https://deno.land/std/http/cookie.ts";

// email verification
export { email } from "https://deno.land/x/validation/mod.ts";

// hashing
export * as bcrypt from "https://deno.land/x/bcrypt/mod.ts";
export * from "https://deno.land/x/bcrypt@v0.3.0/src/worker.ts"
// dates
export { format } from "https://deno.land/std@0.141.0/datetime/mod.ts";