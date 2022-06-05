import { IRouter, Client, format } from "../deps.ts"

import { RequestAuthenticator, redirectIfAuthenticated, authenticatedOnly } from "./auth.ts"
import { renderWithUserData } from "./utils.ts"
import { ContestDB } from "./db.ts"
import { getUnsolvedProblemsThatAreCloseToTheDeadline } from "./queries/submits.ts"

interface StudentRouterConfig {
    authenticator: RequestAuthenticator,
    contestDB: ContestDB,
    client: Client,
}

function setUpStudentRouter(router: IRouter, config: StudentRouterConfig) {
    router.get("/", redirectIfAuthenticated(config.authenticator, '/dashboard'), (_, res, __) => res.render("index"));

    router.get("/dashboard", (_, res, __) => res.redirect("/dashboard/student"));

    router.get("/dashboard/student",
        authenticatedOnly(config.authenticator),
        async (req, res, next) => {
            const user = await config.authenticator.authenticateRequest(req);
            if (!user)
                throw Error("User was authorized and should not be null");

            const contests = await config.contestDB.getUserContests(user.id);
            const recent_submits = await config.contestDB.getUserSubmits(user.id, 10);
            const due_problems = await getUnsolvedProblemsThatAreCloseToTheDeadline(config.client, user.id, 5);
            recent_submits?.map(s => (s as any).submission_time = s.submission_time ? format(s.submission_time, "yyyy-MM-dd, HH:mm:ss") : null)
            due_problems?.map(p => (p as any).due_date = p.due_date ? format(p.due_date, "yyyy-MM-dd") : null)

            renderWithUserData(config.authenticator, "student-dashboard", {
                contests: contests,
                recent_submits: recent_submits,
                due_problems: due_problems,
            })(req, res, next);
        });
}
export { setUpStudentRouter }