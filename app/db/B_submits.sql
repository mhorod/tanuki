CREATE OR REPLACE FUNCTION erase_all_task_results(problem_id INT) RETURNS VOID AS 
$$
DELETE 
FROM task_results
WHERE submit_id IN (SELECT id FROM submits WHERE problem_id = $1);
$$ LANGUAGE SQL;

CREATE OR REPLACE FUNCTION results_integrity_after_submit() RETURNS trigger AS 
$$ 
BEGIN 
  IF NOT (SELECT check_results_integrity(NEW.id)) THEN 
    RAISE EXCEPTION 'Insertion that compromises data integrity';
  END IF;
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

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

CREATE CONSTRAINT TRIGGER results_integrity_after_submit
AFTER DELETE ON submits 
DEFERRABLE INITIALLY DEFERRED 
FOR EACH ROW EXECUTE PROCEDURE results_integrity_after_submit();

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