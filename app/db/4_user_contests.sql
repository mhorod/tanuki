-- For each user find contests they can access
CREATE OR REPLACE VIEW user_contests AS 
    SELECT 
    DISTINCT 
        u.id "user_id", 
        c.contest_id
    FROM 
        users u 
        JOIN contest_permissions c ON u.id = c.user_id;


-- Find contests where user is a teacher i.e. has management permissions
CREATE OR REPLACE VIEW teacher_contests AS 
    SELECT 
    DISTINCT 
        u.id "user_id", 
        c.contest_id
    FROM 
        users u 
        JOIN contest_permissions c ON u.id = c.user_id
    WHERE
        c.permission_id = 1; -- MANAGE


-- Find contests where user is a student i.e. has submission permissions
CREATE OR REPLACE VIEW student_contests AS 
    SELECT 
    DISTINCT 
        u.id "user_id", 
        c.contest_id
    FROM 
        users u 
        JOIN contest_permissions c ON u.id = c.user_id
    WHERE
        c.permission_id = 2; -- SUBMIT