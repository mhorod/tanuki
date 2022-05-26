import { OpineRequest } from "./deps.ts"
import { create, verify, getCookies } from "./deps.ts"
import { UserData, Session } from "./auth.ts"
import { OpineResponse } from "./deps.ts"
import { deleteCookie, setCookie } from "./deps.ts"

const JWT_KEY = await crypto.subtle.generateKey(
    { name: "HMAC", hash: "SHA-512" },
    true,
    ["sign", "verify"]
);

class JWTSession implements Session {
    async logIn(user: UserData, res: OpineResponse) {
        console.log(user)
        // If credentials are valid send back a cookie with a token
        const token = await createUserToken(user);
        res.headers = new Headers();
        setCookie(res.headers, {
            name: "token",
            value: token,
            //secure: true, // TODO: Uncomment that in release version
            httpOnly: true,
        });
    }
    logOut(res: OpineResponse) {
        if (res.headers)
            deleteCookie(res.headers, "token");
    }

    /**
     * Extracts authorization data from request if it's valid
     *  
     * @param req  Request to authorized
     * @returns authorization data, or null if the request cannot be verified
     */
    async authorizeRequest(req: OpineRequest): Promise<UserData | null> {
        const cookie = getCookies(req.headers);
        const token = cookie.token;

        if (token == null) return null;

        // We want `any` here, because we extract variables and create interface
        // deno-lint-ignore no-explicit-any
        let verified: any;
        try {
            verified = await verify(token, JWT_KEY);
        }
        catch {
            return null
        }
        return { login: verified.data.login };
    }
}

/**
 * Create authorization token based on user credentials
 * Token contains all information necessary for later access authorization
 * 
 * @returns token that can be sent back to the user
 */
async function createUserToken(data: UserData) {
    return await create({ alg: "HS512", typ: "JWT" }, { data: data }, JWT_KEY);
}

export { JWTSession }