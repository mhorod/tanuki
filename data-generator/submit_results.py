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
        tasks = []
        for task in db.tasks.entries():
            if db.tasks.task_problem[task.id] == submit.problem_id:
                tasks.append(task)

        task_results = []
        for result in db.task_results.entries():
            for task in tasks:
                if result.task_id == task.id and result.submit_id == submit.id:
                    task_results.append(result)
                    break

        points = sum(result.points for result in task_results)
        task_statuses = [statuses[result.status_id - 1] for result in task_results]
        status = max(task_statuses, key = lambda x: x.priority)

        if random.random() < 0.75:
            db.submit_results.add(Results(submit.id, points, status.id))
