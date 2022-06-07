import { IRouter, Client, OpineRequest } from "../deps.ts"

import { RequestAuthenticator, redirectIfAuthenticated, authenticatedOnly } from "./auth.ts"
import { renderWithUserData, formatDateWithTime, formatDateWithoutTime, authorizeContestAccess } from "./utils.ts"
import { ContestDB, ProblemDB, Submit } from "./db.ts"
import { getUnsolvedProblemsThatAreCloseToTheDeadline } from "./queries/submits.ts"
import { PermissionKind, PermissionDB } from "./permissions.ts"
import { Filters, getFilters, getResults, SubmitResultsDB } from "./contest-results.ts"

interface StudentRouterConfig {
    authenticator: RequestAuthenticator,
    contestDB: ContestDB,
    permissionDB: PermissionDB,
    problemDB: ProblemDB,
    client: Client,
}

function setUpStudentRouter(router: IRouter, config: StudentRouterConfig) {
    [setUpDashboard, setUpResults].forEach(f => f(router, config))
}

function setUpDashboard(router: IRouter, config: StudentRouterConfig) {
    router.get("/", redirectIfAuthenticated(config.authenticator, '/dashboard'), (_, res, __) => res.render("index"));

    router.get("/dashboard/student",
        authenticatedOnly(config.authenticator),
        async (req, res, next) => {
            const user = await config.authenticator.authenticateRequest(req);
            if (!user)
                throw Error("User was authorized and should not be null");

            const contests = await config.contestDB.getUserContests(user.id);
            const recent_submits = await config.contestDB.getUserSubmits(user.id, 5);
            const due_problems = await getUnsolvedProblemsThatAreCloseToTheDeadline(config.client, user.id, 5);
            recent_submits?.map(s => (s as any).submission_time = formatDateWithTime(s.submission_time))
            due_problems?.map(p => (p as any).due_date = formatDateWithoutTime(p.due_date))

            renderWithUserData(config.authenticator, "student-dashboard", {
                contests: contests,
                recent_submits: recent_submits,
                due_problems: due_problems,
            })(req, res, next);
        });

}

class UserSubmitResultDB implements SubmitResultsDB {
    user: number;
    contest: number;
    config: StudentRouterConfig;

    constructor(user: number, contest: number, config: StudentRouterConfig) {
        this.user = user;
        this.contest = contest;
        this.config = config;
    }

    async getSubmits(first: number, last: number, filters: Filters): Promise<Submit[]> {
        return (await this.config.contestDB.getUserSubmits(this.user, 20)).slice(first, last);
    }
    async getPageCount(filters: Filters): Promise<number> {
        return 5;
    }
}


function setUpResults(router: IRouter, config: StudentRouterConfig) {
    router.get("/contest/:contest_id/results",
        authorizeContestAccess(config, PermissionKind.VIEW),
        async (req, res, next) => {
            const user = await config.authenticator.authenticateRequest(req);
            if (!user)
                throw Error("User was authorized and should not be null");

            const contest_id = parseInt(req.params.contest_id);
            const filters = getFilters(req);

            const contest = await config.contestDB.getContestById(contest_id)

            const db = new UserSubmitResultDB(user.id, contest_id, config);
            const results = await getResults(filters, db);
            results.submits?.map(s => (s as any).submission_time = formatDateWithTime(s.submission_time))

            const problems = await config.problemDB.getProblemsInContest(contest_id)
            renderWithUserData(config.authenticator, "student/contest-results", {
                ...results,
                active_page: filters.page,
                contest: contest,
                problems: problems,
            })(req, res, next);
        }

    )
}


export { setUpStudentRouter }