CREATE OR REPLACE VIEW all_submits AS 
    SELECT s.id, s.problem_id, (
        SELECT sr.status
        FROM submit_results sr
        WHERE sr.submit_id = s.id
    ) AS result, s.user_id, s.submission_time
    FROM submits s;
