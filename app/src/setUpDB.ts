
import { connectNewClient, PostgresContestDB } from "./postgres.ts"
import { PostgresCredentialDB, PostgresUserDB, PostgresGraphicalProblemDB } from "./postgres.ts"
import { PostgresPermissionDB } from "./postgres/postgresPermissionDB.ts"
import { PostgresProblemDB } from "./postgres/postgresProblemDB.ts"
import { PostgresSubmitDB } from "./postgres/postgresSubmitDB.ts"
import { PostgresTaskDB } from "./postgres/postgresTaskDB.ts"
import { PostgresLanguageDB } from "./queries/language.ts"
import { PostgresSubmitResultsDB } from "./submitDB.ts"
import { PostgresRecentResultsDB } from "./postgres/postgresRecentResultsDB.ts"
import { ClientOptions } from "../deps.ts"
/**
 * Create all db interfaces used in the app
 * @param options 
 * @returns 
 */
export default async function (options: ClientOptions) {
    const client = await connectNewClient(options);
    console.log("Connected to the database!");

    const db = {
        client: client,
        userDB: new PostgresUserDB(client),
        credentialDB: new PostgresCredentialDB(client),
        contestDB: new PostgresContestDB(client),
        submitDB: new PostgresSubmitDB(client),
        problemDB: new PostgresProblemDB(client),
        permissionDB: new PostgresPermissionDB(client),
        languageDB: new PostgresLanguageDB(client),
        graphicalProblemDB: new PostgresGraphicalProblemDB(client),
        taskDB: new PostgresTaskDB(client),
        submitResultsDB: new PostgresSubmitResultsDB(client),
        recentResultsDB: new PostgresRecentResultsDB(client),
    }

    return db;
}