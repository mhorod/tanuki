// Handles logging in and signing up 

import { OpineRequest, OpineResponse, NextFunction, Router } from "./deps.ts"
import { create, verify } from "./deps.ts"
import { deleteCookie, setCookie, getCookies } from "./deps.ts"
import { renderWithUserData } from "./utils.ts"

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

/**
 * Data used for authorization
 */
interface UserData {
    login: string,
    role: string,
}

interface FrontedUserData {
    login: string,
}

/**
 * Extracts authorization data from request if it's valid
 *  
 * @param req  Request to verify
 * @returns authorization data, or null if the request cannot be verified
 */
async function verifyRequest(req: OpineRequest): Promise<UserData | null> {
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
    return { login: verified.data.login, role: verified.data.role };
}

async function getFrontendUserData(req: OpineRequest): Promise<FrontedUserData | null> {
    const verified = await verifyRequest(req);
    return verified ? { login: verified.login } : null;
}


/**
 * Check if credentials represent a valid user
 */
function credentialsAreValid(credentials: Credentials): boolean {
    return true;
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


function getCredentials(req: OpineRequest): Credentials {
    return { login: req.parsedBody.login, password: req.parsedBody.password };
}

/**
 * Create authorization token based on user credentials
 * Token contains all information necessary for later access authorization
 * 
 * @returns token that can be sent back to the user
 */
async function createUserToken(credentials: Credentials) {
    return await create({ alg: "HS512", typ: "JWT" }, { data: credentials }, JWT_KEY);
}

/**
 * Create handler that allows further processing  of request only if the user making it 
 * meets provided criteria, redirect to 403 otherwise 
 * 
 * @param hasAccess function that returns true if user has access to a resource
 */
function authorizeUsing(hasAccess: (userData: UserData) => boolean) {
    return async (req: OpineRequest, res: OpineResponse, next: NextFunction) => {
        const userData = await verifyRequest(req);
        if (userData === null || !hasAccess(userData)) {
            res.setStatus(403);
            renderWithUserData(req, res, "403");
        }
        else
            next();
    }
}

/**
 * If user is logged in then redirect to another page
 * Redirects to target if it's not null,
 * otherwise redirect to GET parameter if it's not null
 * otherwise redirect to root
 *  
 * @param target where to redirect
 * @returns 
 */
function redirectIfLoggedIn(target: string | null = null) {
    return async (req: OpineRequest, res: OpineResponse, next: NextFunction) => {
        const verified = await verifyRequest(req);
        const redirect = target || req.query.redirect || '/';
        if (verified != null)
            res.redirect(redirect);
        else
            next();
    }
}

const router = Router();

router.get("/log-in", redirectIfLoggedIn(), (req, res, next) => res.render("log-in"));
router.get("/sign-up", redirectIfLoggedIn(), (req, res, next) => res.render("sign-up"));


router.post("/log-in",
    redirectIfLoggedIn(),
    async (req, res, next) => {

        const credentials = getCredentials(req);
        if (credentialsAreEmpty(credentials))
            res.render("log-in", { error: "empty login or password" });
        else if (credentialsAreValid({ login: credentials.login, password: credentials.password })) {
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


const authRouter = router;
export { authRouter, verifyRequest, authorizeUsing, redirectIfLoggedIn, getFrontendUserData };