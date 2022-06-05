CREATE VIEW newest_submits_in_problems AS
SELECT a1.user_id, a1.problem_id, a1.id, result
FROM all_submits a1
WHERE a1.id = (
    SELECT a2.id
    FROM all_submits a2
    WHERE a2.user_id = a1.user_id AND a2.problem_id = a1.problem_id
    ORDER BY compare_submits(a2.result, a2.submission_time) DESC
    LIMIT 1
);
