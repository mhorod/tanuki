from dataclasses import dataclass


@dataclass
class Entry:
    name: str
    description: str
    id: int = -1


class PermissionsForContests:
    def __init__(self):
        self.permissions_for_contests = {}
        self.add(Entry('MANAGE','Allows user to edit contest and manage participants'))
        self.add(Entry('SUBMIT','Allows user to view problems and sending submissions'))

    def add(self, entry):
        entry.id = len(self.permissions_for_contests) + 1
        self.permissions_for_contests[entry.id] = entry
        return entry

    def entries(self):
        return self.permissions_for_contests.values()

    def find_by_name(self, name):
        for entry in self.permissions_for_contests.values():
            if entry.name == name:
                return entry