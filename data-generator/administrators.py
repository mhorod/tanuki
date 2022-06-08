from dataclasses import dataclass
from users import NewUser


@dataclass(frozen=True, eq=True)
class Admin:
    user_id: int


class Administrators:
    def __init__(self):
        self.admins = set()

    def add(self, user_id):
        self.admins.add(Admin(user_id))

    def entries(self):
        return self.admins


def populate_administrators(db, count):
    for i in range(count):
        user = db.users.add(
            NewUser(f"admin{i or ''}", f"A{i}", "D", "admin123",
                    "administracja@tanuki.pl"))
        db.administrators.add(user.id)
