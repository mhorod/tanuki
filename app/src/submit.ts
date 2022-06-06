
import { MultipartReader, R } from "../deps.ts"
import type { IRouter, OpineRequest, OpineResponse, NextFunction } from "../deps.ts"
import { RequestAuthenticator, authorizeUsing } from "./auth.ts"
import { renderWithUserData, renderStatusWithUserData, authorizeContestAccess, formatDateWithTime } from "./utils.ts"
import { SubmitDB, ProblemDB, ContestDB, LanguageDB, NewSubmit, Language } from "./db.ts"
import { PermissionDB, PermissionKind } from "./permissions.ts"
import { SourceManager } from "./source.ts"
import { MockSubmitResultsDB } from "./submitDB.ts"

export { setUpSubmitRouter }

const { compose, nth, split } = R;
const TMP_DIR = '/app/public/uploads'

/** get multipart form data boundary from the `content-type` part */
const getBoundary = compose(nth(1), split('='), nth(1), split(';'))

interface SubmitRouterConfig {
    authenticator: RequestAuthenticator,
    submitDB: SubmitDB,
    problemDB: ProblemDB,
    contestDB: ContestDB,
    permissionDB: PermissionDB,
    languageDB: LanguageDB,
    sourceManager: SourceManager,
}

/**
 * Connect functionality of handling submissions i.e.
 * - page with 'submit' button
 * - page with results of a submit
 * - receiving and processing a submission
 */
function setUpSubmitRouter(router: IRouter, config: SubmitRouterConfig) {
    [setUpSubmission, setUpResults, setUpSubmitPage, setUpFileAccess].forEach(f => f(router, config));
}



function setUpSubmission(router: IRouter, config: SubmitRouterConfig) {
    router.post("/submit/:contest_id",
        authorizeContestAccess(config, PermissionKind.SUBMIT),
        async (req, res, next) => {
            const user = await config.authenticator.authenticateRequest(req);
            if (user == null)
                throw new Error("User should not be null")


            const submission = await loadSubmission(req);
            if (submission == null)
                return renderStatusWithUserData(config.authenticator, 400)(req, res, next);

            const onSubmitFail = (error: string) => renderSubmitPage(
                submission.contest_id,
                submission.problem_id,
                submission.language_id,
                config, { error: error })(req, res, next);

            const extension = getFileExtension(submission.file.filename);
            const availableLanguages = await config.languageDB.getProblemLanguages(submission.problem_id);
            const language = availableLanguages.find(l => l.id == submission.language_id);

            if (!language)
                return onSubmitFail("invalid language");
            else if (language.extensions.every(e => e != extension))
                return onSubmitFail("invalid file extension");

            const uri = "submitted/" + crypto.randomUUID() + "." + extension;
            const added = await config.sourceManager.addSource(uri, submission.file.content);
            if (!added)
                return onSubmitFail("failed to save submission");


            const newSubmit: NewSubmit = {
                source_uri: uri,
                user_id: user.id,
                problem_id: submission.problem_id,
                language_id: language.id,
            };

            const submit = await config.submitDB.addSubmit(newSubmit);

            if (!submit)
                return onSubmitFail("failed to save submission");

            res.redirect("/results/" + submit.id.toString())
        })

}

/**
 * Load submission from request
 */
async function loadSubmission(req: OpineRequest) {
    const form = await readMultipartForm(req);
    const problem_id = parseInt(form?.values("problem_id")?.at(0) || '');
    const language_id = parseInt(form?.values("language_id")?.at(0) || '');
    const contest_id = parseInt(req.params.contest_id);

    if ([contest_id, problem_id, language_id].some(isNaN))
        return null;

    const file = form?.files('source')?.at(0);
    if (!file)
        return null;

    return {
        contest_id: contest_id,
        problem_id: problem_id,
        language_id: language_id,
        file: file,
    }
}

async function readMultipartForm(req: OpineRequest) {
    const contentType = req.get('content-type') || '';
    const boundary = contentType.startsWith('multipart/form-data') ? getBoundary(contentType) : null;
    if (!boundary)
        return null;
    else
        return await new MultipartReader(req.body, boundary).readForm({ maxMemory: 10 << 20, dir: TMP_DIR })
}

/**
 * Connect rendering of single submit results i.e. the page containing task results and source code
 */
function setUpResults(router: IRouter, config: SubmitRouterConfig) {
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
            const submit_results = new MockSubmitResultsDB().getSubmitResults(submit_id);

            await renderWithUserData(config.authenticator, "submit-results", { results: submit_results }
            )(req, res, next);
        }
    )

}

