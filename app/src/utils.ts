import { OpineRequest, OpineResponse, NextFunction } from "../deps.ts"
import { RequestAuthenticator } from "./auth.ts"

/**
 * Creates a handler that authenticates request and then renders a view
 * @param view view to render
 * @param ctx additional context for renderer
 * @returns handler
 */
function renderWithUserData(authenticater: RequestAuthenticator, view: string, ctx: any = {}) {
    return async (req: OpineRequest, res: OpineResponse, _: NextFunction) => {
        const user = await authenticater.authenticateRequest(req);
        ctx.user = user;
        res.render(view, ctx);
    }
}

export { renderWithUserData };