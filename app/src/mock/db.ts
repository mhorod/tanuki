// Mock connection to the database

import type { User, NewUser } from "../db.ts";
import type { UserDB, CredentialDB } from "../db.ts";

import { bcrypt } from "../../deps.ts"
import { Credentials } from "../auth.ts";

class MockClient {
    hashes: Map<string, string>;
    users: Map<string, User>;
    constructor() {
        this.hashes = new Map<string, string>();
        this.users = new Map<string, User>();
    }
}

class MockUserDB implements UserDB {
    client: MockClient;
    constructor(client: MockClient) { this.client = client; }

    async getUserByLogin(login: string): Promise<User | null> {
        return await this.client.users.get(login) || null;
    }

    async addNewUser(user: NewUser): Promise<User | null> {
        const salt = await bcrypt.genSalt(8);
        const hash = await bcrypt.hash(user.password, salt);
        this.client.hashes.set(user.login, hash);
        const added: User = {
            id: 0,
            login: user.login,
            name: user.name,
            surname: user.surname,
            email: user.email,
            password_hash: hash
        };
        this.client.users.set(user.login, added);
        console.log("Added user: ", added);
        return await added;
    }

}

class MockCredentialDB implements CredentialDB {
    client: MockClient;
    constructor(client: MockClient) { this.client = client; }
    async getUserByCredentials(credentials: Credentials): Promise<User | null> {
        const user = this.client.users.get(credentials.login);
        const hash = this.client.hashes.get(credentials.login);
        console.log(user, hash);
        if (!user || !hash) return await null;
        const matches = await bcrypt.compare(credentials.password, hash);
        console.log(hash, matches);
        return matches ? user : null;
    }

}

export { MockClient, MockUserDB, MockCredentialDB }