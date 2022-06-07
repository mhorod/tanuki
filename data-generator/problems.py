from typing import Union

from faker import Faker

from dataclasses import dataclass

import random

fake = Faker()


@dataclass
class Problem:
    name: str
    short_name: str
    contest_id: int
    statement_uri: str
    uses_points: bool
    position: int
    points: float
    due_date: Union[str, None]
    closing_date: Union[str, None]
    published: bool
    scoring_method: int
    source_limit: int
    id: int = -1


class Problems:
    def __init__(self):
        self.problems = {}
        self.short_names = Faker().unique

    def new(self):
        problem = self.random()
        problem.id = len(self.problems) + 1
        self.problems[problem.id] = problem
        return problem

    def random(self):
        name = fake.text(max_nb_chars=30)
        short_name = self.short_names.text(max_nb_chars=8)

        points = int(random.random() * 5) / 10
        due = fake.date_time_between()
        close = fake.date_time_between()

        if due > close:
            due, close = close, due

        due = due.strftime('%Y-%m-%d, %H:%M:%S')
        close = close.strftime('%Y-%m-%d, %H:%M:%S')

        if random.random() < 0.25:
            due = close = None

        statement_uri = "/problems/dummy"
        uses_points = random.random() < 0.5

        contest_id = -1
        position = -1
        scoring_method = -1
        published = random.random() < 0.75
        source_limit = random.choice([1024, 1048576]) * random.randint(1, 100)
        return Problem(
            name,
            short_name,
            contest_id,
            statement_uri,
            uses_points,
            position,
            points,
            due,
            close,
            published,
            scoring_method,
            source_limit,
        )

    def populate(self, count):
        for _ in range(count):
            self.new()

    def entries(self):
        return self.problems.values()


@dataclass(frozen=True, eq=True)
class ProblemLanguage:
    problem_id: int
    language_id: int


class ProblemLanguages:
    def __init__(self):
        self.problem_languages = set()

    def add(self, entry):
        self.problem_languages.add(entry)

    def entries(self):
        return self.problem_languages


def populate_problems(db, max_per_contest):
    for contest in db.contests.entries():
        populate_contest_problems(db, contest.id,
                                  random.randint(1, max_per_contest))


def populate_contest_problems(db, contest_id, count):
    scoring_methods = list(db.scoring_methods.entries())
    for i in range(count):
        problem = db.problems.new()
        problem.contest_id = contest_id
        problem.position = i
        problem.scoring_method = random.choice(scoring_methods).id
        assign_languages(db, problem.id, random.randint(1, 3))


def assign_languages(db, problem_id, count):
    languages = [l.id for l in db.languages.entries()]
    choices = set(random.choices(languages, k=count))
    for choice in choices:
        db.problem_languages.add(ProblemLanguage(problem_id, choice))
