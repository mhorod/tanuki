import { IRouter, OpineRequest } from "../deps.ts"
import { authenticatedOnly, RequestAuthenticator } from "./auth.ts"
import { renderWithUserData, renderStatusWithUserData } from "./utils.ts"
import { EditedUser, UserDB, CredentialDB } from "./db.ts"
import { bcrypt } from "../deps.ts"
interface AccountRouterConfig {
    authenticator: RequestAuthenticator,
    userDB: UserDB,
    credentialDB: CredentialDB
}

function getProfileUpdate(req: OpineRequest) {
    const data = req.parsedBody;
    if (!data) return null;
    if (!data.login || !data.name || !data.surname)
        return null;
    return { login: data.login, name: data.name, surname: data.surname }
}


function setUpAccountRouter(router: IRouter, config: AccountRouterConfig) {
    router.get("/account",
        authenticatedOnly(config.authenticator),
        async (req, res, next) => {

            const userData = await config.authenticator.authenticateRequest(req);
            if (!userData)
                throw Error("User has been authorized and shouldn't be null");

            const user = await config.userDB.getUserByLogin(userData.login);
            renderWithUserData(config.authenticator, "account", user)(req, res, next)
        }
    );

    router.post("/account/profile",

        authenticatedOnly(config.authenticator),
        async (req, res, next) => {
            const user_data = await config.authenticator.authenticateRequest(req)
            if (!user_data)
                throw Error()
            const user = await config.userDB.getUserById(user_data.id);
            if (!user)
                throw Error();

            const updated_user: EditedUser = {
                ...user,
                name: req.parsedBody['name'],
                surname: req.parsedBody['surname'],
            };

            const success = await config.userDB.editUser(user_data.id, updated_user);
            const new_user = await config.userDB.getUserById(user_data.id);
            if (success) {
                renderWithUserData(config.authenticator, "account", {
                    ...new_user,
                    profile_success: "updated profile successfully"
                })(req, res, next);
            } else {
                renderWithUserData(config.authenticator, "account", { ...new_user, error: "could not update profile" })(req, res, next);
            }
        })
    router.post("/account/email",
        authenticatedOnly(config.authenticator),
        async (req, res, next) => {
            const user_data = await config.authenticator.authenticateRequest(req)
            if (!user_data)
                throw Error()
            const user = await config.userDB.getUserById(user_data.id);
            if (!user)
                throw Error();

            const verified = await config.credentialDB.getUserByCredentials({ login: user_data.login, password: req.parsedBody['email-confirm'] })

            let error = null;
            if (!verified)
                error = "invalid password"
            const updated_user: EditedUser = {
                ...user,
                email: req.parsedBody['email'],
            };

            let success;
            if (!error)
                success = await config.userDB.editUser(user_data.id, updated_user);
            const new_user = await config.userDB.getUserById(user_data.id);
            if (success) {
                renderWithUserData(config.authenticator, "account", {
                    ...new_user,
                    email_success: "updated email successfully"
                })(req, res, next);
            } else {
                renderWithUserData(config.authenticator, "account", { ...new_user, email_error: error || "could not update email" })(req, res, next);
            }
        })
    router.post("/account/password",
        authenticatedOnly(config.authenticator),
        async (req, res, next) => {
            const user_data = await config.authenticator.authenticateRequest(req)
            if (!user_data)
                throw Error()
            const user = await config.userDB.getUserById(user_data.id);
            if (!user)
                throw Error();

            const verified = await config.credentialDB.getUserByCredentials({ login: user_data.login, password: req.parsedBody['password-confirm'] })

            let error = null;
            if (!verified)
                error = "invalid password"

            const p1 = req.parsedBody["password"]
            const p2 = req.parsedBody["password-repeat"]

            if (p1 != p2)
                error = error || "passwords don't match"

            let success;
            if (!error) {
                let hash = await bcrypt.hash(p1, await bcrypt.genSalt(8));
                success = await config.userDB.editUserPassword(user_data.id, hash)
            }

            const new_user = await config.userDB.getUserById(user_data.id);
            if (success) {
                renderWithUserData(config.authenticator, "account", {
                    ...new_user,
                    password_success: "updated password successfully"
                })(req, res, next);
            } else {
                renderWithUserData(config.authenticator, "account", { ...new_user, password_error: error || "could not update password" })(req, res, next);
            }
        })
}

export { setUpAccountRouter }