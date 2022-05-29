
import { MultipartReader, exists, R } from "../deps.ts"
import type { IRouter, OpineRequest, OpineResponse, NextFunction } from "../deps.ts"

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

    console.log(boundary);
    if (!(await exists(TMP_DIR)))
        await Deno.mkdir(TMP_DIR, { recursive: true })
    const form = await new MultipartReader(req.body, boundary).readForm({ maxMemory: 10 << 20, dir: TMP_DIR })

    return form;
}

export function handleSubmits(router: IRouter) {
    router.get("/submit", (req, res, next) => {
        res.render("submit")
    })

    router.post("/submit", async (req, res, next) => {
        const files = (await upload(req)).files('source');
        if (files != undefined) {
            const file = files[0];
            console.log(file);
            if (file.content != undefined)
                Deno.writeFile("/app/public/uploads/0.png", file.content);
            res.render("submit-results", { src: "/uploads/0.png" })
        }
    })
}