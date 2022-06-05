CREATE OR REPLACE FUNCTION compare_submits(result INTEGER, submission_time TIMESTAMP)
RETURNS TIMESTAMP AS
$$
    BEGIN
            IF result = 1
                 THEN RETURN TIMESTAMP 'infinity'; 
            END IF;
            RETURN submission_time;
    END;
$$ LANGUAGE plpgsql;