// Common interface of rendering user results for students and for teachers
// The difference is that teacher sees results of all users and student only their own

export type { Filters, Results, SubmitResultsDB }
export { getResults, getFilters }

import { OpineRequest } from "../deps.ts"
import { Submit } from "./db.ts"


interface SubmitResultsDB {
    getSubmits(first: number, last: number, filters: Filters): Promise<Array<Submit>>;
    getPageCount(filters: Filters): Promise<number>;
}

interface Filters {
    page: number,
    limit: number,
    problem: number | null,
}

interface Page {
    number: number,
    href: string,
}

interface Results {
    submits: Submit[],
    pages: Page[],
}

async function getResults(filters: Filters, db: SubmitResultsDB): Promise<Results> {
    const first = (filters.page - 1) * filters.limit;
    const last = filters.page * filters.limit;
    const submits = await db.getSubmits(first, last, filters);
    const page_count = await db.getPageCount(filters)
    const pages = [...Array(page_count).keys()]
        .map(n => n + 1)
        .map(
            number => { return { number: number, href: paramsToHref({ ...filters, page: number }) } }
        )

    return { submits, pages }
}


function getFilters(req: OpineRequest): Filters {
    const DEFAULT_PAGE = 1;
    const DEFAULT_LIMIT = 20;

    let problem: number | null = parseInt(req.query.problem || '');
    problem = isNaN(problem) ? null : problem;

    let page: number | null = parseInt(req.query.page || '');
    page = isNaN(page) ? DEFAULT_PAGE : page;

    let limit: number | null = parseInt(req.query.limit || '');
    limit = isNaN(limit) ? DEFAULT_LIMIT : limit;

    return { page, problem, limit }
}

function paramsToHref(params: Filters): string {
    let result = "";
    const append = (name: string, value: any) => {
        if (result == "")
            result += "?"
        else
            result += "&"
        result += name + "=" + value;

    }

    if (params.page) append("page", params.page)
    if (params.limit) append("limit", params.limit)
    if (params.problem) append("problem", params.problem)

    return result;
}

