// Mock connection to the database

import { User, NewUser, Language } from "../db.ts";
import { UserDB, CredentialDB, LanguageDB } from "../db.ts";
import { PermissionDB } from "../permissions.ts"

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
    updateUser(id: number, newData: NewUser): Promise<User | null> {
        throw new Error("Method not implemented.");
    }

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
        return await added;
    }

}

class MockCredentialDB implements CredentialDB {
    client: MockClient;
    constructor(client: MockClient) { this.client = client; }
    async getUserByCredentials(credentials: Credentials): Promise<User | null> {
        const user = this.client.users.get(credentials.login);
        const hash = this.client.hashes.get(credentials.login);
        if (!user || !hash) return await null;
        const matches = await bcrypt.compare(credentials.password, hash);
        return matches ? user : null;
    }

}

class MockPermissionDB implements PermissionDB {
    async canSubmit(user: number, contest: number): Promise<boolean> {
        return await true;
    }
    async canViewContest(user: number, contest: number): Promise<boolean> {
        return await true;
    }
    async canViewSubmit(user: number, submit: number): Promise<boolean> {
        return await true;
    }
}

class MockLanguageDB implements LanguageDB {
    async getProblemLanguages(problem: number): Promise<Language[]> {
        return await [{
            id: 2,
            name: "C++",
            extensions: ["cpp", "hpp", "h"],
        }]
    }

}

export { MockClient, MockUserDB, MockCredentialDB, MockPermissionDB, MockLanguageDB }