/**
 * Stuff for rendering contests and problems
 */


import { IRouter } from "../deps.ts";
import { format } from "../deps.ts"
import { RequestAuthenticator } from "./auth.ts"
import { ContestDB, GraphicalProblemDB } from "./db.ts"
import { PermissionDB, PermissionKind } from "./permissions.ts"
import { renderWithUserData, authorizeContestAccess, renderStatusWithUserData } from "./utils.ts"
import { SourceManager } from "./source.ts"

interface ContestRouterConfig {
    authenticator: RequestAuthenticator,
    contestDB: ContestDB,
    graphicalProblemDB: GraphicalProblemDB,
    permissionDB: PermissionDB,
    sourceManager: SourceManager,
}

function setUpContestRouter(router: IRouter, config: ContestRouterConfig) {
    router.get("/contest/:contest_id",
        authorizeContestAccess(config, PermissionKind.VIEW),
        async (req, res, next) => {
            const user = await config.authenticator.authenticateRequest(req);
            if (!user)
                throw Error("User was authentiated and should not be null");

            const contest_id = parseInt(req.params.contest_id);
            if (await config.permissionDB.canManageContest(user.id, contest_id))
                res.redirect("/teacher/contest/" + contest_id);

            const contest = await config.contestDB.getContestById(contest_id);
            const problems: any[] = await config.graphicalProblemDB.getGraphicalProblemsInContest(contest_id, user.id)
            problems.forEach(
                p => { p.contest_id = contest_id; p.due_date = format(p.due_date, "dd-MM-yyyy") }
            )

            renderWithUserData(config.authenticator, "student/contest", {
                contest: contest,
                problems: problems
            })(req, res, next);
        });

    router.get("/contest/:contest_id/problem/:problem_id",
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

            const p = {
                ...problem,
                contest_id: contest_id,
                statement: await config.sourceManager.loadSource(problem.statement_uri)
            }
            renderWithUserData(config.authenticator, "student/problem", { contest: contest, problem: p })(req, res, next);
        });
}

export { setUpContestRouter }
export type { ContestRouterConfig }