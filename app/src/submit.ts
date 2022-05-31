
import { MultipartReader, R } from "../deps.ts"
import type { IRouter, OpineRequest, OpineResponse, NextFunction } from "../deps.ts"
import { format } from "../deps.ts"
import { RequestAuthenticator, authorizeUsing } from "./auth.ts"
import { renderWithUserData } from "./utils.ts"
import { SubmitDB } from "./db.ts"


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
    sourceManager: SourceManager
}

function setUpSubmitRouter(router: IRouter, config: SubmitRouterConfig) {
    router.get("/submit",
        authorizeUsing(config.authenticator, _ => true),
        renderWithUserData(config.authenticator, "submit")
    );

    router.post("/submit", async (req, res, next) => {
        const files = (await upload(req)).files('source');
        if (files != undefined) {
            const file = files[0];
            // TODO: do something smarter about that
            if (file.content == undefined)
                res.redirect("/");

            const uri = crypto.randomUUID();
            const added = await config.sourceManager.addSource(uri, file.content)
            if (!added)
                res.redirect("/")
            const submit = await config.submitDB.addSubmit(0, 0, uri);
            if (submit == null)
                res.redirect("/")
            else
                res.redirect("/results/" + submit.id.toString())
        }
    })

    router.get("/results/:submit_id",
        async (req, res, next) => {
            const submit = await config.submitDB.getSubmitById(parseInt(req.params.submit_id));
            if (submit == null) {
                res.sendStatus(404);
                return;
            }
            const src = await config.sourceManager.loadSource(submit.source);
            renderWithUserData(config.authenticator, "results",
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