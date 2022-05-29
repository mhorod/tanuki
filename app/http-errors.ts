import { renderWithUserData } from "./utils.ts"

function renderError(req: OpineRequest, res: OpineResponse, error: string) {
    renderWithUserData(req, res, error);
}