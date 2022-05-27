import { OpineRequest, OpineResponse, NextFunction } from "./deps.ts"
import { RequestAuthorizer } from "./auth.ts"

/**
 * Creates a handler that authorizes request and then renders a view
 * @param view view to render
 * @param ctx additional context for renderer
 * @returns handler
 */
function renderWithUserData(authorizer: RequestAuthorizer, view: string, ctx: any = {}) {
    return async (req: OpineRequest, res: OpineResponse, _: NextFunction) => {
        const user = await authorizer.authorizeRequest(req);
        ctx.user = user;
        res.render(view, ctx);
    }
}

export { renderWithUserData };