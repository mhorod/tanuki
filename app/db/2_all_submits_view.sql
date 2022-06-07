CREATE OR REPLACE VIEW all_submits AS 
    SELECT s.id, s.problem_id, (
        SELECT sr.status
        FROM submit_results sr
        WHERE sr.submit_id = s.id
    ) AS result, s.user_id, s.submission_time
    FROM submits s;

CREATE OR REPLACE VIEW all_short_submits AS
    SELECT s.id, p.id AS problem_id, p.short_name AS short_problem_name,
        c.id AS contest_id, c.name AS contest_name, u.id AS user_id,
        u.login AS user_login, l.name AS language_name, 
        s.submission_time, sr.status
    FROM submits s
    JOIN problems p ON s.problem_id = p.id
    JOIN contests c ON c.id = p.contest_id
    JOIN users u ON u.id = s.user_id
    JOIN languages l ON l.id = s.language_id
    JOIN submit_results sr ON sr.submit_id = s.id
    ORDER BY s.submission_time DESC;