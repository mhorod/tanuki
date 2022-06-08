CREATE OR REPLACE FUNCTION erase_all_task_results(problem_id INT)
RETURNS VOID AS $$
    DELETE FROM task_results WHERE submit_id IN (SELECT id FROM submits WHERE problem_id = $1);
$$ LANGUAGE SQL;

