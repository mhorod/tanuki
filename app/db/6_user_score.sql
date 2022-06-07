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
