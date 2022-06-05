import { join, readAll } from "../deps.ts"
// Directory where submited files go
const SUBMIT_DIR = '/app/files/submitted'

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

    /**
     * Get full path to the file, e.g. to download it
     * @param uri 
     */
    getFullPath(uri: string): Promise<string>;
}

class BasicSourceManager implements SourceManager {
    constructor() {
        try {
            Deno.mkdir(SUBMIT_DIR, { recursive: true })
        }
        catch {
            //  Directory already exists, skip
        }
    }
    async getFullPath(uri: string): Promise<string> {
        return await join(SUBMIT_DIR, uri);
    }

    async addSource(uri: string, content: any): Promise<boolean> {
        try {
            await Deno.writeFile(join(SUBMIT_DIR, uri), content);
            return true;
        }
        catch {
            return false;
        }
    }

    async loadSource(uri: string): Promise<string | null> {
        let file;
        try { file = await Deno.open(join(SUBMIT_DIR, uri)); }
        catch { return null; }

        const decoder = new TextDecoder('utf-8');
        const text = decoder.decode(await readAll(file));
        return text;
    }
}

export { BasicSourceManager }
export type { SourceManager }