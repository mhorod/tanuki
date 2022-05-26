// Handles logging in and signing up 

import { OpineRequest, OpineResponse, NextFunction, Router, IRouter } from "./deps.ts"
import { create, verify } from "./deps.ts"
import { deleteCookie, setCookie, getCookies } from "./deps.ts"
import { renderWithUserData } from "./utils.ts"
import type { User } from "./db.ts"

const JWT_KEY = await crypto.subtle.generateKey(
    { name: "HMAC", hash: "SHA-512" },
    true,
    ["sign", "verify"]
);

/**
 * Credentials used to log into the system
 */
interface Credentials {
    login: string,
    password: string,
}

interface UserData {
    login: string
}

interface CredentialDB {
    findUser(credentials: Credentials): Promise<User | null>;
}


interface Authorizer {
    authorizeRequest(req: OpineRequest): Promise<UserData | null>;

}



class JWTAuthorizer implements Authorizer {

    /**
     * Extracts authorization data from request if it's valid
     *  
     * @param req  Request to authorized
     * @returns authorization data, or null if the request cannot be verified
     */
    async authorizeRequest(req: OpineRequest): Promise<UserData | null> {
        const cookie = getCookies(req.headers);
        const token = cookie.token;

        if (token == null) return null;

        // We want `any` here, because we extract variables and create interface
        // deno-lint-ignore no-explicit-any
        let verified: any;
        try {
            verified = await verify(token, JWT_KEY);
        }
        catch {
            return null
        }
        return { login: verified.data.login };
    }
}

function getCredentials(req: OpineRequest): Credentials {
    return { login: req.parsedBody.login, password: req.parsedBody.password };
}
/**
 * If user is logged in then redirect to another page
 * Redirects to target if it's not null,
 * otherwise redirect to GET parameter if it's not null
 * otherwise redirect to root
 *  
 * @param target where to redirect
 * @returns function tat does the thing
 */
function redirectIfAuthorized(authorizer: Authorizer, target: string | null = null) {
    return async (req: OpineRequest, res: OpineResponse, next: NextFunction) => {
        const verified = await authorizer.authorizeRequest(req);
        const redirect = target || req.query.redirect || '/';
        if (verified != null)
            res.redirect(redirect);
        else
            next();
    }
}

/**
 * If user is **not** logged in then redirect to another page
 * Redirects to target if it's not null,
 * otherwise redirect to GET parameter if it's not null
 * otherwise redirect to root
 *  
 * @param target where to redirect
 * @returns function tat does the thing
 */
function redirectIfUnauthorized(authorizer: Authorizer, target: string | null = null) {
    return async (req: OpineRequest, res: OpineResponse, next: NextFunction) => {
        const verified = await authorizer.authorizeRequest(req);
        const redirect = target || req.query.redirect || '/';
        if (verified == null)
            res.redirect(redirect);
        else
            next();
    }
}

async function getUserData(authorizer: Authorizer, req: OpineRequest): Promise<UserData | null> {
    const verified = await authorizer.authorizeRequest(req);
    return verified ? { login: verified.login } : null;
}



/**
 * Check if credentials contain non-empty data
 * @param credentials 
 * @returns 
 */
function credentialsAreEmpty(credentials: Credentials): boolean {
    return credentials.login === undefined || credentials.password === undefined
        || credentials.login === "" || credentials.password === "";
}



/**
 * Create authorization token based on user credentials
 * Token contains all information necessary for later access authorization
 * 
 * @returns token that can be sent back to the user
 */
async function createUserToken(data: UserData) {
    return await create({ alg: "HS512", typ: "JWT" }, { data: data }, JWT_KEY);
}

/**
 * Create handler that allows further processing  of request only if the user making it 
 * meets provided criteria, redirect to 403 otherwise 
 * @param authorizer authorizer to be used
 * @param hasAccess function that returns true if user has access to a resource
 */
function authorizeUsing(authorizer: Authorizer, hasAccess: (userData: UserData) => boolean) {
    return async (req: OpineRequest, res: OpineResponse, next: NextFunction) => {
        const userData = await authorizer.authorizeRequest(req);
        if (userData === null || !hasAccess(userData)) {
            res.setStatus(403);
            renderWithUserData(authorizer, "403")(req, res, next);
        }
        else
            next();
    }
}



function setUpAuthRouter(router: IRouter, authorizer: Authorizer) {

    router.get("/log-in", redirectIfAuthorized(authorizer), (req, res, next) => res.render("log-in"));
    router.get("/sign-up", redirectIfAuthorized(authorizer), (req, res, next) => res.render("sign-up"));

    router.post("/log-in",
        redirectIfAuthorized(authorizer),
        async (req, res, next) => {


            const credentials = getCredentials(req);
            if (credentialsAreEmpty(credentials))
                res.render("log-in", { error: "empty login or password" });
            else {
                // If credentials are valid send back a cookie with a token
                const token = await createUserToken(credentials);
                res.headers = new Headers();
                setCookie(res.headers, {
                    name: "token",
                    value: token,
                    //secure: true, // TODO: Uncomment that in release version
                    httpOnly: true,
                });

                const redirect = req.query.redirect || '/';
                res.redirect(redirect);
            }

        });

    router.post("/sign-up", (req, res, next) => {
        console.log(req.parsedBody)
    });

    router.get("/log-out", (req, res, next) => {
        if (res.headers)
            deleteCookie(res.headers, "token");
        res.redirect("/");
    })
}





export { setUpAuthRouter };
export { redirectIfAuthorized, redirectIfUnauthorized, authorizeUsing, getUserData };
export { JWTAuthorizer };
export type { Authorizer, CredentialDB, UserData };