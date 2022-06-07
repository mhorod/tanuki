from typing import List

from dataclasses import dataclass
import random


@dataclass(frozen=True, eq=True)
class ContestPermissionsEntry:
    user_id: int
    permission_id: int
    contest_id: int


class ContestPermissions:
    def __init__(self):
        self.permissions = set()

    def add(self, entry):
        self.permissions.add(entry)
        return entry

    def entries(self):
        return self.permissions


def assign_teacher(contest_id, db):
    users = list(db.users.entries())
    teacher = random.choice(users)
    permission = db.permissions_for_contests.find_by_name("MANAGE")
    db.contest_permissions.add(ContestPermissionsEntry(teacher.id, permission.id, contest_id))


def assign_students(contest_id, db, count):
    users = list(db.users.entries())
    permission = db.permissions_for_contests.find_by_name("SUBMIT")
    used = set()
    for _ in range(count):
        student = random.choice(users)
        if student.id not in used:
            used.add(student.id)
            db.contest_permissions.add(ContestPermissionsEntry(student.id, permission.id, contest_id))

def populate_contest_permissions(db):
    for contest in db.contests.entries():
        assign_teacher(contest.id, db)
        assign_students(contest.id, db, 20)