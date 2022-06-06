import type { PermissionDB } from "./../permissions.ts"
import { PermissionKind } from "./../permissions.ts"
import { Client, ClientOptions } from "../../deps.ts"
import { User } from '../db.ts'


class PostgresPermissionDB implements PermissionDB {
    client: Client;

    constructor(client: Client) {
        this.client = client;
    }

    async getAllThatCanEdit(contest: number): Promise<User[]> {
        const query = `
            SELECT users.*
            FROM users JOIN 
            contests_permissions ON(id = user_id)
            WHERE contest_id = $1 AND permission_id=1
        `

        return (await this.client.queryObject<User>(query, [contest])).rows;
    }

    async canSubmit(user: number, contest: number): Promise<boolean> {
        return true; // TODO: remove this line
        //To submit: permission_id 1
        const query = `
            SELECT permission_id
            FROM contests_permissions cp
            JOIN permissions_for_contests pfc ON cp.permission_id = pfc.id
            WHERE user_id = $1 AND contest_id = $2 AND pfc.name = $3
        `;
        const permissionType = await this.client.queryObject(query, [user, contest, 'SUBMIT']);

        if (permissionType.rowCount == 0) {
            return false;
        }
        else {
            return true;
        }
    }
    async canViewContest(user: number, contest: number): Promise<boolean> {
        return true; // TODO: remove this line
        //ANY permission means that you can view
        const query = `
            SELECT permission_id
            FROM contests_permissions
            WHERE user_id = $1 AND contest_id = $2
        `;
        const permissionType = await this.client.queryObject(query, [user, contest]);

        if (permissionType.rowCount == 0) {
            return false;
        }
        else {
            return true;
        }
    }
    async canManageContest(user: number, contest: number): Promise<boolean> {
        const query = `
            SELECT permission_id
            FROM contests_permissions
            WHERE user_id = $1 AND contest_id = $2
            AND permission_id = 1
        `;
        const permissionType = await this.client.queryObject(query, [user, contest]);
        console.log(permissionType);

        if (permissionType.rowCount == 0) {
            return false;
        }
        else {
            return true;
        }
    }

    async ownsSubmit(user: number, submit: number): Promise<boolean> {
        const query = `SELECT 1 FROM submits WHERE user_id = $1 and id = $2`;
        const queryResult = await this.client.queryArray(query, [user, submit]);
        return queryResult.rowCount != 0;
    }

    async canViewSubmit(user: number, submit: number): Promise<boolean> {
        // TODO: remove this line in release
        //return true;

        // If user owns the submit we don't have to do anything
        if (await this.ownsSubmit(user, submit)) return true;

        //First, we will check the ID of contest that user is in
        //Then, we will check whether such user has permissions to view submits there.

        //I am using 2 separate queries here, so this is likely to be ineffective,
        //however combinig those 2 into 1 big would create an absolute utter mess.

        //(Optimize it at your own risk)

        const gimmeContestIDQuery = `
            SELECT p.contest_id
            FROM submits s
            JOIN problems p ON s.problem_id = p.id
            WHERE s.id = $1
        `;

        const queryResult = await this.client.queryObject<{ contest_id: number }>(gimmeContestIDQuery, [submit]);

        if (queryResult.rowCount == 0) {
            //Submit doesn't even exist, so I'm going to say that you can't view such a submit
            //You may argue with that, I guess
            //However, we're programming, not having fun with the set theory
            return false;
        }
        else {
            const contest = queryResult.rows[0].contest_id;
            const query = `
            SELECT permission_id
            FROM contests_permissions cp
            JOIN permissions_for_contests pfc ON cp.permission_id = pfc.id
            WHERE user_id = $1 AND contest_id = $2 AND pfc.name = $3
            `;
            const permissionType = await this.client.queryObject(query, [user, contest, 'MANAGE']);

            if (permissionType.rowCount == 0) {
                return false;
            }
            else {
                return true;
            }
        }

    }

    permissinKindToNumber(permission: PermissionKind): number {
        switch (permission) {
            case PermissionKind.MANAGE:
                return 1;
                break;
            case PermissionKind.SUBMIT:
                return 2;
                break;
            default:
                throw new Error("Database doesn't accept permissions other than MANAGE or SUBMIT");
                break;
        }
    }

    insertPermissions(user: number, contest: number, permission: number): void {
        const insertionQuery = `
            INSERT INTO contests_permissions VALUES($1, $2, $3)
        `;
        this.client.queryArray(insertionQuery, [user, permission, contest]);
        return;
    }

    deletePermissions(user: number, contest: number, permission: number): void {
        const deletionQuery = `
            BEGIN TRANSACTION;
            DELETE FROM contests_permission WHERE
            user_id = $1 AND permission_id = $2 AND contest_id = $3;
            COMMIT;
        `;
        this.client.queryArray(deletionQuery, [user, permission, contest]);
    }

    grantPermission(user: number, contest: number, permission: PermissionKind): void {
        this.insertPermissions(user, contest, this.permissinKindToNumber(permission));
    }
    revokePermission(user: number, contest: number, permission: PermissionKind): void {
        this.deletePermissions(user, contest, this.permissinKindToNumber(permission));
    }

}

export { PostgresPermissionDB }