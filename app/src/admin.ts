export { setUpAdminRouter }

import { IRouter, OpineRequest, OpineResponse, NextFunction } from "../deps.ts"
import { RequestAuthenticator, authorizeUsing } from "./auth.ts"
import { ContestDB, NewContest, UserDB, EditedUser } from "./db.ts"
import { PermissionDB, PermissionKind } from "./permissions.ts"
import { renderWithUserData, renderStatusWithUserData } from "./utils.ts"

interface AdminRouterConfig {
    authenticator: RequestAuthenticator,
    permissionDB: PermissionDB,
    contestDB: ContestDB,
    userDB: UserDB
}

function setUpAdminRouter(router: IRouter, config: AdminRouterConfig) {
    const authorize = authorizeUsing(config.authenticator, user => config.permissionDB.isAdmin(user.id))
    const getContests = async () => {
        return await config.contestDB.getAllContests();
    }

    router.get("/dashboard/admin", authorize, async (req, res, next) => {
        renderWithUserData(config.authenticator, "admin/dashboard")(req, res, next);
    });
    router.get("/admin/contests", authorize, async (req, res, next) => {
        const contests = await getContests();
        renderWithUserData(config.authenticator, "admin/contests", { contests })(req, res, next);
    });

    router.get("/admin/add-contest", authorize, async (req, res, next) => {
        const contests = await getContests();
        renderWithUserData(config.authenticator, "admin/add-contest", { contests, contest: {} })(req, res, next);
    });
    router.get("/admin/contest/:id", authorize, async (req, res, next) => {
        const contest = await config.contestDB.getContestById(+req.params.id);
        const owners = await config.permissionDB.getAllThatCanEdit(+req.params.id);
        renderWithUserData(config.authenticator, "admin/contest", { contest, owners })(req, res, next);
    });

    router.post("/admin/add-contest", authorize, async (req, res, next) => {
        const new_contest = {
            name: req.parsedBody['name'],
            short_name: req.parsedBody['short_name'],
            is_active: req.parsedBody['is_active'] !== undefined,
        } as NewContest;

        const added_contest = await config.contestDB.addNewContest(new_contest);
        if (added_contest) {
            res.redirect("/dashboard/admin");
        } else {
            renderWithUserData(config.authenticator, "admin/add-contest", { error: 'failed to add contest', contest: req.parsedBody })(req, res, next);
        }
    });

    router.get("/admin/user/:id", authorize, async (req, res, next) => {
        const edited_user = await config.userDB.getUserById(+req.params.id);
        if (edited_user) {
            renderWithUserData(config.authenticator, "admin/user", { edited_user })(req, res, next);
        } else {
            renderStatusWithUserData(config.authenticator, 404)(req, res, next);
        }
    });

    router.get("/admin/delete-user/:id", authorize, async (req, res, next) => {
        const user = await config.authenticator.authenticateRequest(req);
        let error = null;
        if (user != null && user.id == +req.params.id)
            error = "you cannot delete yourself"

        let deleted_user;
        if (!error)
            deleted_user = await config.userDB.deleteUser(+req.params.id);
        if (deleted_user) {
            res.redirect("/admin/users");
        } else {
            const edited_user = await config.userDB.getUserById(+req.params.id);
            renderWithUserData(config.authenticator, "admin/user", { edited_user, error: error || "could not delete user" })(req, res, next);
        }
    });
    router.post("/admin/user/:id", authorize,
        async (req, res, next) => {

            const updated_user: EditedUser = {
                login: req.parsedBody['login'],
                name: req.parsedBody['name'],
                surname: req.parsedBody['surname'],
                email: req.parsedBody['email'],
            };

            const success = await config.userDB.editUser(+req.params.id, updated_user);
            const edited_user = await config.userDB.getUserById(+req.params.id);
            if (success) {
                renderWithUserData(config.authenticator, "admin/user", { edited_user, success: "editted user successfully" })(req, res, next);
            } else {
                renderWithUserData(config.authenticator, "admin/user", { edited_user, error: "could not edit user" })(req, res, next);
            }
        });
    router.get("/admin/delete-contest/:contest_id", authorize, async (req, res, next) => {
        await config.contestDB.deleteContest(+req.params.contest_id);
        const contests = await getContests();
        renderWithUserData(config.authenticator, "admin/dashboard", { contests })(req, res, next);
    });

    router.post("/admin/edit-contest/:contestid", authorize, async (req, res, next) => {
        const new_contest = {
            name: req.parsedBody['name'],
            short_name: req.parsedBody['short_name'],
            is_active: req.parsedBody['is_active'] !== undefined,
        } as NewContest;


        const edited_contest = await config.contestDB.editContest(+req.params.contestid, new_contest);
        const contest = await config.contestDB.getContestById(+req.params.contestid);
        const owners = await config.permissionDB.getAllThatCanEdit(+req.params.contestid);
        if (edited_contest) {
            renderWithUserData(config.authenticator, "admin/contest", { contest, owners, success: 'contest editted successfully' })(req, res, next);
        } else {
            renderWithUserData(config.authenticator, "admin/contest", { contest, owners, error: 'failed to edit contest' })(req, res, next);
        }
    });

    router.get("/admin/add-owner/:contest_id", authorize, async (req, res, next) => {
        const users = await config.userDB.getAllUsers();
        const contest = await config.contestDB.getContestById(+req.params.contest_id);
        renderWithUserData(config.authenticator, "admin/add-owner", { contest, users })(req, res, next);
    });
    router.get("/admin/users", authorize, async (req, res, next) => {
        const users = await config.userDB.getAllUsers();
        renderWithUserData(config.authenticator, "admin/users", { users })(req, res, next);
    });

    router.get("/admin/add-owner/:contest_id/:user_id", authorize, async (req, res, next) => {
        await config.permissionDB.grantPermission(+req.params.user_id, +req.params.contest_id, PermissionKind.MANAGE);
        res.redirect("/admin/contest/" + req.params.contest_id);
    });

    router.get("/admin/delete-owner/:contest_id/:user_id", authorize, async (req, res, next) => {
        await config.permissionDB.revokePermission(+req.params.user_id, +req.params.contest_id, PermissionKind.MANAGE);
        res.redirect("/admin/contest/" + req.params.contest_id);
    });

}
