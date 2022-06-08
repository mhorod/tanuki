interface ProblemTasks {
    groups: TaskGroup[],
}

interface TaskGroup {
    id: number | null,
    name: string,
    requires_all_ok: boolean,
    tasks: Task[]
}

interface Task {
    id: number | null,
    name: string,
    test_uri: string,
    points: number,
    time_limit: number,
    memory_limit: number,
    show_output: boolean,
}

interface TaskDB {
    updateTasks(problem_id: number, tasks: ProblemTasks): Promise<boolean>,
    getTasks(problem_id: number): Promise<ProblemTasks>
}

export type { ProblemTasks, Task, TaskGroup, TaskDB }