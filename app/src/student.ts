import { IRouter, Client } from "../deps.ts"

import { RequestAuthenticator, redirectIfAuthenticated, authenticatedOnly } from "./auth.ts"
import { renderWithUserData, formatDateWithTime, formatDateWithoutTime, authorizeContestAccess } from "./utils.ts"
import { ContestDB } from "./db.ts"
import { getUnsolvedProblemsThatAreCloseToTheDeadline } from "./queries/submits.ts"
import { PermissionKind, PermissionDB } from "./permissions.ts"

interface StudentRouterConfig {
    authenticator: RequestAuthenticator,
    contestDB: ContestDB,
    permissionDB: PermissionDB,
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
            recent_submits?.map(s => (s as any).submission_time = formatDateWithTime(s.submission_time))
            due_problems?.map(p => (p as any).due_date = formatDateWithoutTime(p.due_date))

            renderWithUserData(config.authenticator, "student-dashboard", {
                contests: contests,
                recent_submits: recent_submits,
                due_problems: due_problems,
            })(req, res, next);
        });

    router.get("/contest/:contest_id/results",
        authorizeContestAccess(config, PermissionKind.VIEW),
        async (req, res, next) => {
            const user = await config.authenticator.authenticateRequest(req);
            if (!user)
                throw Error("User was authorized and should not be null");

            const contest = await config.contestDB.getContestById(parseInt(req.params.contest_id))
            console.log(contest)
            const recent_submits = await config.contestDB.getUserSubmits(user.id, 20);
            recent_submits?.map(s => (s as any).submission_time = formatDateWithTime(s.submission_time))

            renderWithUserData(config.authenticator, "student/contest-results", {
                contest: contest,
                submits: recent_submits,
            })(req, res, next);
        }

    )
}
export { setUpStudentRouter }