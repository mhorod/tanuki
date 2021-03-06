-- Finds status_id of given group for given submit
-- Essentially it retrieves status with the highest priority from results of all tasks that belong to this group
CREATE OR REPLACE FUNCTION task_group_status(submit_id INT, task_group_id INT) 
RETURNS INT AS 
$$
    SELECT 
        tr.status_id 
    FROM 
        tasks t
        LEFT JOIN (SELECT * FROM task_results tr WHERE tr.submit_id = $1) tr ON (tr.task_id = t.id)
        LEFT JOIN statuses s ON (tr.status_id = s.id)
    WHERE t.task_group = $2
    ORDER BY s.priority DESC NULLS FIRST
    LIMIT 1;
$$
LANGUAGE SQL;

CREATE OR REPLACE FUNCTION task_group_points(submit_id INT, task_group_id INT)
RETURNS NUMERIC AS $$
    SELECT 
        CASE
            WHEN (SELECT requires_all_ok FROM task_groups WHERE id = $2) AND task_group_status($1, $2) != 4 THEN 0
            ELSE 
            (
                SELECT SUM(
                CASE
                    WHEN tr.status_id IS NULL THEN NULL
                    WHEN tr.status_id = 4 THEN t.points -- OK
                    ELSE 0
                END
                )
            FROM tasks t
            LEFT JOIN (SELECT * FROM task_results tr WHERE tr.submit_id = $1) tr ON (tr.task_id = t.id)
            WHERE t.task_group = $2
            )
        END 
$$ LANGUAGE SQL;

CREATE OR REPLACE FUNCTION submit_status(submit_id INT)
RETURNS INT AS $$
    WITH tg_statuses AS (
        SELECT tg.id AS "id", task_group_status($1, tg.id) AS "status"
        FROM submits s
        JOIN task_groups tg USING(problem_id)
        WHERE s.id = $1
    )
    SELECT tgs.status 
    FROM tg_statuses tgs 
    JOIN statuses s ON(tgs.status = s.id)
    ORDER BY s.priority DESC NULLS FIRST
    LIMIT 1;
$$ LANGUAGE SQL;

CREATE OR REPLACE FUNCTION submit_points(submit_id INT)
RETURNS NUMERIC AS $$
    SELECT  SUM (
        CASE 
            WHEN task_group_status($1, tg.id) IS NULL THEN NULL
            ELSE task_group_points($1, tg.id)
        END
    )
    FROM submits s
    JOIN task_groups tg USING(problem_id)
    WHERE s.id = $1
$$ LANGUAGE SQL;



CREATE OR REPLACE FUNCTION max_task_group_points(group_id INT)
RETURNS NUMERIC AS $$
    SELECT SUM(points) 
    FROM tasks t 
    JOIN task_groups tg ON (t.task_group = tg.id)
    WHERE tg.id = $1
$$ LANGUAGE SQL;

CREATE OR REPLACE FUNCTION max_points(problem_id INT)
RETURNS NUMERIC AS $$
    SELECT SUM(max_task_group_points(tg.id)) 
    FROM
    task_groups tg 
    WHERE tg.problem_id = $1;
$$ LANGUAGE SQL;


CREATE OR REPLACE FUNCTION score_multiplier(due_date timestamptz, closing_date timestamptz, submit_time timestamptz, scoring_method INT)
RETURNS NUMERIC AS $$
    SELECT CASE scoring_method 
        WHEN 1 THEN CASE -- ZERO
            WHEN submit_time < due_date THEN 1.0::numeric
            ELSE 0::numeric
        END
        WHEN 2 THEN CASE -- LINEAR_TO_ZERO
            WHEN submit_time < due_date THEN 1.0::numeric
            WHEN submit_time < closing_date THEN (EXTRACT(EPOCH FROM (closing_date - submit_time)) / EXTRACT(EPOCH FROM (closing_date - due_date)))::numeric
            ELSE 0::numeric
        END
        WHEN 3 THEN CASE -- LINEAR_TO_NEGATIVE
            WHEN submit_time < due_date THEN 1.0::numeric
            ELSE (EXTRACT(EPOCH FROM (closing_date - submit_time)) / EXTRACT(EPOCH FROM (closing_date - due_date)))::numeric
        END
    END
$$ LANGUAGE SQL;

CREATE OR REPLACE FUNCTION submit_score(submit_id INT)
RETURNS NUMERIC AS $$
    SELECT 
    CASE p.uses_points
        WHEN true THEN p.points * submit_points(s.id) / max_points(p.id) * score_multiplier(p.due_date, p.closing_date, s.submission_time, p.scoring_method)
        ELSE CASE submit_status(submit_id) 
            WHEN 4 THEN p.points  -- 4 is OK
            ELSE 0
        END
    END
    FROM submits s JOIN problems p ON (p.id = s.problem_id)
    WHERE s.id = $1;
$$ LANGUAGE SQL;

CREATE OR REPLACE VIEW task_scores AS 
    SELECT 
        tr.submit_id, tr.task_id, tr.status_id, tr.points AS points,
        tr.summary, tr.execution_time, tr.used_memory,
        t.task_group, t.name, t.test_uri, t.points AS max_points,
        t.memory_limit, t.show_output
    FROM task_results tr
    JOIN tasks t ON tr.task_id = t.id;
