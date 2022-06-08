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

CREATE OR REPLACE FUNCTION results_integrity_after_inserting_to_submit_results() RETURNS trigger AS $$
DECLARE
a BOOLEAN;

BEGIN
    SELECT check_results_integrity(NEW.submit_id) INTO a;

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

CREATE CONSTRAINT TRIGGER results_integrity_after_inserting_to_submit_results
    AFTER DELETE ON submit_results 
    DEFERRABLE INITIALLY DEFERRED 
    FOR EACH ROW EXECUTE PROCEDURE results_integrity_after_inserting_to_submit_results();

CREATE CONSTRAINT TRIGGER results_integrity_after_inserting_to_task_results 
    AFTER DELETE ON task_results 
    DEFERRABLE INITIALLY DEFERRED 
    FOR EACH ROW EXECUTE PROCEDURE results_integrity_after_inserting_to_submit_results(); --no need for another function here