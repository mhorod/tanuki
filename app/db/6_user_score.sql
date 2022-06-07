CREATE OR REPLACE VIEW problem_scores AS 
    SELECT 
        user_id, problem_id, MAX(sr.score) "score"
    FROM 
        submit_results sr
        JOIN submits s ON s.id = sr.submit_id
        JOIN statuses st ON sr.status = st.id
    WHERE
        st.name != 'REJ'
    GROUP BY
        1, 2; 

CREATE OR REPLACE VIEW task_scores AS 
    SELECT 
        tr.submit_id, tr.task_id, tr.status_id, tr.points AS points,
        tr.summary, tr.execution_time, tr.used_memory,
        t.task_group, t.name, t.test_uri, t.points AS max_points,
        t.memory_limit, t.show_output
    FROM task_results tr
    JOIN tasks t ON tr.task_id = t.id;