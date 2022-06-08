CREATE OR REPLACE FUNCTION delete_user() RETURNS trigger AS $$
BEGIN
    DELETE FROM contest_permissions WHERE user_id = old.id;
    DELETE FROM task_results WHERE submit_id IN(
        SELECT s.id FROM submits s WHERE s.user_id = old.id 
    );
    DELETE FROM submit_results WHERE submit_id IN(
        SELECT s.id FROM submits s WHERE s.user_id = old.id 
    );

    DELETE FROM submits WHERE user_id = old.id;

    DELETE FROM administrators WHERE user_id = old.id;

    RETURN OLD;
END;
$$ LANGUAGE plpgsql;
 

CREATE OR REPLACE FUNCTION delete_contest() RETURNS trigger AS $$
    BEGIN
        DELETE FROM contest_permissions WHERE contest_id = OLD.id;
        DELETE FROM problems WHERE contest_id = OLD.id;

        RETURN OLD;
    END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION delete_problem() RETURNS trigger AS $$
    BEGIN
        DELETE FROM problem_languages WHERE problem_id = OLD.id;
        DELETE FROM submits WHERE problem_id = OLD.id;
        DELETE FROM task_groups WHERE problem_id = OLD.id;

        RETURN OLD;
    END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION delete_submit() RETURNS trigger AS $$
    BEGIN
        DELETE FROM submit_results WHERE submit_id = OLD.id;
        DELETE FROM task_results WHERE submit_id = OLD.id;

        RETURN OLD;
    END;
$$ LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION delete_task_group() RETURNS trigger AS $$
    BEGIN
        DELETE FROM tasks WHERE task_group = OLD.id;
        RETURN OLD;
    END;
$$ LANGUAGE plpgsql;


CREATE TRIGGER delete_user
BEFORE DELETE ON users FOR EACH ROW EXECUTE PROCEDURE delete_user();

CREATE TRIGGER delete_contest
BEFORE DELETE ON contests FOR EACH ROW EXECUTE PROCEDURE delete_contest();

CREATE TRIGGER delete_problem
BEFORE DELETE ON problems FOR EACH ROW EXECUTE PROCEDURE delete_problem();

CREATE TRIGGER delete_submit
BEFORE DELETE ON submits FOR EACH ROW EXECUTE PROCEDURE delete_submit();

CREATE TRIGGER delete_task_group
BEFORE DELETE ON task_groups FOR EACH ROW EXECUTE PROCEDURE delete_task_group();