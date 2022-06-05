import { OpineRequest, OpineResponse, NextFunction } from "../deps.ts"
import { RequestAuthenticator } from "./auth.ts"

/**
 * Simple implementation of Rust's Result type
 * Has two variants: Ok and Err representing (un)successful operation results
 * Provides monadic operations
 */
class Result<T, E> {
    readonly value: T | null = null;
    readonly error: E | null = null;
    constructor(value: T | null = null, error: E | null) {
        this.value = value;
        this.error = error;
    }

    static ok<T, E>(value: T) { return new Result<T, E>(value, null); }
    static err<T, E>(error: E) { return new Result<T, E>(null, error); }

    map<U>(f: (value: T) => U): Result<U, E> {
        if (this.value != null)
            return new Result<U, E>(f(this.value), null);
        else
            return new Result<U, E>(null, this.error);
    }

    and_then<U>(f: (value: T) => Result<U, E>): Result<U, E> {
        if (this.value != null)
            return f(this.value);
        else
            return new Result<U, E>(null, this.error);
    }

    isOk() { return this.value != null; }
    unwrap() { return this.value; }
}


/**
 * Creates a handler that authenticates request and then renders a view
 * @param view view to render
 * @param ctx additional context for renderer
 * @returns handler
 */
function renderWithUserData(authenticator: RequestAuthenticator, view: string, ctx: any = {}) {
    return async (req: OpineRequest, res: OpineResponse, _: NextFunction) => {
        const user = await authenticator.authenticateRequest(req);
        ctx.user = user;
        res.render(view, ctx);
    }
}

function renderStatusWithUserData(authenticator: RequestAuthenticator, status: number, ctx: any = {}) {
    return async (req: OpineRequest, res: OpineResponse, _: NextFunction) => {
        const user = await authenticator.authenticateRequest(req);
        res.setStatus(status);
        res.render("errors/" + status.toString(), { ...ctx, user: user })
    }
}

export { renderWithUserData, renderStatusWithUserData, Result };