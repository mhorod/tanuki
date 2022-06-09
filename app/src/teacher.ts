// Module dedicated for handling teacher i.e. those users who can manage some contests

export { setUpTeacherRouter }

import { IRouter, OpineRequest } from "../deps.ts"
import { RequestAuthenticator } from "./auth.ts"
import { renderWithUserData, renderStatusWithUserData, authorizeContestAccess, formatDateWithoutTime } from "./utils.ts"
import { PermissionKind, PermissionDB } from "./permissions.ts"

import { ContestDB, ProblemDB, NewProblem, Problem, UserDB, GraphicalProblemDB } from "./db.ts"

import { TaskDB } from "./taskDB.ts"

import { getFilters, getResults, RecentResultsDB } from "./contest-results.ts"

import { SourceManager } from "./source.ts"
interface TeacherRouterConfig {
    authenticator: RequestAuthenticator,
    recentResultsDB: RecentResultsDB,
    contestDB: ContestDB,
    permissionDB: PermissionDB,
    problemDB: ProblemDB,
    taskDB: TaskDB,
    userDB: UserDB,
    graphicalProblemDB: GraphicalProblemDB
    sourceManager: SourceManager,
}

function setUpTeacherRouter(router: IRouter, config: TeacherRouterConfig) {
    [setUpResults, setUpProblemPage].forEach(f => f(router, config))
    const getContests = async (req: OpineRequest) => {
        const user = await config.authenticator.authenticateRequest(req);
        if (!user)
            return [];
        else
            return await config.contestDB.getUserContests(user.id)
    }

    const authorize = authorizeContestAccess(config, PermissionKind.MANAGE)
    router.get("/teacher/contest/:contest_id", authorize, async (req, res, next) => {
        const contest = await config.contestDB.getContestById(+req.params.contest_id);
        const problems = await config.problemDB.getProblemsInContest(+req.params.contest_id);

        renderWithUserData(config.authenticator, "teacher/contest", { contest, problems })(req, res, next);
    });

    router.get("/teacher/contest/:contest_id/problem/:problem_id/edit", authorize, async (req, res, next) => {
        const contest = await config.contestDB.getContestById(+req.params.contest_id);
        const problem = await config.problemDB.getProblemById(+req.params.problem_id);
        const tasks = await config.taskDB.getTasks(+req.params.problem_id);
        if (!(contest && problem && tasks))
            return renderStatusWithUserData(config.authenticator, 404)(req, res, next)
        renderWithUserData(config.authenticator, "teacher/edit-problem", { contest, problem, tasks })(req, res, next);
    });
    router.post("/teacher/contest/:contest_id/problem/:problem_id/delete", authorize, async (req, res, next) => {
        await config.problemDB.deleteProblem(+req.params.problem_id);
        res.redirect("/teacher/contest/" + req.params.contest_id);
    });

    router.post("/teacher/contest/:contest_id/problem/:problem_id/edit", authorize, async (req, res, next) => {
        const problem: Problem = {
            id: +req.params.problem_id,
            name: req.parsedBody['name'],
            short_name: req.parsedBody['short_name'],
            contest_id: +req.params.contest_id,
            statement_uri: req.parsedBody['statement-uri'],
            uses_points: req.parsedBody['uses_points'] !== undefined,
            points: req.parsedBody['points'],
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
            const contest = await config.contestDB.getContestById(+req.params.contest_id);
            renderWithUserData(config.authenticator, "teacher/edit-problem", { contest, problem, tasks, success: "editted problem successfully" })(req, res, next);
        }
    });

    router.get("/contest/:contest_id/add", authorize, async (req, res, next) => {
        const contest = await config.contestDB.getContestById(+req.params.contest_id);
        renderWithUserData(config.authenticator, "teacher/add-problem", { contest, problem: {} })(req, res, next);
    });

    router.get("/contest/:contest_id/users", authorize, async (req, res, next) => {
        const users = await config.permissionDB.getAllThatCanSubmit(+req.params.contest_id);
        const contest = await config.contestDB.getContestById(+req.params.contest_id);
        renderWithUserData(config.authenticator, "teacher/contest-users", { contest, users })(req, res, next);
    });

    router.get("/contest/:contest_id/adduser", authorize, async (req, res, next) => {
        const users = await config.userDB.getAllUsers();
        const contest = await config.contestDB.getContestById(+req.params.contest_id);
        renderWithUserData(config.authenticator, "teacher/add-user", { contest, users })(req, res, next);
    });

    router.get("/contest/:contest_id/adduser/:user_id", authorize, async (req, res, next) => {
        await config.permissionDB.grantPermission(+req.params.user_id, +req.params.contest_id, PermissionKind.SUBMIT);
        res.redirect("/contest/" + req.params.contest_id + "/users");
    });

    router.get("/contest/:contest_id/kick/:user_id", authorize, async (req, res, next) => {
        await config.permissionDB.revokePermission(+req.params.user_id, +req.params.contest_id, PermissionKind.SUBMIT);
        res.redirect("/contest/" + req.params.contest_id + "/users");
    });

    router.post("/teacher/add-problem/:contest_id", authorize, async (req, res, next) => {
        const problem: NewProblem = {
            name: req.parsedBody['name'],
            short_name: req.parsedBody['short_name'],
            contest_id: +req.params.contest_id,
            statement_uri: req.parsedBody['statement-uri'],
            uses_points: req.parsedBody['uses_points'] !== undefined,
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

function setUpProblemPage(router: IRouter, config: TeacherRouterConfig) {
    router.get("/teacher/contest/:contest_id/problem/:problem_id",
        authorizeContestAccess(config, PermissionKind.VIEW),
        async (req, res, next) => {

            const user = await config.authenticator.authenticateRequest(req);
            if (!user)
                throw Error("User was authentiated and should not be null");

            const contest_id = parseInt(req.params.contest_id);
            const problem_id = parseInt(req.params.problem_id);

            const contest = await config.contestDB.getContestById(contest_id);
            const problems = await config.graphicalProblemDB.getGraphicalProblemsInContest(contest_id, user.id);

            const problem = problems.find(p => p.id == problem_id);
            if (!problem)
                return renderStatusWithUserData(config.authenticator, 404)(req, res, next);
            (problem as any).contest_id = contest_id;
            (problem as any).due_date = formatDateWithoutTime(problem.due_date);

            const p = {
                ...problem,
                contest_id: contest_id,
                statement: await config.sourceManager.loadSource(problem.statement_uri)
            }
            renderWithUserData(config.authenticator, "teacher/problem", { contest: contest, problem: p })(req, res, next);
        });
}


function setUpResults(router: IRouter, config: TeacherRouterConfig) {
    router.get("/teacher/contest/:contest_id/results",
        authorizeContestAccess(config, PermissionKind.VIEW),
        async (req, res, next) => {
            const contest_id = parseInt(req.params.contest_id);
            const filters = {
                ...getFilters(req),
                contest: contest_id
            }

            const contest = await config.contestDB.getContestById(contest_id)

            const results = await getResults(filters, config.recentResultsDB);

            const problems = await config.problemDB.getProblemsInContest(contest_id)
            renderWithUserData(config.authenticator, "teacher/contest-results", {
                ...results,
                active_page: filters.page,
                contest: contest,
                problems: problems,
                selected_problem: filters.problem,
            })(req, res, next);
        }

    )
}
