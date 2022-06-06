// Module dedicated for handling teacher i.e. those users who can manage some contests

export { setUpTeacherRouter }

import { IRouter, OpineRequest } from "../deps.ts"
import { RequestAuthenticator } from "./auth.ts"
import { ContestDB, ProblemDB, Submit } from "./db.ts"
import { renderWithUserData, formatDateWithTime, formatDateWithoutTime, authorizeContestAccess } from "./utils.ts"
import { PermissionKind, PermissionDB } from "./permissions.ts"

import { Filters, getFilters, getResults, SubmitResultsDB } from "./results.ts"

interface TeacherRouterConfig {
    authenticator: RequestAuthenticator,
    contestDB: ContestDB,
    permissionDB: PermissionDB,
    problemDB: ProblemDB,
}

function setUpTeacherRouter(router: IRouter, config: TeacherRouterConfig) {
    router.get("/dashboard/teacher", renderWithUserData(config.authenticator, "teacher-dashboard"));

    setUpResults(router, config)
    const getContests = async (req: OpineRequest) => {
        const user = await config.authenticator.authenticateRequest(req);
        if (!user)
            return [];
        else
            return await config.contestDB.getUserContests(user.id)
    }

    router.post("/edit/:id", async (req, res, next) => {
        console.log(req.parsedBody);
        const contests = await getContests(req);
        renderWithUserData(config.authenticator, "teacher/edit-problem", { contest: contests[0], problem: { name: 'Test', id: 1 } })(req, res, next);
    });

    router.get("/teacher/contest/:id", async (req, res, next) => {
        const contests = await getContests(req);
        renderWithUserData(config.authenticator, "teacher/contest", { contest: contests[0] })(req, res, next);
    });
    router.get("/contest/:contestid/problem/:problemid", async (req, res, next) => {
        const contests = await getContests(req);
        renderWithUserData(config.authenticator, "student/problem", { contest: contests[0], problem: { name: 'Test', id: 1 } })(req, res, next);
    });
    router.get("/contest/:contestid/problem/:problemid/edit", async (req, res, next) => {
        const contests = await getContests(req);
        renderWithUserData(config.authenticator, "teacher/edit-problem", { contest: contests[0], problem: { name: 'Test', id: 1 } })(req, res, next);
    });
    router.get("/contest/:contestid/add", async (req, res, next) => {
        const contests = await getContests(req);
        renderWithUserData(config.authenticator, "teacher/add-problem", { contest: contests[0], problem: { name: 'Test', id: 1 } })(req, res, next);
    });
    router.get("/contest/:contestid/users", async (req, res, next) => {
        const contests = await getContests(req);
        renderWithUserData(config.authenticator, "teacher/contest-users", { contest: contests[0], problem: { name: 'Test', id: 1 } })(req, res, next);
    });
    router.get("/contest/:contestid/adduser", async (req, res, next) => {
        const contests = await getContests(req);
        renderWithUserData(config.authenticator, "teacher/add-user", { contest: contests[0], problem: { name: 'Test', id: 1 } })(req, res, next);
    });
}

class TeacherSubmitResultDB implements SubmitResultsDB {
    contest: number;
    config: TeacherRouterConfig;

    constructor(contest: number, config: TeacherRouterConfig) {
        this.contest = contest;
        this.config = config;
    }

    async getSubmits(first: number, last: number, filters: Filters): Promise<Submit[]> {
        return (await this.config.contestDB.getUserSubmits(7, 20)).slice(first, last);
    }
    async getPageCount(filters: Filters): Promise<number> {
        return 5;
    }
}


function setUpResults(router: IRouter, config: TeacherRouterConfig) {
    router.get("/teacher/contest/:contest_id/results",
        authorizeContestAccess(config, PermissionKind.VIEW),
        async (req, res, next) => {
            const user = await config.authenticator.authenticateRequest(req);
            if (!user)
                throw Error("User was authorized and should not be null");

            const contest_id = parseInt(req.params.contest_id);
            const filters = getFilters(req);

            const contest = await config.contestDB.getContestById(contest_id)

            const db = new TeacherSubmitResultDB(contest_id, config);
            const results = await getResults(filters, db);
            results.submits?.map(s => (s as any).submission_time = formatDateWithTime(s.submission_time))

            const problems = await config.problemDB.getProblemsInContest(contest_id)
            renderWithUserData(config.authenticator, "teacher/contest-results", {
                ...results,
                active_page: filters.page,
                contest: contest,
                problems: problems,
            })(req, res, next);
        }

    )
}
