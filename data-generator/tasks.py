from faker import Faker
from dataclasses import dataclass

import random
fake = Faker()

@dataclass
class Task:
    task_group: int
    name: str
    test_uri: str
    points: float
    time_limit: float
    memory_limit: int
    show_output: bool
    id: int = -1


class Tasks:
    def __init__(self):
        self.tasks = {}
        self.task_problem = {}


    def new(self):
        return self.add(self.random())


    def add(self, task):
        task.id = len(self.tasks) + 1
        self.tasks[task.id] = task
        return task

    def random(self):
        group_id = 0
        name = ""
        uri = "tasks/" + fake.uri_path()
        points  = 1 + int(random.random() * 20) / 10
        time_limit = 0.5 + int(random.random() * 30) / 10
        memory_limit = source_limit = random.choice([1024, 1048576]) * random.randint(1, 100)
        show_output = random.random() < 0.5
        return Task(group_id,
                    name, 
                    uri, 
                    points, 
                    time_limit,
                    memory_limit,
                    show_output)
    
    def entries(self):
        return self.tasks.values()


def populate_tasks(db, max_per_group):
    for group in db.task_groups.entries():
        task_count = random.randint(1, max_per_group)
        populate_group_tasks(db, group, task_count)


def populate_group_tasks(db, group, count):
    for i in range(count):
        task = db.tasks.new()
        task.task_group = group.id
        task.name = f"Test {i}"
        db.tasks.task_problem[task.id] = group.problem_id
        
