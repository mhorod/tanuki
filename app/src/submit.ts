
import { MultipartReader, R } from "../deps.ts"
import type { IRouter, OpineRequest, OpineResponse, NextFunction } from "../deps.ts"
import { format } from "../deps.ts"
import { RequestAuthenticator, authorizeUsing, UserData } from "./auth.ts"
import { renderWithUserData, renderStatusWithUserData, Result } from "./utils.ts"
import { SubmitDB, ProblemDB } from "./db.ts"


const { compose, nth, split } = R;
const TMP_DIR = '/app/public/uploads'

const getBoundary = compose(
    nth(1), split('='), nth(1), split(';')
)

async function upload(req: OpineRequest) {
    let boundary;
    const ct = req.get('content-type');
    const contentType: string = ct === undefined ? '' : ct;
    if (contentType.startsWith('multipart/form-data'))
        boundary = getBoundary(contentType);

    const form = await new MultipartReader(req.body, boundary).readForm({ maxMemory: 10 << 20, dir: TMP_DIR })

    return form;
}


interface SourceManager {
    /**
     * Add new source file to database
     * @returns Promise with boolean value that is true when operation succeeded
     */
    addSource(uri: string, source: any): Promise<boolean>;

    /**
     * Load source file from given uri
     * @returns Promise with file content, or null if operation failed
     */
    loadSource(uri: string): Promise<string | null>;

}

interface SubmitRouterConfig {
    authenticator: RequestAuthenticator,
    submitDB: SubmitDB,
    problemDB: ProblemDB,
    sourceManager: SourceManager,
    hasSubmitAccess: (user: UserData, submit_id: number) => Promise<boolean>
}

function authorizeSubmitAccess(authenticator: RequestAuthenticator, submit_id: number,
    hasSubmitAccess: (user: UserData, submit_id: number) => Promise<boolean>
) {
    return async (req: OpineRequest, res: OpineResponse, next: NextFunction) => {
        await authorizeUsing(authenticator, user =>
            hasSubmitAccess(user, submit_id)
        )(req, res, next);
    }
}

function setUpSubmitRouter(router: IRouter, config: SubmitRouterConfig) {
    router.get("/submit/:contest_id/:problem_id",
        // authorizeUsing(config.authenticator, async user => await user !== null),
        async (req, res, next) => {
            const contest_id = parseInt(req.params.contest_id);
            let problem_id = parseInt(req.params.problem_id);

            const problems = await config.problemDB.getProblemsInContest(contest_id);
            if (isNaN(problem_id)) problem_id = problems[0].id;

            await renderWithUserData(config.authenticator, "submit", {
                contest: contest_id,
                selected_problem: problem_id,
                problems: problems,
            })(req, res, next);
        }
    );

    router.post("/submit",
        authorizeUsing(config.authenticator, async user => await user !== null),
        async (req, res, next) => {
            const user = await config.authenticator.authenticateRequest(req);
            if (user == null)
                throw new Error("User should not be null")
            const files = (await upload(req)).files('source');
            let result = Result.ok(files);
            const uri = crypto.randomUUID();

            result =
                result
                    .and_then(files => files ? Result.ok<any, any>(files[0]) : Result.err("error"))
                    .and_then(file => file ? Result.ok<any, any>(file.content) : Result.err("error"));
            if (!result.isOk) {
                return res.redirect("/submit");
            }
            const added = await config.sourceManager.addSource(uri, result.unwrap());
            if (!added)
                return res.redirect("/submit");

            const submit = await config.submitDB.addSubmit(0, user.id, uri)
            if (!submit)
                return res.redirect("/submit");

            res.redirect("/results/" + submit.id.toString())
        })

    router.get("/results/:submit_id",
        async (req, res, next) => {
            const submit_id = parseInt(req.params.submit_id);
            await authorizeSubmitAccess(config.authenticator, submit_id, config.hasSubmitAccess)(req, res, next);
        },
        async (req, res, next) => {
            const submit_id = parseInt(req.params.submit_id);
            const submit = await config.submitDB.getSubmitById(submit_id);
            if (submit == null) {
                return renderStatusWithUserData(config.authenticator, 404)(req, res, next);
            }
            const src = await config.sourceManager.loadSource(submit.source);
            await renderWithUserData(config.authenticator, "results",
                {
                    submit: req.params.submit_id,
                    contest: "Kurs obsługi dziurkacza",
                    problem: "A",
                    status: "OK",
                    src: src,
                    date: format(submit.date, "yyyy-MM-dd, hh:mm:ss")
                }
            )(req, res, next);
        }
    )
}

export { setUpSubmitRouter }
export type { SourceManager }