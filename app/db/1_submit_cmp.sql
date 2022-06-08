-- A custom comparator, tasked with comparing results in a way that prioritizes status that's NOT OK (and then sorting by timestamp)
CREATE OR REPLACE FUNCTION compare_submits(result INTEGER, submission_time TIMESTAMPTZ)
RETURNS TIMESTAMPTZ AS
$$
    BEGIN
            IF result = 1
                 THEN RETURN TIMESTAMPTZ 'infinity'; 
            END IF;
            RETURN submission_time;
    END;
$$ LANGUAGE plpgsql;