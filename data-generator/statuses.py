from typing import Union
from dataclasses import dataclass


@dataclass
class Status:
    name: str
    description: str
    priority: Union[int, None] = None
    id: int = -1


statuses = [
    Status("INT", "Internal error", -1),
    Status("REJ", "Manually rejected", -1),
    Status("ERR", "Checking error", -1),
    Status("OK", "Program works correctly"),
    Status("ANS", "Program produces wrong answer"),
    Status("TLE", "Time limit exceeded"),
    Status("MEM", "Memory limit exceeded"),
    Status("RTE", "Runtime error"),
    Status("CME", "Compilation failed"),
    Status("RUL", "Program is incompliant with rules"),
]
next_free = 0
for s in statuses:
    if s.priority is None:
        s.priority = next_free
        next_free += 1

for idx, status in enumerate(statuses):
    status.id = idx + 1


class Statuses:
    def entries(self):
        return statuses
