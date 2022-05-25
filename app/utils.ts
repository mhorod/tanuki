import { OpineRequest, OpineResponse } from "./deps.ts"
import { getFrontendUserData } from "./auth.ts"

async function renderWithUserData(req: OpineRequest, res: OpineResponse, view: string, ctx: any = {}) {
    const user = await getFrontendUserData(req);
    ctx.user = user;
    res.render(view, ctx);
}

export { renderWithUserData };