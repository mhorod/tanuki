from dataclasses import dataclass
from users import Users
from contests import Contests, populate_contests
from permissions_for_contests import PermissionsForContests
from contest_permissions import ContestPermissions, populate_contest_permissions
from languages import Languages, Extensions, populate_languages
from serialize import serialize
from scoring_methods import ScoringMethods
from statuses import Statuses
from administrators import Administrators, populate_administrators
from problems import Problems, ProblemLanguages, populate_problems
from submits import Submit, Submits, populate_submits
from submit_results import SubmitResults, populate_submit_results


@dataclass
class DB:
    users: Users = Users()
    administrators: Administrators = Administrators()
    statuses: Statuses = Statuses()
    scoring_methods: ScoringMethods = ScoringMethods()
    contests: Contests = Contests()
    permissions_for_contests: PermissionsForContests = PermissionsForContests()
    contest_permissions: ContestPermissions = ContestPermissions()
    languages: Languages = Languages()
    extensions: Extensions = Extensions()
    problems: Problems = Problems()
    problem_languages: ProblemLanguages = ProblemLanguages()
    submits: Submits = Submits()
    submit_results: SubmitResults = SubmitResults()


db = DB()
db.users.populate(10)
populate_contests(db, 10)
populate_languages(db)
populate_contest_permissions(db)
populate_administrators(db, 5)
populate_problems(db, 10)
populate_submits(db, 50)
populate_submit_results(db)

for table_name, table in db.__dict__.items():
    s = serialize(table_name, table.entries())
    print(s)
