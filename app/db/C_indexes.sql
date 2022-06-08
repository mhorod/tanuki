-- Indexes on some things that are looked up often

-- Contests
CREATE INDEX contests_activity
ON contests (is_active);

-- Problems
CREATE INDEX problems_closing_date
ON problems(closing_date);

CREATE INDEX problems_due_date
ON problems(due_date);

CREATE INDEX problems_contest_id
ON problems(contest_id);

-- Submits
CREATE INDEX submits_subbmision_time
ON submits(submission_time);

CREATE INDEX submits_user_id
ON submits(user_id);

CREATE INDEX submits_problem_id
ON submits(problem_id);

-- Task groups
CREATE INDEX task_groups_problem_id
ON task_groups(problem_id);

-- Tasks
CREATE INDEX tasks_task_group
ON tasks(task_group);

-- Submit results
CREATE INDEX submit_results_status
ON submit_results(status);

-- Task results
CREATE INDEX task_results_submit_id
ON task_results(submit_id);

CREATE INDEX task_results_task_id
ON task_results(task_id);

CREATE INDEX task_results_status_id
ON task_results(status_id);


