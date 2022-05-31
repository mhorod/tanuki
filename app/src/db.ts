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

interface ContestDB {
  getContests(): Promise<Array<Contest>>;
  getSubmits(): Promise<Array<Submit>>;
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

export type { Submit, Contest };
export type { User, NewUser };
export type { ContestDB, UserDB, CredentialDB, SubmitDB }