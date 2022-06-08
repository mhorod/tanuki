from faker import Faker

from dataclasses import dataclass

import random

fake = Faker()


@dataclass
class Contest:
    name: str
    short_name: str
    is_active: bool
    id: int = -1


class Contests:
    def __init__(self):
        self.contests = {}
        self.short_names = Faker().unique

    def new(self):
        contest = self.random()
        contest.id = len(self.contests) + 1
        self.contests[contest.id] = contest
        return contest

    def random(self):
        name = fake.text(max_nb_chars=32)
        short_name = fake.text(max_nb_chars=12)
        is_active = random.random() < 0.8
        return Contest(name, short_name, is_active)

    def populate(self, count):
        for _ in range(count):
            self.new()

    def entries(self):
        return self.contests.values()


def populate_contests(db, count):
    db.contests.populate(count)
