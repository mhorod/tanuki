interface SubmitResults {
    id: number,

    problem_id: number,
    short_problem_name: string,

    contest_id: number,
    contest_name: string,


    language_name: string,
    submission_time: string,


    source_uri: string,
    src: string,
    status: Status,
    group_results: Array<GroupResult>,
}

interface Status {
    id: number,
    name: string,
    points: number,
    max_points: number,
    score: number,
}

interface GroupResult {
    id: number,
    name: string,
    status: TaskStatus,
    task_results: Array<TaskResult>,
}

interface TaskResult {
    id: number,
    name: string,
    summary: string,
    execution_time: number,
    used_memory: number,
    status: TaskStatus,
}

interface TaskStatus {
    id: number,
    name: string,
    points: number,
    max_points: number,
}

class MockSubmitResultsDB {
    getSubmitResults(submit_id: number): SubmitResults {
        const s1 = {
            id: 0,
            name: "OK",
            points: 0.5,
            max_points: 1,
            score: 0.5,
        }
        const s2 = {
            id: 0,
            name: "OK",
            points: 0.5,
            max_points: 1,
        }
        const s3 = {
            id: 0,
            name: "ANS",
            points: 0.0,
            max_points: 1,
        }

        const tr1: TaskResult = {
            id: 1,
            name: "Task 1",
            status: s2,
            summary: "",
            execution_time: 3.1415,
            used_memory: 42000
        }
        const tr2: TaskResult = {
            id: 3,
            name: "This is a task",
            status: s3,
            summary: "",
            execution_time: 0.001,
            used_memory: 1234
        }

        const gr1: GroupResult = {
            id: 1,
            name: "Group 1",
            status: s2,
            task_results: [tr1, tr2]
        };

        const gr2: GroupResult = {
            id: 2,
            name: "Another group",
            status: s2,
            task_results: [tr2, tr1]
        };

        return {
            id: 0,
            problem_id: 0,
            short_problem_name: "A",
            contest_id: 0,
            contest_name: "Jeszcze pożałujecie",
            language_name: "C++",
            submission_time: "2022-01-01, 00:00:01",
            source_uri: "/problems/java/A",
            src: "print('Hello, World!)",
            status: s1,
            group_results: [gr1, gr2]
        };
    }
}

export { MockSubmitResultsDB }