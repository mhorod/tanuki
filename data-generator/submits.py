from faker import Faker

from dataclasses import dataclass
import random

fake = Faker()


@dataclass
class Submit:
    source_uri: str
    user_id: int
    problem_id: int
    language_id: int
    submission_time: str
    id: int = -1


class Submits:
    def __init__(self):
        self.submits = {}

    def new(self):
        submit = self.random()
        submit.id = len(self.submits) + 1
        self.submits[submit.id] = submit
        return submit

    def random(self):
        time = fake.date_time_between().strftime('%Y-%m-%d, %H:%M:%S')
        source_uri = "/submitted/dummy"
        user_id = 0
        problem_id = 0
        language_id = 0
        return Submit(source_uri, user_id, problem_id, language_id, time)

    def entries(self):
        return self.submits.values()


def populate_submits(db, max_per_user):
    for user in db.users.entries():
        problems = get_user_problems(db, user.id)
        count = random.randint(1, max_per_user)
        if not problems: continue
        for _ in range(count):
            problem = random.choice(problems)
            language = random.choice(get_problem_languages(db, problem.id))
            submit = db.submits.new()
            submit.user_id = user.id
            submit.problem_id = problem.id
            submit.language_id = language


def get_user_problems(db, user_id):
    contests = []
    for contest in db.contests.entries():
        for permission in db.contest_permissions.entries():
            if permission.user_id == user_id and permission.contest_id == contest.id:
                contests.append(contest)

    contest_ids = set(c.id for c in contests)
    problems = []
    for problem in db.problems.entries():
        if problem.contest_id in contest_ids:
            problems.append(problem)
    return problems


def get_problem_languages(db, problem_id):
    result = []
    for problem_language in db.problem_languages.entries():
        if problem_language.problem_id == problem_id:
            result.append(problem_language.language_id)
    return result
