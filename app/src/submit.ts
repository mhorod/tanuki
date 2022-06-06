
import { MultipartReader, R } from "../deps.ts"
import type { IRouter, OpineRequest, OpineResponse, NextFunction } from "../deps.ts"
import { RequestAuthenticator, authorizeUsing } from "./auth.ts"
import { renderWithUserData, renderStatusWithUserData, authorizeContestAccess, formatDateWithTime } from "./utils.ts"
import { SubmitDB, ProblemDB, ContestDB, LanguageDB, NewSubmit, Language } from "./db.ts"
import { PermissionDB, PermissionKind } from "./permissions.ts"
import { SourceManager } from "./source.ts"

const { compose, nth, split } = R;
const TMP_DIR = '/app/public/uploads'

const getBoundary = compose(
    nth(1), split('='), nth(1), split(';')
)

async function readMultipartForm(req: OpineRequest) {
    let boundary;
    const ct = req.get('content-type');
    const contentType: string = ct === undefined ? '' : ct;
    if (contentType.startsWith('multipart/form-data'))
        boundary = getBoundary(contentType);

    const form = await new MultipartReader(req.body, boundary).readForm({ maxMemory: 10 << 20, dir: TMP_DIR })
    return form;
}




interface SubmitRouterConfig {
    authenticator: RequestAuthenticator,

    submitDB: SubmitDB,
    problemDB: ProblemDB,
    contestDB: ContestDB,
    permissionDB: PermissionDB,
    languageDB: LanguageDB,

    sourceManager: SourceManager,
}

function authorizeSubmitAccess(authenticator: RequestAuthenticator, submit_id: number,
    permissionDB: PermissionDB
) {
    return async (req: OpineRequest, res: OpineResponse, next: NextFunction) => {
        await authorizeUsing(authenticator, user => permissionDB.canViewSubmit(user.id, submit_id)
        )(req, res, next);
    }
}

/**
 * Render page with "submit" button
 * @param contest_id contest
 * @param problem_id selected problem - if it's invalid then last problem is selected
 * @param config 
 * @returns 
 */
function renderSubmitPage(contest_id: number, problem_id: number | null, config: SubmitRouterConfig, ctx = {}) {
    return async (req: OpineRequest, res: OpineResponse, next: NextFunction) => {
        const contest = await config.contestDB.getContestById(contest_id);
        if (contest == null) {
            return renderStatusWithUserData(config.authenticator, 404)(req, res, next);
        }

        const problems = await config.problemDB.getProblemsInContest(contest_id);
        if (problem_id == null || isNaN(problem_id)) problem_id = problems[0].id;


        await renderWithUserData(config.authenticator, "submit", {
            ...ctx,
            contest_id: contest_id,
            contest: contest.name,
            selected_problem: problem_id,
            problems: problems,
        })(req, res, next);
    }
}

function getFileExtension(filename: string): string {
    const parts = filename.split('.');
    if (parts.length == 1) return "";
    else
        return parts[parts.length - 1];
}

function findLanguageByExtension(extension: string, languages: Array<Language>): Language | null {
    return languages.filter(l => l.extensions.some(e => e === extension)).at(0) || null;
}


function setUpSubmitRouter(router: IRouter, config: SubmitRouterConfig) {
    router.get("/submit/:contest_id",
        authorizeContestAccess(config, PermissionKind.SUBMIT),
        (req, res, next) => {
            renderSubmitPage(parseInt(req.params.contest_id), null, config)(req, res, next);
        }
    )
    router.get("/submit/:contest_id/:problem_id",
        authorizeContestAccess(config, PermissionKind.SUBMIT),
        (req, res, next) => {
            renderSubmitPage(parseInt(req.params.contest_id), parseInt(req.params.problem_id), config)(req, res, next);
        },
    );




    router.post("/submit/:contest_id",
        authorizeContestAccess(config, PermissionKind.SUBMIT),
        async (req, res, next) => {
            const user = await config.authenticator.authenticateRequest(req);
            if (user == null)
                throw new Error("User should not be null")

            const form = await readMultipartForm(req);
            const values = form.values("problem_id");

            const contest_id = parseInt(req.params.contest_id);
            const problem_id = values == undefined ? NaN : parseInt(values[0]);

            const problem = isNaN(problem_id) ? null : await config.problemDB.getProblemById(problem_id);
            if (problem == null || problem.contest_id != contest_id)
                return renderStatusWithUserData(config.authenticator, 400)(req, res, next);

            const onSubmitFail = (error: string) => renderSubmitPage(contest_id, problem_id, config, { error: error })(req, res, next);

            const redirect_back = "/submit/" + contest_id.toString() + "/" + problem_id.toString();


            const files = form.files('source');
            if (!files || files.length == 0)
                return onSubmitFail("file upload error");


            const file = files[0];
            if (!file)
                return onSubmitFail("file upload error");

            const content = file.content;
            if (!content)
                return onSubmitFail("file upload error");


            const extension = getFileExtension(file.filename);
            const languages = await config.languageDB.getProblemLanguages(problem_id);
            const language = findLanguageByExtension(extension, languages);

            if (!language)
                return onSubmitFail("invalid file extension");

            const uri = "submitted/" + crypto.randomUUID() + "." + extension;
            const added = await config.sourceManager.addSource(uri, content);
            if (!added)
                return res.redirect(redirect_back);

            const newSubmit: NewSubmit = {
                source_uri: uri,
                user_id: user.id,
                problem_id: problem_id,
                language_id: language.id,
            };

            const submit = await config.submitDB.addSubmit(newSubmit);

            if (!submit)
                return onSubmitFail("failed to save submission");

            res.redirect("/results/" + submit.id.toString())
        })

    router.get("/results/:submit_id",
        async (req, res, next) => {
            const submit_id = parseInt(req.params.submit_id);
            await authorizeSubmitAccess(config.authenticator, submit_id, config.permissionDB)(req, res, next);
        },
        async (req, res, next) => {
            const submit_id = parseInt(req.params.submit_id);
            const submit = await config.submitDB.getSubmitById(submit_id);
            if (submit == null) {
                return renderStatusWithUserData(config.authenticator, 404)(req, res, next);
            }
            const src = await config.sourceManager.loadSource(submit.source_uri.trim());
            await renderWithUserData(config.authenticator, "results",
                {
                    submit: req.params.submit_id,
                    contest: submit.contest_name,
                    problem: submit.short_problem_name,
                    status: submit.status,
                    language: submit.language_name,
                    source_uri: submit.id,
                    src: src,
                    date: formatDateWithTime(submit.submission_time),
                }
            )(req, res, next);
        }
    )

    router.get("/files/submitted/:submit_id",
        async (req, res, next) => {
            const submit_id = parseInt(req.params.submit_id);
            await authorizeSubmitAccess(config.authenticator, submit_id, config.permissionDB)(req, res, next);
        },
        async (req, res, next) => {
            const submit = await config.submitDB.getSubmitById(parseInt(req.params.submit_id));
            if (submit == null)
                return renderStatusWithUserData(config.authenticator, 404)(req, res, next);
            console.log(submit);
            const source = await config.sourceManager.loadSource(submit.source_uri);
            if (source == null)
                return renderStatusWithUserData(config.authenticator, 404)(req, res, next);

            const download_name = submit.id.toString() + "." + getFileExtension(submit.source_uri);
            res.download(await config.sourceManager.getFullPath(submit.source_uri), download_name);
        })
}

export { setUpSubmitRouter }
export type { SourceManager }
