import { IRouter, OpineRequest } from "../deps.ts"
import { authenticatedOnly, RequestAuthenticator } from "./auth.ts"
import { renderWithUserData, renderStatusWithUserData } from "./utils.ts"
import { UserDB } from "./db.ts"

interface AccountRouterConfig {
    authenticator: RequestAuthenticator,
    userDB: UserDB,
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
}

export { setUpAccountRouter }