
import { connectNewClient, PostgresContestDB } from "./postgres.ts"
import { PostgresCredentialDB, PostgresUserDB, PostgresGraphicalProblemDB } from "./postgres.ts"
import { PostgresPermissionDB } from "./postgres/postgresPermissionDB.ts"
import { PostgresProblemDB } from "./postgres/postgresProblemDB.ts"
import { PostgresSubmitDB } from "./postgres/postgresSubmitDB.ts"
import { PostgresLanguageDB } from "./queries/language.ts"
import { PostgresSubmitResultsDB } from "./submitDB.ts"

import { Populator, PostgresPopulator } from "./populator.ts"

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
        submitResultsDB: new PostgresSubmitResultsDB(client),
    }


    //Sanity check - should be rejected by the database
    await db.userDB.addNewUser({
        login: "admin",
        name: "",
        surname: "",
        email: "",
        password: "admin",
        password_repeat: "admin"
    })

    //Not really an admin, but it's a ufesul account for test purposes
    await db.userDB.addNewUser({
        login: "admin2",
        name: "Zawodowy",
        surname: "Administrator",
        email: "admin@administracja.pl",
        password: "admin123",
        password_repeat: "admin123"
    });

    try {
        // Give admin2 permission to submit to two contests
        await client.queryArray("INSERT INTO contests_permissions VALUES (7, 2, 2)");
        await client.queryArray("INSERT INTO contests_permissions VALUES (7, 1, 2)");
        await client.queryArray("INSERT INTO contests_permissions VALUES (7, 2, 1)");
    } catch {
        // If that failed then welp, he already has those permissions
    }

    let populator = new PostgresPopulator();
    // populator.generatePeople(db.userDB);
    ///asdasdas
    return db;
}