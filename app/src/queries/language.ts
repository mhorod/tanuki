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
                const extensionStrings = (await this.client.queryObject<string>("SELECT extension FROM extensions WHERE language_id = $1", [itr.language_id])).rows;
                const nameQuery = await this.client.queryObject<string>("SELECT name FROM languages WHERE id = $1", [itr.language_id]);

                let langName = "";
                if (nameQuery.rowCount != 0) {
                    langName = nameQuery.rows[0];
                }

                const subAnswer: Language = {
                    id: itr.language_id,
                    name: await langName,
                    extensions: await extensionStrings
                };

                answerArray.push(subAnswer);
            }
        }

        return answerArray;
    }
}

export { PostgresLanguageDB }