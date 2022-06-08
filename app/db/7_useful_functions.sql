CREATE OR REPLACE FUNCTION check_results_integrity(submit_id INT)
RETURNS BOOLEAN AS $$
    SELECT COALESCE(bool_and(tr.id IS NOT NULL AND t.id IS NOT NULL), True)
    FROM (
        SELECT task_id AS id 
        FROM task_results 
        WHERE submit_id = $1
    ) tr 
    FULL OUTER JOIN 
    (
        SELECT t.id AS id 
        FROM tasks t 
        JOIN task_groups tg ON (t.task_group = tg.id) 
        JOIN submits s ON (tg.problem_id = s.problem_id)
        WHERE s.id = $1
    ) t 
    ON (t.id = tr.id)
$$ LANGUAGE SQL;