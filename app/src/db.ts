// Interface of database connection

import { Credentials } from "./auth.ts"

interface Contest {
  id: number,
  name: string,
  shortname: string,
  active: boolean
}

interface Submit {
  id: number,
  problem: number,
  user: number,
  source: string,
  date: Date,
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
  scoring_method: string,
  source_limit: number,
}

interface GraphicalProblem {
  id: number,
  name: string,
  shortname: string,
  position: number,
  due_date: Date | null,
  closing_date: Date | null,
  status: string
}

interface ContestDB {
  getContests(): Promise<Array<Contest>>;
  getSubmits(): Promise<Array<Submit>>;
  getContestById(id: number): Promise<Contest | null>
}

interface UserDB {
  getUserByLogin(login: string): Promise<User | null>;
  addNewUser(user: NewUser): Promise<User | null>;
}

interface CredentialDB {
  getUserByCredentials(credentials: Credentials): Promise<User | null>;
}

interface SubmitDB {
  addSubmit(problem: number, user: number, source: string): Promise<Submit | null>;
  getSubmitById(id: number): Promise<Submit | null>
}

interface ProblemDB {
  getProblemsInContest(contest: number): Promise<Array<Problem>>;
  getProblemById(id: number): Promise<Problem | null>;
}

interface GraphicalProblemDB {
  getGraphicalProblemsInContest(contest: number, user_id: number): Promise<Array<GraphicalProblem>>;
  getGraphicalProblemById(problem_id: number, user_id: number): Promise<GraphicalProblem | null>;
}

export type { Submit, Contest, Problem, GraphicalProblem };
export type { User, NewUser };
export type { ContestDB, UserDB, CredentialDB, SubmitDB, ProblemDB, GraphicalProblemDB }