/**
 * Connect rendering of submit page with appropriate paths to the router
 * There are two options to submit:
 * - with specyfing the problem at /submit/:contest_id/problem/:problem_id
 * - without specyfing the problem  at /submit/:contest_id
 * If problem is not specicied it is chosen as first from the problems in the contest
 */
function setUpSubmitPage(router: IRouter, config: SubmitRouterConfig) {

    router.get("/submit/:contest_id",
        authorizeContestAccess(config, PermissionKind.SUBMIT),
        (req, res, next) => {
            renderSubmitPage(parseInt(req.params.contest_id), null, null, config)(req, res, next);
        }
    )

    router.get("/submit/:contest_id/:problem_id",
        authorizeContestAccess(config, PermissionKind.SUBMIT),
        (req, res, next) => {
            renderSubmitPage(parseInt(req.params.contest_id), parseInt(req.params.problem_id), null, config)(req, res, next);
        },
    );
}

/**
 * Render page with "submit" button
 * @param contest_id contest
 * @param problem_id selected problem - if it's null or invalid then first problem is selected
 * @param config 
 * @returns 
 */
function renderSubmitPage(contest_id: number, problem_id: number | null, language_id: number | null, config: SubmitRouterConfig, ctx = {}) {
    return async (req: OpineRequest, res: OpineResponse, next: NextFunction) => {
        const contest = await config.contestDB.getContestById(contest_id);
        if (contest == null) {
            return renderStatusWithUserData(config.authenticator, 404)(req, res, next);
        }

        const problems = await config.problemDB.getProblemsInContest(contest_id);
        // Validate that given problem_id matches the contest
        if (problems.every(p => p.id != problem_id)) problem_id = null;
        if (problem_id == null || isNaN(problem_id)) problem_id = problems[0].id;


        const problem_languages = new Map<number, Array<{ id: number, name: string }>>();
        for (const problem of problems) {

            const languages = (await config.languageDB.getProblemLanguages(problem.id))
            const mapped_names = languages.map(l => {
                return { id: l.id, name: l.name + " (" + l.extensions.map(e => "." + e).join(", ") + ")" }
            });

            problem_languages.set(problem.id, mapped_names)
        }

        if (language_id == null)
            language_id = problem_languages.get(problem_id)?.at(0)?.id || 0;


        await renderWithUserData(config.authenticator, "submit", {
            ...ctx,
            contest_id: contest_id,
            contest: contest.name,
            selected_problem: problem_id,
            problems: problems,
            problem_languages: Array.from(problem_languages.entries()),
            selected_problem_languages: problem_languages.get(problem_id),
            selected_language: language_id,
        })(req, res, next);
    }
}

/**
 * Connect downloading submitted files
 */
function setUpFileAccess(router: IRouter, config: SubmitRouterConfig) {
    router.get("/files/submitted/:submit_id",
        async (req, res, next) => {
            const submit_id = parseInt(req.params.submit_id);
            await authorizeSubmitAccess(config.authenticator, submit_id, config.permissionDB)(req, res, next);
        },
        async (req, res, next) => {
            const submit = await config.submitDB.getSubmitById(parseInt(req.params.submit_id));
            if (submit == null)
                return renderStatusWithUserData(config.authenticator, 404)(req, res, next);

            const source = await config.sourceManager.loadSource(submit.source_uri);
            if (source == null)
                return renderStatusWithUserData(config.authenticator, 404)(req, res, next);

            const download_name = submit.id.toString() + "." + getFileExtension(submit.source_uri);
            res.download(await config.sourceManager.getFullPath(submit.source_uri), download_name);
        })
}


/**
 * Returns a function that authorizes access to submits using provided permission database
 */
function authorizeSubmitAccess(
    authenticator: RequestAuthenticator,
    submit_id: number,
    permissionDB: PermissionDB
) {
    return async (req: OpineRequest, res: OpineResponse, next: NextFunction) => {
        await authorizeUsing(authenticator,
            user => permissionDB.canViewSubmit(user.id, submit_id)
        )(req, res, next);
    }
}

/**
 * Get extension of given filename or empty string if it doesn't contain dot
 */
function getFileExtension(filename: string): string {
    const parts = filename.split('.');
    return parts.length == 1 ? "" : parts[parts.length - 1];
}

/**
 * Find first language that uses provided extenstion 
 */
function findLanguageByExtension(extension: string, languages: Array<Language>): Language | null {
    return languages.filter(l => l.extensions.some(e => e === extension)).at(0) || null;
}
