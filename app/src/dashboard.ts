export { setUpDashboardRouter }

import { IRouter } from "../deps.ts"
import { redirectIfAuthenticated, RequestAuthenticator } from "./auth.ts"

import { redirectIfUnauthenticated } from "./auth.ts"
import { formatDateWithoutTime, renderWithUserData } from "./utils.ts"

import { ContestDB } from "./db.ts"
import { getUnsolvedProblemsThatAreCloseToTheDeadline } from "./queries/submits.ts";
import { PermissionDB } from "./permissions.ts";

interface DashboardConfig {
    authenticator: RequestAuthenticator,
    permissionDB: PermissionDB,
    contestDB: ContestDB
}

function setUpDashboardRouter(router: IRouter, config: any) {
    router.get("/", redirectIfAuthenticated(config.authenticator, '/dashboard'), (_, res, __) => res.render("index"));

    router.get("/dashboard",
        redirectIfUnauthenticated(config.authenticator, "/"),
        async (req, res, next) => {
            const user = await config.authenticator.authenticateRequest(req);
            if (!user)
                throw Error("User was authorized and should not be null");

            const student_contests = await config.contestDB.getStudentContests(user.id);
            const teacher_contests = await config.contestDB.getTeacherContests(user.id);
            const is_admin = await config.permissionDB.isAdmin(user.id);

            if (is_admin && student_contests.length == 0 && teacher_contests.length == 0)
                res.redirect("/dashboard/admin")
            const filters = {
                user: user.id,
                page: 1,
                limit: 5,
                problem: null,
                contest: null
            }
            const recent_submits = await config.recentResultsDB.getSubmits(filters)
            const due_problems = await getUnsolvedProblemsThatAreCloseToTheDeadline(config.client, user.id, 5);
            due_problems?.map(p => (p as any).due_date = formatDateWithoutTime(p.due_date))

            return renderWithUserData(config.authenticator, "dashboard", {
                is_admin: is_admin,
                teacher_contests: teacher_contests,
                student_contests: student_contests,
                recent_submits: recent_submits,
                due_problems: due_problems,
            })(req, res, next);
        })
}