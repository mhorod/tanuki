import { OpineRequest, OpineResponse } from "./deps.ts"
import { getFrontendUserData } from "./auth.ts"

function renderWithUserData(req: OpineRequest, res: OpineResponse, view: string, ctx: any = {}) {
    const user = getFrontendUserData(req);
    ctx.user = user;
    res.render(view, ctx);
}

export { renderWithUserData };