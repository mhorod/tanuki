from dataclasses import dataclass

import random


@dataclass(frozen=True, eq=True)
class Results:
    submit_id: int
    score: float
    status: int


class SubmitResults:
    def __init__(self):
        self.results = set()

    def add(self, entry):
        self.results.add(entry)

    def entries(self):
        return self.results


def populate_submit_results(db):
    statuses = list(db.statuses.entries())
    for submit in db.submits.entries():
        if random.random() < 0.75:
            score = random.random()
            status = random.choice(statuses).id
            db.submit_results.add(Results(submit.id, score, status))
