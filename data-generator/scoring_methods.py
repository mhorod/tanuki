from dataclasses import dataclass

@dataclass
class Entry:
    name: str
    id: int = -1


class ScoringMethods:
    def __init__(self):
        self.scoring_methods = {}
        self.add(Entry('ZERO'))
        self.add(Entry('LINEAR_TO_ZERO'))
        self.add(Entry('LINEAR_TO_NEGATIVE'))

    def add(self, entry):
        entry.id = len(self.scoring_methods) + 1
        self.scoring_methods[entry.id] = entry
        return entry

    def entries(self):
        return self.scoring_methods.values()

    def find_by_name(self, name):
        for entry in self.scoring_methods:
            if entry.name == name:
                return entry