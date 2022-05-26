import { OpineRequest, OpineResponse, NextFunction } from "./deps.ts"
import { Authorizer, getUserData } from "./auth.ts"

function renderWithUserData(authorizer: Authorizer, view: string, ctx: any = {}) {
    return async (req: OpineRequest, res: OpineResponse, _: NextFunction) => {
        const user = await getUserData(authorizer, req);
        ctx.user = user;
        res.render(view, ctx);
    }
}

export { renderWithUserData };