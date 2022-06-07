/**
 * Connects all paths to the provided router
 * This file exists to clean up import clutter from app.ts
 */
import { IRouter } from "../deps.ts"
import { setUpSubmitRouter } from "./submit.ts"
import { setUpAccountRouter } from "./account.ts"
import { setUpContestRouter } from "./contest.ts"
import { setUpTeacherRouter } from "./teacher.ts"
import { setUpAuthRouter } from "./auth.ts"
import { setUpStudentRouter } from "./student.ts"
import { setUpAdminRouter } from "./admin.ts"

import { redirectIfUnauthenticated } from "./auth.ts"

export default function (router: IRouter, config: any) {
    [
        setUpAuthRouter,
        setUpSubmitRouter,
        setUpAccountRouter,
        setUpContestRouter,
        setUpTeacherRouter,
        setUpAdminRouter,
        setUpStudentRouter,
        setUpDashboardRouter
    ].forEach(f => f(router, config))
}

function setUpDashboardRouter(router: IRouter, config: any) {
    router.get("/dashboard",
        redirectIfUnauthenticated(config.authenticator, "/"),
        async (req, res, next) => {
            const user = await config.authenticator.authenticateRequest(req);
            if (!user) throw Error();
            if (await config.permissionDB.isAdmin(user.id))
                res.redirect("/dashboard/admin")
            else
                res.redirect("/dashboard/student")
        })
}