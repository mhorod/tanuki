// Module handling file uploads

// source: https://blog.hyper.io/uploading-files-with-deno/

import { MultipartReader, exists, R } from "./deps.ts"
import type { OpineRequest, OpineResponse, NextFunction } from "./deps.ts"

const { compose, nth, split } = R;
const TMP_DIR = '/app/public/uploads'

const getBoundary = compose(
    nth(1), split('='), nth(1), split(';')
)

export default async function (req: OpineRequest) {
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