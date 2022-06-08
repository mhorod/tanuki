import { IRouter, Client, OpineRequest } from "../deps.ts"

import { RequestAuthenticator, redirectIfAuthenticated, authenticatedOnly } from "./auth.ts"
import { renderWithUserData, formatDateWithTime, formatDateWithoutTime, authorizeContestAccess } from "./utils.ts"
import { ContestDB, ProblemDB } from "./db.ts"
import { getUnsolvedProblemsThatAreCloseToTheDeadline } from "./queries/submits.ts"
import { PermissionKind, PermissionDB } from "./permissions.ts"
import { getFilters, getResults, RecentResultsDB } from "./contest-results.ts"


interface StudentRouterConfig {
    authenticator: RequestAuthenticator,
    recentResultsDB: RecentResultsDB
    contestDB: ContestDB,
    permissionDB: PermissionDB,
    problemDB: ProblemDB,
    client: Client,
}

function setUpStudentRouter(router: IRouter, config: StudentRouterConfig) {
    [setUpResults].forEach(f => f(router, config))
}


function setUpResults(router: IRouter, config: StudentRouterConfig) {
    router.get("/contest/:contest_id/results",
        authorizeContestAccess(config, PermissionKind.VIEW),
        async (req, res, next) => {
            const user = await config.authenticator.authenticateRequest(req);
            if (!user)
                throw Error("User was authorized and should not be null");

            const contest_id = parseInt(req.params.contest_id);
            const filters = {
                ...getFilters(req),
                user: user.id,
                contest_id: contest_id
            }

            const contest = await config.contestDB.getContestById(contest_id)

            const results = await getResults(filters, config.recentResultsDB);

            const problems = await config.problemDB.getProblemsInContest(contest_id)
            renderWithUserData(config.authenticator, "student/contest-results", {
                ...results,
                active_page: filters.page,
                contest: contest,
                problems: problems,
                selected_problem: filters.problem,
            })(req, res, next);
        }

    )
}


export { setUpStudentRouter }