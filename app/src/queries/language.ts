import { Language } from "../db.ts"
import { LanguageDB } from "../db.ts"

import { Client } from "../../deps.ts"

interface LanguageExtension {
    id: number,
    name: string,
    extension: string,
}

class PostgresLanguageDB implements LanguageDB {

    client: Client;

    constructor(client: Client) {
        this.client = client;
    }

    async getProblemLanguages(problem: number): Promise<Language[]> {
        // For given problem find triplets: (language_id, language_name, extension)
        // that represent valid file extensions that may be submitted to this problem
        // and then collect extensions for every language
        const query = `
            SELECT 
                l.id, l.name, extension  
            FROM 
                problems p
                JOIN problem_languages pl ON p.id = pl.problem_id
                JOIN languages l ON l.id = pl.language_id
                JOIN extensions e ON e.language_id = l.id
            WHERE p.id = $1;`;
        const queryResult: LanguageExtension[] = (await this.client.queryObject<LanguageExtension>(query, [problem])).rows;
        return this.groupLanguages(queryResult);
    }

    async getLanguageById(id: number): Promise<Language | null> {
        // We could query only extensions, but we need the name
        // so we query triplet and reuse extracting function
        const query = `
            SELECT
                l.id, l.name, extension
            FROM 
                languages l
                JOIN extensions e ON e.language_id = l.id
            WHERE
                l.id = $1
        `;
        const queryResult: LanguageExtension[] = (await this.client.queryObject<LanguageExtension>(query, [id])).rows;
        return this.groupLanguages(queryResult).at(0) || null;
    }

    /**
     * Converts array of triplets (id, name, extension) into array of languages
     * by grouping together all extensions of language
     */
    groupLanguages(from: LanguageExtension[]): Language[] {
        const languages = new Map<number, Language>();
        from.forEach(e => {
            if (languages.has(e.id))
                languages.get(e.id)?.extensions.push(e.extension.trim());
            else
                languages.set(e.id, { id: e.id, name: e.name, extensions: [e.extension.trim()] })
        })
        return Array.from(languages.values())
    }
}

export { PostgresLanguageDB }