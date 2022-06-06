
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
    canSubmit(user: number, contest: number): Promise<boolean>;
    canViewContest(user: number, contest: number): Promise<boolean>;
    canViewSubmit(user: number, submit: number): Promise<boolean>;
    grantPermission(user: number, contest: number, permission: PermissionKind): void;
    revokePermission(user: number, contest: number, permission: PermissionKind): void;
}

export { PermissionKind };
export type { Permission, PermissionDB };