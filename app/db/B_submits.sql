CREATE OR REPLACE FUNCTION erase_all_task_results(problem_id INT) RETURNS VOID AS 
$$
DELETE 
FROM task_results
WHERE submit_id IN (SELECT id FROM submits WHERE problem_id = $1);
$$ LANGUAGE SQL;


-- This function checks two things:
-- 1. Every task of the submit's problem has a result
-- 2. Every task result that references this submit belongs to the submit's problem
CREATE OR REPLACE FUNCTION check_results_integrity(submit_id INT) RETURNS BOOLEAN AS 
$$
-- We select id of task two times:
-- first we find all tasks that have a result for this submit
-- second we find all task that should have a result
-- If those two sets are not equal we get a pair (id, NULL) or (NULL, id) thanks to the full outer join.
-- Collation handles case where problem has no tasks at all and both subqueries return NULL
SELECT 
  COALESCE(bool_and(tr.id IS NOT NULL AND t.id IS NOT NULL), True)
FROM (
    -- task results assigned to the submit
    SELECT task_id AS id 
    FROM task_results 
    WHERE submit_id = $1
) tr 
FULL OUTER JOIN 
(
    -- tasks that are assigned to the status' problem
    -- i.e. all tasks that should have results
    SELECT t.id AS id 
    FROM tasks t 
    JOIN task_groups tg ON (t.task_group = tg.id) 
    JOIN submits s ON (tg.problem_id = s.problem_id)
    WHERE s.id = $1
) t 
ON (t.id = tr.id)
$$ 
LANGUAGE SQL;

-- Upon adding results for tasks validate that all of them are added
-- Since we need to insert many tasks we do it with a transaction
-- and thus we create constraint trigger that is deferred
CREATE OR REPLACE FUNCTION validate_results_integrity() RETURNS trigger AS 
$$ 
BEGIN 
  IF NOT (SELECT check_results_integrity(NEW.submit_id)) THEN 
    RAISE EXCEPTION 'Insertion that compromises data integrity';
  END IF;
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE CONSTRAINT TRIGGER validate_results_integrity
AFTER INSERT ON task_results 
DEFERRABLE INITIALLY DEFERRED 
FOR EACH ROW EXECUTE PROCEDURE validate_results_integrity();


-- Pretty self explanatory - results cannot have more points than maximum
CREATE OR REPLACE FUNCTION task_result_points_cannot_exceed_max() RETURNS TRIGGER AS 
$$ 
BEGIN 
  IF NEW.points > (SELECT points FROM tasks WHERE id = NEW.task_id) THEN 
    RAISE EXCEPTION 'Insertion that compromises data integrity';
  END IF;
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER task_points_have_to_be_in_range
BEFORE INSERT ON task_results 
FOR EACH ROW EXECUTE PROCEDURE task_result_points_cannot_exceed_max();

-- This function is meant to be called after successful insertion of all task results for given submits
-- Basing on those it calculates score and status using default methods
CREATE OR REPLACE FUNCTION add_submit_results(submit_id int) RETURNS VOID AS 
$$
INSERT INTO submit_results
VALUES (
    submit_id,
    submit_score(submit_id),
    submit_status(submit_id)
);
$$ 
LANGUAGE SQL;