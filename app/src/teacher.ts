// Module dedicated for handling teacher i.e. those users who can manage some contests

export { setUpTeacherRouter }

import { IRouter, OpineRequest } from "../deps.ts"
import { RequestAuthenticator } from "./auth.ts"
import { renderWithUserData, formatDateWithTime, formatDateWithoutTime, authorizeContestAccess } from "./utils.ts"
import { PermissionKind, PermissionDB } from "./permissions.ts"

import { Filters, getFilters, getResults, SubmitResultsDB } from "./contest-results.ts"
import { ContestDB, ProblemDB, Submit, NewProblem, Problem, UserDB } from "./db.ts"

interface TeacherRouterConfig {
    authenticator: RequestAuthenticator,
    contestDB: ContestDB,
    permissionDB: PermissionDB,
    problemDB: ProblemDB,
    taskDB: TaskDB,
    userDB: UserDB
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


    router.get("/teacher/contest/:contest_id", authorizeContestAccess(config, PermissionKind.MANAGE), async (req, res, next) => {
        const contest = await config.contestDB.getContestById(+req.params.contest_id);
        const problems = await config.problemDB.getProblemsInContest(+req.params.contest_id);

        renderWithUserData(config.authenticator, "teacher/contest", { contest, problems })(req, res, next);
    });
    router.get("/contest/:contestid/problem/:problemid", async (req, res, next) => {
        const contests = await getContests(req);
        renderWithUserData(config.authenticator, "student/problem", { contest: contests[0], problem: { name: 'Test', id: 1 } })(req, res, next);
    });

    router.get("/contest/:contest_id/problem/:problem_id/edit", authorizeContestAccess(config, PermissionKind.MANAGE), async (req, res, next) => {
        const contest = await config.contestDB.getContestById(+req.params.contest_id);
        const problem = await config.problemDB.getProblemById(+req.params.problem_id);
        const tasks = await config.taskDB.getTasks(+req.params.problem_id);
        for (const group of tasks.groups) {
            console.log(group.tasks);
        }
        renderWithUserData(config.authenticator, "teacher/edit-problem", { contest, problem, tasks })(req, res, next);
    });
    router.get("/contest/:contest_id/problem/:problem_id/delete", authorizeContestAccess(config, PermissionKind.MANAGE), async (req, res, next) => {
        await config.problemDB.deleteProblem(+req.params.problem_id);
        res.redirect("/teacher/contest/" + req.params.contest_id);
    });

    router.post("/contest/:contest_id/problem/:problem_id/edit", authorizeContestAccess(config, PermissionKind.MANAGE), async (req, res, next) => {
        const problem: Problem = {
            id: +req.params.problem_id,
            name: req.parsedBody['name'],
            short_name: req.parsedBody['short_name'],
            contest_id: +req.params.contest_id,
            statement_uri: req.parsedBody['statement-uri'],
            uses_points: req.parsedBody['uses_points'] !== undefined,
            position: 0,
            points: req.parsedBody['pointes'],
            due_date: req.parsedBody['due-date'],
            closing_date: req.parsedBody['closing-date'],
            published: req.parsedBody['published'] !== undefined,
            scoring_method: 1,
            source_limit: req.parsedBody['source-limit']
        }
        const tasks = JSON.parse(req.parsedBody['tests']);

        if (!await config.taskDB.updateTasks(+req.params.problem_id, tasks)) {
            const contest = await config.contestDB.getContestById(+req.params.contest_id);
            renderWithUserData(config.authenticator, "teacher/edit-problem", { contest, problem, tasks, error: "could not edit tasks" })(req, res, next);
        } else if (!await config.problemDB.updateProblem(problem)) {
            const contest = await config.contestDB.getContestById(+req.params.contest_id);
            renderWithUserData(config.authenticator, "teacher/edit-problem", { contest, problem, tasks, error: "could not edit problem" })(req, res, next);
        } else {
            res.redirect("/teacher/contest/" + req.params.contest_id);
        }
    });

    router.get("/contest/:contestid/add", async (req, res, next) => {
        const contests = await getContests(req);
        renderWithUserData(config.authenticator, "teacher/add-problem", { contest: contests[0], problem: { name: 'Test', id: 1 } })(req, res, next);
    });

    router.get("/contest/:contest_id/users", authorizeContestAccess(config, PermissionKind.MANAGE), async (req, res, next) => {
        const users = await config.permissionDB.getAllThatCanSubmit(+req.params.contest_id);
        const contest = await config.contestDB.getContestById(+req.params.contest_id);
        renderWithUserData(config.authenticator, "teacher/contest-users", { contest, users })(req, res, next);
    });

    router.get("/contest/:contest_id/adduser", authorizeContestAccess(config, PermissionKind.MANAGE), async (req, res, next) => {
        const users = await config.userDB.getAllUsers();
        const contest = await config.contestDB.getContestById(+req.params.contest_id);
        renderWithUserData(config.authenticator, "teacher/add-user", { contest, users })(req, res, next);
    });

    router.get("/contest/:contest_id/adduser/:user_id", authorizeContestAccess(config, PermissionKind.MANAGE), async (req, res, next) => {
        await config.permissionDB.grantPermission(+req.params.user_id, +req.params.contest_id, PermissionKind.SUBMIT);
        res.redirect("/contest/" + req.params.contest_id + "/users");
    });

    router.get("/contest/:contest_id/kick/:user_id", authorizeContestAccess(config, PermissionKind.MANAGE), async (req, res, next) => {
        await config.permissionDB.revokePermission(+req.params.user_id, +req.params.contest_id, PermissionKind.SUBMIT);
        res.redirect("/contest/" + req.params.contest_id + "/users");
    });

    router.post("/teacher/add-problem/:contest_id", authorizeContestAccess(config, PermissionKind.MANAGE), async (req, res, next) => {
        const problem: NewProblem = {
            name: req.parsedBody['name'],
            short_name: req.parsedBody['short_name'],
            contest_id: +req.params.contest_id,
            statement_uri: req.parsedBody['statement-uri'],
            uses_points: req.parsedBody['uses_points'] !== undefined,
            position: 0,
            points: req.parsedBody['pointes'],
            due_date: req.parsedBody['due-date'],
            closing_date: req.parsedBody['closing-date'],
            published: req.parsedBody['published'] !== undefined,
            scoring_method: 1,
            source_limit: req.parsedBody['source-limit']
        }
        if ((await config.problemDB.createProblem(problem))) {
            res.redirect("/teacher/contest/" + req.params.contest_id);
        } else {
            const contest = await config.contestDB.getContestById(+req.params.contest_id);
            renderWithUserData(config.authenticator, "teacher/add-problem", { contest, problem, error: "could not add problem" })(req, res, next);
        }
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
