import bcrypt
from faker import Faker

from dataclasses import dataclass

fake = Faker()


@dataclass
class User:
    login: str
    name: str
    surname: str
    password_hash: str
    email: str
    id: int = -1


@dataclass
class NewUser:
    login: str
    name: str
    surname: str
    password: str
    email: str


class Users:
    def __init__(self):
        self.users = {}
        self.logins = Faker().unique

    def new(self):
        return self.random()

    def random(self):
        login = self.logins.user_name()
        name = fake.first_name()
        surname = fake.last_name()
        password = "admin123"
        email = fake.email()
        return self.add(NewUser(login, name, surname, password, email))

    def add(self, new_user):
        password_hash = hash_password(new_user.password)
        user = User(new_user.login, new_user.name, new_user.surname,
                    password_hash, new_user.email)
        user.id = len(self.users) + 1
        self.users[user.id] = user

        return user

    def populate(self, count):
        for _ in range(count):
            self.new()

    def entries(self):
        return self.users.values()


def hash_password(password):
    password = password.encode()
    salt = bcrypt.gensalt()
    hashed = bcrypt.hashpw(password, salt)
    return hashed.decode()
