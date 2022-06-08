CREATE OR REPLACE VIEW user_contests AS 
    SELECT 
    DISTINCT u.id "user_id", c.contest_id
    FROM users u JOIN contest_permissions c ON u.id = c.user_id;