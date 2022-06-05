import { OpineRequest, OpineResponse, NextFunction } from "../deps.ts"
import { RequestAuthenticator, authorizeUsing } from "./auth.ts"
import { PermissionDB, PermissionKind } from "./permissions.ts"

/**
 * Creates a handler that authenticates request and then renders a view
 * @param view view to render
 * @param ctx additional context for renderer
 * @returns handler
 */
function renderWithUserData(authenticator: RequestAuthenticator, view: string, ctx: any = {}) {
    return async (req: OpineRequest, res: OpineResponse, _: NextFunction) => {
        const user = await authenticator.authenticateRequest(req);
        ctx.user = user;
        res.render(view, ctx);
    }
}

function renderStatusWithUserData(authenticator: RequestAuthenticator, status: number, ctx: any = {}) {
    return async (req: OpineRequest, res: OpineResponse, _: NextFunction) => {
        const user = await authenticator.authenticateRequest(req);
        res.setStatus(status);
        res.render("errors/" + status.toString(), { ...ctx, user: user })
    }
}
interface ContestAccessConfig {
    authenticator: RequestAuthenticator,
    permissionDB: PermissionDB,
}

/**
 * Checks `contest_id` parameter of the path and 
 * @param config 
 * @returns 
 */
function authorizeContestAccess(config: ContestAccessConfig, requiredPermission: PermissionKind) {
    return (req: OpineRequest, res: OpineResponse, next: NextFunction) => {
        const contest_id = parseInt(req.params.contest_id);
        if (isNaN(contest_id))
            renderStatusWithUserData(config.authenticator, 404);
        authorizeUsing(config.authenticator, async user => {
            if (requiredPermission == PermissionKind.VIEW || requiredPermission == PermissionKind.MANAGE)
                return await config.permissionDB.canViewContest(user.id, contest_id)
            else if (requiredPermission == PermissionKind.SUBMIT)
                return await config.permissionDB.canSubmit(user.id, contest_id)
            else return false;
        })(req, res, next);

    };
}
export { renderWithUserData, renderStatusWithUserData, authorizeContestAccess };