CREATE OR REPLACE FUNCTION erase_all_task_results(problem_id INT)
RETURNS VOID AS $$
    DELETE FROM task_results WHERE submit_id IN (SELECT id FROM submits WHERE problem_id = $1);
$$ LANGUAGE SQL;


CREATE OR REPLACE FUNCTION results_integrity_after_submit() RETURNS trigger AS $$
DECLARE
a BOOLEAN;

BEGIN
    SELECT check_results_integrity(NEW.id) INTO a;

    IF a = false
        THEN RAISE EXCEPTION 'Insertion that compromises data integrity';
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;
 
CREATE CONSTRAINT TRIGGER results_integrity_after_submit
    AFTER DELETE ON submits 
    DEFERRABLE INITIALLY DEFERRED 
    FOR EACH ROW EXECUTE PROCEDURE results_integrity_after_submit();