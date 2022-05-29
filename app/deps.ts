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
export type { ClientOptions } from "https://deno.land/x/postgres/mod.ts";
export { Client } from "https://deno.land/x/postgres/mod.ts";

// Environment variables
export { dirname, join } from "https://deno.land/std/path/mod.ts";
export { config } from "https://deno.land/std/dotenv/mod.ts";

// Handling submitted files
export { exists } from "https://deno.land/std/fs/mod.ts";
export { MultipartReader } from "https://deno.land/std/mime/mod.ts";
export * as R from "https://deno.land/x/ramda@v0.27.2/mod.ts";

// JWT for user  verification
export { create, verify } from "https://deno.land/x/djwt/mod.ts";

// Date and time parsing
export { datetime } from "https://deno.land/x/ptera/mod.ts";

// cookies
export { deleteCookie, setCookie, getCookies } from "https://deno.land/std/http/cookie.ts";

// email verification
export { email } from "https://deno.land/x/validation/mod.ts";