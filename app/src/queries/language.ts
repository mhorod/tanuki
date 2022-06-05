import { Language } from "../db.ts"
import { LanguageDB } from "../db.ts"

import { Client, ClientOptions } from "../../deps.ts"

interface NumberWrapper {
    language_id: number
}

class PostgresLanguageDB implements LanguageDB {

    client: Client;

    constructor(client: Client) {
        this.client = client;
    }

    async getProblemLanguages(problem: number): Promise<Language[]> {
        //This is ineffective, but table with languages shouldn't be (that) big, so we might survive performing these magnificent queries

        //So, here's the plan: First I'll get all language ID's that are suitable for a given taks (there shouldn't be that many of them)
        //Then, for each of them I'll get their extensions. 

        let answerArray = [];

        const languageIDsQuery = await this.client.queryObject<NumberWrapper>("SELECT language_id FROM problem_languages WHERE problem_id = $1", [problem]);

        if (languageIDsQuery.rowCount == 0) {
            //Hmmmm
            return [];
        }
        else {
            for (const itr of languageIDsQuery.rows) {
                //For each ID we'll get all extensions that it can have
                const extensionStrings: Array<{ extension: string }> = (await this.client.queryObject<{ extension: string }>("SELECT extension FROM extensions WHERE language_id = $1", [itr.language_id])).rows;
                const nameQuery: Array<{ name: string }> = (await this.client.queryObject<{ name: string }>("SELECT name FROM languages WHERE id = $1", [itr.language_id])).rows;

                let langName = "";
                if (nameQuery.length != 0) {
                    langName = nameQuery[0].name;
                }

                const subAnswer: Language = {
                    id: itr.language_id,
                    name: langName,
                    extensions: extensionStrings.map(e => e.extension.trim())
                };

                answerArray.push(subAnswer);
            }
        }

        return answerArray;
    }
}

export { PostgresLanguageDB }