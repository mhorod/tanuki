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
import { setUpDashboardRouter } from "./dashboard.ts"


export default function (router: IRouter, config: any) {
    [
        setUpAuthRouter,
        setUpSubmitRouter,
        setUpAccountRouter,
        setUpContestRouter,
        setUpTeacherRouter,
        setUpAdminRouter,
        setUpStudentRouter,
        setUpDashboardRouter,
    ].forEach(f => f(router, config))
}
