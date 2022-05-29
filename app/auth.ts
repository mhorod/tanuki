// Handles logging in and signing up

import { OpineRequest, OpineResponse, NextFunction, IRouter, email } from "./deps.ts"
import { renderWithUserData } from "./utils.ts"
import { CredentialDB } from "./db.ts"
/**
 * Credentials used to log into the system
 */
interface Credentials {
    login: string,
    password: string,
}

/**
 * Data used to identify user making a request
 */
interface UserData {
    login: string
}

interface NewUserData {
    login: string,
    name: string,
    surname: string,
    email: string,
    password: string,
    password_repeat: string,
}

const newUserDataPrototype: NewUserData = {
    login: "",
    name: "",
    surname: "",
    email: "",
    password: "",
    password_repeat: ""
}

/**
 * Extracts information about user making the request
 * 
 */
interface RequestAuthorizer {
    authorizeRequest(req: OpineRequest): Promise<UserData | null>;
}

interface CredentialAuthorizer {
    authorizeCredentials(credentials: Credentials): Promise<UserData | null>;
}

/**
 * Manages request/response layer of user session
 */
interface Session extends RequestAuthorizer {
    logIn(user: UserData, res: OpineResponse): any;
    logOut(res: OpineResponse): any;
}


class DBAuthorizer implements CredentialAuthorizer {
    credentialDB: CredentialDB;
    constructor(credentialDB: CredentialDB) { this.credentialDB = credentialDB; }
    async authorizeCredentials(credentials: Credentials) {
        const user = await this.credentialDB.getUserByCredentials(credentials);
        return user;
    }

}

/**
 * Retrieves credentials from given request
 */
function getCredentials(req: OpineRequest): Credentials {
    return { login: req.parsedBody.login, password: req.parsedBody.password };
}

function getNewUserData(from: any): NewUserData {
    let result: Record<string, any> = {}
    for (const property in newUserDataPrototype)
        result[property] = from[property] || (newUserDataPrototype as Record<string, any>)[property];
    return result as NewUserData;
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
function redirectIfAuthorized(authorizer: RequestAuthorizer, target: string | null = null) {
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
function redirectIfUnauthorized(authorizer: RequestAuthorizer, target: string | null = null) {
    return async (req: OpineRequest, res: OpineResponse, next: NextFunction) => {
        const verified = await authorizer.authorizeRequest(req);
        const redirect = target || req.query.redirect || '/';
        if (verified == null)
            res.redirect(redirect);
        else
            next();
    }
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
 * Create handler that allows further processing  of request only if the user making it 
 * meets provided criteria, redirect to 403 otherwise 
 * @param authorizer authorizer to be used
 * @param hasAccess function that returns true if user has access to a resource
 */
function authorizeUsing(authorizer: RequestAuthorizer, hasAccess: (userData: UserData) => boolean) {
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


/**
 * Connects authentication paths to the router
 * handles GET and POST of routes `/log-in` and `/sign-up`
 * @param router router to use
 * @param session 
 * @param credentialAuthorizer 
 */
function setUpAuthRouter(router: IRouter, session: Session, credentialAuthorizer: CredentialAuthorizer) {

    // Just render those pages, nothing fancy
    router.get("/log-in", redirectIfAuthorized(session), (req, res, next) => res.render("log-in"));
    router.get("/sign-up", redirectIfAuthorized(session), (req, res, next) => res.render("sign-up"));

    router.post("/log-in",
        redirectIfAuthorized(session),
        async (req, res, next) => {
            const credentials = getCredentials(req);
            if (credentialsAreEmpty(credentials))
                res.render("log-in", { error: "empty login or password" });
            else {
                const user = await credentialAuthorizer.authorizeCredentials(credentials);
                if (user == null)
                    res.render("log-in", { error: "invalid login or password" });
                else {
                    await session.logIn(user, res);
                    const redirect = req.query.redirect || '/';
                    res.redirect(redirect);
                }
            }

        });

    router.post("/sign-up", (req, res, next) => {
        const userData = getNewUserData(req.parsedBody);
        console.log(userData);
        let errors: any = {}
        if (userData.login == "admin")
            errors.login_error = "login already taken"
        if (userData.password != userData.password_repeat)
            errors.password_error = "passwords don't match"
        if (!email.valid(userData.email))
            errors.email_error = "invalid email"


        res.render('sign-up',
            {
                ...userData,
                ...errors
            });
    });

    // both POST and GET can log out
    router.get("/log-out", async (req, res, next) => {
        await session.logOut(res);
        res.redirect("/");
    })

    router.post("/log-out", async (req, res, next) => {
        await session.logOut(res);
        res.redirect("/");
    })
}




export { setUpAuthRouter };
export { redirectIfAuthorized, redirectIfUnauthorized, authorizeUsing };
export { DBAuthorizer };
export type { RequestAuthorizer, CredentialAuthorizer, Credentials, UserData, Session };