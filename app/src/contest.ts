/**
 * Stuff for rendering contests and problems
 */


import { IRouter } from "../deps.ts";
import { format } from "../deps.ts"
import { RequestAuthenticator } from "./auth.ts"
import { ContestDB, GraphicalProblemDB } from "./db.ts"
import { PermissionDB, PermissionKind } from "./permissions.ts"
import { renderWithUserData, authorizeContestAccess } from "./utils.ts"

interface ContestRouterConfig {
    authenticator: RequestAuthenticator,
    contestDB: ContestDB,
    graphicalProblemDB: GraphicalProblemDB,
    permissionDB: PermissionDB,
}

function setUpContestRouter(router: IRouter, config: ContestRouterConfig) {
    router.get("/contest/:contest_id",
        authorizeContestAccess(config, PermissionKind.VIEW),
        async (req, res, next) => {
            const user = await config.authenticator.authenticateRequest(req);
            if (!user)
                throw Error("User was authentiated and should not be null");

            const contest_id = parseInt(req.params.contest_id);
            const contest = await config.contestDB.getContestById(contest_id);
            const problems: any[] = await config.graphicalProblemDB.getGraphicalProblemsInContest(contest_id, user.id)
            problems.forEach(
                p => p.due_date = format(p.due_date, "dd-MM-yyyy"),
            )

            renderWithUserData(config.authenticator, "student/contest", {
                contest: contest,
                problems: problems
            })(req, res, next);
        });

    router.get("/contest/:contestid/problem/:problemid",
        authorizeContestAccess(config, PermissionKind.VIEW),
        async (req, res, next) => {
            const contests = await config.contestDB.getContests();
            renderWithUserData(config.authenticator, "student/problem", { contest: contests[0], problem: { name: 'Test', id: 1 } })(req, res, next);
        });
}

export { setUpContestRouter }
export type { ContestRouterConfig }