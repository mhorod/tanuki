-- Information needed to display a single row representing the submit
-- e.g. in the table of all submits
CREATE OR REPLACE VIEW short_submit_results AS 
    SELECT 
        s.id,

        s.problem_id,
        p.short_name "short_problem_name",

        p.contest_id,
        c.short_name "short_contest_name",

        s.user_id,
        CONCAT(u.name, ' ', u.surname) "user_name",

        submission_time,

        statuses.id "status_id",
        statuses.name "status_name",
        submit_points(s.id) "points",
        max_points(s.problem_id) "max_points",
        sr.score

    FROM
        submits s
        LEFT JOIN submit_results sr ON s.id = sr.submit_id
        LEFT JOIN statuses ON statuses.id = sr.status
        JOIN problems p ON s.problem_id = p.id
        JOIN contests c ON p.contest_id = c.id
        JOIN users u ON s.user_id = u.id
    ORDER BY
        submission_time;

-- Information for rendering an invididual submit
-- In addition to all short information we also need the language and path to the source file
CREATE OR REPLACE VIEW full_submit_results AS 
    SELECT
        short.*,
        l.name "language_name",
        s.source_uri
    FROM
        short_submit_results short
        JOIN submits s ON short.id = s.id
        JOIN languages l ON s.language_id = l.id;