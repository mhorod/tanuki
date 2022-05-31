// Handles logging in and signing up

import { OpineRequest, OpineResponse, NextFunction, IRouter, email } from "../deps.ts"
import { renderWithUserData } from "./utils.ts"
import { CredentialDB, UserDB, NewUser } from "./db.ts"
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
    id: number,
    login: string
}


const newUserDataPrototype: NewUser = {
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
interface RequestAuthenticator {
    authenticateRequest(req: OpineRequest): Promise<UserData | null>;
}

interface CredentialAuthenticator {
    authenticateCredentials(credentials: Credentials): Promise<UserData | null>;
}

/**
 * Manages request/response layer of user session
 */
interface Session extends RequestAuthenticator {
    logIn(user: UserData, res: OpineResponse): any;
    logOut(res: OpineResponse): any;
}


/**
 * Retrieves credentials from given request
 */
function getCredentials(req: OpineRequest): Credentials {
    return { login: req.parsedBody.login, password: req.parsedBody.password };
}

function getNewUser(from: any): NewUser {
    let result: Record<string, any> = {}
    for (const property in newUserDataPrototype)
        result[property] = from[property] || (newUserDataPrototype as Record<string, any>)[property];
    return result as NewUser;
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
function redirectIfAuthenticated(authenticater: RequestAuthenticator, target: string | null = null) {
    return async (req: OpineRequest, res: OpineResponse, next: NextFunction) => {
        const verified = await authenticater.authenticateRequest(req);
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
function redirectIfUnauthenticated(authenticater: RequestAuthenticator, target: string | null = null) {
    return async (req: OpineRequest, res: OpineResponse, next: NextFunction) => {
        const verified = await authenticater.authenticateRequest(req);
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
 * @param authenticator authenticator to be used
 * @param hasAccess function that returns true if user has access to a resource
 */
function authorizeUsing(authenticator: RequestAuthenticator, hasAccess: (user: UserData) => Promise<boolean>) {
    return async (req: OpineRequest, res: OpineResponse, next: NextFunction) => {
        const user = await authenticator.authenticateRequest(req);
        if (user === null || !await hasAccess(user)) {
            res.setStatus(403);
            renderWithUserData(authenticator, "403")(req, res, next);
        }
        else
            next();
    }
}

interface AuthConfig {
    session: Session,
    credentialDB: CredentialDB,
    userDB: UserDB,
}

/**
 * Connects authentication paths to the router
 * handles GET and POST of routes `/log-in` and `/sign-up`
 */
function setUpAuthRouter(router: IRouter, config: AuthConfig) {
    // Just render those pages, nothing fancy
    router.get("/log-in", redirectIfAuthenticated(config.session), (req, res, next) => res.render("log-in"));
    router.get("/sign-up", redirectIfAuthenticated(config.session), (req, res, next) => res.render("sign-up"));

    router.post("/log-in",
        redirectIfAuthenticated(config.session),
        async (req, res, next) => {
            const credentials = getCredentials(req);
            if (credentialsAreEmpty(credentials))
                res.render("log-in", { error: "empty login or password" });
            else {
                const user = await config.credentialDB.getUserByCredentials(credentials);
                if (user == null)
                    res.render("log-in", { error: "invalid login or password" });
                else {
                    await config.session.logIn(user, res);
                    const redirect = req.query.redirect || '/';
                    res.redirect(redirect);
                }
            }

        });

    router.post("/sign-up", async (req, res, next) => {
        const user = getNewUser(req.parsedBody);
        const errors = await vaidateNewUser(user, config.userDB);
        // Submitted data was not valid
        if (errors) {
            res.render('sign-up',
                {
                    ...user,
                    ...errors
                });
        }
        else {
            const addedUser = await config.userDB.addNewUser(user);
            if (addedUser != null)
                await config.session.logIn({ id: addedUser.id, login: addedUser.login }, res);
            res.redirect('/');
        }
    });

    // both POST and GET can log out
    router.get("/log-out", async (req, res, next) => {
        await config.session.logOut(res);
        res.redirect("/");
    })

    router.post("/log-out", async (req, res, next) => {
        await config.session.logOut(res);
        res.redirect("/");
    })
}

async function vaidateNewUser(data: NewUser, userDB: UserDB): Promise<any | null> {

    const existingUser = await userDB.getUserByLogin(data.login);

    let errors: any = {}
    if (existingUser != null)
        errors.login_error = "login already taken"
    else if (data.login == "")
        errors.login_error = "login cannot be empty"

    if (data.password.length < 8)
        errors.password_error = "password is too short"
    else if (data.password != data.password_repeat)
        errors.password_error = "passwords don't match"

    if (data.name == "" || data.surname == "" || data.email == "")
        errors.email_error = "fields cannot be empty"
    else if (!email.valid(data.email))
        errors.email_error = "invalid email"

    return JSON.stringify(errors) == "{}" ? null : errors;
}




export { setUpAuthRouter };
export { redirectIfAuthenticated, redirectIfUnauthenticated, authorizeUsing };
export type { RequestAuthenticator, CredentialAuthenticator, Credentials, UserData, Session };