from dataclasses import dataclass

import random


@dataclass
class Group:
    problem_id: int
    name: str
    requires_all_ok: bool
    id: int = -1


class TaskGroups:
    def __init__(self):
        self.task_groups = {}

    def add(self, group):
        group.id = len(self.task_groups) + 1
        self.task_groups[group.id] = group
        return group


    def entries(self):
        return self.task_groups.values()


def populate_task_groups(db, max_per_problem):
    for problem in db.problems.entries():
        group_count = random.randint(1, max_per_problem)
        populate_problem_task_groups(db, problem.id, group_count)


def populate_problem_task_groups(db, problem_id, count):
    for i in range(count):
        group = Group(problem_id, f"Group {i + 1}", random.random() < 0.5)
        db.task_groups.add(group)

