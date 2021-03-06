from typing import Union
from dataclasses import dataclass
from faker import Faker
import random

fake = Faker()

@dataclass(frozen=True, eq=True)
class Results:
    submit_id: int
    task_id: int
    status_id: int
    points: float
    summary: Union[str, None]
    execution_time: float
    used_memory: int


class TaskResults:
    def __init__(self):
        self.results = set()

    def add(self, entry):
        self.results.add(entry)

    def entries(self):
        return self.results


def populate_task_results(db):
    statuses = list(db.statuses.entries())
    for submit in db.submits.entries():
        for task in db.tasks.entries():
            if db.tasks.task_problem[task.id] != submit.problem_id:
                continue

            status = random.choice(statuses)
            while status.name == "REJ":
                status = random.choice(statuses)

            if random.random() < 0.5:
                for s in statuses:
                    if s.name == "OK":
                        status = s

            if status.name == "OK":
                if random.random() < 0.25:
                    points = round(random.random() * task.points, 1);
                else:
                    points = task.points
            else:
                points = 0
            summary = None
            if random.random() < 0.5:
                summary = fake.paragraph(nb_sentences=random.choice((1, 2)))
            execution_time = 0.5 + round(random.random() * 1.5, 1)
            used_memory = 1024 * random.randint(100, 8096)
            results = Results(
                    submit.id,
                    task.id,
                    status.id,
                    points,
                    summary,
                    execution_time,
                    used_memory
            )
            db.task_results.add(results)
