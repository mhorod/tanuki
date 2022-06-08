from typing import List

from dataclasses import dataclass


@dataclass
class Language:
    name: str
    extensions: List[str]


@dataclass
class LanguageEntry:
    name: str
    id: int = -1


@dataclass
class ExtensionEntry:
    extension: str
    language_id: int
    id: int = -1


languages = [
    Language("Python 2", ["py"]),
    Language("Python 3", ["py"]),
    Language("C++", ["cpp", "hpp", "h"]),
    Language("C", ["c", "h"]),
    Language("Fortran", ["f"]),
    Language("Java", ["java"]),
    Language("Haskell", ["hs"])
]


class Languages:
    def __init__(self):
        self.languages = {}

    def add(self, entry):
        entry.id = len(self.languages) + 1
        self.languages[entry.id] = entry
        return entry

    def entries(self):
        return self.languages.values()


class Extensions:
    def __init__(self):
        self.extensions = {}

    def add(self, entry):
        entry.id = len(self.extensions) + 1
        self.extensions[entry.id] = entry
        return entry

    def entries(self):
        return self.extensions.values()


def populate_languages(db):
    for language in languages:
        l = db.languages.add(LanguageEntry(language.name))
        for e in language.extensions:
            db.extensions.add(ExtensionEntry(e, l.id))
