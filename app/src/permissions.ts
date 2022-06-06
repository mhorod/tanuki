import { User } from './db.ts'
enum PermissionKind {
    MANAGE,
    SUBMIT,
    VIEW,
}

interface Permission {
    id: number,
    kind: PermissionKind,
    description: string | null,
}


interface PermissionDB {
    canManageContest(user: number, contest: number): Promise<boolean>;
    canSubmit(user: number, contest: number): Promise<boolean>;
    getAllThatCanEdit(contest: number): Promise<User[]>;
    getAllThatCanSubmit(contest: number): Promise<User[]>;
    canViewContest(user: number, contest: number): Promise<boolean>;
    canViewSubmit(user: number, submit: number): Promise<boolean>;
    grantPermission(user: number, contest: number, permission: PermissionKind): Promise<void>;
    revokePermission(user: number, contest: number, permission: PermissionKind): Promise<void>;
}

export { PermissionKind };
export type { Permission, PermissionDB };