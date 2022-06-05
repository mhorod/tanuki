import { IRouter } from "../deps.ts"
import { RequestAuthenticator } from "./auth.ts"
import { ContestDB } from "./db.ts"
import { renderWithUserData } from "./utils.ts"

interface TeacherRouterConfig {
    authenticator: RequestAuthenticator,
    contestDB: ContestDB,
}

function setUpTeacherRouter(router: IRouter, config: TeacherRouterConfig) {
    router.get("/dashboard/teacher", renderWithUserData(config.authenticator, "teacher-dashboard"));

    router.post("/edit/:id", async (req, res, next) => {
        console.log(req.parsedBody);
        const contests = await config.contestDB.getContests();
        renderWithUserData(config.authenticator, "teacher/edit-problem", { contest: contests[0], problem: { name: 'Test', id: 1 } })(req, res, next);
    });

    router.get("/teacher/contest/:id", async (req, res, next) => {
        const contests = await config.contestDB.getContests();
        renderWithUserData(config.authenticator, "teacher/contest", { contest: contests[0] })(req, res, next);
    });
    router.get("/contest/:contestid/problem/:problemid", async (req, res, next) => {
        const contests = await config.contestDB.getContests();
        renderWithUserData(config.authenticator, "student/problem", { contest: contests[0], problem: { name: 'Test', id: 1 } })(req, res, next);
    });
    router.get("/contest/:contestid/problem/:problemid/edit", async (req, res, next) => {
        const contests = await config.contestDB.getContests();
        renderWithUserData(config.authenticator, "teacher/edit-problem", { contest: contests[0], problem: { name: 'Test', id: 1 } })(req, res, next);
    });
    router.get("/contest/:contestid/add", async (req, res, next) => {
        const contests = await config.contestDB.getContests();
        renderWithUserData(config.authenticator, "teacher/add-problem", { contest: contests[0], problem: { name: 'Test', id: 1 } })(req, res, next);
    });
    router.get("/contest/:contestid/users", async (req, res, next) => {
        const contests = await config.contestDB.getContests();
        renderWithUserData(config.authenticator, "teacher/contest-users", { contest: contests[0], problem: { name: 'Test', id: 1 } })(req, res, next);
    });
    router.get("/contest/:contestid/adduser", async (req, res, next) => {
        const contests = await config.contestDB.getContests();
        renderWithUserData(config.authenticator, "teacher/add-user", { contest: contests[0], problem: { name: 'Test', id: 1 } })(req, res, next);
    });
}

export { setUpTeacherRouter }