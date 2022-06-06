import { IRouter, OpineRequest } from "../deps.ts"
import { RequestAuthenticator } from "./auth.ts"
import { ContestDB, NewProblem, ProblemDB, GraphicalProblemDB, Problem, UserDB } from "./db.ts"
import { renderWithUserData, authorizeContestAccess } from "./utils.ts"
import { PermissionKind, PermissionDB } from "./permissions.ts"

interface TeacherRouterConfig {
    authenticator: RequestAuthenticator,
    contestDB: ContestDB,
    problemDB: ProblemDB,
    graphicalProblemDB: GraphicalProblemDB,
    permissionDB: PermissionDB,
    userDB: UserDB
}

function setUpTeacherRouter(router: IRouter, config: TeacherRouterConfig) {
    router.get("/dashboard/teacher", renderWithUserData(config.authenticator, "teacher-dashboard"));

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
        renderWithUserData(config.authenticator, "teacher/edit-problem", { contest, problem })(req, res, next);
    });
    router.get("/contest/:contest_id/problem/:problem_id/delete", authorizeContestAccess(config, PermissionKind.MANAGE), async (req, res, next) => {
        //TODO
        res.redirect("/teacher/contest/" + req.params.problem_id);
    });

    router.post("/contest/:contest_id/problem/:problem_id/edit", authorizeContestAccess(config, PermissionKind.MANAGE), async (req, res, next) => {
        const problem: Problem = {
            id: +req.params.problem_id,
            name: req.parsedBody['name'],
            shortname: req.parsedBody['shortname'],
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
        if (await config.problemDB.updateProblem(problem)) {
            res.redirect("/teacher/contest/" + req.params.problem_id);
        } else {
            const contest = await config.contestDB.getContestById(+req.params.contest_id);
            renderWithUserData(config.authenticator, "teacher/edit-problem", { contest, problem, error: "could not edit problem" })(req, res, next);
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
            shortname: req.parsedBody['shortname'],
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

export { setUpTeacherRouter }