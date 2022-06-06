import { IRouter, Client, OpineRequest } from "../deps.ts"

import { RequestAuthenticator, redirectIfAuthenticated, authenticatedOnly } from "./auth.ts"
import { renderWithUserData, formatDateWithTime, formatDateWithoutTime, authorizeContestAccess } from "./utils.ts"
import { ContestDB, ProblemDB } from "./db.ts"
import { getUnsolvedProblemsThatAreCloseToTheDeadline } from "./queries/submits.ts"
import { PermissionKind, PermissionDB } from "./permissions.ts"

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
    router.get("/dashboard", (_, res, __) => res.redirect("/dashboard/student"));

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

interface ResultsParams {
    page: number,
    limit: number,
    problem: number | null,
}

function setUpResults(router: IRouter, config: StudentRouterConfig) {
    router.get("/contest/:contest_id/results",
        authorizeContestAccess(config, PermissionKind.VIEW),
        async (req, res, next) => {
            const user = await config.authenticator.authenticateRequest(req);
            if (!user)
                throw Error("User was authorized and should not be null");

            const contest_id = parseInt(req.params.contest_id);
            const params = loadParams(req);

            const contest = await config.contestDB.getContestById(contest_id)

            const submits = await getDisplayedSubmits(user.id, contest_id, params, config);
            submits?.map(s => (s as any).submission_time = formatDateWithTime(s.submission_time))

            const page_count = await getPageCount(user.id, contest_id, params, config)
            const pages = [...Array(page_count).keys()]
                .map(n => n + 1)
                .map(
                    number => { return { number: number, href: paramsToHref({ ...params, page: number }) } }
                )

            const problems = await config.problemDB.getProblemsInContest(contest_id)
            renderWithUserData(config.authenticator, "student/contest-results", {
                pages: pages,
                active_page: params.page,
                contest: contest,
                submits: submits,
                problems: problems,
            })(req, res, next);
        }

    )
}

// TODO: Replace with actual query to database
async function getDisplayedSubmits(user: number, contest: number, params: ResultsParams, config: StudentRouterConfig) {
    const begin = (params.page - 1) * params.limit;
    const end = params.page * params.limit;
    return (await config.contestDB.getUserSubmits(user, 20)).slice(begin, end);
}

// TODO: Replace with actual query to database
async function getPageCount(user: number, contest: number, params: ResultsParams, config: StudentRouterConfig) {
    return 5;
}


function loadParams(req: OpineRequest): ResultsParams {
    const DEFAULT_PAGE = 1;
    const DEFAULT_LIMIT = 20;

    let problem: number | null = parseInt(req.query.problem || '');
    problem = isNaN(problem) ? null : problem;

    let page: number | null = parseInt(req.query.page || '');
    page = isNaN(page) ? DEFAULT_PAGE : page;

    let limit: number | null = parseInt(req.query.limit || '');
    limit = isNaN(limit) ? DEFAULT_LIMIT : limit;

    return { page, problem, limit }
}

function paramsToHref(params: ResultsParams): string {
    let result = "";
    const append = (name: string, value: any) => {
        if (result == "")
            result += "?"
        else
            result += "&"
        result += name + "=" + value;

    }

    if (params.page) append("page", params.page)
    if (params.limit) append("limit", params.limit)
    if (params.problem) append("problem", params.problem)

    return result;
}



export { setUpStudentRouter }