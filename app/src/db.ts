// Interface of database connection

import { Credentials } from "./auth.ts"

interface Contest {
  id: number,
  name: string,
  shortname: string,
  active: boolean
}

interface User {
  id: number,
  login: string,
  name: string,
  surname: string,
  password_hash: string,
  email: string,
}

interface NewUser {
  login: string,
  name: string,
  surname: string,
  email: string,
  password: string,
  password_repeat: string,
}

interface Problem {
  id: number,
  name: string,
  shortname: string,
  contest_id: number,
  statement_uri: string,
  uses_points: boolean,
  position: number,
  points: number,
  due_date: Date | null,
  closing_date: Date | null,
  published: boolean,
  scoring_method: number,
  source_limit: number,
}

interface GraphicalProblem {
  id: number,
  name: string,
  statement_uri: string,
  shortname: string,
  position: number,
  due_date: Date | null,
  closing_date: Date | null,
  status: string
}

/**
 * Information for displaying submit results
 */
interface Submit {
  id: number,
  source_uri: string,
  points: number,
  status: string,
  contest_name: string,
  short_problem_name: string,
  language_name: string,
  submission_time: Date,
}

//Used to convey information about progress of a student
interface GraphicalProblemStatus {
  id: number
  shortname: string
  status: string
  user_id: number
}

interface NewSubmit {
  source_uri: string,
  user_id: number,
  problem_id: number,
  language_id: number
}

//Same as problem, but without ID - used when we need to insert a problem to the database
interface NewProblem {
  name: string,
  shortname: string,
  contest_id: number,
  statement_uri: string,
  uses_points: boolean,
  position: number,
  points: number,
  due_date: Date | null,
  closing_date: Date | null,
  published: boolean,
  scoring_method: number,
  source_limit: number,
}

interface NewContest {
  name: string,
  shortname: string,
  is_active: boolean
}

interface Language {
  id: number,
  name: string;
  extensions: Array<string>,
}

enum SubmitResult {
  OK,
  ANS,
  MEM,
  RTE,
  CME,
  TLE,
  REJ,
  RUL
}


interface ContestDB {
  getUserContests(user_id: number): Promise<Array<Contest>>;
  getAllContests(): Promise<Array<Contest>>;
  getUserSubmits(user_id: number, limit: number): Promise<Array<Submit>>;
  getContestById(id: number): Promise<Contest | null>;
  addNewContest(contest: NewContest): Promise<Contest | null>;
  deleteContest(id: number): Promise<boolean>;
  editContest(id: number, contest: NewContest): Promise<boolean>;
}

interface UserDB {
  getAllUsers(): Promise<User[]>;
  getUserByLogin(login: string): Promise<User | null>;
  addNewUser(user: NewUser): Promise<User | null>;
  getUserById(id: number): Promise<User | null>;
}

interface CredentialDB {
  getUserByCredentials(credentials: Credentials): Promise<User | null>;
}

interface SubmitDB {
  addSubmit(newSubmit: NewSubmit): Promise<Submit | null>;
  getSubmitById(id: number): Promise<Submit | null>
}

interface ProblemDB {
  getProblemsInContest(contest: number): Promise<Array<Problem>>;
  getProblemById(id: number): Promise<Problem | null>;
  createProblem(problem: NewProblem): Promise<boolean>;
  updateProblem(newVersion: Problem): Promise<boolean>;
}

interface GraphicalProblemDB {
  getGraphicalProblemsInContest(contest: number, user_id: number): Promise<Array<GraphicalProblem>>;
  getGraphicalProblemById(problem_id: number, user_id: number): Promise<GraphicalProblem | null>;
}

interface LanguageDB {
  getProblemLanguages(problem: number): Promise<Array<Language>>;
}

interface ResultDB {
  addSubmitResults(id: number, points: number, status: string): Promise<boolean>;
  overrideSubmitResults(id: number, points: number, status: number): void;
}


export type { Submit, NewSubmit, Contest, NewContest, Problem, GraphicalProblem };
export type { User, NewUser, Language, NewProblem };
export type { GraphicalProblemStatus };
export type { ContestDB, UserDB, CredentialDB, SubmitDB, ProblemDB, GraphicalProblemDB, LanguageDB, ResultDB }
