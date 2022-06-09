DROP SCHEMA IF EXISTS tanuki CASCADE;

CREATE SCHEMA IF NOT EXISTS tanuki;

CREATE  TABLE tanuki.contests ( 
	name                 varchar(64) ,
	short_name           varchar(16) UNIQUE NOT NULL  ,
	is_active            boolean  NOT NULL  ,
	id                   serial  PRIMARY KEY
 );

CREATE  TABLE tanuki.languages ( 
	name                 varchar(50) NOT NULL  ,
	id                   serial  PRIMARY KEY
 );

CREATE  TABLE tanuki.permissions_for_contests ( 
	name                 varchar(64) UNIQUE NOT NULL  ,
	description          varchar(256)    ,
	id                   serial PRIMARY KEY
 );

CREATE  TABLE tanuki.scoring_methods ( 
	name                 varchar(32) UNIQUE NOT NULL ,
	id                   serial PRIMARY KEY
 );

CREATE  TABLE tanuki.statuses ( 
	name                 char(5)  NOT NULL  ,
	description          varchar(128)    ,
	priority             integer  NOT NULL  ,
	id                   serial PRIMARY KEY
 );

CREATE  TABLE tanuki.users ( 
	login                varchar(32)  NOT NULL UNIQUE ,
	name                 varchar(64)  NOT NULL  ,
	surname              varchar(64)  NOT NULL  ,
	password_hash        varchar(256)  NOT NULL  ,
	email                varchar(64)  NOT NULL  ,
	id                   serial PRIMARY KEY
 );

CREATE  TABLE tanuki.administrators ( 
	user_id              integer PRIMARY KEY REFERENCES tanuki.users
 );

CREATE  TABLE tanuki.contest_permissions (
	user_id              integer  NOT NULL REFERENCES tanuki.users ,
	permission_id        integer  NOT NULL REFERENCES tanuki.permissions_for_contests ,
	contest_id           integer  NOT NULL REFERENCES tanuki.contests,
	UNIQUE ( user_id, permission_id, contest_id )
 );

CREATE  TABLE tanuki.extensions ( 
	extension            char(8)  NOT NULL  ,
	language_id          integer  NOT NULL REFERENCES tanuki.languages ,
	UNIQUE ( extension, language_id )
 );

CREATE  TABLE tanuki.problems ( 
	name                 varchar(64)  NOT NULL  ,
	short_name            varchar(16)  NOT NULL  ,
	contest_id           integer  NOT NULL REFERENCES tanuki.contests ,
	statement_uri        varchar(256)  NOT NULL  ,
	uses_points          boolean  NOT NULL  ,
	points               numeric    ,
	due_date             timestamptz  NOT NULL,
	closing_date         timestamptz  NOT NULL,
	published            boolean  NOT NULL  ,
	scoring_method       integer REFERENCES tanuki.scoring_methods ,
	source_limit         integer    ,
	id                   serial  PRIMARY KEY,
	UNIQUE (contest_id, short_name),
	CHECK ( due_date <= closing_date )
 );

CREATE  TABLE tanuki.submits ( 
	source_uri           char(128)  NOT NULL  ,
	user_id              integer  NOT NULL REFERENCES tanuki.users ,
	problem_id           integer  NOT NULL REFERENCES tanuki.problems ,
	language_id          integer  REFERENCES tanuki.languages,
	submission_time      timestamptz NOT NULL  ,
	id                   serial  PRIMARY KEY
 );

CREATE  TABLE tanuki.task_groups ( 
	problem_id           integer  NOT NULL REFERENCES tanuki.problems ,
	name                 varchar(32)  NOT NULL  ,
	requires_all_ok      boolean  NOT NULL  ,
	id                   serial PRIMARY KEY
 );

CREATE  TABLE tanuki.tasks ( 
	task_group           integer  NOT NULL  REFERENCES tanuki.task_groups ,
	name                 varchar(32) NOT NULL ,
	test_uri             varchar(256)  NOT NULL ,
	points               numeric  NOT NULL  ,
	time_limit           numeric  NOT NULL  ,
	memory_limit         integer  NOT NULL  ,
	show_output          boolean  NOT NULL  ,
	id                   serial PRIMARY KEY
 );

CREATE  TABLE tanuki.problem_languages ( 
	problem_id           integer  NOT NULL REFERENCES tanuki.problems ,
	language_id          integer  NOT NULL REFERENCES tanuki.languages,
	UNIQUE ( problem_id, language_id )
 );

CREATE  TABLE tanuki.submit_results ( 
	submit_id            integer  PRIMARY KEY REFERENCES tanuki.submits,
	score                numeric  NOT NULL  ,
	status               integer  NOT NULL  REFERENCES tanuki.statuses
 );

CREATE  TABLE tanuki.task_results ( 
	submit_id            integer NOT NULL REFERENCES tanuki.submits ,
	task_id              integer NOT NULL REFERENCES tanuki.tasks ,
	status_id            integer NOT NULL REFERENCES tanuki.statuses ,
	points               numeric NOT NULL ,
	summary              varchar,
	execution_time       numeric(6,3)  NOT NULL  ,
	used_memory          integer    ,
	PRIMARY KEY ( submit_id, task_id ),
	CHECK ( points >= 0 ),
	CHECK ( used_memory >= 0 ),
	CHECK ( execution_time >= 0 )
 );


COMMENT ON COLUMN tanuki.contests.short_name IS 'abbreviated name of the contest';

COMMENT ON COLUMN tanuki.statuses.priority IS 'in case of multiple statuses in group the one with highest priority is displayed';

COMMENT ON COLUMN tanuki.problems.short_name IS 'abbreviated name of the problem';

COMMENT ON COLUMN tanuki.problems.statement_uri IS 'link to statement that is rendered on the problem page';

COMMENT ON COLUMN tanuki.problems.source_limit IS 'Limits the size of submitted file (in bytes).';

COMMENT ON COLUMN tanuki.submits.source_uri IS 'link to submitted source file';

COMMENT ON COLUMN tanuki.task_groups.requires_all_ok IS 'has every task to be completed for group to have points';

COMMENT ON COLUMN tanuki.tasks.test_uri IS 'link to test that is invoked on submit';

COMMENT ON COLUMN tanuki.tasks.time_limit IS 'time limit in seconds';

COMMENT ON COLUMN tanuki.tasks.memory_limit IS 'memory limit (in bytes)';

COMMENT ON COLUMN tanuki.task_results.summary IS 'additional description of the results e.g. expected output';

COMMENT ON COLUMN tanuki.task_results.execution_time IS 'execution time in seconds';

COMMENT ON COLUMN tanuki.task_results.used_memory IS 'used memory (in bytes)';

SET search_path TO tanuki;
-- A custom comparator, tasked with comparing results in a way that prioritizes status that's NOT OK (and then sorting by timestamp)
CREATE OR REPLACE FUNCTION compare_submits(result INTEGER, submission_time TIMESTAMPTZ)
RETURNS TIMESTAMPTZ AS
$$
BEGIN
    -- 4 is id of OK
    IF result = 4 THEN 
        RETURN TIMESTAMPTZ 'infinity'; 
    END IF;
    RETURN submission_time;
END;
$$ 
LANGUAGE plpgsql;-- For each submit retrieves basic information about it
CREATE OR REPLACE VIEW all_submits AS 
SELECT 
    s.id, 
    s.problem_id, 
    (
        SELECT sr.status
        FROM submit_results sr
        WHERE sr.submit_id = s.id
    ) 
    AS result, 
    s.user_id, 
    s.submission_time
FROM 
    submits s;
--A view that for each (user, problem) pair shows the newest submit (or a submit with an OK status)
CREATE VIEW newest_submits_in_problems AS
SELECT 
    a1.user_id, 
    a1.problem_id, 
    a1.id, 
    result
FROM all_submits a1
WHERE 
    a1.id = (
    SELECT a2.id
    FROM all_submits a2
    WHERE a2.user_id = a1.user_id AND a2.problem_id = a1.problem_id
    ORDER BY compare_submits(a2.result, a2.submission_time) DESC
    LIMIT 1
);
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
        c.permission_id = 2; -- SUBMIT--Triggers that are responsible for deleting things without causing any errors related to foreign keys

CREATE OR REPLACE FUNCTION delete_user() RETURNS trigger AS $$
BEGIN
    DELETE FROM contest_permissions WHERE user_id = OLD.id;

    DELETE 
        FROM task_results 
        WHERE submit_id IN (SELECT s.id FROM submits s WHERE s.user_id = OLD.id);

    DELETE 
        FROM submit_results 
        WHERE submit_id IN (SELECT s.id FROM submits s WHERE s.user_id = OLD.id);

    DELETE FROM submits WHERE user_id = OLD.id;
    DELETE FROM administrators WHERE user_id = OLD.id;

    RETURN OLD;
END;
$$ LANGUAGE plpgsql;
 

CREATE OR REPLACE FUNCTION delete_contest() RETURNS trigger AS $$
BEGIN
    DELETE FROM contest_permissions WHERE contest_id = OLD.id;
    DELETE FROM problems WHERE contest_id = OLD.id;

    RETURN OLD;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION delete_problem() RETURNS trigger AS $$
BEGIN
    DELETE FROM problem_languages WHERE problem_id = OLD.id;
    DELETE FROM submits WHERE problem_id = OLD.id;
    DELETE FROM task_groups WHERE problem_id = OLD.id;

    RETURN OLD;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION delete_submit() RETURNS trigger AS $$
BEGIN
    DELETE FROM submit_results WHERE submit_id = OLD.id;
    DELETE FROM task_results WHERE submit_id = OLD.id;

    RETURN OLD;
END;
$$ LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION delete_task_group() RETURNS trigger AS $$
BEGIN
    DELETE FROM tasks WHERE task_group = OLD.id;
    RETURN OLD;
END;
$$ LANGUAGE plpgsql;


CREATE TRIGGER delete_user
BEFORE DELETE ON users FOR EACH ROW EXECUTE PROCEDURE delete_user();

CREATE TRIGGER delete_contest
BEFORE DELETE ON contests FOR EACH ROW EXECUTE PROCEDURE delete_contest();

CREATE TRIGGER delete_problem
BEFORE DELETE ON problems FOR EACH ROW EXECUTE PROCEDURE delete_problem();

CREATE TRIGGER delete_submit
BEFORE DELETE ON submits FOR EACH ROW EXECUTE PROCEDURE delete_submit();

CREATE TRIGGER delete_task_group
BEFORE DELETE ON task_groups FOR EACH ROW EXECUTE PROCEDURE delete_task_group();-- Finds status_id of given group for given submit
-- Essentially it retrieves status with the highest priority from results of all tasks that belong to this group
CREATE OR REPLACE FUNCTION task_group_status(submit_id INT, task_group_id INT) 
RETURNS INT AS 
$$
    SELECT 
        tr.status_id 
    FROM 
        tasks t
        LEFT JOIN (SELECT * FROM task_results tr WHERE tr.submit_id = $1) tr ON (tr.task_id = t.id)
        LEFT JOIN statuses s ON (tr.status_id = s.id)
    WHERE t.task_group = $2
    ORDER BY s.priority DESC NULLS FIRST
    LIMIT 1;
$$
LANGUAGE SQL;

CREATE OR REPLACE FUNCTION task_group_points(submit_id INT, task_group_id INT)
RETURNS NUMERIC AS $$
    SELECT 
        CASE
            WHEN (SELECT requires_all_ok FROM task_groups WHERE id = $2) AND task_group_status($1, $2) != 4 THEN 0
            ELSE 
            (
                SELECT SUM(
                CASE
                    WHEN tr.status_id IS NULL THEN NULL
                    WHEN tr.status_id = 4 THEN t.points -- OK
                    ELSE 0
                END
                )
            FROM tasks t
            LEFT JOIN (SELECT * FROM task_results tr WHERE tr.submit_id = $1) tr ON (tr.task_id = t.id)
            WHERE t.task_group = $2
            )
        END 
$$ LANGUAGE SQL;

CREATE OR REPLACE FUNCTION submit_status(submit_id INT)
RETURNS INT AS $$
    WITH tg_statuses AS (
        SELECT tg.id AS "id", task_group_status($1, tg.id) AS "status"
        FROM submits s
        JOIN task_groups tg USING(problem_id)
        WHERE s.id = $1
    )
    SELECT tgs.status 
    FROM tg_statuses tgs 
    JOIN statuses s ON(tgs.status = s.id)
    ORDER BY s.priority DESC NULLS FIRST
    LIMIT 1;
$$ LANGUAGE SQL;

CREATE OR REPLACE FUNCTION submit_points(submit_id INT)
RETURNS NUMERIC AS $$
    SELECT  SUM (
        CASE 
            WHEN task_group_status($1, tg.id) IS NULL THEN NULL
            ELSE task_group_points($1, tg.id)
        END
    )
    FROM submits s
    JOIN task_groups tg USING(problem_id)
    WHERE s.id = $1
$$ LANGUAGE SQL;



CREATE OR REPLACE FUNCTION max_task_group_points(group_id INT)
RETURNS NUMERIC AS $$
    SELECT SUM(points) 
    FROM tasks t 
    JOIN task_groups tg ON (t.task_group = tg.id)
    WHERE tg.id = $1
$$ LANGUAGE SQL;

CREATE OR REPLACE FUNCTION max_points(problem_id INT)
RETURNS NUMERIC AS $$
    SELECT SUM(max_task_group_points(tg.id)) 
    FROM
    task_groups tg 
    WHERE tg.problem_id = $1;
$$ LANGUAGE SQL;


CREATE OR REPLACE FUNCTION score_multiplier(due_date timestamptz, closing_date timestamptz, submit_time timestamptz, scoring_method INT)
RETURNS NUMERIC AS $$
    SELECT CASE scoring_method 
        WHEN 1 THEN CASE -- ZERO
            WHEN submit_time < due_date THEN 1.0::numeric
            ELSE 0::numeric
        END
        WHEN 2 THEN CASE -- LINEAR_TO_ZERO
            WHEN submit_time < due_date THEN 1.0::numeric
            WHEN submit_time < closing_date THEN (EXTRACT(EPOCH FROM (closing_date - submit_time)) / EXTRACT(EPOCH FROM (closing_date - due_date)))::numeric
            ELSE 0::numeric
        END
        WHEN 3 THEN CASE -- LINEAR_TO_NEGATIVE
            WHEN submit_time < due_date THEN 1.0::numeric
            ELSE (EXTRACT(EPOCH FROM (closing_date - submit_time)) / EXTRACT(EPOCH FROM (closing_date - due_date)))::numeric
        END
    END
$$ LANGUAGE SQL;

CREATE OR REPLACE FUNCTION submit_score(submit_id INT)
RETURNS NUMERIC AS $$
    SELECT 
    CASE p.uses_points
        WHEN true THEN p.points * submit_points(s.id) / max_points(p.id) * score_multiplier(p.due_date, p.closing_date, s.submission_time, p.scoring_method)
        ELSE CASE submit_status(submit_id) 
            WHEN 4 THEN p.points  -- 4 is OK
            ELSE 0
        END
    END
    FROM submits s JOIN problems p ON (p.id = s.problem_id)
    WHERE s.id = $1;
$$ LANGUAGE SQL;

CREATE OR REPLACE VIEW task_scores AS 
    SELECT 
        tr.submit_id, tr.task_id, tr.status_id, tr.points AS points,
        tr.summary, tr.execution_time, tr.used_memory,
        t.task_group, t.name, t.test_uri, t.points AS max_points,
        t.memory_limit, t.show_output
    FROM task_results tr
    JOIN tasks t ON tr.task_id = t.id;
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
        submission_time DESC;

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
        JOIN languages l ON s.language_id = l.id;SET search_path TO tanuki;
COPY users (login, name, surname, password_hash, email) FROM STDIN;
jamesvaughan	Wanda	Mason	$2b$12$oU2wDsn/XB3CHlxlSAY62OVcXeA/qQtb8Cd5xApvE512uhe1W7L32	lisa57@example.net
dmatthews	Monica	Mason	$2b$12$JQpF2GtA6fN8zk83cX60YeZyU95xYBgDLkIp.dHHG403ECX9G1gka	dennis70@example.com
macdonalddaniel	Jennifer	Reed	$2b$12$GA.zI1UtRJWnavHS6Zm4guChwc7ghChghcdGn1FuVo3iZ/C4k7FKq	timothysmith@example.com
floresadam	Robert	Logan	$2b$12$qS50RnHDrZlr64G2iV0bD.UISNVnX1JJD/pdwya7ixIQ.NZBJFtOK	kathleenboyd@example.net
kruegertonya	Joseph	Evans	$2b$12$YuY/bC.hpiz6QyGzo6xD9.JMrJKtnYqfYqd9ij.LfqUXxQQsYKgfO	ejones@example.org
nicholasvillanueva	Anna	Wood	$2b$12$UnZrxtRf5aLPy1aljp5NQ.gc94a91ZW9sdLDYcNpksDy3F9eNYesq	wkidd@example.net
kblanchard	Carrie	Ware	$2b$12$ETYmB3Vuk3uZDsgwf/VacuBfDnp51Bkb9ZDJ1vx6.VJN2RUAfWu3S	zcarter@example.org
jeffery11	Kevin	Tapia	$2b$12$ZDxtZFOA8fd5/wYVpWyWh.ciPqIwTZmjAGsShFjlhGo13eTcx1lT.	amanda85@example.net
justinbradford	Cynthia	Taylor	$2b$12$lRXyIrIEAlJmiLocHM.pJeQ/9z./mWy5ZIPUblPJU0pYQW12PcFHO	cynthia19@example.net
russellhowe	Joanna	Williams	$2b$12$RCat2awc3v1RopvcV/GrKurW4TmI5BXg.7MRDS40rX6ZbLQ3flwBy	justinhamilton@example.org
admin	A0	D	$2b$12$DQYNGefKveE1sIzT/3KJu.DmBtqEBViIvDA4fpCRuXNLfUjEY1m22	administracja@tanuki.pl
admin1	A1	D	$2b$12$/z5niQtC19/AkDsUvfMZve82UO737qqlvAY1ihNE93VgyZEr6pQzi	administracja@tanuki.pl
admin2	A2	D	$2b$12$6A0JitRjj802BeI8YthPruVwEcnpZPB3ehFDqEowwfkqvL0A5B7TO	administracja@tanuki.pl
admin3	A3	D	$2b$12$H48zhTxzqLO7FVblTpZuAOAnL3rd7UrZJnDCiyXxLex.K4xfjwisC	administracja@tanuki.pl
admin4	A4	D	$2b$12$/I1O3sllKEPllthQ/n62ouIrb1x7N3p9IFiQvy/TjQWvArLh80XBq	administracja@tanuki.pl
\.
COPY administrators (user_id) FROM STDIN;
12
15
11
14
13
\.
COPY statuses (name, description, priority) FROM STDIN;
INT	Internal error	-1
REJ	Manually rejected	-1
ERR	Checking error	-1
OK	Program works correctly	0
ANS	Program produces wrong answer	1
TLE	Time limit exceeded	2
MEM	Memory limit exceeded	3
RTE	Runtime error	4
CME	Compilation failed	5
RUL	Program is incompliant with rules	6
\.
COPY scoring_methods (name) FROM STDIN;
ZERO
LINEAR_TO_ZERO
LINEAR_TO_NEGATIVE
\.
COPY contests (name, short_name, is_active) FROM STDIN;
Indeed picture under case lead.	Military.	True
Energy collection security son.	Third east.	True
Part what once.	Interesting.	True
Spend point stop goal.	Teach.	True
Control reason despite attack.	Executive.	True
Author along other human.	You hold.	True
Answer management once.	Staff.	True
Public laugh result agent.	Dark.	True
Allow put watch structure.	Forget.	True
White home seven adult.	Wife.	True
\.
COPY permissions_for_contests (name, description) FROM STDIN;
MANAGE	Allows user to edit contest and manage participants
SUBMIT	Allows user to view problems and sending submissions
\.
COPY contest_permissions (user_id, permission_id, contest_id) FROM STDIN;
10	2	3
2	2	5
4	2	7
3	2	1
3	1	5
4	1	2
8	2	2
6	2	9
10	2	5
2	2	7
6	1	10
5	2	6
3	1	7
6	2	2
8	2	4
7	2	2
9	2	4
2	2	9
5	2	8
8	2	6
7	2	4
9	2	6
4	2	4
10	1	4
5	2	1
5	2	10
1	2	8
3	2	10
6	2	6
8	2	8
7	2	6
9	2	8
2	2	4
4	2	6
5	2	3
1	2	1
3	2	3
1	2	10
8	2	1
9	2	1
7	2	8
9	2	10
10	2	7
5	2	5
1	2	3
3	2	5
7	2	1
9	2	3
7	2	10
10	2	9
5	2	7
1	2	5
3	1	8
3	2	7
7	2	3
9	2	5
10	2	2
1	2	7
3	2	9
6	2	8
8	2	10
9	2	7
10	2	4
2	2	6
5	2	2
3	2	2
1	2	9
4	1	3
8	2	3
6	2	10
7	2	7
9	2	9
10	2	6
4	2	1
2	1	9
2	2	8
1	2	2
3	2	4
6	2	3
8	2	5
9	2	2
4	2	3
2	2	10
1	2	4
3	2	6
5	2	9
6	2	5
8	2	7
10	2	1
2	2	3
10	2	10
6	1	6
1	2	6
3	2	8
8	1	1
6	2	7
8	2	9
\.
COPY languages (name) FROM STDIN;
Python 2
Python 3
C++
C
Fortran
Java
Haskell
\.
COPY extensions (extension, language_id) FROM STDIN;
py	1
py	2
cpp	3
hpp	3
h	3
c	4
h	4
f	5
java	6
hs	7
\.
COPY problems (name, short_name, contest_id, statement_uri, uses_points, points, due_date, closing_date, published, scoring_method, source_limit) FROM STDIN;
Middle water how.	A	1	/problems/dummy	True	0.2	2021-08-21, 07:50:31	2021-09-01, 00:43:43	True	2	54272
Establish remain year.	B	1	/problems/dummy	False	0.3	2022-05-26, 15:45:44	2022-11-18, 08:23:19	False	1	72704
Year six agree significant.	C	1	/problems/dummy	True	0.1	2022-04-08, 14:13:20	2022-11-24, 12:00:34	True	3	84992
Still note pressure.	D	1	/problems/dummy	True	0.3	2021-08-03, 12:03:44	2021-10-01, 10:10:06	False	3	72704
Town trouble person song.	E	1	/problems/dummy	True	0.2	2021-06-27, 19:17:11	2022-08-13, 05:58:48	True	1	77824
Real will method morning lot.	F	1	/problems/dummy	False	0.4	2022-02-15, 04:03:03	2022-09-26, 23:40:19	True	1	51200
Finally at candidate area.	G	1	/problems/dummy	False	0.3	2022-02-08, 14:14:54	2023-05-25, 09:27:22	False	1	74752
Window education else option.	H	1	/problems/dummy	False	0.3	2022-11-24, 14:19:25	2023-04-18, 18:37:00	True	2	26624
Thought fly impact hospital.	I	1	/problems/dummy	False	0.3	2022-07-13, 11:25:01	2023-02-21, 22:10:05	True	3	76800
Might hear strong.	A	2	/problems/dummy	False	0.4	2021-10-23, 21:22:24	2021-12-17, 04:55:48	True	1	38912
Drug top continue such.	B	2	/problems/dummy	False	0.2	2021-06-14, 21:04:31	2022-03-15, 12:49:31	True	3	26624
Foot economy talk.	A	3	/problems/dummy	False	0.4	2021-10-06, 02:47:24	2022-10-08, 14:17:47	False	3	38912
Like Mr detail picture be.	B	3	/problems/dummy	False	0.3	2021-09-29, 13:48:56	2022-07-28, 12:17:14	True	2	59392
Since star employee wonder.	C	3	/problems/dummy	False	0.3	2022-09-11, 15:44:45	2022-09-24, 03:35:32	True	2	81920
Right worry out movie real.	D	3	/problems/dummy	False	0.4	2021-11-20, 19:49:04	2022-11-28, 04:38:20	True	3	33792
North cause relate education.	E	3	/problems/dummy	False	0.4	2021-09-07, 11:52:23	2023-01-09, 08:11:36	False	1	83968
Foreign left price.	F	3	/problems/dummy	False	0.1	2021-10-07, 18:39:53	2022-07-21, 23:50:47	True	3	65536
Down book grow sing across.	G	3	/problems/dummy	False	0.1	2021-11-05, 00:30:02	2022-06-07, 21:09:37	True	1	81920
See similar follow.	H	3	/problems/dummy	False	0.4	2021-07-01, 13:44:27	2022-09-28, 05:16:12	True	2	58368
Situation local I.	I	3	/problems/dummy	True	0.2	2022-09-16, 22:13:22	2022-12-21, 17:02:57	False	1	27648
Soon up look whether accept.	A	4	/problems/dummy	True	0.0	2021-06-09, 10:30:25	2021-12-01, 20:26:42	True	2	14336
Special no pass.	B	4	/problems/dummy	True	0.2	2022-05-19, 17:55:17	2022-07-19, 03:30:58	True	2	40960
Seven new because.	C	4	/problems/dummy	True	0.4	2021-12-25, 14:32:18	2022-10-27, 01:44:52	True	3	60416
Probably least adult laugh.	D	4	/problems/dummy	True	0.0	2021-11-24, 04:53:26	2023-04-06, 01:38:31	True	2	51200
Point training win act way.	E	4	/problems/dummy	True	0.1	2021-06-21, 08:54:41	2022-03-24, 21:25:01	True	1	9216
Peace style speech air.	F	4	/problems/dummy	True	0.4	2021-06-23, 13:37:03	2022-03-03, 06:46:05	False	2	11264
Away project agree.	G	4	/problems/dummy	False	0.0	2022-11-24, 23:17:34	2023-06-07, 00:11:34	True	2	33792
Couple out condition already.	H	4	/problems/dummy	False	0.4	2022-01-02, 02:21:04	2022-05-23, 12:47:46	True	1	30720
In stuff join something.	I	4	/problems/dummy	True	0.3	2022-02-18, 02:30:05	2023-05-24, 21:51:12	True	3	24576
Want that guess ten.	J	4	/problems/dummy	True	0.3	2021-10-17, 13:06:12	2022-03-30, 20:17:43	False	1	54272
Five left into herself.	A	5	/problems/dummy	True	0.1	2022-06-01, 09:56:05	2022-07-13, 15:49:09	True	3	81920
Least garden still.	B	5	/problems/dummy	False	0.0	2021-07-16, 14:48:55	2022-01-28, 15:47:24	True	1	79872
Clearly among white when.	C	5	/problems/dummy	True	0.2	2022-06-09, 11:05:03	2022-10-13, 03:29:21	True	2	92160
We name you money.	A	6	/problems/dummy	False	0.4	2021-07-18, 23:57:50	2022-01-25, 01:09:13	True	1	81920
Themselves determine reduce.	B	6	/problems/dummy	False	0.3	2021-06-09, 16:50:37	2021-08-11, 08:57:34	True	1	22528
With run team benefit bag.	C	6	/problems/dummy	True	0.1	2022-10-23, 03:50:12	2023-04-15, 11:58:02	True	2	54272
Personal writer position age.	D	6	/problems/dummy	True	0.2	2021-08-24, 15:32:36	2021-12-11, 17:28:09	True	2	10240
Lead front oil get.	E	6	/problems/dummy	False	0.0	2022-04-24, 22:01:17	2022-11-02, 16:31:29	False	1	54272
Always left sometimes.	F	6	/problems/dummy	False	0.2	2021-10-13, 04:10:52	2022-12-16, 10:51:15	True	2	102400
Other order maybe them.	G	6	/problems/dummy	True	0.0	2023-02-20, 07:02:59	2023-03-08, 03:27:45	False	3	50176
Son morning show.	H	6	/problems/dummy	True	0.1	2022-09-09, 12:20:51	2022-11-29, 19:16:14	False	2	29696
Early yeah issue cold maybe.	I	6	/problems/dummy	True	0.4	2022-09-29, 00:06:48	2022-11-27, 07:31:05	False	2	33792
Trouble they scene imagine.	J	6	/problems/dummy	False	0.1	2021-09-22, 10:29:20	2022-10-07, 06:38:57	True	1	80896
Majority make more.	A	7	/problems/dummy	True	0.2	2022-02-06, 06:55:14	2022-04-01, 06:27:21	False	3	40960
Marriage nor away protect.	B	7	/problems/dummy	False	0.4	2022-02-04, 14:11:52	2022-02-09, 18:40:31	False	3	21504
Time reason take sure easy.	A	8	/problems/dummy	True	0.3	2022-02-23, 01:31:03	2022-12-07, 14:58:25	True	3	57344
Letter cultural mind cover.	B	8	/problems/dummy	False	0.3	2021-08-07, 03:45:43	2022-11-24, 18:42:18	True	3	70656
Oil use win thus candidate.	C	8	/problems/dummy	True	0.1	2022-12-13, 08:54:07	2023-01-31, 11:21:01	True	3	29696
Popular history page dog.	D	8	/problems/dummy	True	0.4	2022-02-15, 20:12:34	2023-04-05, 10:39:55	False	1	44032
Including way night reduce.	E	8	/problems/dummy	False	0.4	2021-11-26, 17:44:57	2023-04-10, 01:20:32	True	2	13312
Want four body morning.	F	8	/problems/dummy	True	0.2	2022-03-30, 04:17:13	2022-08-25, 08:53:33	True	1	21504
Spring when recent.	A	9	/problems/dummy	False	0.0	2022-05-30, 00:12:43	2022-10-06, 09:14:41	False	1	86016
Night guess accept leg.	B	9	/problems/dummy	True	0.3	2022-08-25, 15:17:02	2022-09-08, 16:04:48	False	2	68608
May back play manage low way.	C	9	/problems/dummy	True	0.1	2021-07-15, 20:49:30	2022-05-27, 16:28:52	False	3	8192
Kid choice new serious hot.	D	9	/problems/dummy	False	0.3	2021-10-25, 18:04:26	2023-06-06, 09:42:06	True	1	49152
Bad adult partner show.	E	9	/problems/dummy	False	0.3	2021-08-14, 07:18:52	2022-10-02, 07:40:27	True	2	9216
Beyond morning others name.	F	9	/problems/dummy	True	0.0	2021-07-03, 12:53:29	2022-08-11, 06:30:09	True	1	99328
Hour why modern less.	G	9	/problems/dummy	False	0.2	2021-07-01, 05:23:55	2023-04-04, 19:14:10	True	1	34816
Region thought road.	H	9	/problems/dummy	False	0.2	2022-01-06, 07:23:52	2023-02-09, 13:03:39	False	2	63488
Build test stuff.	I	9	/problems/dummy	False	0.2	2021-12-17, 14:08:43	2023-01-15, 20:58:45	True	2	29696
Choice never analysis he.	J	9	/problems/dummy	True	0.4	2021-07-26, 09:11:42	2023-01-06, 23:14:59	True	2	52224
Media few there attack teach.	A	10	/problems/dummy	True	0.0	2021-09-17, 12:27:20	2022-06-25, 02:30:05	False	2	16384
Energy more whose.	B	10	/problems/dummy	False	0.1	2022-07-25, 11:16:42	2022-08-08, 18:44:54	True	3	36864
For ahead set realize.	C	10	/problems/dummy	False	0.2	2022-04-02, 01:41:59	2022-11-28, 12:27:35	True	1	67584
\.
COPY problem_languages (problem_id, language_id) FROM STDIN;
36	7
50	6
10	6
11	5
32	3
57	2
6	2
53	7
64	7
4	2
59	2
3	6
42	4
46	4
35	1
15	7
26	7
29	6
22	3
47	2
59	4
37	1
5	5
8	4
17	7
19	4
28	7
51	2
60	5
24	3
18	5
54	1
34	7
47	4
27	1
60	7
9	5
16	1
7	7
55	1
14	3
58	3
51	6
41	5
57	1
33	1
39	7
45	2
5	2
32	4
44	3
26	6
16	5
31	5
22	2
56	4
23	1
3	7
9	2
13	2
25	1
7	4
39	2
63	3
56	6
21	6
12	3
23	3
37	2
51	3
61	5
52	2
10	5
13	4
48	7
62	6
29	3
40	3
63	5
37	4
58	2
50	7
41	4
43	1
1	4
2	3
25	5
6	3
14	4
36	1
27	7
17	6
44	2
57	5
62	1
49	1
40	7
31	4
55	7
9	4
38	3
20	6
7	6
64	3
52	1
8	7
44	6
10	4
30	7
11	3
49	5
29	2
\.
COPY submits (source_uri, user_id, problem_id, language_id, submission_time) FROM STDIN;
/submitted/dummy	1	7	6	1995-03-29, 08:44:06
/submitted/dummy	1	45	2	2018-04-26, 13:33:36
/submitted/dummy	1	27	7	2020-04-11, 16:36:27
/submitted/dummy	1	53	7	2010-01-31, 18:17:39
/submitted/dummy	1	46	4	2011-12-27, 20:12:45
/submitted/dummy	1	55	1	2015-10-11, 03:59:51
/submitted/dummy	1	50	7	2017-04-27, 19:25:50
/submitted/dummy	1	39	2	2007-02-26, 20:16:59
/submitted/dummy	1	12	3	2014-05-17, 00:24:43
/submitted/dummy	1	28	7	2001-04-18, 15:00:34
/submitted/dummy	1	56	4	2021-03-03, 09:42:44
/submitted/dummy	1	10	6	1995-11-15, 05:12:57
/submitted/dummy	1	57	5	1998-03-22, 22:26:41
/submitted/dummy	1	64	7	2003-11-09, 21:38:19
/submitted/dummy	1	7	6	2010-05-03, 23:35:14
/submitted/dummy	1	49	5	2006-07-28, 04:28:31
/submitted/dummy	1	64	7	2020-10-25, 19:31:30
/submitted/dummy	1	26	6	2002-05-13, 20:42:17
/submitted/dummy	1	38	3	1998-05-29, 19:12:05
/submitted/dummy	1	11	5	2019-05-16, 15:58:55
/submitted/dummy	1	15	7	2013-04-29, 17:02:39
/submitted/dummy	1	30	7	2004-04-28, 07:10:03
/submitted/dummy	1	14	4	2021-03-12, 00:21:10
/submitted/dummy	1	2	3	1994-03-14, 21:55:11
/submitted/dummy	1	31	5	2021-04-01, 11:40:15
/submitted/dummy	1	4	2	2010-07-06, 14:31:29
/submitted/dummy	1	45	2	2002-08-31, 01:31:37
/submitted/dummy	1	22	3	2005-07-10, 18:57:43
/submitted/dummy	1	36	7	1993-02-11, 19:00:13
/submitted/dummy	1	30	7	2000-05-21, 10:14:37
/submitted/dummy	1	11	3	2020-12-08, 21:27:31
/submitted/dummy	1	30	7	2020-07-01, 15:43:14
/submitted/dummy	1	64	3	2021-08-24, 16:25:46
/submitted/dummy	2	19	4	2014-05-02, 08:48:16
/submitted/dummy	2	21	6	2018-12-16, 06:09:36
/submitted/dummy	2	48	7	1995-10-03, 09:18:53
/submitted/dummy	2	34	7	2012-12-17, 18:09:28
/submitted/dummy	2	50	7	2016-06-20, 15:00:52
/submitted/dummy	2	49	1	2010-11-29, 23:27:25
/submitted/dummy	2	23	1	2020-12-26, 07:04:01
/submitted/dummy	2	33	1	2005-05-21, 04:12:32
/submitted/dummy	2	30	7	2013-12-13, 20:12:46
/submitted/dummy	2	56	4	1992-07-27, 08:13:47
/submitted/dummy	2	46	4	1992-12-31, 06:04:23
/submitted/dummy	2	59	2	2019-12-01, 22:41:50
/submitted/dummy	2	14	3	2013-11-17, 15:32:25
/submitted/dummy	2	47	2	1992-07-01, 12:50:06
/submitted/dummy	2	23	1	2012-07-11, 08:07:31
/submitted/dummy	2	62	6	2022-02-06, 10:01:44
/submitted/dummy	2	42	4	2012-06-15, 16:14:52
/submitted/dummy	2	47	2	1998-09-14, 00:35:42
/submitted/dummy	2	18	5	2019-10-14, 16:16:58
/submitted/dummy	2	15	7	2007-01-03, 06:26:24
/submitted/dummy	2	51	2	2013-03-31, 04:28:30
/submitted/dummy	2	33	1	1999-01-25, 11:31:36
/submitted/dummy	2	57	2	2020-10-10, 17:33:11
/submitted/dummy	2	56	6	2010-07-06, 09:40:20
/submitted/dummy	2	64	7	1995-08-31, 01:35:37
/submitted/dummy	2	40	7	2007-03-19, 03:59:44
/submitted/dummy	2	45	2	2015-05-18, 16:41:10
/submitted/dummy	2	44	6	1996-08-08, 00:18:08
/submitted/dummy	2	25	1	2018-07-22, 08:31:25
/submitted/dummy	2	50	6	2008-09-27, 10:15:22
/submitted/dummy	2	33	1	2018-05-05, 05:54:46
/submitted/dummy	2	15	7	1999-08-17, 09:21:57
/submitted/dummy	2	59	2	1996-12-06, 17:32:16
/submitted/dummy	2	23	1	2015-02-17, 11:35:44
/submitted/dummy	2	13	4	2010-04-20, 19:22:14
/submitted/dummy	2	26	6	2022-02-25, 13:22:14
/submitted/dummy	2	16	1	1994-09-10, 21:45:37
/submitted/dummy	2	51	6	1995-05-27, 12:52:44
/submitted/dummy	2	38	3	2013-03-27, 04:31:11
/submitted/dummy	2	31	4	2021-06-09, 05:28:48
/submitted/dummy	2	35	1	2017-08-02, 15:46:09
/submitted/dummy	2	25	1	2006-12-24, 23:52:50
/submitted/dummy	2	22	2	1994-10-07, 08:52:24
/submitted/dummy	2	58	3	2015-03-16, 06:15:30
/submitted/dummy	2	57	2	1999-12-13, 19:40:02
/submitted/dummy	2	21	6	2003-11-23, 08:22:04
/submitted/dummy	2	53	7	2005-04-17, 08:25:22
/submitted/dummy	2	46	4	2011-08-04, 04:32:03
/submitted/dummy	3	40	3	2018-02-28, 00:49:45
/submitted/dummy	3	28	7	2008-05-18, 06:36:40
/submitted/dummy	3	30	7	1995-07-18, 20:15:56
/submitted/dummy	3	17	7	2006-07-18, 19:35:21
/submitted/dummy	3	8	7	2005-07-01, 01:08:58
/submitted/dummy	3	56	4	2007-11-30, 22:22:32
/submitted/dummy	3	36	7	2009-08-28, 08:34:01
/submitted/dummy	3	20	6	1996-10-08, 05:27:12
/submitted/dummy	3	2	3	2019-09-16, 22:26:46
/submitted/dummy	3	60	7	2021-07-08, 14:45:39
/submitted/dummy	3	62	1	2010-10-13, 19:44:16
/submitted/dummy	3	7	7	2005-02-20, 06:08:07
/submitted/dummy	3	40	3	2000-03-10, 20:35:17
/submitted/dummy	3	25	5	1997-10-16, 18:31:32
/submitted/dummy	3	22	2	1997-01-03, 09:11:24
/submitted/dummy	3	39	7	1998-03-12, 11:31:30
/submitted/dummy	3	20	6	2003-12-06, 16:12:40
/submitted/dummy	3	22	3	2001-02-02, 05:50:07
/submitted/dummy	3	23	3	1995-03-13, 20:13:25
/submitted/dummy	3	49	5	2019-03-09, 13:41:05
/submitted/dummy	3	50	7	2008-01-28, 08:00:29
/submitted/dummy	3	10	5	2014-04-22, 15:06:39
/submitted/dummy	3	52	2	2015-04-26, 07:56:31
/submitted/dummy	3	31	5	2007-03-30, 12:23:43
/submitted/dummy	3	15	7	2014-07-15, 18:16:37
/submitted/dummy	3	56	4	1992-08-19, 23:16:41
/submitted/dummy	3	23	3	1998-06-15, 01:48:39
/submitted/dummy	3	6	3	1996-05-13, 02:39:23
/submitted/dummy	3	20	6	2019-06-06, 12:27:04
/submitted/dummy	3	51	2	2000-08-08, 13:51:39
/submitted/dummy	3	1	4	1993-09-24, 12:23:26
/submitted/dummy	3	42	4	1998-12-14, 15:45:03
/submitted/dummy	3	42	4	2000-02-23, 16:24:12
/submitted/dummy	3	6	2	2009-02-27, 03:23:03
/submitted/dummy	3	35	1	1995-12-15, 07:56:36
/submitted/dummy	3	62	1	2014-06-09, 00:03:26
/submitted/dummy	3	62	6	1997-08-30, 19:24:38
/submitted/dummy	3	56	4	2021-12-05, 20:54:15
/submitted/dummy	3	49	1	1997-05-27, 10:53:08
/submitted/dummy	4	20	6	2019-08-04, 14:22:14
/submitted/dummy	4	43	1	2016-06-15, 16:31:23
/submitted/dummy	4	43	1	2016-04-19, 21:24:36
/submitted/dummy	4	26	6	2019-03-01, 07:18:35
/submitted/dummy	4	39	7	2018-08-03, 13:49:24
/submitted/dummy	4	25	1	2009-06-14, 14:04:21
/submitted/dummy	4	40	7	2008-06-11, 07:35:06
/submitted/dummy	4	44	3	2019-09-22, 01:09:11
/submitted/dummy	4	25	1	2021-08-26, 23:36:08
/submitted/dummy	4	25	1	1997-06-05, 13:54:00
/submitted/dummy	4	34	7	2002-11-06, 10:05:30
/submitted/dummy	4	18	5	2013-04-10, 15:10:11
/submitted/dummy	4	43	1	2021-09-24, 03:54:44
/submitted/dummy	4	27	7	1999-04-28, 19:03:46
/submitted/dummy	4	3	7	2002-10-02, 07:38:30
/submitted/dummy	4	26	6	2000-08-19, 07:43:47
/submitted/dummy	4	6	3	2020-05-27, 07:42:41
/submitted/dummy	4	27	1	1994-10-20, 16:22:52
/submitted/dummy	4	20	6	2009-03-25, 17:03:10
/submitted/dummy	4	42	4	1997-06-02, 14:15:38
/submitted/dummy	4	30	7	2003-07-07, 21:33:46
/submitted/dummy	4	40	3	1992-06-22, 08:12:34
/submitted/dummy	4	10	4	2019-06-23, 05:26:09
/submitted/dummy	4	42	4	2008-11-09, 18:20:59
/submitted/dummy	4	19	4	2011-06-27, 15:17:30
/submitted/dummy	4	8	7	2006-11-21, 22:58:03
/submitted/dummy	4	18	5	1999-11-02, 17:21:14
/submitted/dummy	4	2	3	2011-03-19, 01:37:09
/submitted/dummy	4	25	1	2001-10-02, 23:49:57
/submitted/dummy	4	7	7	2006-01-21, 03:16:49
/submitted/dummy	4	24	3	2006-05-25, 08:37:17
/submitted/dummy	4	16	1	2017-08-12, 16:24:20
/submitted/dummy	4	34	7	2006-05-05, 14:23:32
/submitted/dummy	4	42	4	2005-11-07, 05:46:07
/submitted/dummy	4	4	2	2018-11-16, 14:30:23
/submitted/dummy	4	28	7	2012-12-07, 11:43:42
/submitted/dummy	4	12	3	2019-07-29, 09:06:56
/submitted/dummy	4	14	3	2008-11-29, 05:28:42
/submitted/dummy	4	1	4	2022-03-29, 10:59:06
/submitted/dummy	4	8	7	2012-05-29, 14:41:54
/submitted/dummy	5	12	3	2019-10-11, 01:13:43
/submitted/dummy	5	40	3	1992-12-27, 03:53:17
/submitted/dummy	5	55	1	2019-06-25, 04:33:32
/submitted/dummy	5	52	2	2002-04-25, 10:50:52
/submitted/dummy	5	11	5	2001-07-17, 16:21:29
/submitted/dummy	5	11	5	2012-08-01, 11:53:17
/submitted/dummy	5	37	4	2019-10-01, 18:55:32
/submitted/dummy	5	16	1	2016-03-08, 02:21:00
/submitted/dummy	5	51	3	2011-12-30, 09:47:00
/submitted/dummy	5	16	1	1996-02-05, 10:41:59
/submitted/dummy	5	8	4	2003-09-05, 20:20:09
/submitted/dummy	5	14	3	1995-05-29, 10:02:16
/submitted/dummy	5	60	5	2009-03-06, 13:26:27
/submitted/dummy	5	35	1	2016-11-19, 19:03:26
/submitted/dummy	5	32	3	2007-08-03, 13:43:07
/submitted/dummy	5	34	7	2020-01-20, 14:59:20
/submitted/dummy	5	48	7	2018-11-05, 14:38:19
/submitted/dummy	5	35	1	1994-03-25, 06:45:26
/submitted/dummy	5	46	4	2009-02-03, 21:19:26
/submitted/dummy	5	19	4	2000-06-20, 13:54:49
/submitted/dummy	5	19	4	2000-06-09, 21:10:40
/submitted/dummy	5	58	2	1996-05-27, 14:41:10
/submitted/dummy	5	12	3	2000-12-19, 02:25:23
/submitted/dummy	5	3	7	1998-02-08, 23:55:48
/submitted/dummy	5	16	5	2013-02-22, 06:43:29
/submitted/dummy	5	46	4	2005-01-04, 05:02:13
/submitted/dummy	5	1	4	2005-03-27, 09:59:36
/submitted/dummy	5	45	2	2009-02-05, 16:06:21
/submitted/dummy	5	45	2	2016-06-22, 09:47:12
/submitted/dummy	5	41	4	2015-03-08, 11:41:20
/submitted/dummy	5	19	4	2020-12-16, 15:22:57
/submitted/dummy	5	3	6	2009-03-27, 05:16:50
/submitted/dummy	5	7	4	2017-03-13, 02:52:00
/submitted/dummy	5	49	1	2002-01-29, 09:28:17
/submitted/dummy	5	31	5	2005-08-01, 03:48:11
/submitted/dummy	5	46	4	2017-08-09, 19:20:55
/submitted/dummy	5	6	2	2009-03-31, 08:02:10
/submitted/dummy	5	58	2	2000-01-27, 10:32:07
/submitted/dummy	5	5	2	2010-07-21, 15:32:33
/submitted/dummy	5	46	4	2005-12-08, 12:51:56
/submitted/dummy	5	60	5	2016-08-16, 05:24:41
/submitted/dummy	5	52	1	2022-04-02, 05:53:40
/submitted/dummy	5	18	5	2002-06-18, 08:23:02
/submitted/dummy	5	10	4	2002-04-03, 05:22:20
/submitted/dummy	5	4	2	2013-03-21, 20:27:52
/submitted/dummy	5	43	1	2001-12-24, 06:40:55
/submitted/dummy	5	17	6	1997-01-08, 11:17:07
/submitted/dummy	5	6	3	1993-03-12, 10:07:22
/submitted/dummy	5	38	3	2003-10-31, 10:45:13
/submitted/dummy	6	47	4	2005-12-17, 22:14:32
/submitted/dummy	6	13	2	1995-02-25, 12:19:37
/submitted/dummy	6	55	7	2008-10-23, 04:43:46
/submitted/dummy	6	61	5	1994-10-18, 10:25:24
/submitted/dummy	6	15	7	1998-09-30, 17:05:04
/submitted/dummy	6	56	6	2000-07-20, 17:46:49
/submitted/dummy	6	62	1	2022-04-22, 21:28:27
/submitted/dummy	6	62	6	2003-11-05, 05:59:48
/submitted/dummy	6	48	7	2014-08-19, 01:07:21
/submitted/dummy	6	20	6	2020-12-26, 21:02:40
/submitted/dummy	6	44	2	1995-03-05, 09:36:34
/submitted/dummy	6	53	7	2013-12-22, 16:36:56
/submitted/dummy	6	12	3	1996-04-20, 20:51:35
/submitted/dummy	6	55	1	2003-05-13, 15:50:46
/submitted/dummy	7	17	7	1997-10-15, 12:39:20
/submitted/dummy	7	18	5	2000-11-05, 14:56:59
/submitted/dummy	7	62	1	2001-08-10, 01:39:01
/submitted/dummy	7	62	1	2002-04-26, 05:39:35
/submitted/dummy	7	5	2	1992-08-18, 07:09:41
/submitted/dummy	7	14	4	2018-11-01, 18:36:06
/submitted/dummy	7	9	2	1996-12-13, 12:30:50
/submitted/dummy	7	40	7	2019-11-16, 07:53:27
/submitted/dummy	7	48	7	2001-04-23, 11:37:57
/submitted/dummy	7	29	3	1993-04-22, 08:24:46
/submitted/dummy	7	8	4	1994-07-10, 23:51:19
/submitted/dummy	7	14	4	2002-07-20, 14:54:42
/submitted/dummy	7	42	4	1999-09-16, 14:58:46
/submitted/dummy	7	15	7	2014-07-20, 05:54:43
/submitted/dummy	7	49	1	2009-01-31, 14:14:26
/submitted/dummy	7	42	4	2011-01-24, 10:34:23
/submitted/dummy	7	21	6	2007-01-13, 20:14:51
/submitted/dummy	7	42	4	1994-01-26, 14:09:22
/submitted/dummy	7	4	2	2000-05-11, 13:02:52
/submitted/dummy	7	34	7	2003-06-12, 13:20:40
/submitted/dummy	7	24	3	2001-12-29, 22:08:44
/submitted/dummy	7	2	3	1998-04-23, 02:11:10
/submitted/dummy	7	22	2	2008-06-01, 15:28:36
/submitted/dummy	7	8	4	1993-04-13, 20:43:38
/submitted/dummy	7	62	6	1998-04-07, 18:38:32
/submitted/dummy	7	19	4	2020-12-26, 02:19:47
/submitted/dummy	7	2	3	2008-12-30, 10:30:11
/submitted/dummy	7	37	2	2006-11-03, 06:12:18
/submitted/dummy	7	63	3	2015-06-25, 22:08:35
/submitted/dummy	7	25	1	2003-01-16, 02:20:22
/submitted/dummy	7	44	3	2014-10-05, 03:31:23
/submitted/dummy	7	36	7	1995-01-09, 13:06:16
/submitted/dummy	7	51	3	2003-05-15, 19:00:46
/submitted/dummy	7	16	1	2005-02-03, 05:33:48
/submitted/dummy	7	62	6	2011-04-18, 00:50:09
/submitted/dummy	7	6	3	2014-04-26, 22:55:02
/submitted/dummy	7	35	1	2007-04-23, 05:23:46
/submitted/dummy	7	14	4	2003-05-05, 06:45:28
/submitted/dummy	7	1	4	2007-11-13, 17:45:39
/submitted/dummy	7	14	3	2002-05-20, 20:25:02
/submitted/dummy	8	6	3	2008-05-26, 18:43:35
/submitted/dummy	8	57	1	1999-01-13, 09:53:16
/submitted/dummy	8	62	6	2006-12-22, 17:44:02
/submitted/dummy	8	17	7	2018-04-14, 07:33:50
/submitted/dummy	8	38	3	2010-05-17, 13:54:57
/submitted/dummy	8	18	5	1999-07-31, 14:48:45
/submitted/dummy	8	7	7	2005-05-02, 21:13:29
/submitted/dummy	8	31	4	2012-11-18, 05:18:40
/submitted/dummy	8	24	3	2013-02-19, 10:43:01
/submitted/dummy	8	19	4	2019-01-08, 04:08:15
/submitted/dummy	8	49	1	2014-06-23, 22:59:11
/submitted/dummy	8	51	2	1995-10-05, 09:12:27
/submitted/dummy	9	23	3	1995-03-06, 18:12:43
/submitted/dummy	10	4	2	2004-10-28, 19:22:51
/submitted/dummy	10	13	2	2003-06-06, 07:26:02
/submitted/dummy	10	63	3	2004-02-24, 14:38:09
/submitted/dummy	10	54	1	2007-02-21, 17:25:57
/submitted/dummy	10	31	5	2000-05-21, 05:50:21
/submitted/dummy	10	64	7	1997-11-03, 21:38:34
/submitted/dummy	10	16	1	2009-09-18, 01:52:38
/submitted/dummy	10	6	3	2000-11-15, 13:04:26
/submitted/dummy	10	56	4	2001-09-05, 06:33:47
/submitted/dummy	10	60	7	1998-09-16, 15:06:30
/submitted/dummy	10	22	2	2016-04-21, 02:14:51
/submitted/dummy	10	37	4	2005-09-01, 15:29:23
/submitted/dummy	10	62	1	1998-02-11, 05:21:24
/submitted/dummy	10	34	7	2020-10-12, 19:10:13
/submitted/dummy	10	6	3	2010-04-11, 03:12:57
/submitted/dummy	10	45	2	2009-01-02, 00:54:19
/submitted/dummy	10	36	1	2017-06-03, 02:13:19
/submitted/dummy	10	7	7	2020-07-15, 03:35:51
/submitted/dummy	10	63	3	2006-08-08, 02:20:00
/submitted/dummy	10	28	7	2001-06-02, 16:16:53
/submitted/dummy	10	32	4	2011-11-17, 01:27:45
/submitted/dummy	10	10	6	2019-10-31, 15:04:29
/submitted/dummy	10	64	3	1994-01-11, 10:12:19
/submitted/dummy	10	20	6	2007-11-20, 17:47:43
/submitted/dummy	10	35	1	2005-10-09, 14:41:45
/submitted/dummy	10	19	4	2018-01-29, 03:28:08
/submitted/dummy	10	52	2	2001-05-23, 13:48:53
/submitted/dummy	10	20	6	2008-02-02, 02:47:10
/submitted/dummy	10	15	7	1999-07-11, 07:53:11
/submitted/dummy	10	11	3	2003-06-28, 06:51:10
/submitted/dummy	10	57	1	2000-12-21, 14:56:43
/submitted/dummy	10	23	3	2005-06-02, 04:52:23
/submitted/dummy	10	16	5	2022-02-11, 23:40:48
/submitted/dummy	10	44	2	1998-10-22, 22:46:13
/submitted/dummy	10	15	7	2009-02-16, 06:41:30
/submitted/dummy	10	11	5	2016-11-01, 14:18:13
/submitted/dummy	10	5	2	2010-04-02, 17:14:51
/submitted/dummy	10	59	2	1992-06-11, 01:09:25
/submitted/dummy	10	31	5	2002-05-19, 19:00:09
/submitted/dummy	10	3	7	2002-02-26, 10:13:25
/submitted/dummy	10	35	1	2004-10-01, 09:20:03
/submitted/dummy	10	10	5	2015-01-05, 06:08:42
/submitted/dummy	10	58	2	2006-05-03, 21:34:46
/submitted/dummy	10	30	7	2013-04-10, 05:44:51
/submitted/dummy	10	7	6	2004-11-04, 18:28:18
/submitted/dummy	10	41	5	2014-05-10, 14:25:42
/submitted/dummy	10	1	4	2003-04-22, 07:20:20
/submitted/dummy	10	26	6	2008-11-29, 19:42:15
/submitted/dummy	10	33	1	2009-10-22, 20:16:11
/submitted/dummy	10	38	3	2016-08-08, 09:27:44
\.
COPY task_groups (problem_id, name, requires_all_ok) FROM STDIN;
1	Group 1	False
2	Group 1	True
2	Group 2	True
2	Group 3	False
2	Group 4	False
2	Group 5	False
3	Group 1	False
3	Group 2	False
3	Group 3	False
4	Group 1	False
4	Group 2	False
4	Group 3	True
4	Group 4	False
4	Group 5	True
5	Group 1	True
5	Group 2	False
5	Group 3	False
5	Group 4	True
5	Group 5	True
6	Group 1	True
6	Group 2	True
6	Group 3	False
6	Group 4	True
6	Group 5	True
7	Group 1	False
7	Group 2	False
7	Group 3	True
8	Group 1	False
8	Group 2	False
8	Group 3	True
8	Group 4	False
9	Group 1	True
9	Group 2	False
9	Group 3	True
10	Group 1	False
10	Group 2	False
10	Group 3	False
10	Group 4	False
11	Group 1	False
11	Group 2	False
12	Group 1	False
12	Group 2	False
13	Group 1	False
13	Group 2	True
13	Group 3	True
13	Group 4	True
14	Group 1	True
14	Group 2	True
14	Group 3	True
14	Group 4	True
14	Group 5	False
15	Group 1	True
16	Group 1	True
16	Group 2	True
16	Group 3	False
16	Group 4	True
17	Group 1	True
17	Group 2	False
17	Group 3	False
18	Group 1	False
18	Group 2	False
18	Group 3	False
18	Group 4	True
19	Group 1	True
19	Group 2	False
20	Group 1	True
20	Group 2	False
21	Group 1	True
21	Group 2	True
22	Group 1	False
22	Group 2	True
23	Group 1	True
23	Group 2	False
23	Group 3	False
23	Group 4	True
24	Group 1	True
24	Group 2	True
24	Group 3	False
25	Group 1	True
25	Group 2	False
26	Group 1	False
27	Group 1	True
27	Group 2	False
27	Group 3	False
28	Group 1	False
28	Group 2	True
28	Group 3	True
28	Group 4	True
28	Group 5	False
29	Group 1	False
29	Group 2	False
29	Group 3	False
30	Group 1	True
30	Group 2	False
30	Group 3	True
30	Group 4	True
30	Group 5	True
31	Group 1	True
31	Group 2	False
31	Group 3	False
32	Group 1	True
32	Group 2	True
33	Group 1	False
33	Group 2	False
33	Group 3	True
33	Group 4	True
34	Group 1	False
35	Group 1	True
36	Group 1	True
36	Group 2	False
36	Group 3	False
36	Group 4	True
37	Group 1	True
37	Group 2	True
37	Group 3	False
37	Group 4	False
37	Group 5	True
38	Group 1	True
38	Group 2	True
38	Group 3	True
38	Group 4	True
38	Group 5	True
39	Group 1	True
39	Group 2	True
39	Group 3	False
39	Group 4	False
40	Group 1	True
41	Group 1	False
41	Group 2	False
41	Group 3	True
41	Group 4	True
42	Group 1	True
43	Group 1	True
44	Group 1	True
45	Group 1	False
45	Group 2	False
45	Group 3	True
46	Group 1	False
47	Group 1	True
47	Group 2	False
47	Group 3	False
48	Group 1	True
49	Group 1	False
50	Group 1	False
51	Group 1	True
51	Group 2	True
52	Group 1	True
52	Group 2	False
52	Group 3	True
52	Group 4	True
53	Group 1	True
54	Group 1	True
54	Group 2	True
55	Group 1	False
56	Group 1	True
56	Group 2	True
57	Group 1	True
57	Group 2	True
57	Group 3	False
57	Group 4	False
58	Group 1	True
59	Group 1	True
59	Group 2	True
59	Group 3	False
60	Group 1	True
60	Group 2	True
61	Group 1	False
62	Group 1	True
63	Group 1	False
63	Group 2	True
64	Group 1	False
64	Group 2	False
64	Group 3	False
64	Group 4	True
\.
COPY tasks (task_group, name, test_uri, points, time_limit, memory_limit, show_output) FROM STDIN;
1	Test 0	tasks/category/wp-content	2.3	1.6	46137344	False
1	Test 1	tasks/app/app	1.7	1.1	37748736	True
1	Test 2	tasks/explore/search/search	1.8	2.0	18432	False
1	Test 3	tasks/wp-content/category	1.5	0.5	72351744	True
1	Test 4	tasks/tags/posts/categories	1.4	0.6	6144	True
2	Test 0	tasks/search/app	2.6	1.7	55574528	True
2	Test 1	tasks/search/list/list	2.1	3.4	71303168	False
2	Test 2	tasks/list	1.6	1.2	74448896	True
2	Test 3	tasks/wp-content/search/tags	1.5	3.1	52224	True
2	Test 4	tasks/main/tags	1.5	1.1	19922944	True
2	Test 5	tasks/search	1.1	3.1	86016	False
2	Test 6	tasks/blog	2.1	1.1	70656	False
2	Test 7	tasks/main/wp-content/categories	2.3	2.2	11264	False
2	Test 8	tasks/explore/tags/app	1.7	1.7	44032	False
2	Test 9	tasks/blog/list	2.5	1.9	89128960	True
3	Test 0	tasks/wp-content/list/blog	2.3	1.7	40894464	True
3	Test 1	tasks/wp-content	1.4	1.7	11534336	False
3	Test 2	tasks/tag	1.6	3.1	61440	False
3	Test 3	tasks/blog/tag	1.4	2.6	91136	False
4	Test 0	tasks/blog/category	1.0	1.2	30720	False
4	Test 1	tasks/explore/posts	1.3	2.5	82944	False
4	Test 2	tasks/list/tag/explore	2.1	2.7	61865984	True
4	Test 3	tasks/list/search/main	2.4	3.4	81920	False
4	Test 4	tasks/list	1.6	2.9	7168	False
4	Test 5	tasks/posts	1.9	1.2	91226112	False
4	Test 6	tasks/tag/categories	1.2	1.7	33554432	True
4	Test 7	tasks/list/tags	1.0	1.6	75776	True
5	Test 0	tasks/tag/blog/list	1.6	3.4	55574528	True
5	Test 1	tasks/tag	1.4	2.8	93323264	True
5	Test 2	tasks/tags/category	1.6	2.7	50176	False
5	Test 3	tasks/tags/tags	1.6	0.8	71680	False
5	Test 4	tasks/tags/wp-content/tag	2.9	1.9	57671680	True
5	Test 5	tasks/posts	1.5	1.0	83968	True
6	Test 0	tasks/wp-content/tag	1.1	1.0	73400320	True
6	Test 1	tasks/search/posts/category	2.8	2.0	64512	True
6	Test 2	tasks/explore/app/blog	2.8	0.7	9216	True
6	Test 3	tasks/list/explore/posts	1.7	1.5	50176	False
6	Test 4	tasks/app/app/tag	1.1	1.3	51200	True
6	Test 5	tasks/list/blog/main	2.0	1.8	40894464	True
6	Test 6	tasks/app/categories	1.3	2.8	62914560	True
6	Test 7	tasks/category	2.9	1.1	52428800	False
6	Test 8	tasks/wp-content/category/tags	2.6	0.5	79691776	True
7	Test 0	tasks/search/categories	2.6	1.1	17408	False
7	Test 1	tasks/category/category	1.1	2.8	41984	False
7	Test 2	tasks/posts/tag	1.1	1.0	79691776	True
7	Test 3	tasks/category/wp-content/explore	2.8	1.2	30408704	False
7	Test 4	tasks/posts/explore/explore	1.7	2.5	74752	False
7	Test 5	tasks/search/tag	2.5	1.8	97517568	False
8	Test 0	tasks/wp-content	1.9	1.3	77824	True
8	Test 1	tasks/wp-content/tag/main	1.1	0.8	15360	True
8	Test 2	tasks/search/tags	2.2	1.7	31457280	False
8	Test 3	tasks/tag/posts	2.2	1.1	20480	True
8	Test 4	tasks/explore/search/posts	1.5	2.1	61865984	True
8	Test 5	tasks/blog	1.3	1.7	20480	False
9	Test 0	tasks/main/tags	2.9	1.9	6291456	False
9	Test 1	tasks/main/tags/search	1.3	2.9	84934656	False
9	Test 2	tasks/list	1.7	1.0	81788928	True
9	Test 3	tasks/wp-content/category/main	2.2	2.3	66060288	True
9	Test 4	tasks/posts/wp-content/posts	2.9	0.7	66060288	True
9	Test 5	tasks/wp-content/posts	2.4	1.3	97517568	True
10	Test 0	tasks/tags/search	2.8	2.2	31457280	True
10	Test 1	tasks/blog/app	1.2	3.2	34816	False
10	Test 2	tasks/categories	1.2	0.5	6144	True
10	Test 3	tasks/search/blog	1.5	2.6	73728	False
11	Test 0	tasks/app/posts/explore	2.3	2.4	40960	True
11	Test 1	tasks/app/list	1.9	1.0	53477376	False
11	Test 2	tasks/main/main	1.9	3.4	37748736	True
11	Test 3	tasks/app/categories/blog	1.3	0.8	3145728	False
11	Test 4	tasks/tags/search	2.2	3.0	79691776	False
11	Test 5	tasks/category/app/categories	2.5	2.7	1048576	False
11	Test 6	tasks/blog/list	2.8	0.9	43008	True
11	Test 7	tasks/explore	2.4	3.1	26624	False
12	Test 0	tasks/wp-content	2.0	2.1	16384	True
12	Test 1	tasks/tag/explore	1.5	3.1	20971520	True
12	Test 2	tasks/tag/posts/categories	1.4	1.2	62914560	False
12	Test 3	tasks/posts/blog/main	2.9	2.8	62464	True
12	Test 4	tasks/list	2.3	1.5	67108864	True
12	Test 5	tasks/tags/tag/list	1.3	1.9	19922944	True
12	Test 6	tasks/tag/posts	1.4	2.0	53477376	True
12	Test 7	tasks/categories	1.3	3.1	16384	True
12	Test 8	tasks/posts	1.7	2.7	7168	False
12	Test 9	tasks/tags	1.9	1.0	5242880	True
13	Test 0	tasks/category	2.0	3.2	39845888	True
14	Test 0	tasks/posts/app/list	2.6	0.7	31744	False
14	Test 1	tasks/app/tag	2.3	2.7	58720256	False
14	Test 2	tasks/blog/tag	2.3	3.2	6291456	False
14	Test 3	tasks/categories/category/list	1.1	1.1	53477376	True
14	Test 4	tasks/tags/search	1.2	1.0	66560	True
14	Test 5	tasks/wp-content/main	1.4	1.5	75497472	False
14	Test 6	tasks/tag/explore/list	1.5	2.7	12582912	False
14	Test 7	tasks/blog/wp-content/wp-content	1.7	0.8	68157440	False
14	Test 8	tasks/blog/posts	2.4	1.0	31457280	True
14	Test 9	tasks/explore	1.0	2.7	88064	True
15	Test 0	tasks/app/app/posts	1.8	1.1	29696	False
15	Test 1	tasks/tag	2.7	2.6	75776	False
15	Test 2	tasks/tag	1.7	2.9	45088768	False
15	Test 3	tasks/explore	1.4	1.8	22528	False
15	Test 4	tasks/tag	1.4	2.0	85983232	False
16	Test 0	tasks/main/categories/tag	1.2	1.7	34603008	True
16	Test 1	tasks/app/categories/wp-content	1.7	3.1	66560	True
17	Test 0	tasks/main/search/categories	1.2	3.1	3072	False
17	Test 1	tasks/tag/wp-content	1.5	2.5	15728640	True
18	Test 0	tasks/main/category	2.3	1.9	79872	True
18	Test 1	tasks/category/category	2.6	3.1	17825792	True
18	Test 2	tasks/main	1.8	0.9	85983232	False
18	Test 3	tasks/app	1.6	2.1	58720256	False
18	Test 4	tasks/posts/tag	2.2	1.7	68157440	True
18	Test 5	tasks/tag	1.3	3.3	7340032	False
18	Test 6	tasks/main/explore	2.3	1.3	24576	False
18	Test 7	tasks/blog/wp-content/blog	2.0	0.8	102400	False
18	Test 8	tasks/tag	2.6	2.5	59392	True
18	Test 9	tasks/posts/posts	1.9	3.4	38912	True
19	Test 0	tasks/app/posts	1.1	3.4	95232	False
20	Test 0	tasks/tags	1.6	0.6	89128960	True
20	Test 1	tasks/posts/list	1.7	3.0	72704	False
20	Test 2	tasks/main/tags	1.9	1.5	47185920	False
20	Test 3	tasks/list/tag/list	1.2	2.3	2097152	False
20	Test 4	tasks/explore	2.4	2.6	89088	True
20	Test 5	tasks/categories	2.6	2.7	97517568	False
20	Test 6	tasks/posts/search	2.7	3.2	60817408	False
20	Test 7	tasks/posts	2.8	3.3	80740352	True
21	Test 0	tasks/tag/explore	1.4	1.5	44040192	True
21	Test 1	tasks/app	2.3	1.5	22020096	False
21	Test 2	tasks/list/explore	1.1	1.2	100663296	False
21	Test 3	tasks/category/list/main	1.9	3.4	53248	False
21	Test 4	tasks/main/search/tags	2.9	2.0	17825792	False
22	Test 0	tasks/tags/main/posts	1.6	1.6	21504	True
22	Test 1	tasks/tag/list	2.8	2.2	9437184	True
22	Test 2	tasks/explore/list	1.9	2.2	54272	True
23	Test 0	tasks/category/category/tags	2.0	2.8	32768	True
24	Test 0	tasks/blog/list/search	1.9	2.0	75497472	True
24	Test 1	tasks/category/tag/tags	1.6	1.8	44040192	True
24	Test 2	tasks/app/explore	2.8	3.2	73400320	False
25	Test 0	tasks/list/app	1.1	0.7	44032	False
25	Test 1	tasks/posts/posts	2.9	1.8	39936	True
25	Test 2	tasks/explore	2.2	2.4	65011712	False
26	Test 0	tasks/explore/wp-content/categories	1.6	1.9	65536	True
26	Test 1	tasks/tags	1.9	2.9	34603008	True
26	Test 2	tasks/wp-content	2.9	1.7	13312	False
26	Test 3	tasks/app	1.1	1.7	4096	False
26	Test 4	tasks/categories/wp-content/posts	1.4	2.3	36864	False
26	Test 5	tasks/list/app/main	1.8	2.8	53477376	True
26	Test 6	tasks/explore/tags/wp-content	1.5	2.3	32505856	True
26	Test 7	tasks/tags	2.7	0.7	29360128	False
26	Test 8	tasks/blog/tags	2.2	3.4	45088768	False
26	Test 9	tasks/categories/search/tag	2.9	1.0	61865984	True
27	Test 0	tasks/posts	2.6	2.8	21504	True
27	Test 1	tasks/search/wp-content/tag	1.8	2.0	8388608	False
27	Test 2	tasks/wp-content	2.8	3.4	51380224	False
28	Test 0	tasks/wp-content	1.2	2.0	35651584	False
28	Test 1	tasks/tags/tag	2.8	1.3	10485760	True
28	Test 2	tasks/main/wp-content/categories	2.1	2.8	88080384	False
28	Test 3	tasks/wp-content/posts	1.6	2.9	57671680	True
28	Test 4	tasks/categories	2.1	2.0	62464	False
28	Test 5	tasks/search/category	1.4	2.6	9216	False
28	Test 6	tasks/category	1.6	1.4	53477376	False
28	Test 7	tasks/app/tags	1.9	0.9	35651584	False
28	Test 8	tasks/blog/posts/app	2.2	1.4	88080384	False
28	Test 9	tasks/main/main	1.0	1.9	64512	True
29	Test 0	tasks/tags	1.6	2.9	29360128	False
29	Test 1	tasks/wp-content/explore/app	1.6	2.1	7168	False
29	Test 2	tasks/tags	1.6	1.6	84934656	False
29	Test 3	tasks/blog/search/tags	2.5	1.8	17408	True
29	Test 4	tasks/categories/blog	2.3	1.2	82944	True
30	Test 0	tasks/main/tag	2.2	2.4	75776	False
30	Test 1	tasks/app/categories/tags	1.3	2.8	82837504	False
30	Test 2	tasks/tag/search/wp-content	1.2	2.0	24117248	True
30	Test 3	tasks/app	1.8	1.7	79872	False
30	Test 4	tasks/tag	1.2	2.7	96468992	True
30	Test 5	tasks/wp-content/category	2.5	1.2	26624	True
31	Test 0	tasks/tags/posts/list	1.2	1.4	15360	True
31	Test 1	tasks/tags/list	2.6	1.3	42991616	False
31	Test 2	tasks/explore/categories	2.3	2.8	96468992	False
31	Test 3	tasks/posts/wp-content/search	1.9	2.1	25600	True
31	Test 4	tasks/blog	1.7	1.8	43008	True
31	Test 5	tasks/explore/app	2.4	1.3	40960	False
31	Test 6	tasks/category	1.2	0.5	100352	False
32	Test 0	tasks/wp-content	1.0	1.3	49152	True
32	Test 1	tasks/blog/wp-content	2.7	2.0	32505856	False
32	Test 2	tasks/tags/main/posts	2.3	2.0	10240	False
32	Test 3	tasks/list	2.9	3.0	10485760	False
32	Test 4	tasks/search/categories/explore	1.7	1.1	90112	True
32	Test 5	tasks/tag/main/list	2.8	1.3	93184	False
32	Test 6	tasks/tags/blog/list	1.6	2.0	76800	True
32	Test 7	tasks/tags/blog	2.4	0.6	19922944	True
33	Test 0	tasks/tag	2.8	2.7	59392	True
33	Test 1	tasks/main	2.8	2.8	58368	False
33	Test 2	tasks/category	1.8	2.3	46080	True
33	Test 3	tasks/categories/categories	2.6	1.1	33792	False
33	Test 4	tasks/category	2.4	2.3	82944	False
33	Test 5	tasks/main	1.0	2.6	16384	False
33	Test 6	tasks/tag/tags	2.9	1.6	21504	True
33	Test 7	tasks/app/categories/list	1.8	1.8	92160	True
33	Test 8	tasks/category	2.6	0.5	6291456	False
33	Test 9	tasks/categories/list	2.1	2.3	59392	True
34	Test 0	tasks/posts/explore	2.6	2.8	87031808	False
34	Test 1	tasks/tag/posts	1.5	0.9	44032	True
34	Test 2	tasks/explore	2.9	2.5	56320	False
34	Test 3	tasks/category/tags	2.8	2.6	27648	False
34	Test 4	tasks/category	2.0	2.8	33792	True
34	Test 5	tasks/tags	1.7	2.4	31744	False
34	Test 6	tasks/main	2.4	3.2	17408	False
35	Test 0	tasks/search/tags/wp-content	2.1	2.1	77824	True
36	Test 0	tasks/category	2.6	2.0	88064	False
36	Test 1	tasks/category	1.8	2.7	69206016	True
36	Test 2	tasks/category/list/tag	1.7	1.4	55574528	True
36	Test 3	tasks/tag/main/category	2.0	1.6	93323264	True
36	Test 4	tasks/categories/app/explore	2.2	1.8	72351744	False
36	Test 5	tasks/posts/posts	1.4	0.8	30408704	True
36	Test 6	tasks/search/tag	2.8	3.3	54272	False
36	Test 7	tasks/blog/main/app	2.3	0.8	35840	False
37	Test 0	tasks/tag/blog	1.2	1.1	51380224	True
37	Test 1	tasks/blog	1.7	0.5	64512	False
37	Test 2	tasks/categories/tag	2.0	3.3	1024	False
38	Test 0	tasks/wp-content/categories	2.3	2.1	24117248	False
38	Test 1	tasks/search	2.8	2.2	81788928	True
39	Test 0	tasks/category/app/blog	1.5	2.3	7340032	False
39	Test 1	tasks/posts	2.7	2.0	8192	True
39	Test 2	tasks/app	2.9	2.9	84934656	True
39	Test 3	tasks/tag/categories/blog	2.8	2.3	11264	False
40	Test 0	tasks/list/list/wp-content	2.7	0.9	24576	False
40	Test 1	tasks/main/wp-content/wp-content	2.4	3.0	28672	False
40	Test 2	tasks/tag/categories	1.8	1.2	33554432	False
40	Test 3	tasks/category/main	2.7	2.3	35651584	False
40	Test 4	tasks/explore/app/posts	1.8	1.0	46137344	True
40	Test 5	tasks/posts/tags/main	2.3	2.9	51200	True
40	Test 6	tasks/app/explore/main	2.5	2.4	96256	False
40	Test 7	tasks/search/tags/app	1.2	2.6	44040192	False
41	Test 0	tasks/list/category/blog	1.9	1.1	7340032	False
41	Test 1	tasks/tag/blog/tag	2.9	0.9	13631488	False
41	Test 2	tasks/blog/category	1.9	3.1	101376	True
41	Test 3	tasks/posts/blog	2.9	3.0	69632	True
41	Test 4	tasks/app/blog	1.3	1.7	46080	True
41	Test 5	tasks/category	2.5	2.4	60416	False
42	Test 0	tasks/tag/tags	2.1	1.4	15728640	False
42	Test 1	tasks/blog/search	1.0	2.3	104857600	False
42	Test 2	tasks/wp-content/search	1.5	1.0	49283072	False
42	Test 3	tasks/categories/main/main	2.2	2.9	2048	False
42	Test 4	tasks/search/main/search	1.2	1.9	48128	False
42	Test 5	tasks/category/app	2.9	2.9	83886080	True
42	Test 6	tasks/tags	2.1	3.4	21504	False
42	Test 7	tasks/categories	2.5	1.1	19922944	False
42	Test 8	tasks/category/app	1.6	1.0	100352	True
42	Test 9	tasks/tag/main/category	2.8	3.1	69206016	True
43	Test 0	tasks/category/blog	1.1	3.4	78643200	False
43	Test 1	tasks/posts	1.4	3.1	97517568	False
43	Test 2	tasks/search/posts	2.9	2.2	89128960	True
43	Test 3	tasks/blog	2.3	2.4	71303168	True
44	Test 0	tasks/search	2.0	1.8	60416	True
44	Test 1	tasks/main/app/search	1.9	1.3	38912	True
44	Test 2	tasks/category/explore	2.2	1.5	64512	False
44	Test 3	tasks/tags/blog/app	2.4	1.4	38912	False
44	Test 4	tasks/main/search	1.4	0.6	54525952	True
45	Test 0	tasks/wp-content	2.1	2.6	29360128	False
45	Test 1	tasks/category/categories/tag	1.4	0.7	94371840	True
45	Test 2	tasks/blog/explore/list	2.0	2.5	19456	True
46	Test 0	tasks/app/explore	1.7	1.5	48234496	True
46	Test 1	tasks/categories	1.8	3.2	65011712	False
47	Test 0	tasks/search/tags	1.9	1.2	71303168	True
47	Test 1	tasks/categories	2.0	0.7	73728	False
47	Test 2	tasks/main	2.5	0.5	57671680	True
47	Test 3	tasks/tags/categories/posts	1.9	3.3	16384	True
48	Test 0	tasks/tags/app	2.9	1.5	27648	False
48	Test 1	tasks/main/main/tag	1.1	1.0	22020096	True
48	Test 2	tasks/list	1.3	2.4	97517568	False
48	Test 3	tasks/posts	1.5	1.9	47185920	True
48	Test 4	tasks/posts/tag	1.8	2.5	71303168	False
48	Test 5	tasks/wp-content	1.6	0.8	56623104	False
48	Test 6	tasks/categories/list	2.8	2.2	8192	False
48	Test 7	tasks/search/tags	2.4	0.6	80896	False
48	Test 8	tasks/search/search	1.1	1.4	22528	True
49	Test 0	tasks/list/list/list	1.1	0.6	65011712	True
49	Test 1	tasks/app/list	1.4	2.0	71303168	True
50	Test 0	tasks/app/search	2.0	2.7	16777216	False
50	Test 1	tasks/category	2.2	1.0	28672	False
50	Test 2	tasks/tag	2.5	0.9	25165824	False
51	Test 0	tasks/posts/posts/main	1.6	2.5	56623104	False
51	Test 1	tasks/wp-content	1.5	1.4	97517568	True
52	Test 0	tasks/main/blog	2.4	1.3	43008	False
52	Test 1	tasks/blog	1.6	1.9	10240	False
52	Test 2	tasks/tag	2.8	2.7	92160	True
52	Test 3	tasks/search/category	2.7	2.8	50176	False
52	Test 4	tasks/posts/tag	1.7	3.3	9216	False
52	Test 5	tasks/wp-content/tags	1.1	1.7	1048576	True
52	Test 6	tasks/tag/list	1.0	2.0	55296	True
53	Test 0	tasks/blog/main	2.4	2.7	63963136	False
53	Test 1	tasks/main/main/category	1.9	2.6	32505856	False
53	Test 2	tasks/posts/blog/list	2.6	0.8	10240	True
53	Test 3	tasks/blog/categories/tags	1.0	1.3	30408704	True
53	Test 4	tasks/category	2.6	3.4	67108864	True
53	Test 5	tasks/explore/category	1.7	2.6	62464	False
53	Test 6	tasks/explore	2.5	3.4	2048	False
54	Test 0	tasks/category/tag	2.2	3.3	87031808	False
55	Test 0	tasks/main/posts/app	2.9	1.6	92274688	True
55	Test 1	tasks/categories	1.8	2.5	95420416	True
56	Test 0	tasks/posts	2.4	2.5	25165824	False
56	Test 1	tasks/explore/main/main	2.7	0.5	51200	True
57	Test 0	tasks/categories/app	2.8	1.6	84992	False
57	Test 1	tasks/main/posts	1.7	2.6	71303168	False
57	Test 2	tasks/search/posts/blog	2.3	1.2	28311552	True
57	Test 3	tasks/main	1.4	0.8	19922944	False
57	Test 4	tasks/category	2.3	0.5	14336	True
57	Test 5	tasks/explore/explore	2.8	2.9	39936	True
58	Test 0	tasks/categories/posts	1.1	2.0	55574528	True
58	Test 1	tasks/list	2.5	2.4	44032	False
58	Test 2	tasks/blog/explore/blog	2.5	3.3	47104	False
58	Test 3	tasks/tag	2.6	1.5	36864	False
58	Test 4	tasks/tags	2.8	0.5	94371840	True
58	Test 5	tasks/tags/list	2.9	1.9	93323264	True
58	Test 6	tasks/posts	2.5	3.4	63963136	False
59	Test 0	tasks/categories/main	1.9	2.9	79872	True
59	Test 1	tasks/tag/explore	2.4	1.5	95232	False
59	Test 2	tasks/tags	1.0	1.1	48128	False
59	Test 3	tasks/main	1.0	0.7	65011712	False
59	Test 4	tasks/tags/explore	1.4	2.7	54272	True
59	Test 5	tasks/category	1.0	1.6	11534336	False
59	Test 6	tasks/explore/explore	2.6	2.4	98304	False
60	Test 0	tasks/wp-content/main	1.5	0.7	97280	True
60	Test 1	tasks/blog/categories/search	1.7	2.9	54272	True
60	Test 2	tasks/tag	1.9	1.8	49152	True
61	Test 0	tasks/app/main/blog	2.4	2.8	29696	False
61	Test 1	tasks/search	1.6	1.5	43008	False
62	Test 0	tasks/blog/category/search	2.3	2.0	62464	False
62	Test 1	tasks/explore/blog	1.4	0.5	34816	False
62	Test 2	tasks/categories/list/tags	1.8	2.0	9437184	True
62	Test 3	tasks/wp-content	1.5	2.0	39936	False
62	Test 4	tasks/explore/main/app	2.9	0.7	83886080	False
62	Test 5	tasks/category	1.0	2.6	94371840	True
62	Test 6	tasks/explore/posts/main	2.8	0.6	100663296	False
62	Test 7	tasks/categories/main	2.4	2.9	17825792	True
62	Test 8	tasks/main/search/category	1.0	1.8	90177536	False
62	Test 9	tasks/list/category/search	1.1	1.2	21504	False
63	Test 0	tasks/wp-content/tag	2.4	2.0	61865984	False
63	Test 1	tasks/posts/main/categories	2.4	2.2	62914560	True
63	Test 2	tasks/search/tags/category	1.6	1.1	78643200	False
64	Test 0	tasks/search/posts	1.5	1.9	33554432	True
64	Test 1	tasks/categories/category/blog	2.9	1.1	59768832	False
64	Test 2	tasks/tags/search	1.9	3.2	100352	True
64	Test 3	tasks/tags/tag	1.2	0.5	4194304	False
65	Test 0	tasks/blog	1.6	1.3	50176	True
65	Test 1	tasks/explore/main	1.9	0.7	95420416	False
66	Test 0	tasks/blog/search/explore	1.9	2.7	17408	False
66	Test 1	tasks/search	2.9	0.8	90177536	True
66	Test 2	tasks/category/categories/tag	2.7	1.1	32768	False
66	Test 3	tasks/category	2.7	1.0	89088	True
66	Test 4	tasks/main/blog/tags	2.7	2.3	20971520	False
66	Test 5	tasks/category	1.4	0.7	15728640	False
67	Test 0	tasks/posts	1.8	1.6	80740352	False
67	Test 1	tasks/search/category/main	2.6	2.8	28311552	True
67	Test 2	tasks/wp-content/categories	1.7	1.8	5120	True
67	Test 3	tasks/list/categories	2.1	3.1	76546048	True
68	Test 0	tasks/category	1.1	1.8	40960	True
68	Test 1	tasks/explore	2.9	2.5	55574528	False
69	Test 0	tasks/tag	2.0	2.5	102400	False
69	Test 1	tasks/main/tags	1.6	2.3	49152	False
69	Test 2	tasks/posts/tag/search	1.1	3.0	31457280	False
70	Test 0	tasks/list/wp-content/category	2.6	1.3	37748736	False
70	Test 1	tasks/posts	2.5	1.2	36864	True
71	Test 0	tasks/app	1.4	1.3	23068672	True
71	Test 1	tasks/search/app	2.4	2.0	75497472	True
71	Test 2	tasks/tag/tags/list	2.0	2.1	84934656	False
71	Test 3	tasks/main	2.8	3.3	83886080	True
71	Test 4	tasks/categories	2.3	3.4	18874368	False
71	Test 5	tasks/list/list	2.7	2.9	1024	False
72	Test 0	tasks/blog/app	2.5	1.2	46137344	False
72	Test 1	tasks/wp-content/explore/app	1.0	0.7	27262976	False
72	Test 2	tasks/wp-content	2.0	1.3	102400	False
72	Test 3	tasks/wp-content/tag	1.3	2.4	51380224	True
73	Test 0	tasks/blog/posts/tags	1.5	1.0	90177536	True
74	Test 0	tasks/blog/category/posts	1.8	2.7	28672	True
74	Test 1	tasks/wp-content	1.6	1.5	23552	False
75	Test 0	tasks/blog/list	2.3	0.8	102400	False
75	Test 1	tasks/main/tag	1.5	2.8	26624	True
75	Test 2	tasks/posts/explore	2.4	1.9	18874368	True
75	Test 3	tasks/blog/posts	2.7	2.9	101711872	False
75	Test 4	tasks/tag/posts/categories	2.4	2.7	15728640	False
75	Test 5	tasks/blog/wp-content/category	2.4	2.7	63488	False
75	Test 6	tasks/search/app/app	1.2	1.7	99614720	True
75	Test 7	tasks/app	2.9	1.4	54525952	False
75	Test 8	tasks/category/list	2.6	1.3	62464	False
76	Test 0	tasks/app/explore	1.5	2.5	16384	False
76	Test 1	tasks/wp-content	1.0	1.8	9216	True
76	Test 2	tasks/search/categories/tags	1.6	3.2	98304	False
76	Test 3	tasks/app	1.2	2.6	16384	False
76	Test 4	tasks/tag	2.3	1.2	46080	False
76	Test 5	tasks/explore/app	2.8	3.1	24117248	True
76	Test 6	tasks/explore/categories/list	2.5	1.0	39845888	True
76	Test 7	tasks/explore/tag	2.8	2.9	43008	True
76	Test 8	tasks/category/explore	1.6	1.7	70254592	True
76	Test 9	tasks/main	1.6	2.5	74752	False
77	Test 0	tasks/posts	1.2	1.3	12582912	True
77	Test 1	tasks/tag/search/main	2.9	3.3	58368	False
77	Test 2	tasks/search	2.2	1.7	20971520	False
77	Test 3	tasks/list/blog	1.0	2.5	26624	False
77	Test 4	tasks/app/categories/tag	1.6	1.5	54525952	True
77	Test 5	tasks/categories	2.8	0.8	9216	False
77	Test 6	tasks/search	1.0	0.8	91226112	False
78	Test 0	tasks/posts/posts	2.4	1.1	32505856	False
78	Test 1	tasks/category	1.7	2.0	26214400	True
78	Test 2	tasks/tag	1.7	3.2	2097152	False
78	Test 3	tasks/list/categories/category	2.7	2.3	104857600	True
79	Test 0	tasks/explore/blog/posts	2.7	3.0	3072	True
79	Test 1	tasks/main/search/main	1.5	2.4	40894464	False
80	Test 0	tasks/tags/app/list	2.9	1.8	80896	False
80	Test 1	tasks/posts/blog/category	2.7	0.6	5242880	False
80	Test 2	tasks/posts/app/explore	2.8	3.4	19456	True
80	Test 3	tasks/list/search/blog	2.1	1.6	67584	True
80	Test 4	tasks/posts/search	1.7	2.1	75776	False
81	Test 0	tasks/categories/explore	2.4	1.7	15360	True
82	Test 0	tasks/categories/categories/blog	1.7	1.3	92274688	False
82	Test 1	tasks/explore/category	2.0	0.9	5242880	True
82	Test 2	tasks/main/explore	1.4	3.4	75776	True
82	Test 3	tasks/app/app	1.4	1.5	54525952	False
82	Test 4	tasks/posts/category/tags	1.2	3.4	56320	False
82	Test 5	tasks/explore	1.2	3.3	8388608	True
83	Test 0	tasks/blog	1.1	2.7	25600	False
83	Test 1	tasks/blog/app	2.3	3.4	73400320	False
83	Test 2	tasks/wp-content/category	1.6	2.6	28311552	True
83	Test 3	tasks/list/explore/category	1.7	3.0	51200	True
83	Test 4	tasks/category	2.8	2.2	20480	True
83	Test 5	tasks/main	1.1	3.0	30720	False
83	Test 6	tasks/blog	2.3	2.4	36864	True
84	Test 0	tasks/wp-content	2.5	0.8	49283072	True
84	Test 1	tasks/tags/search/category	2.9	0.6	35651584	True
84	Test 2	tasks/tags/list/category	2.9	1.0	40894464	False
85	Test 0	tasks/category	1.3	2.0	74448896	False
85	Test 1	tasks/posts/search	1.6	1.1	92274688	False
85	Test 2	tasks/main	2.4	1.9	38912	False
85	Test 3	tasks/wp-content/categories/tag	2.4	0.7	91226112	True
85	Test 4	tasks/blog	2.8	1.6	16384	True
85	Test 5	tasks/app	1.4	1.7	92274688	False
85	Test 6	tasks/wp-content/wp-content	1.9	2.5	76546048	False
85	Test 7	tasks/wp-content/tag/posts	2.0	2.5	76546048	True
86	Test 0	tasks/tag/posts/search	2.3	1.5	37888	False
86	Test 1	tasks/app/posts	2.3	1.9	25165824	True
86	Test 2	tasks/categories/category/blog	1.1	2.3	12582912	False
87	Test 0	tasks/categories	2.4	3.3	70656	False
87	Test 1	tasks/categories/blog/wp-content	2.8	2.3	95420416	True
87	Test 2	tasks/tag	2.0	2.7	16384	True
87	Test 3	tasks/main	1.2	2.4	72704	False
87	Test 4	tasks/blog/posts/wp-content	2.9	2.4	3072	True
87	Test 5	tasks/wp-content/explore/categories	1.9	0.8	14336	False
87	Test 6	tasks/explore/list/list	1.1	2.7	98566144	False
87	Test 7	tasks/explore/explore	1.9	1.5	101711872	True
87	Test 8	tasks/app/wp-content/category	1.1	2.0	53248	True
88	Test 0	tasks/explore	1.3	2.6	5242880	False
88	Test 1	tasks/blog/app	2.2	2.0	62914560	True
88	Test 2	tasks/category	1.3	3.4	70656	False
88	Test 3	tasks/search/posts	1.5	1.6	97280	True
88	Test 4	tasks/wp-content	1.8	2.0	54272	True
88	Test 5	tasks/categories/posts	1.4	1.9	89128960	True
88	Test 6	tasks/wp-content	1.6	1.8	5120	False
89	Test 0	tasks/list/blog/wp-content	1.4	2.6	12288	False
89	Test 1	tasks/tags/app/list	2.8	1.9	20971520	True
89	Test 2	tasks/list	2.2	2.4	59768832	True
89	Test 3	tasks/app	2.2	1.9	16777216	False
89	Test 4	tasks/app/blog	1.8	1.7	4194304	True
89	Test 5	tasks/categories/categories	2.4	1.9	82944	False
89	Test 6	tasks/tags	1.6	0.8	103809024	False
90	Test 0	tasks/wp-content	2.5	2.3	87040	False
90	Test 1	tasks/tags/app	1.0	3.4	44040192	True
91	Test 0	tasks/explore/wp-content/tags	2.2	2.4	56623104	True
91	Test 1	tasks/posts	2.3	2.7	83886080	False
91	Test 2	tasks/blog/posts	1.1	2.8	18432	True
91	Test 3	tasks/tag	1.4	0.5	44040192	False
92	Test 0	tasks/tags/search/app	2.7	2.6	60817408	True
92	Test 1	tasks/main/search	1.3	1.5	63963136	True
92	Test 2	tasks/blog	1.6	1.8	13631488	False
92	Test 3	tasks/tag/app	1.7	1.2	17408	False
92	Test 4	tasks/list/tags	2.5	3.1	98304	True
93	Test 0	tasks/search	1.1	3.2	11264	False
94	Test 0	tasks/tags/explore/tags	1.7	0.6	77824	True
94	Test 1	tasks/app	2.6	3.0	31457280	False
94	Test 2	tasks/categories/tag/blog	2.1	2.8	100663296	True
94	Test 3	tasks/explore/search	2.3	3.2	32768	False
95	Test 0	tasks/category/search/tags	2.9	0.9	6291456	False
95	Test 1	tasks/tags	2.7	2.9	1048576	False
95	Test 2	tasks/categories/list/list	2.8	0.6	19456	True
95	Test 3	tasks/list/explore/wp-content	2.2	2.3	25165824	True
95	Test 4	tasks/blog/explore	1.7	1.9	76800	False
95	Test 5	tasks/category/blog/list	1.2	1.4	31457280	False
95	Test 6	tasks/tag	2.4	1.9	10240	True
95	Test 7	tasks/list/categories/wp-content	1.9	3.0	3145728	False
95	Test 8	tasks/app	2.2	1.0	94208	True
96	Test 0	tasks/search/category	1.3	1.8	59768832	False
96	Test 1	tasks/search/blog	1.7	1.9	89088	True
96	Test 2	tasks/category/search	2.9	2.3	94371840	False
96	Test 3	tasks/categories/tag	2.7	0.5	92160	True
96	Test 4	tasks/tags/categories	2.8	2.9	78848	False
96	Test 5	tasks/main/posts	2.0	2.8	85983232	True
96	Test 6	tasks/wp-content/explore	1.6	1.9	42991616	False
96	Test 7	tasks/blog	1.8	0.5	57671680	False
97	Test 0	tasks/explore/categories	2.3	1.5	98304	False
97	Test 1	tasks/blog	1.1	0.9	60817408	False
97	Test 2	tasks/main	2.2	1.2	38912	False
97	Test 3	tasks/categories/search/wp-content	1.5	1.0	4096	True
98	Test 0	tasks/posts/category/app	2.8	3.1	28672	False
98	Test 1	tasks/categories/tags	2.9	2.8	13312	True
98	Test 2	tasks/explore	1.6	1.5	104857600	False
98	Test 3	tasks/app	1.4	2.4	71680	True
98	Test 4	tasks/main/tags	1.9	2.2	79691776	True
98	Test 5	tasks/list	2.4	3.3	48128	False
99	Test 0	tasks/tags/explore	1.0	2.6	32505856	True
99	Test 1	tasks/tags/posts	1.4	1.7	15360	False
99	Test 2	tasks/wp-content/wp-content/categories	1.8	2.4	97280	False
99	Test 3	tasks/app	2.9	2.5	72351744	True
100	Test 0	tasks/app	1.1	1.4	60817408	False
100	Test 1	tasks/tags/posts/main	2.9	1.4	71680	False
100	Test 2	tasks/explore/list/posts	1.3	3.4	51200	False
100	Test 3	tasks/posts/app	1.9	2.8	87040	True
100	Test 4	tasks/wp-content/blog	2.2	2.9	49283072	True
100	Test 5	tasks/posts/tag	2.2	2.9	3072	True
100	Test 6	tasks/explore/wp-content	1.1	1.8	61440	True
100	Test 7	tasks/category	2.8	0.7	24576	True
101	Test 0	tasks/wp-content/blog	1.2	1.9	96468992	False
101	Test 1	tasks/category/tag/wp-content	2.8	0.5	36864	False
101	Test 2	tasks/list/category/blog	2.9	3.2	96468992	False
101	Test 3	tasks/tag/categories/app	1.3	3.4	77594624	True
101	Test 4	tasks/search/tag	1.3	1.8	87031808	True
101	Test 5	tasks/categories/category/tag	2.3	3.4	31744	False
101	Test 6	tasks/tag/wp-content	1.0	2.7	46080	True
101	Test 7	tasks/app	1.7	1.0	26624	True
101	Test 8	tasks/list	1.0	1.0	90177536	True
101	Test 9	tasks/app/posts/app	1.0	2.6	25600	True
102	Test 0	tasks/list/search/posts	2.2	2.9	34816	False
102	Test 1	tasks/blog	2.5	1.3	102760448	False
102	Test 2	tasks/categories/categories	2.3	1.9	56320	True
102	Test 3	tasks/tags	1.4	2.7	96468992	False
102	Test 4	tasks/blog/explore	1.0	0.7	66560	True
102	Test 5	tasks/categories/main/explore	2.2	3.4	66060288	False
102	Test 6	tasks/tags/main/explore	2.5	2.9	36864	False
102	Test 7	tasks/tags/tag	1.2	1.2	66560	False
102	Test 8	tasks/main/tag	1.8	2.1	12288	True
102	Test 9	tasks/category/wp-content/blog	2.7	0.8	44032	False
103	Test 0	tasks/category/main	2.8	1.8	93323264	False
103	Test 1	tasks/posts/tags/explore	1.3	0.5	101376	False
103	Test 2	tasks/wp-content/app	1.4	2.0	89128960	False
103	Test 3	tasks/categories/categories	2.6	3.3	29360128	False
103	Test 4	tasks/search	1.8	0.5	51380224	False
103	Test 5	tasks/posts	1.2	2.5	45088768	False
103	Test 6	tasks/blog/explore	1.5	3.1	80740352	False
104	Test 0	tasks/tags/search/app	1.0	1.0	9437184	True
104	Test 1	tasks/categories/tags	1.4	3.1	71680	True
104	Test 2	tasks/list/app	2.2	3.2	90177536	True
104	Test 3	tasks/search/categories/list	2.7	0.9	84934656	True
104	Test 4	tasks/tag/tags	1.2	0.6	1024	False
104	Test 5	tasks/tags/tag	1.8	2.9	15360	True
104	Test 6	tasks/tags/explore/explore	2.2	3.2	13312	True
104	Test 7	tasks/tags/posts/search	1.2	1.2	83886080	True
104	Test 8	tasks/tag/blog	1.9	2.1	69632	True
105	Test 0	tasks/blog/category/tags	2.6	2.2	87040	False
105	Test 1	tasks/wp-content/explore	2.0	3.0	95420416	True
105	Test 2	tasks/wp-content/app	1.6	1.7	56623104	True
105	Test 3	tasks/tag/tag	1.2	2.2	81920	False
105	Test 4	tasks/app/wp-content	1.9	1.3	98566144	True
105	Test 5	tasks/blog	2.3	1.9	36864	True
105	Test 6	tasks/wp-content	2.7	0.5	41943040	True
105	Test 7	tasks/main/tags	1.5	3.1	40894464	False
105	Test 8	tasks/explore/categories	2.8	2.4	34816	False
106	Test 0	tasks/main/categories/blog	2.2	2.3	17825792	True
106	Test 1	tasks/blog/app	2.8	0.8	66560	True
106	Test 2	tasks/categories/search/wp-content	1.5	3.4	102760448	True
106	Test 3	tasks/list/category	1.9	0.7	83886080	False
106	Test 4	tasks/categories/category	2.9	1.6	54272	False
107	Test 0	tasks/explore/blog/category	1.5	1.1	82944	False
107	Test 1	tasks/categories/search	2.1	3.1	41984	False
107	Test 2	tasks/wp-content/app/explore	2.9	2.6	101376	False
108	Test 0	tasks/search/list	1.7	3.3	61440	False
108	Test 1	tasks/category	1.7	1.9	101711872	False
108	Test 2	tasks/main	1.2	2.9	85983232	False
109	Test 0	tasks/app	1.8	3.0	93323264	True
109	Test 1	tasks/posts/wp-content/posts	2.0	3.3	27262976	True
109	Test 2	tasks/blog	1.5	0.8	41943040	False
109	Test 3	tasks/tag/explore	2.4	1.6	39936	False
110	Test 0	tasks/tags/list	2.4	3.1	83886080	True
110	Test 1	tasks/wp-content	1.5	2.2	74752	True
110	Test 2	tasks/list/list	1.0	3.0	54525952	True
110	Test 3	tasks/search	2.6	1.6	61440	True
110	Test 4	tasks/tags/tags	2.6	1.1	90112	True
110	Test 5	tasks/tag	1.5	3.2	74752	False
110	Test 6	tasks/main/app	2.9	1.9	4096	True
110	Test 7	tasks/app/app/categories	2.6	1.0	75776	True
110	Test 8	tasks/category	2.5	1.6	83886080	False
111	Test 0	tasks/list	1.6	3.0	67584	False
111	Test 1	tasks/list/category	2.6	1.2	65536	True
111	Test 2	tasks/posts	2.4	2.0	58720256	True
111	Test 3	tasks/posts/explore	2.6	0.8	103809024	True
111	Test 4	tasks/wp-content/list/main	2.0	1.9	43008	True
111	Test 5	tasks/list	1.4	1.4	71680	False
111	Test 6	tasks/list/category/posts	1.0	2.3	81788928	False
112	Test 0	tasks/posts/categories/app	1.1	2.2	22528	False
113	Test 0	tasks/posts	1.8	2.0	67584	False
113	Test 1	tasks/list	1.0	3.0	100352	False
113	Test 2	tasks/wp-content/wp-content/app	2.1	1.0	89128960	True
113	Test 3	tasks/wp-content/category/app	2.9	2.4	30408704	True
113	Test 4	tasks/list/categories/categories	1.8	1.0	97517568	True
113	Test 5	tasks/app/wp-content	1.9	2.6	55574528	False
113	Test 6	tasks/list/blog/categories	1.2	0.8	11534336	False
113	Test 7	tasks/wp-content/wp-content	1.4	0.6	95420416	True
114	Test 0	tasks/category	1.8	2.3	84992	True
114	Test 1	tasks/blog	2.6	3.0	92160	True
114	Test 2	tasks/categories/explore	2.5	0.5	70656	True
115	Test 0	tasks/main	2.4	1.7	12582912	False
115	Test 1	tasks/explore/wp-content	1.6	1.4	38797312	False
115	Test 2	tasks/list/blog	1.8	1.5	71680	False
116	Test 0	tasks/categories/search	1.0	1.3	32768	False
116	Test 1	tasks/app/tags	1.6	3.2	74752	True
117	Test 0	tasks/blog/main/blog	1.0	0.7	83886080	True
117	Test 1	tasks/list	2.0	1.6	22020096	True
117	Test 2	tasks/tag/posts/tags	2.3	1.9	58368	True
117	Test 3	tasks/explore/search/app	1.7	2.2	21504	False
117	Test 4	tasks/blog/app/category	2.8	3.3	26624	True
118	Test 0	tasks/wp-content	2.2	2.7	100663296	True
118	Test 1	tasks/tag/categories/app	2.1	1.8	14336	False
118	Test 2	tasks/tag/list/blog	1.0	2.7	92160	True
118	Test 3	tasks/posts/category	1.1	1.5	36700160	False
118	Test 4	tasks/app/search	1.4	0.9	97517568	False
118	Test 5	tasks/explore/wp-content	1.4	2.9	17825792	True
118	Test 6	tasks/main	1.9	1.0	18874368	False
118	Test 7	tasks/main/list	2.3	1.7	6291456	True
118	Test 8	tasks/posts/list	2.7	0.7	66560	True
119	Test 0	tasks/app	2.5	2.0	40894464	True
120	Test 0	tasks/list	2.2	2.0	87040	False
120	Test 1	tasks/app	2.5	2.8	102400	False
120	Test 2	tasks/category/category/tags	2.7	1.9	19456	False
121	Test 0	tasks/tag/explore/list	1.0	2.8	34816	True
121	Test 1	tasks/categories/wp-content	1.5	1.1	58720256	True
121	Test 2	tasks/explore/search	2.9	2.2	23552	False
121	Test 3	tasks/explore/search/main	2.4	0.5	71680	True
121	Test 4	tasks/explore/main/search	1.3	0.8	56320	False
122	Test 0	tasks/tags/blog/blog	1.7	0.5	6144	False
122	Test 1	tasks/app/tag/main	2.0	2.6	59768832	False
122	Test 2	tasks/tags/wp-content/main	1.1	2.6	19922944	False
122	Test 3	tasks/app/tags/category	2.9	0.9	92274688	True
122	Test 4	tasks/category	1.0	3.2	32505856	True
122	Test 5	tasks/category/tags/search	2.0	2.1	100663296	False
122	Test 6	tasks/posts/tags	1.1	3.2	68608	False
122	Test 7	tasks/wp-content/posts/tag	2.9	3.3	41984	False
122	Test 8	tasks/blog	1.7	1.1	91136	False
123	Test 0	tasks/explore/tag/search	1.7	3.4	26214400	True
123	Test 1	tasks/search/search/explore	2.3	1.1	16777216	False
124	Test 0	tasks/blog/wp-content	2.0	2.8	87031808	False
124	Test 1	tasks/list/list/category	2.1	2.1	45056	False
124	Test 2	tasks/posts	2.9	1.9	19456	False
124	Test 3	tasks/app	1.3	3.3	13631488	False
124	Test 4	tasks/tag	1.6	2.8	100663296	False
124	Test 5	tasks/wp-content	2.1	1.5	14336	False
124	Test 6	tasks/blog/tags/wp-content	2.8	3.4	32505856	False
124	Test 7	tasks/blog	1.3	2.3	5242880	True
124	Test 8	tasks/category	2.5	3.2	86016	False
125	Test 0	tasks/category	2.5	2.1	94371840	True
125	Test 1	tasks/search	2.9	1.3	16777216	True
126	Test 0	tasks/categories	2.1	3.4	57671680	False
126	Test 1	tasks/app	1.6	3.1	13631488	True
126	Test 2	tasks/explore/main	2.6	1.3	48128	True
126	Test 3	tasks/list	1.7	1.2	77824	False
126	Test 4	tasks/posts/main	2.0	2.9	17825792	True
126	Test 5	tasks/list/main/app	1.9	0.8	87031808	False
127	Test 0	tasks/search/posts	2.0	0.9	77594624	False
127	Test 1	tasks/main/tag	2.7	3.1	72351744	True
127	Test 2	tasks/explore	2.4	2.3	99614720	False
127	Test 3	tasks/blog	2.3	3.0	39936	False
127	Test 4	tasks/categories	1.9	0.5	51380224	False
128	Test 0	tasks/explore/main/explore	1.2	1.8	30720	False
128	Test 1	tasks/posts/search	2.8	0.6	34603008	True
128	Test 2	tasks/list	2.3	0.5	12288	True
128	Test 3	tasks/wp-content/explore	1.4	1.2	12582912	True
128	Test 4	tasks/blog	1.6	1.2	78848	True
128	Test 5	tasks/category/categories	1.3	1.2	32505856	False
129	Test 0	tasks/search	2.6	1.6	87040	False
129	Test 1	tasks/tag/explore/search	2.0	1.2	6291456	True
129	Test 2	tasks/explore/search/category	2.6	2.1	50331648	False
129	Test 3	tasks/app/list	2.2	3.0	16777216	True
129	Test 4	tasks/main/tag	1.4	2.1	5120	False
129	Test 5	tasks/search/posts/wp-content	2.5	3.2	101711872	False
129	Test 6	tasks/posts	2.1	3.3	66060288	True
129	Test 7	tasks/search	1.8	1.8	19456	True
129	Test 8	tasks/search/blog	1.3	2.7	45056	True
130	Test 0	tasks/explore/categories	1.6	2.4	91226112	False
130	Test 1	tasks/main/tag/explore	1.4	3.4	73728	True
130	Test 2	tasks/tag	2.8	2.0	102760448	True
130	Test 3	tasks/category/explore/categories	2.5	3.2	51380224	False
130	Test 4	tasks/search	2.4	0.6	25165824	True
130	Test 5	tasks/tags/posts	1.4	2.5	30720	False
130	Test 6	tasks/wp-content	2.4	1.4	50176	False
130	Test 7	tasks/category/blog	2.2	1.0	67108864	True
130	Test 8	tasks/blog/app	1.0	1.6	9437184	True
131	Test 0	tasks/explore	2.0	1.9	39845888	True
131	Test 1	tasks/category/explore	1.7	1.7	69632	True
131	Test 2	tasks/explore/categories/search	1.6	3.2	4194304	True
131	Test 3	tasks/tag/main	2.0	2.6	67584	False
131	Test 4	tasks/wp-content/main/explore	1.1	2.4	51200	True
131	Test 5	tasks/blog/search	1.1	3.3	78643200	True
131	Test 6	tasks/posts/categories/blog	2.9	3.1	28311552	False
131	Test 7	tasks/explore	2.7	0.9	59768832	True
131	Test 8	tasks/blog/posts	1.9	3.1	20480	True
132	Test 0	tasks/app/category	2.5	2.3	41943040	True
132	Test 1	tasks/app/list	2.8	0.9	64512	False
132	Test 2	tasks/list/main/list	2.3	2.7	27262976	False
132	Test 3	tasks/blog/blog	1.5	1.8	67108864	True
132	Test 4	tasks/wp-content/search/main	2.5	3.2	72351744	True
132	Test 5	tasks/category/wp-content	1.6	0.7	26214400	False
132	Test 6	tasks/tags/blog/explore	2.1	1.5	13312	True
132	Test 7	tasks/tag/posts/explore	1.5	0.7	35840	True
132	Test 8	tasks/explore	2.1	0.9	67584	True
132	Test 9	tasks/categories/category	1.9	2.4	70254592	True
133	Test 0	tasks/blog/categories/search	1.6	2.6	13312	True
133	Test 1	tasks/wp-content/blog/category	1.4	1.4	13312	True
133	Test 2	tasks/explore/tags/tags	1.4	2.5	84934656	False
133	Test 3	tasks/explore/category	2.9	0.5	93323264	False
133	Test 4	tasks/category/blog	1.4	2.4	77824	False
133	Test 5	tasks/tags	1.5	3.4	53477376	False
133	Test 6	tasks/category/category/explore	1.2	1.1	38797312	False
133	Test 7	tasks/app/explore	1.7	0.7	18432	True
134	Test 0	tasks/main	2.8	0.8	65011712	True
134	Test 1	tasks/posts	2.6	0.9	24117248	True
134	Test 2	tasks/search/app	1.6	2.7	39845888	False
134	Test 3	tasks/wp-content	2.6	1.5	14336	False
134	Test 4	tasks/list/wp-content/blog	1.3	2.9	58720256	True
134	Test 5	tasks/app	1.1	3.0	93323264	False
134	Test 6	tasks/posts	1.1	2.1	6144	False
134	Test 7	tasks/list/app	1.1	2.3	57344	False
135	Test 0	tasks/search/explore	1.3	1.8	74752	False
136	Test 0	tasks/posts/main/blog	1.7	2.6	28672	False
136	Test 1	tasks/blog/tags	1.8	2.9	14336	True
136	Test 2	tasks/tags/list	2.0	2.5	69206016	False
136	Test 3	tasks/app/app	1.0	3.4	95232	True
136	Test 4	tasks/explore/explore	2.6	0.6	57671680	False
137	Test 0	tasks/tags	1.5	2.4	71680	False
137	Test 1	tasks/search/blog/wp-content	1.7	0.7	26214400	True
137	Test 2	tasks/explore/tags/wp-content	1.9	0.6	59768832	True
137	Test 3	tasks/search/category	1.5	2.6	2048	False
137	Test 4	tasks/categories/tag	2.5	2.2	8192	False
137	Test 5	tasks/list/app	1.6	0.6	42991616	False
137	Test 6	tasks/posts/category	2.5	1.2	5120	True
137	Test 7	tasks/blog/list	1.2	0.6	25165824	True
137	Test 8	tasks/search/list	2.2	1.5	19922944	False
138	Test 0	tasks/main/wp-content	2.3	2.0	14680064	False
138	Test 1	tasks/posts/blog	1.9	1.9	52224	False
138	Test 2	tasks/categories/categories	2.8	1.9	102760448	False
138	Test 3	tasks/search/category/posts	1.7	0.6	47185920	True
138	Test 4	tasks/main/explore	2.7	2.1	47185920	False
138	Test 5	tasks/category/explore	1.4	2.4	96256	True
138	Test 6	tasks/tags	1.8	3.2	53248	True
138	Test 7	tasks/blog/list/tags	2.5	2.2	84934656	True
138	Test 8	tasks/category/main/category	1.0	1.6	6144	False
138	Test 9	tasks/tags	1.4	3.4	74752	True
139	Test 0	tasks/main	2.7	3.0	18432	True
140	Test 0	tasks/tag/blog/tag	1.6	3.4	84992	True
140	Test 1	tasks/explore/app	1.8	2.4	91226112	False
140	Test 2	tasks/wp-content/categories	2.9	2.0	12582912	False
141	Test 0	tasks/blog/list/categories	1.6	2.2	23068672	True
142	Test 0	tasks/list/tag/tag	1.9	2.7	22528	True
142	Test 1	tasks/categories/app	2.1	2.6	65536	False
142	Test 2	tasks/posts/categories/search	1.4	1.5	4194304	True
142	Test 3	tasks/posts/list/explore	1.5	1.4	94208	False
142	Test 4	tasks/search/app/posts	1.4	1.5	27262976	False
142	Test 5	tasks/tag	1.7	1.7	25165824	True
142	Test 6	tasks/blog	2.5	3.3	26624	False
142	Test 7	tasks/app/posts/tags	1.3	3.4	30408704	False
142	Test 8	tasks/posts/main/app	2.5	1.3	30408704	False
142	Test 9	tasks/posts/explore/tag	1.9	0.6	65011712	False
143	Test 0	tasks/posts/category/app	1.0	3.0	14336	True
143	Test 1	tasks/app/list/main	2.7	2.6	38912	True
143	Test 2	tasks/tags/blog/categories	1.6	0.8	52428800	True
143	Test 3	tasks/tags	1.1	0.5	81788928	True
143	Test 4	tasks/search	2.6	1.8	25600	True
143	Test 5	tasks/categories/list	2.6	3.2	43008	False
143	Test 6	tasks/search/explore	1.0	1.1	9437184	False
143	Test 7	tasks/list/wp-content	1.2	3.4	40894464	True
144	Test 0	tasks/categories	2.1	1.7	46137344	True
144	Test 1	tasks/main/tag/posts	2.7	1.7	37748736	False
144	Test 2	tasks/tags/blog/categories	1.7	1.9	99614720	True
144	Test 3	tasks/blog/tag	1.4	2.7	23552	True
144	Test 4	tasks/list/main	2.9	3.2	26214400	False
144	Test 5	tasks/category	2.7	2.4	9437184	True
144	Test 6	tasks/tag/posts	2.4	3.4	60817408	False
145	Test 0	tasks/category/main/categories	1.3	2.0	57344	False
145	Test 1	tasks/tags/categories	1.3	2.4	1048576	False
145	Test 2	tasks/tag	2.0	2.3	83886080	True
145	Test 3	tasks/search/tag	1.0	1.4	13312	False
145	Test 4	tasks/categories/search	1.2	3.0	84934656	True
145	Test 5	tasks/blog/search	2.1	1.5	98304	False
145	Test 6	tasks/search	1.9	1.4	77824	False
145	Test 7	tasks/posts/explore/tags	1.2	2.5	10240	True
145	Test 8	tasks/list	1.8	1.5	91136	True
146	Test 0	tasks/blog/posts	2.0	0.5	34816	False
146	Test 1	tasks/tags/main/tags	2.9	1.5	51200	False
146	Test 2	tasks/search/category	1.2	1.7	96468992	False
146	Test 3	tasks/wp-content/categories/category	1.2	3.1	69206016	False
146	Test 4	tasks/category	1.3	2.2	39936	False
146	Test 5	tasks/posts/category/main	2.7	2.8	35651584	False
146	Test 6	tasks/blog/search	1.9	0.6	101711872	True
147	Test 0	tasks/tag	2.0	0.9	85983232	True
147	Test 1	tasks/category/app/tag	2.5	2.3	36700160	True
147	Test 2	tasks/list/app	1.1	2.3	9437184	True
147	Test 3	tasks/tags/app/category	1.5	3.2	97517568	False
147	Test 4	tasks/category	2.4	2.2	38797312	True
147	Test 5	tasks/search	2.4	2.1	100663296	True
148	Test 0	tasks/blog	2.8	0.7	56623104	False
148	Test 1	tasks/search/posts/explore	1.5	0.9	86016	False
148	Test 2	tasks/tag/category	1.5	1.8	86016	True
148	Test 3	tasks/categories/tags	2.5	3.0	50331648	True
148	Test 4	tasks/tag/posts	1.3	2.0	86016	False
148	Test 5	tasks/explore/explore/search	1.7	3.2	81788928	True
149	Test 0	tasks/wp-content	1.6	1.9	94208	False
149	Test 1	tasks/posts	2.3	2.0	10485760	False
149	Test 2	tasks/categories	2.4	2.4	80896	True
149	Test 3	tasks/category	1.1	2.7	38797312	False
149	Test 4	tasks/main/app	1.5	2.3	33554432	True
149	Test 5	tasks/main/main	2.3	3.0	23068672	False
149	Test 6	tasks/tag	1.6	0.6	61440	True
149	Test 7	tasks/category/category	2.1	1.6	53248	False
149	Test 8	tasks/app/list/tag	2.5	2.6	55574528	True
149	Test 9	tasks/app/list/blog	2.6	3.4	39936	False
150	Test 0	tasks/wp-content/list/tags	2.6	1.4	97517568	False
151	Test 0	tasks/explore/tag	2.1	3.4	12582912	True
151	Test 1	tasks/explore/tags	1.7	2.2	56320	False
151	Test 2	tasks/blog/explore	1.4	0.7	50176	False
151	Test 3	tasks/tag/categories/categories	2.1	1.1	82944	False
151	Test 4	tasks/blog/wp-content	2.4	1.9	73728	False
151	Test 5	tasks/wp-content	1.5	3.3	31457280	True
151	Test 6	tasks/search/categories/category	1.2	2.6	34816	False
151	Test 7	tasks/tag	2.4	0.8	74448896	True
151	Test 8	tasks/wp-content	1.9	1.9	60416	False
151	Test 9	tasks/tags/category/tag	1.6	1.3	34603008	True
152	Test 0	tasks/main/main	2.6	2.0	45056	True
152	Test 1	tasks/explore/tags/blog	2.2	0.9	45088768	False
152	Test 2	tasks/category/explore/explore	2.4	2.5	28672	True
152	Test 3	tasks/explore/category	2.3	1.0	56320	True
152	Test 4	tasks/explore/search/posts	1.3	2.0	24117248	True
152	Test 5	tasks/tag/category/list	1.9	1.7	33554432	False
152	Test 6	tasks/categories	1.4	0.8	39845888	False
152	Test 7	tasks/tags/app	2.0	0.7	2048	True
152	Test 8	tasks/categories/list/tag	1.3	2.9	89128960	False
152	Test 9	tasks/categories/blog/list	1.9	2.6	102760448	True
153	Test 0	tasks/category/search	2.3	3.2	34816	True
153	Test 1	tasks/category	1.2	2.1	79691776	True
153	Test 2	tasks/blog	2.4	2.5	97280	False
153	Test 3	tasks/category	2.8	3.4	83968	True
153	Test 4	tasks/categories	2.2	1.3	12582912	False
153	Test 5	tasks/app	2.6	2.9	29360128	True
153	Test 6	tasks/explore	1.8	3.3	61865984	True
153	Test 7	tasks/explore/explore	2.2	0.8	29360128	True
154	Test 0	tasks/posts/search/main	1.4	3.3	55574528	True
154	Test 1	tasks/app	1.6	1.5	12582912	True
154	Test 2	tasks/category/search	1.9	0.5	29696	False
154	Test 3	tasks/blog/main/list	2.4	0.7	52224	False
154	Test 4	tasks/main/posts/category	2.7	2.5	60817408	True
154	Test 5	tasks/search/posts/category	2.3	1.6	28311552	True
155	Test 0	tasks/blog/category/tags	1.6	2.7	80896	True
155	Test 1	tasks/tag/list	2.2	2.2	31457280	False
155	Test 2	tasks/categories/tag/blog	1.9	2.0	84934656	True
155	Test 3	tasks/category	2.8	3.1	8192	False
155	Test 4	tasks/explore/category	2.0	1.8	88080384	False
155	Test 5	tasks/search/blog/blog	1.3	3.4	77824	False
155	Test 6	tasks/wp-content	2.7	1.3	13312	True
155	Test 7	tasks/blog/tag	2.7	0.7	45088768	True
156	Test 0	tasks/list/explore	1.9	0.5	48234496	False
156	Test 1	tasks/posts/main/app	2.8	1.1	102400	True
156	Test 2	tasks/search/blog/app	1.9	1.8	41984	True
156	Test 3	tasks/app/category/posts	2.7	0.7	45056	True
156	Test 4	tasks/list	2.7	2.3	47185920	False
156	Test 5	tasks/explore	1.7	2.7	29696	False
156	Test 6	tasks/category/categories/explore	1.7	1.7	63488	True
156	Test 7	tasks/posts/wp-content/blog	1.4	0.7	29696	False
156	Test 8	tasks/categories	2.9	2.3	8388608	False
156	Test 9	tasks/search/app	1.6	1.8	50331648	False
157	Test 0	tasks/blog/blog/tag	2.5	3.0	83968	False
157	Test 1	tasks/tags/tag	2.5	2.4	93323264	True
157	Test 2	tasks/explore/tags	1.9	3.3	72351744	False
157	Test 3	tasks/main/wp-content	2.5	0.7	12582912	True
157	Test 4	tasks/tag/explore	2.7	3.1	10485760	True
157	Test 5	tasks/list/main/app	2.5	1.3	71303168	False
157	Test 6	tasks/tags/category/tags	2.1	2.3	31457280	True
157	Test 7	tasks/tags/posts/wp-content	1.0	3.3	85983232	True
158	Test 0	tasks/categories/app	1.9	1.9	60817408	False
158	Test 1	tasks/wp-content/categories/blog	2.5	0.6	51380224	False
159	Test 0	tasks/posts	2.0	3.4	95420416	False
159	Test 1	tasks/wp-content/main	2.1	0.7	11534336	True
159	Test 2	tasks/search/tag	2.0	2.7	101711872	True
159	Test 3	tasks/categories	1.6	2.0	78643200	False
159	Test 4	tasks/posts	1.8	0.9	98304	False
159	Test 5	tasks/tag	2.0	1.2	27262976	True
159	Test 6	tasks/list/app/app	2.5	2.3	100352	False
159	Test 7	tasks/main/category/posts	1.9	2.8	75776	True
159	Test 8	tasks/explore/categories/category	2.3	1.2	3145728	False
159	Test 9	tasks/category	1.0	2.1	60416	True
160	Test 0	tasks/search/search	2.5	3.1	29360128	False
160	Test 1	tasks/categories	1.0	2.9	89088	False
160	Test 2	tasks/explore/categories	2.0	0.8	2048	True
160	Test 3	tasks/tags	1.0	1.2	11264	True
160	Test 4	tasks/list/explore/list	1.2	2.3	49152	True
161	Test 0	tasks/categories	1.1	1.1	89128960	True
161	Test 1	tasks/blog	1.4	3.1	8388608	True
161	Test 2	tasks/categories/app	2.9	0.5	99614720	False
161	Test 3	tasks/wp-content	2.8	1.6	36864	True
161	Test 4	tasks/wp-content/posts	2.9	1.7	84992	True
161	Test 5	tasks/tags/tags	2.3	1.3	44032	True
161	Test 6	tasks/search/search/wp-content	2.6	2.2	22528	True
162	Test 0	tasks/list/categories	2.8	2.7	21504	False
162	Test 1	tasks/category/search/main	1.7	2.5	22020096	True
162	Test 2	tasks/tag/explore	1.5	1.8	30408704	False
162	Test 3	tasks/tag/list/tag	1.1	2.3	95232	False
162	Test 4	tasks/tag	1.2	0.7	72704	False
163	Test 0	tasks/wp-content	1.2	1.5	23068672	False
163	Test 1	tasks/tags	2.3	0.8	30408704	True
164	Test 0	tasks/wp-content/tag/blog	2.1	2.9	15360	True
164	Test 1	tasks/categories/app	2.6	2.8	97517568	False
164	Test 2	tasks/category/list	1.5	3.2	56320	True
164	Test 3	tasks/wp-content	2.5	3.0	87031808	False
164	Test 4	tasks/main/tag	1.7	0.6	4194304	True
164	Test 5	tasks/tags/categories/explore	2.3	3.0	41984	False
164	Test 6	tasks/wp-content/app/explore	2.4	3.3	18874368	True
164	Test 7	tasks/list/blog/app	1.6	2.5	67584	True
164	Test 8	tasks/explore	1.3	1.5	93323264	False
165	Test 0	tasks/tag/list/app	1.1	0.6	14336	True
165	Test 1	tasks/tag	2.6	0.9	11264	True
165	Test 2	tasks/search/category/explore	1.2	0.7	57344	False
165	Test 3	tasks/main/blog	1.1	2.9	76546048	True
166	Test 0	tasks/search/posts	1.5	1.6	74448896	False
166	Test 1	tasks/search/main/wp-content	2.9	3.3	30408704	False
166	Test 2	tasks/tag/category/explore	1.2	3.2	25600	False
166	Test 3	tasks/search/categories	2.9	3.3	32768	False
166	Test 4	tasks/explore/wp-content/categories	2.4	2.2	81788928	True
166	Test 5	tasks/app/category/search	2.7	0.5	45088768	True
167	Test 0	tasks/search/categories	2.8	1.5	104857600	False
167	Test 1	tasks/explore/blog	1.0	1.9	79872	True
167	Test 2	tasks/list/main	2.1	3.4	25600	False
167	Test 3	tasks/blog	2.6	2.7	46137344	True
167	Test 4	tasks/list/blog	1.9	1.9	25165824	False
167	Test 5	tasks/tag/categories	2.4	2.3	54272	False
167	Test 6	tasks/list/search	1.9	2.1	42991616	False
167	Test 7	tasks/tags/main	1.2	1.6	48234496	False
168	Test 0	tasks/explore/category	2.8	0.7	12582912	False
168	Test 1	tasks/list/main/app	1.1	0.6	100663296	False
168	Test 2	tasks/main/list/categories	2.6	2.3	2048	False
168	Test 3	tasks/categories/main/main	1.5	3.1	51200	False
168	Test 4	tasks/tag/tags	1.8	0.5	82837504	False
169	Test 0	tasks/search/app/category	2.1	1.5	83968	True
169	Test 1	tasks/categories/tag/posts	2.2	2.0	43008	True
169	Test 2	tasks/list/categories	2.8	1.4	98566144	False
169	Test 3	tasks/categories/posts	2.1	1.2	101376	True
169	Test 4	tasks/tags	2.3	2.6	84992	False
169	Test 5	tasks/search/wp-content/wp-content	1.2	2.3	99328	True
169	Test 6	tasks/search/app	2.3	0.7	10240	True
169	Test 7	tasks/search	2.1	2.5	13312	False
169	Test 8	tasks/categories	2.6	1.5	6144	False
170	Test 0	tasks/categories/wp-content/tag	2.9	3.2	60416	True
170	Test 1	tasks/categories	1.9	3.0	21504	False
170	Test 2	tasks/posts/search	1.1	1.7	88080384	False
170	Test 3	tasks/search/posts	1.2	0.6	36700160	False
170	Test 4	tasks/wp-content/posts	1.3	2.8	74752	True
170	Test 5	tasks/app/posts	1.6	1.8	35840	True
170	Test 6	tasks/explore	1.4	1.7	15360	False
170	Test 7	tasks/categories/explore/category	2.6	1.9	62914560	True
170	Test 8	tasks/main/categories	1.5	2.9	92274688	False
171	Test 0	tasks/main/list	2.4	2.3	74448896	True
171	Test 1	tasks/app	2.0	1.1	61865984	False
171	Test 2	tasks/wp-content	2.3	1.0	11534336	False
171	Test 3	tasks/app/search	2.6	1.2	28672	True
171	Test 4	tasks/category	2.0	2.9	25600	False
171	Test 5	tasks/main/main	1.3	0.6	92274688	True
171	Test 6	tasks/wp-content/main/categories	2.9	1.1	18432	True
172	Test 0	tasks/list	2.5	1.3	49152	False
172	Test 1	tasks/main	2.9	2.0	48128	True
172	Test 2	tasks/posts/tags/explore	1.3	1.1	6291456	True
172	Test 3	tasks/posts/categories/categories	2.1	3.1	41984	True
172	Test 4	tasks/wp-content	1.5	1.3	37888	False
172	Test 5	tasks/blog/posts/tags	2.8	3.3	22528	True
173	Test 0	tasks/categories/explore/explore	1.8	0.8	34816	True
173	Test 1	tasks/blog/tags/tags	1.6	1.5	93323264	True
173	Test 2	tasks/explore	1.4	1.9	20971520	True
173	Test 3	tasks/tag/wp-content	1.0	1.0	44040192	True
173	Test 4	tasks/category/search/categories	2.1	1.8	93323264	False
173	Test 5	tasks/main/search	2.6	2.2	44032	False
173	Test 6	tasks/search/tag	1.9	0.8	66560	True
173	Test 7	tasks/tags	1.5	2.1	5242880	True
174	Test 0	tasks/app	1.8	0.5	51200	False
174	Test 1	tasks/wp-content/explore	1.9	0.8	92160	True
174	Test 2	tasks/posts	2.5	1.9	79691776	True
174	Test 3	tasks/wp-content/explore/search	1.6	2.2	74448896	True
174	Test 4	tasks/category/blog	2.3	1.9	55296	False
174	Test 5	tasks/search/posts/explore	1.9	2.7	35840	False
174	Test 6	tasks/tag/main	1.9	3.2	69206016	False
174	Test 7	tasks/wp-content/tags/tag	1.9	2.5	56623104	False
174	Test 8	tasks/main/tags	1.4	1.5	70254592	False
\.
COPY task_results (submit_id, task_id, status_id, points, summary, execution_time, used_memory) FROM STDIN;
175	519	10	0	\N	1.4	5299200
230	184	4	0.0	Four suddenly hospital thing management. While fly not energy entire inside western.	0.9	7121920
17	978	10	0	Own much office use phone.	1.3	7359488
147	335	4	1.6	Fine seem although among with subject should. Certain few soon candidate life process.	0.8	3597312
193	146	7	0	Live budget customer today course sing piece address.	1.1	5240832
201	925	10	0	\N	1.9	7599104
84	473	6	0	\N	1.6	7580672
289	936	6	0	None check design good.	1.0	745472
302	336	7	0	Official company family star. Smile idea hand wind tell.	0.7	5178368
108	378	7	0	Range hard time herself risk chair turn. Their key arrive former actually say ahead.	0.9	5431296
203	322	8	0	\N	1.2	6051840
313	98	4	1.4	\N	1.6	8272896
268	630	4	1.3	Leg line century type art happen everybody.	1.3	3785728
299	985	6	0	Feeling guy effort upon.	1.1	3623936
48	379	4	0.6	\N	1.3	7800832
306	222	6	0	As goal maybe such training necessary keep. Possible night take activity glass evidence hair.	0.9	6169600
161	235	4	2.1	Grow provide perform bit speak.	0.6	5309440
169	789	4	1.2	\N	1.1	2472960
210	751	5	0	\N	0.9	7602176
232	755	4	1.4	\N	1.1	7229440
268	615	7	0	Western more national.	0.6	1389568
281	511	6	0	Have deal number me outside.	0.6	2881536
309	292	4	2.5	\N	1.1	6971392
108	367	4	1.3	Population will next just.	1.5	7783424
255	577	6	0	\N	0.9	2173952
166	222	4	0.9	Type treat physical young together newspaper.	0.8	1885184
299	984	5	0	Others itself although then meet.	1.4	3010560
193	141	10	0	Drive toward indicate get. Song threat near real.	0.6	5394432
3	424	4	2.9	Necessary expert man affect staff everyone.	1.3	4794368
86	159	4	1.0	Hand system heart blood try. News ten generation with despite.	1.7	3686400
56	885	4	2.5	Daughter computer create find. Industry girl white.	0.8	3482624
285	859	1	0	\N	1.4	1951744
132	322	5	0	\N	1.0	5843968
296	435	4	2.3	Science great hot stand compare.	1.9	2073600
114	706	8	0	Buy carry own face number hear.	1.4	335872
267	301	4	0.2	Light responsibility entire lay provide look business.	1.4	5861376
245	42	4	2.6	\N	1.3	5804032
194	765	1	0	\N	1.0	1857536
297	522	4	0.7	Data instead many recently trade city address.	1.9	5011456
140	705	4	2.1	Soldier whom worker article stock indeed talk.	1.9	2564096
210	752	7	0	Want appear mouth of.	1.4	7419904
31	224	4	2.7	\N	0.9	5881856
273	341	4	0.7	Side room effort. Left smile loss true factor conference factor everyone.	1.0	3756032
157	240	5	0	\N	1.6	5474304
84	483	1	0	\N	1.1	576512
235	268	4	1.6	Position full TV knowledge.	0.7	4431872
254	720	5	0	Name sell dinner vote away wish exactly.	1.6	6483968
83	438	10	0	Describe front free road visit approach type.	1.3	1731584
215	864	6	0	Room today husband.	1.9	7962624
188	723	8	0	\N	1.8	7562240
173	920	4	0.4	\N	1.8	5695488
234	166	6	0	\N	1.8	1702912
285	860	6	0	Life off everyone ready.	0.6	6045696
94	663	1	0	\N	0.8	7255040
97	640	4	0.6	\N	1.0	4368384
26	91	7	0	\N	1.6	2661376
81	741	10	0	\N	1.3	4143104
318	212	4	1.0	\N	1.0	2450432
151	394	4	0.1	\N	1.6	6144000
26	62	9	0	Her condition night fall.	1.6	4436992
322	668	5	0	Stay firm general kid each.	1.1	6002688
32	496	3	0	Nor support total option throw. Choose send safe machine wall.	1.8	4594688
86	165	8	0	For today series less responsibility recent.	0.7	2430976
64	554	4	1.2	\N	1.2	5352448
287	361	4	0.5	\N	1.3	761856
267	307	4	2.6	Peace future face three stuff morning.	1.7	2229248
298	206	4	0.2	Condition boy site phone someone good either.	1.9	1897472
261	277	3	0	\N	2.0	7742464
156	450	7	0	\N	0.9	2504704
257	292	6	0	\N	0.6	223232
43	867	4	2.9	\N	1.8	3624960
235	277	4	0.3	Figure answer trade about little citizen hand.	1.3	482304
8	656	10	0	\N	1.6	610304
281	501	4	1.9	\N	1.8	756736
293	571	4	1.8	For who data sing.	1.9	3025920
222	241	5	0	Look beyond goal notice.	0.9	4775936
204	214	4	2.0	\N	1.2	3670016
105	514	4	2.8	Against far magazine shake may.	0.7	2708480
148	22	4	2.1	\N	1.8	6935552
202	795	4	2.5	\N	1.8	2837504
215	867	4	0.4	Direction source operation purpose without box. Thousand blue strong animal office.	0.7	3810304
321	136	10	0	Happy keep yard force mouth order job.	0.5	1934336
73	511	1	0	\N	0.6	3064832
29	591	4	1.1	\N	0.9	1900544
279	954	4	0.7	Officer school west against big.	1.7	3209216
268	628	4	2.3	Born drive response.	0.8	5183488
47	748	1	0	\N	0.5	1208320
68	248	7	0	\N	1.8	558080
269	335	5	0	Memory walk business glass discuss. Condition behavior piece record.	1.8	1694720
189	730	4	1.7	\N	0.7	2363392
247	163	1	0	\N	0.8	6257664
286	917	4	1.1	Daughter movie number position it building work.	1.5	6286336
283	288	1	0	Threat along response environmental.	0.9	1629184
184	58	4	2.2	\N	1.5	913408
39	766	4	1.1	\N	1.4	3597312
17	974	4	1.0	\N	1.1	5733376
205	87	7	0	\N	1.0	3764224
242	77	5	0	\N	1.5	6945792
28	361	7	0	Popular draw over.	1.7	3367936
245	24	4	1.6	Gun challenge western and including couple federal. Set leave several practice.	0.9	5033984
282	986	4	1.9	\N	1.6	321536
41	540	3	0	Summer determine participant.	1.5	3918848
290	565	10	0	\N	1.9	6282240
316	50	3	0	Interest act increase experience fish investment begin.	1.8	3781632
142	661	4	2.4	\N	1.1	8000512
73	513	7	0	\N	1.6	4886528
146	152	4	0.5	Class notice travel finally eye middle walk. Move fall matter side his human.	1.5	676864
155	90	4	1.5	Sport foot stand include receive.	1.7	575488
66	907	4	2.3	\N	0.6	2940928
200	740	4	2.8	\N	0.9	2969600
203	324	7	0	Issue two parent line yard southern.	1.4	2700288
251	595	7	0	Hospital instead hear easy. Pm want laugh start method who laugh.	2.0	2942976
167	612	4	2.3	\N	1.3	5809152
206	713	1	0	\N	0.9	922624
170	291	5	0	Activity score loss test real one. True little ground eat cost range town.	0.8	2101248
263	264	10	0	Fish computer spend relate house within road.	1.9	2113536
41	539	5	0	Hand official recognize boy.	0.9	4731904
171	153	4	1.6	\N	0.7	1412096
19	620	4	2.3	Magazine write push chance.	0.8	4154368
275	780	4	2.0	\N	1.7	5745664
277	82	10	0	\N	1.3	8210432
24	11	7	0	Nearly each event heavy fly tell. Lay morning ask again.	1.7	6231040
267	305	6	0	\N	1.2	6464512
145	340	4	1.6	Participant join almost especially able.	1.8	2187264
270	149	7	0	\N	1.1	6608896
25	497	4	1.8	\N	1.0	8198144
322	680	4	1.4	\N	1.4	7190528
90	39	3	0	Pretty throughout small wear family.	1.6	1778688
78	886	7	0	Police maintain maintain. Law weight only lose simple maintain first.	1.3	6250496
222	238	4	1.8	Away agreement keep college important manager.	1.4	3667968
326	636	4	2.0	\N	0.9	7873536
189	736	10	0	\N	1.4	118784
64	545	4	2.7	Likely safe many close certain art there. May yourself when million peace small positive.	0.6	5097472
49	938	8	0	\N	1.0	3035136
237	280	4	1.6	\N	1.5	6499328
295	940	4	2.1	\N	1.8	6629376
158	263	5	0	\N	1.8	7211008
182	900	9	0	\N	1.2	5335040
37	567	9	0	Rock effort tax focus support goal middle.	1.4	2007040
243	566	4	0.7	\N	1.4	5027840
31	217	9	0	Rate tough turn will end.	1.9	7817216
86	174	4	1.9	Capital indeed apply success station let friend.	1.8	1893376
207	314	1	0	\N	0.8	7214080
319	899	8	0	Company vote officer man tend water.	0.5	1888256
15	144	4	2.7	\N	1.5	2462720
54	791	10	0	Decade budget majority mouth commercial. Clear red drop.	1.4	1785856
15	134	1	0	Especially half gas ever beyond. Production seek shake someone opportunity response list not.	0.9	3479552
265	886	4	1.9	General fire beautiful. Enough new blue former according.	0.9	2460672
27	735	4	1.8	\N	0.8	5550080
218	762	1	0	\N	0.8	3441664
104	815	7	0	\N	0.6	270336
156	428	4	2.4	Happy investment condition entire. Door throw stock age.	1.9	5334016
267	313	10	0	Sing because decision myself change entire. Stay trouble give relate exist song energy.	2.0	6659072
48	369	4	1.5	Other table point tax. Sea find example memory every north.	1.5	6480896
234	161	4	1.6	Wife him avoid lawyer certainly physical debate across.	1.3	1185792
225	327	6	0	Guy shake toward along.	1.5	3123200
111	786	6	0	Career often stand television letter see hospital throw. Require speak line still last.	1.3	4940800
300	343	4	2.9	\N	1.0	7014400
318	210	4	2.8	Particular result source institution.	2.0	6681600
228	97	4	1.4	\N	1.4	2852864
141	483	4	1.9	Democratic get value general. Tax fact serious ready take have color.	1.1	4528128
9	233	5	0	Skill early recognize conference school film look. Experience role occur society arrive little.	1.6	3908608
158	271	4	0.3	\N	0.8	4922368
66	901	5	0	\N	1.8	5482496
172	265	6	0	Machine let star nice peace plan leave.	1.4	500736
309	297	4	2.4	Return different very.	1.5	1664000
313	104	6	0	Improve area expert task feeling it.	1.3	6757376
139	344	4	2.7	Free class trial me. Inside these water room prove hope moment.	1.7	542720
125	649	4	1.3	Language next president just marriage per management.	0.5	7567360
199	95	1	0	\N	1.0	7040000
289	939	4	1.8	\N	1.6	2790400
306	218	4	1.7	\N	1.3	8286208
85	298	3	0	Recently personal shake cover learn seem yes. Conference economic even final bank term evidence.	1.1	8079360
230	187	4	2.8	\N	1.8	6610944
294	143	4	1.5	\N	1.0	7786496
321	137	1	0	Speak ten ask eight process single year long. Moment near soon.	1.4	6587392
315	507	4	0.6	Policy work city whose anyone one decision.	1.8	7003136
326	630	9	0	Game there tend school low price start.	1.3	7750656
322	684	4	1.0	\N	1.7	434176
2	736	8	0	He from future full agreement fish present.	0.5	8252416
234	165	5	0	\N	1.4	7000064
31	220	4	2.8	\N	1.3	2110464
161	238	4	2.2	Form inside church draw.	1.4	7764992
196	746	6	0	\N	0.8	7372800
115	128	4	2.8	\N	1.6	2353152
156	443	4	1.1	Character alone author store fill population.	1.7	6747136
7	776	9	0	Central push least. Save realize there carry around.	0.6	4225024
82	661	1	0	\N	1.6	7369728
256	793	4	1.9	Who want meeting none represent mother look.	1.1	5439488
215	863	4	2.7	Provide cut strong level minute. Parent religious heavy establish morning.	1.3	8282112
104	805	4	1.7	Mean minute image time wife.	1.1	6168576
233	465	4	1.4	\N	0.6	2803712
35	353	4	2.9	Ground just part continue station dog. Go mouth exactly information building world win.	1.6	1846272
156	436	4	0.1	Miss life table close fight require show.	1.9	8228864
256	779	4	1.3	Have nice plan hair if.	0.9	5174272
322	695	9	0	\N	1.1	244736
158	261	4	0.1	Level boy different short.	0.8	5977088
126	407	4	2.1	\N	0.8	8026112
313	111	7	0	\N	1.2	1541120
262	5	4	1.4	\N	1.4	5178368
170	296	8	0	\N	0.5	7326720
157	232	4	2.9	\N	1.2	7208960
35	354	4	2.0	Red way poor piece concern.	1.0	6739968
5	743	1	0	Language meet ok model difficult.	0.7	7976960
148	25	4	1.9	\N	0.8	3604480
177	755	4	1.4	\N	1.9	7597056
203	332	4	1.1	\N	1.2	8040448
2	729	5	0	\N	1.2	7576576
8	646	4	0.6	\N	1.4	677888
255	582	4	2.5	\N	0.6	5479424
46	271	4	1.1	Serious fill must finish detail. Democrat when dark spring happy option.	0.7	3633152
113	702	4	1.6	Civil above specific personal nor indicate toward.	1.0	189440
280	843	5	0	Person ready condition this debate available.	1.5	4588544
300	347	8	0	Next four money recently debate face reason movement.	1.9	2087936
172	273	4	1.4	Support far product hope never.	1.0	4074496
146	170	1	0	\N	1.3	436224
250	29	7	0	\N	0.6	3048448
228	113	3	0	Information option natural develop.	1.9	2870272
86	168	10	0	\N	1.5	3377152
127	659	5	0	\N	1.8	3129344
137	114	9	0	\N	2.0	3695616
21	279	4	2.4	Always charge job wife push race.	0.7	3659776
308	367	4	2.0	Push garden up along as eight with. Effort student edge factor put feeling attorney.	1.5	1012736
254	718	6	0	\N	0.8	2457600
320	496	8	0	\N	1.2	7273472
42	473	4	2.6	Budget participant action thousand. Door wonder deep arm state century hand wait.	1.6	4028416
90	31	4	1.6	Entire why guy since fill.	1.5	6237184
15	145	1	0	Strong answer art reflect fill.	1.0	7430144
293	583	4	2.5	\N	2.0	7335936
185	292	4	2.5	Drop ever land drive the. None practice who seek success true.	0.5	4604928
121	344	4	1.7	\N	0.8	1884160
234	159	5	0	\N	0.8	2688000
190	673	3	0	\N	1.9	7615488
255	575	4	2.4	\N	1.6	4793344
10	430	1	0	Score land admit door left my rest.	1.0	6769664
51	748	8	0	\N	1.5	4194304
164	796	4	0.3	Pm she process majority expect. Probably list management marriage seem tax.	1.1	3593216
96	361	1	0	\N	1.5	8284160
244	397	3	0	\N	1.5	4352000
26	64	4	1.5	\N	2.0	4321280
154	698	4	2.8	Plan do that agency fund minute available.	1.6	3638272
3	422	4	2.3	\N	1.9	2259968
117	936	3	0	Certainly she seven garden knowledge hour play.	0.7	6204416
194	767	1	0	\N	0.6	171008
40	379	4	2.9	Carry cell deal risk anything environment address.	1.5	5456896
208	128	8	0	Language fear pass. Board research create themselves.	1.4	5406720
242	68	1	0	Candidate five dream little option clear campaign.	0.7	804864
148	6	4	2.6	Chance image market down meeting.	1.9	4975616
30	485	10	0	\N	1.8	2503680
139	347	4	1.4	\N	0.7	2732032
294	140	5	0	\N	1.6	844800
312	227	4	2.5	\N	1.3	676864
24	32	7	0	\N	1.9	3916800
151	399	1	0	Decision chance eight production commercial.	0.6	5603328
243	565	4	1.5	Most treat should necessary seem size. Note too class walk himself generation.	1.8	2592768
53	280	4	1.6	\N	0.7	3843072
155	66	4	1.0	If animal per still protect special garden.	0.5	864256
258	936	7	0	\N	1.0	2197504
287	363	4	2.3	Doctor no character teach group management manager reach.	1.6	305152
209	637	10	0	\N	1.8	2287616
316	60	9	0	Charge consider prove every trouble agreement choose.	1.8	706560
325	541	3	0	Clearly guy go television garden need. Piece office standard which national amount western realize.	1.2	2712576
281	510	6	0	Yeah low move beat myself.	1.0	7785472
285	853	4	0.8	Again prevent manager sell program nice write.	0.5	4305920
33	975	4	2.1	\N	1.5	4960256
318	203	1	0	\N	0.8	6132736
7	772	6	0	\N	1.0	5840896
137	132	5	0	\N	1.3	3911680
168	286	10	0	\N	1.7	5144576
58	960	4	2.3	\N	1.9	3743744
55	561	4	2.8	\N	1.8	7580672
141	476	4	2.9	\N	0.7	921600
228	112	4	1.9	\N	1.6	8207360
299	978	4	0.3	Compare require religious collection determine ahead spend. Break thousand safe room protect.	1.4	254976
32	487	4	2.9	Administration wind democratic Mrs seek if central. Short between together deal much data fire.	0.8	4302848
218	758	4	1.7	Suggest account save president wait. Capital nearly already page see than true.	1.2	7591936
160	170	4	0.4	\N	1.1	187392
64	557	9	0	\N	1.6	2519040
86	175	1	0	\N	1.1	6859776
37	566	5	0	Room he race green case.	0.5	7375872
129	403	7	0	Near inside right consider cell.	1.5	3530752
198	895	3	0	\N	1.9	2830336
198	900	4	2.6	\N	2.0	457728
235	269	9	0	Western seek fight him.	1.2	7132160
241	700	5	0	Different present you.	1.6	7055360
141	475	10	0	Anyone lot figure become.	0.9	2888704
245	39	9	0	\N	1.1	6499328
109	116	4	1.9	Care voice cultural able PM.	0.7	737280
218	755	4	1.4	More next population.	1.2	7714816
21	284	6	0	Wall nearly remain everybody agent window.	1.7	7984128
42	483	3	0	Collection part loss morning into put seven. Thus toward continue mind bring color institution.	1.2	5433344
30	490	4	2.0	Road performance much loss call similar suffer.	0.5	5309440
46	267	4	1.8	\N	1.2	6790144
83	433	5	0	\N	1.6	3512320
158	266	7	0	\N	1.3	5349376
105	513	4	1.1	\N	1.2	6524928
195	505	7	0	Cost wind special bank.	0.7	6999040
279	950	4	1.9	Executive development picture deep professor assume him see.	1.7	5059584
326	624	1	0	Morning camera else suddenly dinner watch.	0.7	4930560
325	537	4	1.4	\N	1.3	2781184
230	192	7	0	Growth own south miss.	0.9	5285888
313	101	4	1.2	Especially reflect easy writer use.	1.1	4571136
192	49	4	1.9	\N	1.7	2143232
93	136	6	0	\N	1.1	6241280
209	630	4	1.3	\N	1.6	5787648
306	217	10	0	Free focus make usually. Director hair arm fly political wish yeah some.	1.3	5804032
83	441	4	2.0	Company doctor glass model simply. Go year yeah.	1.6	6257664
164	801	4	1.5	\N	1.3	6422528
5	745	6	0	\N	2.0	6595584
313	103	4	2.3	Need fast enough perhaps wide learn pull.	1.6	4794368
160	166	4	0.7	You have fall like.	1.5	6900736
24	23	4	0.5	Both executive culture receive former similar.	1.1	3007488
58	978	4	1.5	Own prove computer outside for miss. Measure understand scientist off debate management section clearly.	1.9	2015232
83	459	7	0	\N	1.6	4964352
115	133	4	0.2	Garden cut partner manage health store official.	1.7	2910208
49	935	8	0	\N	1.1	2309120
19	638	4	2.9	\N	0.7	4621312
55	549	4	1.2	\N	1.3	1377280
60	729	1	0	\N	0.5	5172224
104	795	4	2.5	\N	1.9	7701504
256	789	4	1.2	Option feeling draw police discover perhaps.	0.8	5466112
259	120	7	0	\N	0.7	6949888
103	209	8	0	\N	0.9	2170880
19	633	4	0.5	Nature police friend affect report travel.	1.2	3559424
90	7	4	1.6	\N	0.7	5096448
129	408	4	1.7	Main fund blue door pattern news. Stay natural type.	0.9	1805312
137	125	10	0	\N	1.4	6130688
138	420	4	2.8	\N	1.2	1909760
193	143	4	0.7	Above early everybody dog policy.	0.6	7830528
2	735	4	2.5	\N	1.6	3082240
190	678	4	1.3	With analysis use about too build ever. Cover realize green serious air around.	1.7	2345984
241	703	4	2.1	Never usually clearly important yet say American.	1.8	7957504
184	44	4	1.1	\N	0.7	974848
301	568	4	0.6	\N	0.6	3251200
5	739	3	0	On customer actually whole everything forget must notice. Product senior instead good office officer.	1.1	3216384
247	158	4	2.2	\N	0.7	2360320
253	406	1	0	Try president chair cause without relationship capital.	1.4	5916672
25	505	7	0	Able base that marriage wonder after husband later.	1.8	6470656
263	278	4	1.4	Wrong owner table practice.	1.0	5105664
64	540	4	1.2	\N	0.8	3999744
155	81	7	0	Civil wonder piece will foot bad.	1.6	6856704
73	501	4	1.9	\N	0.8	3650560
234	160	7	0	Where address suffer hit.	1.0	116736
152	292	4	2.2	\N	1.9	162816
181	339	5	0	\N	1.4	4510720
281	497	4	2.3	Already prepare figure argue anyone computer.	1.9	1536000
33	962	4	1.1	Easy may new training weight simply need upon.	0.5	2817024
270	140	6	0	\N	1.6	2656256
106	279	4	0.3	\N	1.9	5294080
116	570	9	0	Available human production out benefit.	0.9	7455744
33	977	4	0.3	\N	1.8	7536640
47	751	4	2.9	\N	0.6	5861376
86	153	6	0	\N	1.0	4734976
282	966	4	2.9	Debate question seven big health. However analysis sound parent early her few.	0.9	7200768
161	243	6	0	\N	1.9	6772736
119	860	5	0	\N	0.9	7090176
17	969	1	0	\N	1.7	1528832
208	132	9	0	\N	0.9	3215360
80	823	4	0.1	\N	0.9	7373824
132	335	4	1.6	\N	1.6	2584576
72	620	10	0	\N	1.5	1613824
26	73	4	0.5	\N	0.9	5170176
10	437	1	0	Effect when run.	1.8	2275328
190	680	4	1.4	\N	1.7	6230016
78	870	4	2.5	\N	1.4	5786624
168	289	4	1.0	Reduce case computer author.	1.2	4668416
139	349	4	2.6	Truth anything project specific clear voice. Son Congress week fight PM real.	1.4	7653376
251	611	6	0	Evidence career leader daughter.	1.0	2996224
276	373	4	1.5	Else seat management hit town vote compare.	1.3	8224768
195	514	4	2.8	\N	1.7	2723840
293	591	4	1.1	Win down song party. Around west day shake end some light.	1.6	4009984
54	780	3	0	Pm interesting health go group put nation. Onto last race evidence.	0.5	3406848
164	806	6	0	\N	1.6	4371456
56	892	4	0.2	\N	2.0	2978816
58	965	5	0	Present war Mrs.	1.4	5480448
110	342	9	0	\N	1.3	3590144
121	350	5	0	\N	1.7	1044480
172	274	8	0	\N	1.1	626688
155	84	4	2.6	\N	0.8	405504
263	267	4	1.5	Event everything major safe fear.	1.6	2374656
227	938	7	0	Increase fear whatever call. Reflect want new remain practice news.	0.6	5159936
266	936	5	0	\N	1.8	4493312
296	451	10	0	Significant join middle author loss foreign. Receive management lot every policy.	1.6	3965952
292	729	4	1.5	Skin sell analysis wonder staff garden unit way.	1.8	4809728
9	235	4	2.1	\N	1.0	1444864
142	663	4	1.9	See perform most long bank policy.	1.0	2904064
261	278	3	0	\N	0.8	7088128
263	265	4	1.3	Wall staff receive shake magazine upon. If conference early often be television.	0.9	4699136
304	348	4	1.8	Throughout laugh remain job.	1.5	6166528
127	661	4	2.4	Probably husband friend decide arm thing near. Minute throw Congress itself nature less exactly.	1.6	7322624
167	598	4	0.8	\N	0.6	6474752
215	861	4	1.9	\N	1.7	5945344
190	693	8	0	Herself fight stay down international cup take left.	1.8	7270400
318	204	4	2.6	\N	0.7	4188160
102	776	1	0	\N	1.8	2768896
197	132	4	1.6	Tv teacher third win public they administration.	1.8	6051840
255	579	4	2.6	Yeah yard central agreement seat discussion. Once certain Congress pretty.	1.1	7452672
95	404	4	0.8	Say personal environmental fly easy physical guess. In old skill.	1.8	4345856
137	123	4	2.3	\N	0.6	2876416
88	588	4	2.0	\N	1.1	4347904
284	121	4	2.8	\N	0.7	1312768
22	473	4	2.6	\N	1.6	8022016
90	42	9	0	Front on personal police.	1.0	1836032
224	298	5	0	Medical current series myself challenge.	1.6	2948096
306	221	4	2.7	Front federal difficult industry I a seat. Market health seven relationship.	1.3	6868992
203	329	5	0	\N	1.1	5023744
105	506	4	2.9	\N	2.0	5779456
76	360	6	0	\N	1.6	2540544
9	244	4	2.8	Wife rate seven position area increase. Audience suddenly operation dinner write.	1.9	7221248
160	175	4	1.3	\N	1.7	5835776
245	19	4	0.5	\N	1.1	4148224
52	327	4	2.9	Top history factor between writer specific never bag.	1.6	5467136
67	377	10	0	Heart north job benefit machine however.	1.8	2181120
90	6	4	2.6	Town least dog yet.	1.3	4620288
224	316	4	1.0	We three father discover only himself. Moment team exactly human thought computer.	0.8	3351552
168	290	8	0	Staff hit either evening figure. Table leave available return common entire analysis.	1.5	3571712
236	700	4	1.5	\N	1.5	6976512
61	721	10	0	\N	0.9	1336320
287	357	6	0	\N	1.5	4154368
245	9	4	1.5	Out indeed thus church door almost. Believe lay suddenly I.	1.1	3566592
151	390	4	1.6	\N	0.7	4709376
221	824	7	0	Measure ten PM boy reach.	0.6	6469632
53	279	1	0	Else trip manage option describe lot outside. Form company young serious page.	1.9	1295360
72	625	8	0	In population blood. Over speak interest shake put voice.	0.8	6899712
13	893	4	1.0	\N	1.6	3151872
97	644	4	2.9	Quality market red difference wall plant.	1.6	7387136
65	284	4	1.1	Future brother kitchen since. End cup range thus size specific push.	1.2	6132736
147	322	6	0	\N	1.0	3918848
208	124	4	0.9	Focus so note no name. Federal according with national series.	1.3	4880384
199	111	5	0	\N	0.9	215040
90	27	4	1.0	\N	1.7	3239936
36	758	4	1.7	Garden since out draw follow participant eye.	1.3	3393536
156	438	4	2.8	\N	1.9	7739392
30	481	7	0	\N	1.3	217088
155	69	4	2.2	Sport money some cup. Shoulder actually allow head high station pass final.	1.1	7281664
194	769	5	0	\N	1.8	3904512
3	416	4	1.1	Hotel wind every response moment then.	1.3	8275968
286	924	4	2.9	Town music should least treat American similar.	1.1	4737024
303	806	10	0	\N	0.9	5064704
43	864	4	1.7	According family factor father media machine should.	1.5	5042176
98	343	4	2.9	\N	1.9	2681856
36	762	1	0	\N	1.2	400384
284	118	3	0	Current region who personal. Color baby very party keep.	1.2	5671936
36	753	4	0.6	\N	1.5	2258944
85	304	7	0	\N	1.6	4792320
293	575	8	0	Development stand year tonight film.	1.0	4462592
167	600	1	0	Test stay area lay through at.	1.7	4234240
49	936	1	0	\N	0.9	305152
90	21	4	1.3	Similar huge although gun.	0.8	4021248
46	277	8	0	\N	1.1	5196800
192	47	4	1.7	Television skill after nor section.	1.2	2233344
17	985	6	0	Everything health professor. Friend start hear girl particularly soldier.	1.8	929792
95	406	4	1.8	\N	1.3	6061056
125	646	8	0	\N	0.7	3067904
17	971	4	0.2	Message beyond million school.	0.8	6375424
250	22	4	0.6	Point into help huge.	0.7	7347200
5	738	7	0	\N	0.7	2204672
83	447	4	2.2	\N	0.6	3689472
245	12	4	2.1	Old out week understand pretty.	1.3	3748864
17	979	4	1.8	Wife their that alone interview interest.	0.6	7393280
13	879	4	2.0	\N	0.7	6988800
66	905	10	0	Eat together trip.	1.8	6124544
234	162	4	1.6	Move reveal across everything bed.	1.4	4216832
273	336	4	1.5	Billion TV it light direction. Day I sound hundred.	0.9	7472128
288	599	4	1.4	Red senior win leg health former along.	0.8	7182336
13	883	4	1.8	\N	1.6	8118272
315	508	10	0	\N	1.3	2046976
42	487	1	0	\N	0.6	1460224
71	787	4	2.0	Up hear suddenly explain drug popular.	1.7	3202048
41	538	6	0	\N	1.7	7657472
308	372	1	0	Thus writer forget bed could.	0.8	483328
209	622	4	2.5	Dark authority child hit second.	1.8	858112
307	891	9	0	Else dark control huge seat operation tree. Interesting rate however.	0.8	2469888
29	571	4	1.8	Tree realize return can with chair.	0.7	7804928
17	961	4	2.6	Across smile skill approach happy thousand policy.	0.6	5146624
119	854	4	2.8	\N	0.7	7103488
147	324	4	0.1	\N	1.8	6421504
209	629	4	1.0	\N	1.6	7954432
234	154	4	2.1	\N	0.5	2527232
321	148	4	1.7	Finally model garden situation.	1.1	7739392
43	853	7	0	We crime job fire.	1.5	712704
144	705	8	0	\N	1.3	1827840
184	59	7	0	\N	0.7	8148992
299	974	4	1.0	\N	1.7	6438912
215	851	4	1.6	\N	1.0	2700288
101	763	7	0	\N	1.8	8043520
34	338	4	1.9	\N	1.2	7716864
172	260	10	0	Once might follow life. Perform television find assume building poor kind.	0.7	5916672
38	772	4	2.7	Tell us two item until.	1.7	1141760
148	27	4	1.0	Whether describe fact laugh affect specific international.	1.7	6721536
183	239	4	1.2	Economy country just nature buy process I.	0.6	7640064
97	645	4	1.3	Shake land ago top trip analysis yes.	0.8	2363392
256	788	4	0.8	\N	1.8	565248
325	563	9	0	\N	1.9	7872512
285	861	7	0	\N	1.2	6585344
205	81	6	0	Quickly go officer black determine soldier.	1.2	3231744
267	314	9	0	\N	1.7	8148992
155	79	1	0	\N	1.4	1551360
29	581	9	0	\N	1.8	7950336
48	380	7	0	\N	1.4	1757184
206	708	4	1.4	\N	0.7	1455104
312	218	6	0	Family memory building so throw. Cold care school else Congress stage lead door.	0.5	3050496
23	270	4	2.4	\N	0.5	7249920
57	851	4	1.6	\N	1.2	8160256
291	131	4	1.9	Strong ahead lay seem story.	1.1	2686976
167	601	4	2.6	Dream sell size often.	1.0	7744512
190	681	6	0	Where subject high political pay American sister.	1.1	7343104
2	728	4	0.6	\N	0.6	7473152
322	664	9	0	\N	1.2	228352
133	708	7	0	\N	0.6	7925760
219	350	10	0	Knowledge focus leg believe also mouth.	1.1	4020224
71	786	4	1.8	Capital ok discover building.	0.7	6232064
160	152	1	0	Rather cup at subject. List enter provide care long sister beat.	1.5	4690944
166	225	1	0	Your magazine life.	1.9	3351552
180	337	4	2.9	\N	0.9	1296384
204	204	4	2.6	\N	1.7	6287360
46	263	4	2.9	\N	1.0	6148096
318	214	5	0	Board five personal letter enter record list.	0.8	5925888
15	137	4	1.6	Top himself skill during if author. Wish today image firm task drive measure.	0.8	2038784
67	379	1	0	\N	1.9	4018176
68	254	10	0	\N	1.9	1037312
303	801	4	1.5	\N	0.7	1582080
321	147	10	0	\N	1.9	3680256
221	817	4	1.9	According serve meet.	1.6	1768448
190	675	4	2.5	Base wear community tonight generation.	0.7	2122752
165	217	9	0	\N	1.8	7408640
303	813	4	1.6	Leg poor region drop benefit.	0.8	4907008
42	493	1	0	Human article education reduce. Again policy same cost during management two tell.	0.5	5516288
156	457	4	1.8	\N	1.0	1648640
190	677	4	1.8	\N	1.0	5444608
242	89	9	0	\N	0.8	2475008
265	877	8	0	Answer green report service with national lawyer.	1.5	4495360
38	773	5	0	\N	1.0	1722368
41	561	1	0	\N	0.8	766976
137	122	8	0	Until them sit interest ago before. Mean imagine list cup.	1.5	6585344
245	7	3	0	Teacher page understand citizen consumer down represent.	1.6	2417664
245	34	4	1.1	Increase box respond cultural bill whatever bad. Chance ok stay then possible training ago.	1.6	2152448
56	888	4	1.0	Office drop responsibility maintain either how leg. Development pay debate general ever reality.	1.6	289792
60	733	4	2.5	\N	0.6	5552128
57	853	8	0	\N	0.8	1235968
109	124	4	0.3	Magazine where campaign occur these whole former. Main staff white movie fill your compare.	1.0	2948096
269	332	4	1.1	\N	1.8	1141760
255	586	1	0	Him bed down view get mouth.	1.9	2152448
319	896	4	2.9	\N	0.6	5091328
179	743	10	0	\N	1.8	633856
158	273	4	1.4	Crime what everyone feeling program single.	1.2	7310336
209	618	5	0	Suffer reduce subject make name return. Often yeah dog next.	1.1	2649088
205	72	3	0	Exactly feel go have sense blood drug career.	1.4	4366336
164	814	3	0	\N	1.6	6181888
207	311	4	0.5	\N	1.6	4261888
190	692	4	1.1	\N	0.9	3584000
247	167	10	0	Parent if few side.	2.0	3419136
264	133	4	2.8	\N	0.8	332800
242	86	3	0	\N	1.9	2723840
78	877	4	1.9	\N	1.4	1305600
14	971	3	0	Others decision both reflect because.	1.1	6518784
30	473	7	0	\N	0.8	641024
235	273	4	1.4	World forward create run born stop could.	1.1	650240
33	967	7	0	Listen fine nice a wide home involve.	0.5	7596032
230	197	5	0	\N	1.2	4160512
26	68	4	1.3	\N	1.2	3737600
221	819	8	0	\N	1.2	3569664
277	92	4	2.4	Good only party like whole factor me.	1.4	7402496
72	615	4	1.0	Wide building light owner full.	0.9	1429504
97	646	4	0.1	\N	1.0	1179648
160	163	9	0	Against activity still.	1.9	4652032
3	419	7	0	Security traditional section second. Democrat drive suggest capital cost raise.	1.0	3115008
114	701	7	0	Mrs actually perform. Water board hold listen effect spring wear.	0.9	5549056
250	28	1	0	\N	1.7	3051520
104	807	7	0	\N	0.8	5084160
88	578	4	0.9	Cost teacher give fine visit.	0.9	1591296
247	151	4	2.8	\N	0.8	4915200
234	163	9	0	\N	1.1	4472832
137	126	4	2.9	\N	1.3	6563840
278	252	4	2.4	\N	1.7	4052992
244	381	4	1.5	Color never production concern heavy option.	1.2	7612416
300	342	10	0	Perhaps laugh note. Exist ago office white direction recognize heavy.	1.4	8219648
125	652	4	2.9	\N	0.6	3777536
110	346	9	0	\N	0.9	5821440
112	5	4	1.4	Open people section organization.	1.5	4198400
84	472	5	0	\N	1.2	4067328
61	722	6	0	Yard cut record offer consumer defense.	0.8	1516544
250	8	4	1.6	\N	0.6	1525760
288	598	4	1.2	Reason claim affect those beyond discuss black.	0.8	6343680
276	372	4	0.5	\N	1.4	8247296
267	316	8	0	Firm site might always.	1.0	6943744
10	449	4	1.5	Also dog from pretty.	1.6	2618368
25	506	4	0.1	Car woman simple fast.	1.1	1125376
146	172	4	2.6	\N	1.9	1703936
55	535	4	0.5	\N	1.6	6694912
162	659	8	0	Stand heart entire live happy social mission. Authority way sound evidence station series nature.	1.1	2544640
66	903	4	1.5	Hear prepare social adult each rule. Ground expert simply particularly usually.	0.7	6029312
283	292	4	2.5	\N	1.1	8250368
294	144	4	2.7	\N	1.5	7740416
177	757	3	0	Address loss born either measure receive hold.	1.7	736256
48	368	6	0	Technology dog strategy ready which religious business not. Political actually may help particular probably their.	1.2	1024000
169	782	7	0	Interest note evidence hour local exist mission. Receive who garden tonight.	1.4	2772992
233	460	9	0	Push require state will material bag send.	1.1	1953792
279	941	4	2.2	\N	1.8	3127296
72	634	4	2.1	Themselves more face suggest back pattern.	1.1	1205248
229	262	9	0	\N	1.7	1184768
43	855	9	0	\N	1.6	2452480
156	435	4	2.3	\N	1.4	1508352
304	351	4	2.1	Involve view analysis instead before.	1.1	7768064
190	687	8	0	\N	1.0	6446080
72	637	1	0	Study three no picture miss hear.	0.8	2323456
205	86	4	2.3	Box south represent program have idea. Something military them structure decision news marriage.	1.2	4493312
96	360	4	2.4	Those simply control word theory how.	1.1	4871168
129	406	7	0	Rich trouble bank reduce subject full long.	1.6	2557952
311	282	3	0	Minute dark matter.	1.0	1085440
222	240	4	2.9	\N	0.9	2652160
275	793	4	1.9	\N	1.2	3003392
58	958	10	0	\N	0.9	3621888
251	610	6	0	Trip hand big free audience operation wait. Improve yourself wall city.	0.9	5710848
230	186	8	0	\N	1.8	5918720
14	959	4	2.0	\N	0.6	229376
128	720	4	1.1	\N	1.7	3999744
138	411	8	0	\N	1.1	5229568
164	812	4	1.1	\N	1.7	4308992
84	481	7	0	Successful hope theory while too everyone himself.	1.7	1650688
15	135	10	0	Able drug occur appear. Have memory respond able wife but.	0.7	8010752
213	933	4	1.9	\N	0.6	3222528
107	862	5	0	Wife TV but peace never you after military.	0.5	2157568
299	973	4	1.4	Challenge investment it citizen. Eye bit water sound much.	1.6	4970496
230	179	3	0	Another house investment.	1.3	5536768
103	204	10	0	Too water consumer third draw environmental.	1.4	1775616
78	876	4	1.0	Result computer out hospital gun church according age.	1.4	2435072
144	698	10	0	\N	1.9	332800
284	120	4	2.7	\N	1.6	3456000
316	56	4	1.3	President Mrs leg cause.	1.4	832512
71	790	9	0	Race director poor debate quality growth.	1.9	7748608
164	795	1	0	\N	1.6	1596416
200	742	4	2.7	Get personal brother much base.	0.6	1986560
29	578	1	0	\N	1.3	5884928
270	137	5	0	Card lose security deal say.	0.5	5385216
129	404	8	0	Work kid big ago chair.	1.1	3989504
57	868	4	1.6	\N	1.1	6111232
155	67	5	0	\N	1.8	7803904
233	468	4	1.1	Might security artist save three. Arm wait teacher force little poor.	1.6	7491584
245	15	1	0	\N	0.5	6789120
281	509	3	0	\N	0.7	2934784
247	161	1	0	Speak early size summer price civil. Nearly performance meet follow so.	1.1	7984128
242	67	4	0.6	To argue alone seek member staff month.	1.2	5673984
190	694	4	2.9	\N	0.5	3894272
176	566	4	2.1	\N	0.5	2866176
203	323	4	2.3	Federal already crime field its fish machine.	1.7	3109888
221	821	3	0	Herself step special ten responsibility crime.	0.8	6978560
242	75	4	1.4	Could break instead spend change one team. Letter hope you seek.	1.6	2087936
276	365	1	0	Certainly develop front military.	0.9	3223552
24	40	5	0	Charge along success.	1.8	3930112
146	165	7	0	Important answer car wrong line fish art amount. When deal money especially several day think.	0.6	1981440
320	472	4	1.7	\N	1.0	3526656
205	65	4	2.3	Name good start production benefit.	1.9	5228544
295	943	4	2.1	Top clear according.	1.5	2571264
305	282	8	0	Life final air situation modern customer.	1.3	5230592
148	18	4	1.6	Mother gas huge month ahead.	1.6	1777664
104	798	10	0	From later product sound. Beyond police school might edge final reach month.	1.6	5664768
132	325	4	1.8	Public enjoy support air take peace. Develop main heart per number century.	1.7	2154496
137	118	4	1.4	\N	1.7	6111232
170	287	4	1.9	\N	1.8	3462144
245	25	7	0	\N	1.4	7458816
265	879	9	0	\N	1.2	405504
306	219	10	0	\N	0.9	5805056
133	713	7	0	\N	1.9	5614592
90	12	4	2.1	Choose century more detail relate game.	1.2	6700032
202	815	6	0	\N	1.3	1480704
279	944	9	0	\N	1.6	3468288
48	376	10	0	Almost word development more agree together.	0.8	4509696
40	377	6	0	Care time what purpose feeling tonight law.	1.0	7398400
126	408	3	0	Thousand thing fast edge.	1.7	836608
68	252	4	2.4	\N	1.1	807936
110	351	4	0.7	Author apply age avoid change understand.	1.9	1062912
222	229	4	1.9	Sea part really them. Himself medical Congress political control.	1.5	3763200
86	161	4	1.4	Resource quickly civil spring.	0.8	2682880
83	457	4	1.8	\N	1.9	7436288
186	742	4	2.7	Citizen likely remember artist professional second good purpose.	0.5	2260992
248	939	4	1.8	\N	0.7	3707904
169	791	10	0	Present find Congress majority use other decide.	1.3	5659648
292	725	4	1.1	\N	1.5	7264256
157	233	4	1.3	Next finish win begin reduce.	1.9	3732480
303	800	9	0	Box because wear.	1.9	1906688
282	965	10	0	\N	1.8	2336768
258	939	4	1.8	Four too cover none protect meeting.	1.5	6157312
52	330	6	0	Represent find base several eight.	0.5	3109888
14	968	4	2.1	Often center world ability different best security. Team owner possible onto some.	0.8	529408
107	859	3	0	Respond exist if training weight nature.	0.6	7093248
268	616	4	0.4	\N	1.7	954368
189	732	4	1.0	\N	0.9	2643968
233	470	7	0	\N	1.8	7414784
56	878	1	0	Keep best learn fish something.	2.0	5937152
130	404	1	0	Individual somebody ground service.	0.9	3415040
170	289	4	0.6	\N	0.9	4330496
109	118	4	0.8	Which say subject deep special produce sort together.	1.8	7024640
190	674	3	0	Information hundred gun anything fall do meeting.	1.6	2437120
242	93	3	0	\N	1.4	5924864
169	779	4	1.3	Budget better free avoid open memory person evidence.	1.1	919552
297	525	1	0	\N	1.5	7493632
207	307	4	0.6	\N	0.9	1817600
63	773	8	0	\N	0.8	1044480
102	773	1	0	Head standard study doctor white.	1.1	2892800
141	473	10	0	Box line strong practice everyone assume population. Traditional outside less research else call.	0.5	3565568
211	253	4	1.2	\N	1.8	5087232
229	269	4	0.8	Bad structure million project way.	1.7	6005760
252	957	8	0	\N	1.6	7689216
287	358	4	1.7	\N	0.6	1152000
285	863	4	2.7	No dinner education environmental picture mother.	1.2	2850816
156	441	4	2.9	\N	2.0	3399680
134	412	10	0	Real develop car push out.	0.9	3864576
255	580	4	1.5	Business road wind.	1.2	2707456
268	621	1	0	\N	1.7	2079744
132	334	9	0	View body early word race thought.	1.7	7274496
190	672	9	0	\N	1.8	2091008
99	362	4	2.8	\N	1.6	1989632
255	578	4	0.4	\N	1.5	6215680
81	743	4	1.4	\N	0.7	6551552
149	404	4	2.9	\N	1.8	1251328
13	872	8	0	\N	0.8	2731008
143	210	6	0	\N	1.9	6226944
195	507	8	0	\N	1.9	8210432
320	485	9	0	Character even my positive we contain for wait.	1.3	8251392
125	643	4	1.4	Black throughout show series his message.	1.0	2899968
149	405	4	2.7	\N	1.0	7331840
188	737	4	2.2	Accept understand thought really skin nation.	1.2	5861376
245	35	10	0	\N	0.9	1968128
220	715	4	2.8	\N	0.9	1756160
224	308	4	2.6	Direction capital while prove inside thank level.	0.5	448512
84	479	4	2.2	\N	1.3	5113856
191	340	4	1.6	Let stop role management people sea.	1.9	7881728
42	491	6	0	Commercial reflect operation agent major grow.	0.9	7290880
325	543	4	1.4	\N	1.7	6511616
234	171	4	1.2	Resource here ground rather low letter bit science.	2.0	7996416
51	751	7	0	Expect half late than occur film image.	1.9	2486272
193	142	1	0	Take much last Republican.	1.3	3527680
276	375	4	1.3	\N	1.9	4196352
105	508	4	2.9	List case player same example hear nor.	1.3	1905664
263	268	10	0	\N	0.6	3090432
58	964	4	2.9	Inside no total seem majority example week explain.	1.3	826368
73	499	4	1.6	Budget democratic condition significant.	1.5	971776
91	926	1	0	\N	1.6	5230592
284	133	4	1.4	Assume meet group food.	0.9	667648
148	35	3	0	Pass ago why.	1.1	6403072
316	45	8	0	\N	1.2	6011904
104	802	5	0	Painting improve she value week.	0.7	192512
231	659	4	2.0	\N	0.6	2336768
42	479	1	0	Hard item century agree degree get run.	1.7	7168000
271	506	7	0	Game kitchen few citizen. Bit upon music support sister resource tell.	0.9	3872768
320	490	4	2.0	Authority list fly community necessary.	1.7	3043328
236	702	7	0	\N	1.5	6676480
274	766	4	1.1	Miss teacher produce people themselves.	1.2	5373952
271	501	8	0	Economic although major.	1.9	7228416
186	747	4	0.2	Explain future identify create politics.	1.9	5903360
84	488	4	2.7	Alone Democrat lose main either rise fast.	1.6	6665216
179	740	4	2.8	Company ability war since it effort among.	1.6	1479680
24	39	4	0.9	\N	1.5	1585152
1	137	1	0	\N	0.6	4745216
41	555	4	1.9	Middle lawyer have compare seven.	0.5	4965376
90	23	4	2.4	\N	0.9	7126016
119	865	7	0	\N	1.3	1883136
194	763	8	0	Full her small happy situation.	0.7	7310336
64	563	5	0	Pay remain time true.	1.8	5942272
227	935	1	0	\N	1.8	5790720
237	281	3	0	\N	2.0	1357824
278	258	4	1.8	Thought simple include.	1.2	3397632
288	601	4	1.1	\N	1.5	156672
86	171	4	1.2	Career stock father particularly fear teach.	1.6	6947840
48	378	7	0	\N	1.8	6922240
71	788	10	0	\N	1.9	1629184
45	914	1	0	Anyone myself up page. Surface talk rate near arrive.	0.8	7842816
97	655	3	0	\N	1.3	6849536
105	503	4	1.0	\N	2.0	6523904
57	854	3	0	\N	1.1	271360
85	311	4	1.9	\N	0.7	8208384
166	226	4	2.3	Especially call keep five yeah they.	0.5	8024064
202	800	4	2.8	Deal sure hot night.	1.3	2689024
175	534	5	0	\N	1.5	315392
169	792	4	2.7	Every it view interest. No especially not common nothing.	2.0	5357568
140	699	10	0	Executive discuss yeah cut.	1.6	343040
160	162	4	1.4	\N	1.6	4405248
91	925	4	0.3	Walk final show air base front part.	0.9	6078464
220	719	10	0	\N	1.4	4848640
272	382	4	0.9	\N	1.6	6433792
284	125	1	0	\N	1.5	4832256
19	637	4	0.1	Down second send together most camera.	0.7	7424000
224	304	4	1.1	\N	1.7	4009984
115	132	6	0	Society at light policy perform.	1.6	2846720
126	402	4	2.7	\N	0.5	7665664
261	270	4	2.4	\N	0.7	601088
245	26	4	0.6	Community car understand cover tend bill. Hard five feel president friend kitchen mother.	1.2	6141952
41	545	3	0	\N	1.3	1156096
148	30	4	1.6	\N	1.5	1108992
57	860	4	2.8	Manager only arm.	1.6	6902784
307	887	3	0	Movement every drug service society discover affect.	1.4	276480
65	285	4	0.6	Major audience team social example.	0.7	6293504
235	276	9	0	Allow risk view read single method.	1.4	2008064
320	473	5	0	Piece resource amount among one example.	1.5	4463616
14	983	4	2.3	\N	1.7	4608000
256	786	4	1.8	Realize get federal although real heart despite.	0.8	6105088
42	494	4	1.1	\N	0.9	8199168
296	447	10	0	Wrong with suddenly defense ground finish.	2.0	6647808
55	544	4	2.2	\N	0.6	1488896
295	942	1	0	\N	1.2	8287232
256	783	8	0	Site necessary benefit carry.	0.7	1437696
289	935	4	2.8	Simple yard radio although so different result.	1.4	6940672
28	359	10	0	And total claim set think bad from.	1.8	6860800
26	88	9	0	Money side know cell.	1.3	800768
268	632	4	2.0	\N	1.9	844800
260	570	4	1.2	To deep debate figure contain south try suffer.	1.8	4239360
309	296	3	0	Three purpose agree become miss personal office short.	1.0	7833600
73	509	7	0	\N	0.9	3383296
269	325	1	0	Be speech trial against sure spring.	1.7	3210240
164	799	4	2.4	\N	0.9	1262592
316	55	4	2.9	Effect air total couple baby oil also. Half step live.	0.6	3393536
157	239	4	1.2	\N	1.6	3431424
224	303	5	0	Meeting us option article.	1.6	1931264
60	737	4	2.2	\N	2.0	8080384
88	581	7	0	\N	0.8	7477248
231	661	4	2.4	\N	0.6	5704704
282	974	10	0	\N	0.9	4146176
116	568	4	1.7	\N	1.8	5124096
158	267	4	1.8	\N	0.6	4226048
119	852	4	2.2	\N	1.4	2141184
27	728	10	0	\N	0.9	2096128
161	234	1	0	\N	1.1	1762304
189	723	6	0	\N	0.8	2597888
230	180	5	0	\N	0.7	5862400
230	199	7	0	Good clearly treatment.	1.2	7604224
119	864	3	0	Former nature on wife.	1.8	6421504
239	704	4	0.5	Especially often town level.	1.7	8201216
246	359	4	1.3	Later throw affect develop common bed.	1.6	1452032
160	155	8	0	Wait between present.	1.6	1379328
192	50	4	1.0	\N	1.9	7434240
205	82	7	0	\N	1.9	7115776
228	103	4	2.3	Write physical small any could college let employee.	1.8	3415040
232	762	4	1.6	Station social catch general later.	0.5	4864000
281	506	8	0	Top practice anything clearly authority.	0.8	1883136
71	780	4	0.8	\N	1.0	2080768
234	158	7	0	To small wonder study rise. Thank everybody whatever.	0.8	7469056
34	341	4	1.0	Put by adult goal specific.	0.7	4836352
84	476	9	0	Speak bring doctor. Game soon music trade.	1.0	7511040
315	513	3	0	\N	1.8	2296832
72	628	4	2.9	Almost enter themselves hotel benefit claim bad through. Identify special tree choose.	1.9	5817344
219	347	7	0	\N	0.6	1438720
49	939	10	0	Generation rather light boy.	0.9	7568384
99	359	10	0	House activity learn student phone environmental.	1.5	5152768
6	849	10	0	Provide result action about.	1.7	7168000
24	6	4	2.6	\N	0.9	7361536
75	407	3	0	\N	1.7	5075968
201	924	9	0	\N	1.5	1724416
309	291	4	1.7	Or send many.	1.0	1499136
14	979	4	1.8	Step travel her specific decade write. Rule government loss.	0.8	7207936
17	958	4	0.7	Together face lawyer fill expert. Down the sort likely take small.	2.0	3825664
137	130	4	2.0	\N	1.2	5204992
170	292	4	2.5	\N	1.2	723968
279	956	5	0	Moment senior risk picture direction mouth. Statement agent magazine baby sport form.	1.0	4916224
84	478	8	0	Understand program grow actually.	0.7	4186112
149	403	8	0	\N	1.3	5088256
237	282	4	2.7	\N	0.9	4895744
11	861	3	0	Recently weight could deep ahead.	0.6	4624384
10	439	3	0	\N	0.6	4017152
297	531	4	2.5	\N	1.8	7215104
30	479	4	2.2	Sure culture now general leader experience each. Use plan lead foot.	1.8	4592640
55	541	1	0	\N	2.0	5641216
13	871	4	1.9	\N	0.7	6846464
104	804	7	0	\N	0.6	7200768
205	84	4	2.6	Night plant under general.	1.6	7880704
79	355	4	1.6	\N	1.2	7887872
282	959	4	0.4	\N	0.9	3097600
58	983	4	2.3	\N	1.7	4927488
307	885	7	0	\N	1.5	2248704
307	893	4	1.2	\N	1.2	920576
103	216	1	0	\N	0.8	4564992
10	458	4	2.4	Experience popular face box.	1.2	6252544
28	363	4	1.0	\N	1.3	2907136
33	968	5	0	Grow coach white.	0.8	5053440
264	132	4	1.6	\N	1.3	4228096
42	481	3	0	\N	1.0	6009856
83	430	4	2.8	\N	1.9	5364736
64	550	4	0.4	\N	1.6	349184
26	63	4	1.2	\N	1.2	6615040
314	903	4	1.5	Feeling avoid life participant.	0.8	6554624
30	487	9	0	\N	0.6	3529728
93	140	9	0	\N	1.3	655360
85	303	9	0	\N	2.0	629760
24	36	4	2.8	\N	1.6	3802112
26	74	4	0.4	\N	1.3	4655104
97	651	4	1.9	\N	1.2	7121920
310	719	4	1.3	\N	0.7	2924544
109	117	4	0.7	\N	1.6	5715968
140	703	4	1.9	\N	1.6	763904
157	230	4	2.9	\N	1.2	8217600
45	907	4	1.4	Guess happy beautiful minute.	1.3	3769344
267	310	4	2.5	\N	2.0	2107392
239	697	4	0.0	Describe speak case too name read pass.	0.7	5645312
183	229	3	0	\N	1.9	2233344
247	171	4	1.2	That mention teacher recent gun.	0.5	2912256
288	606	3	0	Door similar onto yeah one administration item.	0.8	7412736
169	788	4	2.9	Image show while happy.	0.7	7496704
158	275	9	0	Foot its way response cup improve.	1.0	8111104
250	19	4	1.4	Detail theory well specific continue.	1.3	1192960
41	543	4	1.4	\N	1.4	4856832
234	167	10	0	Way man once I. Prevent computer treat practice.	1.2	2102272
126	403	5	0	Lawyer life treat local. Purpose discuss partner everybody degree then.	1.3	4401152
208	121	4	2.8	Number from time again leg get note.	1.9	652288
308	380	8	0	\N	0.8	7179264
6	847	1	0	None image while himself.	2.0	2642944
13	875	4	2.1	Save ability night reality build sister collection claim.	0.6	7550976
90	14	4	1.7	\N	0.9	1856512
134	423	3	0	\N	1.5	3843072
33	972	4	1.6	\N	1.7	7290880
141	487	4	2.9	\N	1.1	973824
275	781	4	1.0	\N	1.9	3568640
11	851	4	1.6	\N	1.4	8192000
229	260	4	2.0	Fine they parent go sister view hope.	1.0	7161856
73	507	4	0.5	Environmental draw support their wish.	1.4	5325824
265	892	6	0	Small choice red usually tough pick.	0.7	7741440
193	147	4	2.2	\N	1.4	7525376
161	240	4	2.9	State catch research table value. We thus fly threat.	1.9	4868096
48	374	9	0	\N	1.4	2272256
24	25	4	1.9	\N	1.2	6369280
72	631	8	0	\N	1.4	6382592
221	823	4	1.2	Successful pass son care thank.	0.9	5839872
108	379	4	2.9	Organization weight thing address address month.	1.7	5224448
244	393	6	0	\N	1.1	1097728
314	902	4	1.7	Energy both subject.	1.8	2099200
57	857	4	1.0	Focus current interesting reality.	1.5	2041856
56	869	1	0	\N	1.8	7758848
242	83	4	0.5	\N	0.8	3320832
320	482	6	0	Baby to painting standard game cup.	1.4	2407424
314	911	4	2.5	Move game expect take impact onto.	1.6	2796544
137	133	4	2.8	Student challenge quickly hard. Moment last north eye identify.	1.7	4947968
283	297	7	0	Those available there impact it.	1.6	5779456
298	212	1	0	Age place season country.	0.9	2908160
41	564	4	2.9	Former campaign create.	0.5	6323200
125	647	4	2.1	\N	1.0	3609600
314	910	3	0	Size fact house thus play list around.	1.0	5102592
28	357	4	2.6	Beat animal civil federal like or attention gas.	1.4	1001472
26	84	4	1.6	\N	1.8	580608
102	774	4	1.4	Power now edge set girl.	1.7	4563968
242	88	8	0	\N	1.1	4753408
190	682	4	2.5	\N	0.8	1286144
9	239	1	0	Under education seven.	1.7	4796416
83	442	4	1.9	\N	0.6	916480
44	747	9	0	Continue form arrive building state federal.	1.8	4556800
155	89	4	1.4	Over sort book white sister television service.	1.4	1153024
24	14	9	0	\N	0.9	2222080
175	520	4	1.7	About bill health there party PM its.	1.7	149504
294	135	4	2.9	\N	1.2	547840
172	277	4	1.6	Traditional environment nor care miss security building design.	0.8	4875264
197	119	9	0	Would send market employee foreign hotel. New price professor get.	1.3	1603584
58	986	4	1.9	Take however there. Conference wall right finally enough call.	1.7	4236288
263	262	4	1.9	Prepare turn name hot.	1.5	7413760
288	605	8	0	Son speak deal leader decade free.	1.6	1086464
182	898	4	2.9	Exist many in job walk laugh family.	1.2	5233664
215	866	6	0	Item onto camera can exactly girl citizen live.	1.5	4389888
306	227	10	0	Position employee leader plant.	1.0	478208
111	787	7	0	\N	1.1	7105536
199	98	8	0	\N	0.6	7098368
91	921	5	0	Story once authority want.	0.9	575488
40	375	4	2.7	Energy focus leg theory personal remain concern time.	1.8	2718720
250	6	4	2.6	\N	1.8	3273728
322	681	3	0	Couple student can information billion yourself. Plan trade civil seek low.	1.7	795648
96	359	4	1.4	\N	2.0	7419904
303	807	4	2.3	Human minute actually effort piece unit to pretty. Fish show Mr realize good no.	0.9	4461568
192	44	9	0	\N	1.4	3344384
209	623	4	2.2	Third third note loss leave visit.	0.9	5452800
239	702	4	1.6	Rate discussion information out a western report.	1.7	2968576
137	117	6	0	\N	1.8	7181312
321	146	10	0	Discover response he time challenge clearly bit.	1.6	3148800
291	125	4	1.9	\N	1.5	2581504
272	396	4	2.8	Military explain him save debate music.	0.6	4175872
68	256	4	2.0	\N	0.6	6676480
181	336	7	0	\N	0.8	1754112
273	337	6	0	Congress foot sport hear wall beat letter. Possible evidence data window find day range.	0.8	1204224
13	887	8	0	\N	1.1	5347328
320	479	3	0	Sure try simply rest none. Human actually own.	1.8	3289088
72	614	10	0	Center speech week south image. Collection nor despite we want.	0.9	5057536
20	219	3	0	\N	0.7	959488
138	417	5	0	\N	1.6	5163008
135	51	7	0	Whole vote degree go knowledge force wonder. Particularly call them woman.	1.7	5967872
12	215	4	2.3	Safe heavy protect treat break.	0.6	501760
9	242	1	0	Six quickly support sure hope sister everyone.	1.2	4451328
21	283	4	1.7	Bad gas just either executive doctor happy message.	1.2	4630528
200	739	4	1.6	Both responsibility material time own image physical.	1.7	5991424
227	939	8	0	\N	1.8	2173952
10	434	5	0	Organization evidence see shake.	1.3	8111104
26	77	4	0.5	\N	1.0	6657024
203	328	4	1.0	Area scientist attorney your get within soldier. Foot course born guy.	1.7	7560192
40	369	4	1.5	\N	0.7	1080320
190	665	9	0	\N	1.1	2423808
283	295	6	0	Both across would difficult.	1.6	642048
45	902	9	0	\N	1.0	5098496
196	739	7	0	Hold continue bit fish program everybody.	1.0	528384
313	107	4	2.2	Community able attack across. Through open face but.	1.2	4715520
175	527	4	2.3	\N	0.9	2258944
322	673	4	2.2	\N	1.1	3174400
71	791	7	0	\N	1.4	5285888
138	413	4	1.4	\N	0.7	3784704
141	486	4	1.7	Pick grow understand four.	0.5	2396160
32	483	4	1.9	Miss agree blue hear part.	1.2	7732224
209	631	7	0	Case thank interesting beyond floor far stuff.	0.7	3842048
250	12	4	1.8	Determine receive amount sea catch especially affect. Else girl try leave course current.	0.9	431104
148	23	9	0	Produce live every natural simple. Mrs across south scene environmental college adult.	0.8	4328448
46	274	4	2.0	True short watch next.	2.0	6007808
35	352	4	1.1	Always senior author drive friend room street.	1.4	3998720
89	347	4	1.4	\N	1.9	5657600
169	784	7	0	Health those draw white eat wait follow.	1.4	5114880
197	127	9	0	Stand common allow task practice there.	1.4	6811648
250	18	9	0	\N	0.7	1607680
300	350	4	1.1	Few safe population at several college improve about.	1.5	3038208
29	574	9	0	\N	1.4	925696
41	559	5	0	Space as necessary.	1.0	7896064
318	206	4	1.3	\N	1.9	7868416
322	679	5	0	\N	1.0	1848320
204	207	4	2.0	\N	0.6	6060032
277	93	4	1.0	\N	1.6	1115136
70	291	4	1.7	Great director role serious. Statement reach wait it total then project.	1.2	5235712
80	826	3	0	Bad adult since despite phone. Guy control morning yet always suddenly.	0.6	3294208
246	363	3	0	Off difficult lawyer example once soldier fast.	0.9	5070848
204	209	5	0	Trial civil produce low debate should.	1.3	2714624
259	127	5	0	Run hit citizen I group full again.	1.9	4329472
87	861	4	1.9	\N	1.1	2263040
277	69	10	0	\N	0.9	1965056
139	350	4	1.7	\N	1.4	216064
245	23	4	2.4	Understand blue process.	1.3	4983808
171	175	1	0	\N	1.9	2763776
282	963	4	1.3	Move big attorney quickly hope.	0.6	8256512
60	727	4	1.0	\N	1.7	7186432
29	587	4	2.6	Reflect man by technology.	1.3	1545216
12	214	4	0.2	History ok consider.	0.5	7799808
144	697	4	0.2	\N	1.4	4968448
244	390	4	1.6	Group stand especially think sound pass word. Opportunity claim generation government affect.	1.8	4858880
254	721	5	0	\N	0.9	1899520
276	377	4	2.4	\N	1.7	4186112
14	984	4	1.9	\N	1.2	7483392
22	490	3	0	Success carry here million perhaps mind.	1.2	2582528
63	777	4	2.4	Arm gun bed discussion. Reach word political throughout show several large tax.	0.5	6244352
168	294	1	0	\N	1.0	3625984
184	49	4	1.9	\N	1.5	6231040
288	604	3	0	Expect and low high area relationship. Know account site.	1.5	4480000
54	778	4	0.1	\N	0.6	6876160
59	662	4	2.3	Edge production chance nor rest very eat magazine.	0.5	7676928
90	40	4	1.3	\N	0.9	4545536
221	822	9	0	Make security change standard cell agent lose.	0.6	2464768
314	906	4	1.2	Company image body discover street someone commercial notice.	0.9	7367680
173	918	4	2.6	\N	1.9	7847936
199	112	8	0	\N	0.9	2115584
75	405	4	2.7	Hour analysis raise toward staff walk challenge. Though throw man along road.	1.4	887808
43	863	4	1.5	\N	1.7	2898944
85	308	7	0	\N	0.6	893952
119	863	9	0	Result guess mission charge series along center.	1.7	6811648
161	230	6	0	Region born natural billion realize together.	1.7	534528
279	946	7	0	Offer want air understand issue picture learn.	1.6	7973888
171	160	6	0	Local act boy interview. Buy good front same business suffer.	1.7	6384640
64	556	4	2.3	\N	1.3	8215552
100	367	4	2.0	\N	0.8	6508544
244	396	8	0	Away student hour summer.	0.6	6760448
66	910	5	0	\N	1.5	7868416
105	504	4	1.4	Dark senior consumer.	1.8	2742272
180	341	8	0	\N	0.7	3762176
13	885	3	0	This least often exactly need rest loss.	1.2	2305024
10	453	4	1.4	Eye main itself firm stuff clear.	1.6	7971840
97	650	4	2.5	Player along my.	1.9	7350272
155	74	4	1.5	Tend smile wish theory interest writer tonight.	0.8	5524480
261	272	4	1.1	\N	1.0	2227200
8	644	4	2.9	\N	1.5	757760
57	863	10	0	Authority camera bag ahead. Upon Congress than unit line.	1.3	2998272
250	30	8	0	Guess join such.	1.9	3849216
250	38	4	0.8	\N	0.7	8218624
296	430	4	2.8	Time identify reason.	0.9	2368512
154	703	10	0	\N	1.7	4230144
297	519	4	1.3	Difference week safe fast reality level.	0.8	5746688
190	688	4	2.0	\N	0.8	4092928
240	355	5	0	Ok approach yourself whether avoid sister.	1.6	715776
165	218	6	0	Book we job range everyone manager. Reflect society instead.	1.0	1076224
30	486	4	1.2	Happy voice television bit gas. Ahead exactly among middle.	1.1	6608896
197	123	5	0	Hair level customer section consider across. To set almost.	0.7	520192
189	727	9	0	\N	2.0	835584
252	941	4	2.2	Charge head inside type. Development recently city.	1.4	4209664
42	488	1	0	Water call individual ten explain direction can.	1.6	4350976
56	870	9	0	\N	1.4	782336
269	320	4	1.6	\N	1.6	5328896
78	888	4	1.0	\N	1.1	3129344
302	338	10	0	Send church prevent end show condition billion.	1.5	3794944
10	447	4	2.2	\N	0.5	3948544
107	860	10	0	Hundred support religious despite hand ok room.	1.1	8012800
120	764	1	0	\N	0.6	2084864
128	722	4	1.1	Thing defense everything point quite center teacher.	1.3	1145856
202	810	4	1.5	Own whole around me organization main campaign. Close soon certain bed your.	1.2	4025344
159	1	3	0	\N	1.8	4818944
151	387	6	0	\N	1.9	2014208
198	896	7	0	\N	1.2	8034304
308	376	7	0	\N	1.3	232448
55	558	9	0	\N	1.0	1981440
26	82	4	1.9	\N	0.7	2278400
264	123	5	0	Paper agent hundred person population.	1.3	6111232
145	339	5	0	Truth even player. Address loss produce couple.	0.8	840704
33	971	1	0	Although agree cultural seem personal.	0.7	1609728
25	513	6	0	\N	1.0	510976
271	499	4	1.3	\N	1.7	2638848
83	436	4	1.1	\N	0.7	4874240
158	274	5	0	\N	1.9	1771520
273	339	4	1.2	Already speech specific type staff glass again. Analysis wonder marriage type face light save.	1.4	4563968
269	331	4	1.0	\N	1.9	4901888
45	904	6	0	\N	1.7	3165184
41	536	5	0	Season side develop mention particularly worker but.	1.7	8049664
108	374	4	2.4	\N	0.8	5078016
179	745	4	2.5	\N	0.8	1923072
24	35	8	0	Go feel real. Price network country thing reveal door.	1.8	7558144
235	267	4	1.8	\N	1.4	8159232
166	218	3	0	\N	0.9	6294528
190	691	4	2.0	Agreement about ok loss market ago.	0.6	5286912
252	947	4	1.1	Hotel do size including.	1.9	4566016
88	586	4	0.9	Especially should car effect which management.	1.6	456704
19	622	4	1.2	\N	0.6	581632
109	129	4	1.9	Imagine speech edge environment federal.	1.3	6297600
205	80	10	0	Blood nature role individual certainly already.	1.7	399360
277	63	5	0	Leader call unit both.	1.2	4424704
152	296	4	0.5	Before discuss information.	1.7	4333568
56	876	8	0	Have miss may provide suffer course year.	1.9	6307840
13	874	4	2.5	\N	1.3	4963328
247	165	3	0	East amount art.	0.6	3962880
241	697	3	0	\N	1.2	596992
316	43	4	2.6	\N	1.9	5884928
261	269	4	2.8	Let respond small allow top.	1.3	397312
279	953	6	0	\N	1.1	2265088
162	663	1	0	\N	0.6	5346304
268	622	3	0	\N	0.7	1388544
157	229	4	1.8	\N	0.9	4809728
271	503	4	1.0	Nation dark strong southern others arrive. Three so body always computer.	1.8	1562624
102	772	6	0	Significant task term see one. Outside grow necessary exist phone make.	1.9	4985856
53	284	4	1.1	\N	0.7	6296576
193	140	4	1.1	\N	1.4	1927168
279	951	5	0	\N	1.0	3590144
157	237	4	0.2	\N	1.0	7522304
100	372	4	2.3	\N	1.1	2206720
115	115	4	1.7	Catch audience town could. Debate coach body movie security clearly join.	1.5	3902464
155	77	1	0	\N	0.6	4837376
288	603	4	2.4	Development just almost growth according next cultural spend.	1.9	2142208
302	341	6	0	Floor watch house center society author could.	0.9	5570560
11	864	4	1.0	\N	1.8	5097472
257	291	4	0.6	Say edge shake decision system name.	0.8	5113856
280	839	4	0.1	\N	0.7	2014208
9	238	4	2.2	\N	1.2	8093696
46	265	3	0	Education hold firm may rather. Dinner fall data perform.	1.7	5482496
25	509	4	1.3	Thing ground list least.	0.9	4161536
19	623	9	0	\N	1.1	7966720
125	654	3	0	Enjoy thus everybody another rich.	1.2	4571136
203	325	4	1.8	\N	0.7	6093824
14	977	4	1.9	Down forget blue.	0.8	6238208
173	924	4	2.9	Trip night future soldier attorney. Body some total among rather eat that them.	0.6	7238656
232	753	1	0	\N	1.9	2913280
151	396	3	0	\N	0.7	2106368
246	361	1	0	\N	1.5	2457600
225	334	4	2.4	\N	1.0	231424
298	210	4	2.8	Father shake value heavy dream country.	2.0	7499776
22	477	4	2.7	Daughter since break environmental.	1.8	6872064
284	116	4	1.4	Model television window administration financial church individual.	1.9	1983488
167	599	8	0	\N	0.9	6517760
315	504	8	0	Parent machine girl though.	0.6	4054016
225	329	4	2.8	\N	0.9	2544640
167	602	10	0	Stop both whatever community key whether soldier.	1.5	1680384
183	230	4	2.9	Answer adult cut herself education seat. Exist pattern plant beat support former.	1.1	8147968
313	97	4	1.4	Wide whom perhaps face.	1.1	3772416
280	828	9	0	\N	1.8	5442560
24	26	4	0.8	Develop reason less partner majority.	0.6	1960960
2	723	8	0	Affect author police painting force million law. Rock hear against marriage thus arrive service.	1.3	4711424
29	590	4	0.4	Call method tonight almost.	1.7	7250944
230	190	4	2.4	\N	1.5	998400
270	138	7	0	Through attorney finish guy Mr.	1.8	4326400
272	393	9	0	\N	1.8	3302400
320	491	4	1.6	\N	1.1	6985728
205	89	6	0	Head page likely off company.	1.7	3953664
325	546	3	0	Bad answer act heart friend happen agree.	1.8	6986752
160	164	5	0	Available arrive concern young. President into room.	1.0	8188928
321	144	4	2.7	Case talk seat region research college statement.	1.5	642048
38	774	4	0.9	\N	1.6	4048896
304	349	4	2.6	\N	1.3	7816192
305	284	10	0	Education threat experience use reduce.	1.2	1833984
207	304	6	0	\N	1.7	4813824
277	78	4	1.3	Standard federal name choice section ask piece.	0.9	6791168
17	987	4	1.4	West expect onto feel.	0.9	1267712
224	317	8	0	Film drive food kitchen live run.	0.9	6843392
212	849	4	2.7	\N	0.8	4383744
10	441	8	0	Deal stuff responsibility.	1.0	8120320
231	660	4	2.7	\N	1.2	1818624
242	65	4	2.3	\N	0.6	4149248
172	267	4	1.2	\N	0.7	5099520
158	264	4	1.1	\N	0.5	7218176
188	730	4	0.9	\N	2.0	5806080
202	794	9	0	\N	1.6	6918144
251	594	4	0.3	Out administration Republican responsibility response moment special. Plant wait there value card heavy.	1.4	1270784
284	124	4	1.1	Yeah office arm network.	1.6	3533824
311	284	9	0	Party space or store if charge.	1.6	5285888
207	306	4	2.5	\N	1.9	525312
275	785	4	1.2	Because police alone get interview.	0.8	2855936
8	649	4	1.3	\N	1.9	3538944
142	660	4	2.7	\N	1.4	1559552
285	852	6	0	\N	1.9	4188160
72	635	4	1.0	\N	0.6	4888576
292	736	9	0	Country language bad natural.	1.9	6538240
282	975	4	2.1	\N	0.5	4582400
132	326	8	0	New enough might political different.	1.7	6718464
282	971	4	1.8	\N	0.8	700416
155	83	4	2.0	\N	1.5	7753728
93	143	4	1.5	Nature capital certain hit whose near deep art.	1.0	4126720
31	219	4	0.6	\N	1.3	6594560
3	413	5	0	\N	1.4	7714816
242	70	4	2.5	\N	1.4	5698560
262	3	10	0	\N	1.9	6681600
288	596	4	1.8	\N	0.9	1280000
6	845	6	0	Candidate think state factor. Pressure bank item successful plan.	1.7	4908032
229	265	4	0.9	Tell activity artist adult.	1.1	4827136
196	740	4	2.8	Statement traditional under seek under late behavior. Concern seven house range consider I.	1.5	5231616
93	137	4	1.6	Nice religious nothing decade under meeting girl. Response their especially most thus.	1.0	397312
242	63	9	0	\N	1.9	4636672
217	936	4	1.1	\N	1.5	1773568
255	571	7	0	\N	0.9	3297280
220	721	4	1.1	We up you current. Can design best report especially community agreement.	0.6	4473856
137	119	5	0	\N	1.5	6782976
14	963	4	0.5	Thought candidate age item machine since.	0.9	1887232
228	98	4	1.4	Peace agent dog want describe positive.	0.6	7178240
269	321	8	0	Place building organization born fine choose rock. Up writer tend become.	1.0	425984
190	670	4	2.6	\N	1.2	4592640
270	144	8	0	\N	0.8	1211392
274	769	4	1.0	Wall our bill success. Edge simply method major.	1.4	697344
138	414	4	1.2	\N	0.8	3462144
167	607	4	1.6	Look pattern project human particularly board.	0.9	1830912
51	749	4	0.4	\N	2.0	8200192
211	251	4	2.2	\N	1.6	1630208
293	584	4	1.6	\N	1.4	675840
175	515	4	1.2	\N	1.1	4110336
232	754	7	0	Student plant every.	1.6	3400704
33	974	4	0.2	\N	0.9	6445056
71	782	4	1.2	\N	0.7	1858560
269	323	4	2.3	Economic nice inside local.	1.8	3453952
313	94	8	0	Major water trip hot detail various war.	1.2	5884928
24	31	4	1.6	\N	1.1	4973568
17	964	4	2.0	Must outside local red newspaper environment.	0.7	5943296
57	866	9	0	\N	1.6	583680
156	446	4	0.8	Full million institution avoid probably three.	1.6	4807680
236	705	9	0	Participant question usually civil feel look few. Born material get move always each player.	0.7	786432
171	165	4	0.6	Actually send talk building. Table cell report city action father.	0.8	515072
58	972	5	0	Table themselves during half all.	1.4	2961408
32	484	4	1.4	Conference blue task wonder pay try girl. Wall across cultural defense.	0.5	7056384
293	577	4	1.0	\N	2.0	1579008
228	95	4	2.7	Join within financial second know raise play.	1.1	1029120
163	847	4	1.9	\N	1.2	744448
161	244	4	2.8	\N	0.8	2869248
296	458	6	0	\N	1.4	1288192
132	327	4	2.9	\N	1.4	3466240
141	492	7	0	\N	1.1	5414912
100	368	9	0	Customer military break for be.	1.3	1588224
127	663	3	0	\N	1.9	7286784
156	439	4	2.0	\N	1.4	5319680
263	273	4	1.4	Maybe fly environmental section.	1.7	6882304
141	481	4	1.2	\N	1.7	1201152
270	148	4	1.8	\N	1.2	3012608
58	969	4	1.5	Everyone off wish cold enjoy lose.	1.3	731136
148	26	7	0	\N	0.7	4110336
33	976	4	2.6	Wide half husband recently.	0.8	5706752
52	324	4	1.4	Republican no create black.	1.7	7070720
222	234	4	2.5	\N	1.7	8264704
88	583	9	0	\N	1.9	6173696
137	127	4	0.5	Nice method learn his support.	0.7	7441408
265	870	4	2.5	Help control raise capital nearly.	0.6	499712
209	620	4	2.3	Focus amount recent explain.	1.0	6853632
140	697	6	0	\N	1.7	4900864
284	126	4	2.9	Friend argue general meet condition seem.	1.7	2042880
128	717	9	0	\N	0.7	5251072
106	280	9	0	\N	2.0	4254720
130	407	4	2.1	Plan hundred through chance inside yourself clear. Again thing market risk travel least past.	2.0	5724160
292	726	4	2.0	\N	1.3	1820672
325	548	4	2.2	\N	1.0	5150720
280	842	4	2.5	On believe security science win question those. Idea someone official.	0.9	2774016
228	96	9	0	\N	0.6	2258944
115	130	4	2.0	\N	1.9	4531200
201	922	10	0	Minute occur weight eight forward well.	1.4	283648
215	865	4	0.3	\N	0.6	1358848
11	868	9	0	\N	0.9	6408192
56	883	4	0.7	Central center box same other skill.	0.6	4058112
27	723	10	0	Policy wish force occur day.	1.6	903168
282	977	5	0	End individual sound never peace.	1.6	7615488
87	860	1	0	Green six agree place.	1.3	7988224
16	766	4	0.6	Bit do almost expect maintain scientist.	1.9	6893568
32	492	4	1.8	Play seek truth hand.	1.6	1910784
104	806	9	0	Agent wait tax law why audience start early.	0.8	2400256
264	126	4	2.8	\N	1.9	2996224
3	412	4	1.4	\N	1.4	1428480
24	29	8	0	\N	1.7	792576
38	775	4	2.4	Father help his.	0.9	1993728
34	336	4	1.5	\N	1.8	407552
283	289	4	1.0	\N	1.7	6792192
172	266	4	1.5	Pm space step summer. Necessary local brother owner hair environment likely morning.	1.2	1562624
59	660	4	0.8	Sport often cut within may.	1.8	1031168
122	714	5	0	\N	0.6	8073216
296	441	5	0	Born certain final view blood. Speak feeling information media impact.	1.2	7957504
252	940	9	0	Federal job Democrat cover maintain add third.	0.8	3297280
14	981	3	0	\N	0.8	5650432
78	893	8	0	\N	1.4	6182912
29	579	4	2.6	Hospital city class near use.	1.5	4773888
26	65	4	2.3	Indeed how car much. Inside major hair attack law significant prepare.	0.8	2139136
69	409	4	0.3	\N	1.1	7519232
206	707	3	0	Time meeting table modern positive. Husband trouble forward few choose how.	1.3	3702784
189	731	4	1.9	Expert pressure process.	0.8	1150976
44	746	3	0	Despite star far compare culture.	1.2	2819072
188	731	7	0	Officer old weight base truth kitchen.	1.5	999424
14	958	5	0	\N	1.1	479232
86	154	4	0.8	\N	0.7	7286784
78	881	7	0	\N	1.5	5035008
323	1	4	1.8	Among and age prepare off on reveal.	0.6	8159232
23	275	5	0	Hard live some pick spring.	1.3	8020992
323	2	1	0	\N	1.5	7298048
306	225	4	1.8	Order foot so quickly size effort.	0.5	2130944
86	158	4	1.3	\N	1.1	7878656
229	261	4	2.5	Lay worry enter job.	0.6	2395136
135	48	4	2.5	\N	1.1	2172928
291	124	4	1.1	\N	1.1	1916928
55	552	8	0	\N	1.9	7926784
4	826	9	0	Long forget financial brother suffer fine.	1.8	3896320
87	864	4	1.7	Old full lead think drive.	0.5	5036032
310	718	4	1.4	Discuss one resource each.	1.6	3096576
89	350	4	1.7	\N	1.4	5495808
204	211	7	0	Fact much particularly buy past card effort.	1.5	3080192
56	880	4	0.3	\N	1.8	269312
245	41	4	2.9	\N	2.0	6764544
29	582	4	2.6	\N	1.0	3209216
325	560	4	2.2	\N	1.2	2941952
45	906	4	1.2	\N	0.7	1611776
78	892	5	0	Outside change your decision ground.	1.7	4657152
284	129	3	0	\N	1.0	122880
187	5	1	0	\N	1.0	3135488
296	432	4	1.9	\N	1.5	7292928
60	731	10	0	Allow left conference age.	1.0	162816
297	527	4	2.3	\N	0.9	5603328
264	124	5	0	Style argue address computer support nor.	1.9	3851264
223	850	4	1.4	\N	1.6	5962752
24	17	3	0	\N	1.9	4215808
24	13	4	1.5	Position ready would. Sign television rise seek structure treat order.	1.3	2135040
55	543	10	0	Charge real trial campaign between government.	1.4	2855936
271	504	1	0	Sing or show. Reveal seem reduce door quite treatment action.	1.7	6510592
301	569	9	0	Past turn record.	1.7	1106944
228	108	8	0	Turn win decision national forward itself. Whom control investment dark hotel.	1.3	845824
237	279	9	0	\N	1.8	1141760
26	93	8	0	About memory state forget during.	1.6	4008960
55	555	4	1.1	Enough cold on wife.	1.9	5814272
14	964	3	0	\N	1.8	4105216
58	980	4	1.9	Land soon school nation I trial door also.	1.0	154624
23	260	4	2.0	Through eat add you.	1.1	4254720
90	28	6	0	\N	0.9	5533696
178	568	4	0.9	\N	0.7	1483776
225	331	4	1.0	\N	1.1	5517312
244	382	4	1.0	Cup happen animal similar thank mention according floor. Everything create break become across.	0.9	7443456
321	142	4	1.8	Ball order strong bring move thought. Benefit wall daughter marriage either long speak.	1.6	3689472
35	356	4	1.1	Suffer these eat nothing half relate.	1.4	1374208
32	495	4	2.2	Among consumer far election.	0.9	4483072
25	503	4	1.0	\N	0.7	2689024
171	150	4	1.2	\N	0.9	6793216
315	510	10	0	Crime do together various.	1.6	1868800
322	688	4	2.0	Difficult five family.	1.5	4405248
125	658	4	1.4	Probably hour direction certainly center maybe.	1.1	5768192
272	388	5	0	Decide heavy clear laugh.	1.7	7443456
252	948	9	0	Federal mention imagine already show information.	0.6	2078720
279	947	4	2.1	\N	1.5	3133440
43	852	4	2.1	\N	1.0	3519488
96	358	4	2.5	Increase rather help.	0.8	347136
135	52	4	2.2	Party black exist relate.	0.9	2475008
113	701	4	1.7	Color top first choice exist.	1.6	4308992
25	501	7	0	\N	1.0	7126016
281	508	3	0	\N	0.5	4632576
19	625	4	2.2	Teach drug capital technology. Result goal those floor tell.	1.9	6618112
303	816	4	2.6	\N	1.3	4455424
304	350	5	0	Father hand whatever book gun effort something.	1.3	3214336
118	938	4	0.4	\N	1.4	4733952
193	135	8	0	White happen task whole government police however.	0.6	2625536
37	565	4	1.5	Indeed hand recognize structure consider to woman common. Sound security professional throughout analysis.	0.9	1883136
67	370	4	0.4	Edge since among.	1.8	6412288
171	164	8	0	\N	0.8	3067904
156	455	8	0	Raise clearly new.	0.6	5389312
238	769	3	0	Explain amount here lawyer great.	1.7	5165056
286	918	4	2.6	\N	1.3	635904
322	675	8	0	Money language federal machine away reach open about.	2.0	6317056
30	477	3	0	South dog air.	0.5	5372928
109	126	9	0	Dinner nature baby return.	1.3	4475904
143	208	7	0	\N	1.8	1954816
204	208	4	1.1	Defense why reduce common much.	1.3	4438016
46	264	8	0	\N	1.7	2899968
89	344	4	2.7	Grow door article official.	1.6	6316032
119	853	4	1.9	\N	0.8	4184064
143	209	10	0	\N	1.3	162816
217	939	6	0	Relationship line ok word improve.	1.5	192512
235	262	6	0	\N	1.2	937984
79	354	1	0	A short suddenly common admit.	1.7	4843520
239	705	9	0	\N	1.0	5424128
250	24	10	0	Forget kid deep interesting writer.	2.0	4369408
291	118	9	0	\N	1.9	7881728
326	629	5	0	\N	1.1	3023872
23	264	4	1.1	\N	1.9	6795264
196	742	10	0	Finish what whom reach whose political response four.	0.8	4975616
265	869	4	2.5	Great together source rate nation.	2.0	8254464
211	248	4	2.3	\N	0.5	5576704
90	19	10	0	Bit anyone sound shake capital treatment.	0.6	3894272
244	400	10	0	Wind control pressure write.	1.0	6061056
193	144	7	0	Shake stock those.	1.1	4261888
242	92	4	2.4	\N	1.7	3176448
281	504	4	1.4	\N	1.9	7569408
303	805	7	0	\N	0.8	6511616
23	263	4	2.9	Think probably cut.	1.1	927744
13	876	9	0	Green book energy begin energy program southern.	0.5	1680384
88	582	4	1.2	Official six right forget drop.	1.8	7668736
190	676	4	2.1	\N	1.5	3432448
190	667	4	1.4	Tend suffer gun agent debate near.	1.8	4043776
299	977	10	0	Rise third by office personal team.	1.2	8109056
209	626	4	1.0	\N	1.5	3509248
146	168	4	0.5	Worker performance source employee smile there professor.	1.8	8270848
295	946	7	0	\N	1.7	5117952
111	782	1	0	Any score opportunity pick.	1.8	6563840
234	153	4	1.6	\N	0.8	4433920
72	630	4	1.3	\N	1.0	3351552
19	614	3	0	\N	1.0	3433472
322	674	1	0	Establish believe eye activity available direction hotel wait. Cold collection force worker my.	1.2	4786176
275	792	7	0	\N	1.9	755712
290	566	4	2.1	\N	1.6	3536896
108	372	4	2.3	Protect bill red see pull.	1.7	6021120
67	376	4	2.4	\N	1.3	5509120
145	338	6	0	\N	1.3	4533248
140	706	1	0	\N	1.1	1774592
68	247	10	0	\N	1.0	4964352
146	159	4	1.0	According once phone grow others finally doctor fill. Soldier war wind own home true.	0.6	4241408
29	576	4	1.5	Crime green prove.	0.7	5669888
225	321	9	0	Section however open.	1.1	2856960
166	223	3	0	Us memory low final religious occur nation city. Add politics environment.	1.6	6618112
186	743	4	1.4	However just man street truth.	1.3	2137088
14	986	6	0	\N	0.6	4434944
148	9	5	0	Possible almost safe peace.	0.7	7070720
313	95	7	0	Stuff ok really part. Although account color could instead reality.	0.7	3927040
76	357	4	2.6	\N	0.5	6946816
230	191	10	0	\N	1.5	6074368
280	841	4	2.2	\N	0.6	3404800
31	222	4	2.4	Open realize car marriage evening commercial.	1.1	1934336
13	889	4	2.5	\N	1.9	6343680
64	553	4	1.6	\N	0.8	7887872
4	825	3	0	No enough book fine. President design report town body decision happy.	0.9	3012608
115	118	4	2.4	\N	1.5	8250368
93	141	4	1.4	\N	1.9	7915520
284	117	4	0.5	\N	0.9	1776640
138	418	4	1.6	Indeed reflect work near trade wish.	1.5	3518464
291	119	4	2.6	\N	1.9	5487616
270	146	4	2.9	\N	1.1	1205248
163	849	4	2.7	\N	1.6	4963328
253	407	4	0.2	Exist entire camera level somebody run water.	0.6	2672640
286	920	4	1.1	\N	1.5	2269184
261	267	4	1.3	Field behavior score also work next anyone. Central grow enjoy finally already.	0.7	6467584
90	41	3	0	Character low world fund necessary TV down. Structure with method news new cut character big.	1.7	3032064
303	808	4	2.4	\N	1.6	1157120
63	776	7	0	Attack national miss science operation receive manage movement.	1.4	8171520
22	483	4	0.1	Mention message often against force participant. Fly impact truth important hold man.	1.2	4064256
90	30	4	1.6	\N	0.8	7502848
222	230	4	2.9	Million professional bag scientist front sometimes man.	0.9	3856384
30	483	4	1.9	\N	1.7	4758528
91	919	9	0	\N	1.9	3066880
50	702	4	1.6	\N	1.6	4581376
23	277	10	0	Sense ball physical eight. Store artist garden begin American level.	1.5	7623680
230	181	4	2.9	Allow woman bring until.	0.8	1077248
107	854	8	0	\N	1.9	2837504
119	858	4	2.7	\N	1.7	4724736
244	398	4	2.4	\N	0.7	666624
268	617	4	1.4	Across yet stuff pick pass. Evidence senior west Mr soon.	1.4	5240832
296	437	4	2.4	Do catch thought foreign forget.	0.7	3634176
307	870	4	2.5	\N	1.7	6686720
32	493	4	2.3	\N	1.6	1650688
66	913	5	0	Compare there consumer method.	1.0	7619584
284	123	4	2.3	\N	1.5	6052864
181	338	4	1.9	Miss left rate should final.	1.9	3981312
314	907	7	0	Car discuss every as seven modern key.	1.3	5365760
42	492	4	1.8	\N	1.6	6977536
113	699	4	2.3	Local clear adult trouble hit.	0.6	5785600
136	409	8	0	Camera raise bed difference. Soon here reason computer while house.	1.7	4014080
216	937	1	0	\N	1.7	2237440
109	130	4	0.4	\N	1.8	1182720
285	866	7	0	\N	1.7	1869824
46	272	9	0	\N	0.6	6510592
23	261	4	2.5	\N	0.5	7838720
150	135	4	2.9	Large when ever under grow owner.	0.8	1021952
236	697	8	0	Ok agent be gun five serve authority.	1.6	5289984
251	598	4	1.2	\N	1.4	1440768
281	513	5	0	Nor usually avoid series carry cause stand wrong.	1.1	5836800
62	407	4	2.1	Today question different.	1.9	1650688
50	703	4	0.6	\N	1.6	7526400
95	402	5	0	\N	1.3	2973696
57	852	3	0	Seven protect expert building. Wear plant thank institution those discover.	1.3	6349824
189	733	1	0	When person something however guy TV others.	1.2	4903936
14	987	5	0	Perform discover interview bank three individual black.	1.8	5466112
132	319	4	1.7	\N	0.6	6084608
60	728	6	0	Score person yes game.	1.4	7575552
203	318	1	0	\N	0.9	1395712
78	889	4	2.5	\N	1.6	1326080
58	987	4	1.4	Group base hit floor whether lay hard.	0.6	7439360
265	891	3	0	\N	1.2	7159808
156	452	4	1.6	International level tax type.	0.7	2136064
165	226	4	2.3	\N	1.8	1721344
285	854	4	2.8	\N	0.8	5012480
158	260	4	2.0	Affect size win war low expert little.	1.0	5127168
43	861	4	1.9	Turn staff trip play.	1.5	2734080
151	392	4	2.9	Him officer we reveal break sort exactly.	1.1	7257088
170	295	4	1.8	Sure able statement less build whom billion.	1.7	3090432
22	484	8	0	\N	1.5	6645760
185	287	4	1.0	Sometimes wind radio use student. Himself factor physical reality spend.	1.3	2493440
233	463	4	2.3	\N	0.6	3246080
279	940	6	0	Feel according police though.	1.0	304128
156	447	3	0	\N	1.3	2950144
188	733	4	2.5	\N	0.6	4818944
70	294	4	2.9	Lead quite sport already.	0.5	4125696
85	302	4	2.3	\N	2.0	6231040
94	660	4	2.7	Relate his agreement business. Position although base father leader.	1.6	6506496
114	705	6	0	\N	1.7	3009536
244	389	4	1.6	Ground whose suddenly. Bill of stage there administration research.	1.4	2538496
58	973	4	0.9	Once thought hope news.	1.9	586752
210	750	4	1.8	\N	1.5	6184960
322	667	5	0	\N	1.5	1300480
121	349	10	0	\N	2.0	8027136
105	511	4	1.5	\N	1.5	1400832
167	606	4	1.0	Since course put home few PM.	0.9	3654656
33	979	4	1.8	\N	1.2	3332096
157	242	4	2.5	Beyond stop leave successful.	1.8	4686848
14	962	4	2.0	\N	1.7	4868096
272	386	3	0	Prove such suffer likely responsibility close.	1.9	2693120
5	747	4	1.4	\N	1.3	6423552
188	732	3	0	\N	1.3	2102272
96	362	1	0	\N	1.9	3685376
103	214	4	2.0	Two as lay south reality attorney the.	1.1	3130368
113	697	4	2.5	\N	1.9	1038336
57	865	7	0	\N	1.9	2476032
80	818	6	0	Consider many develop different ask may like professional.	0.7	628736
189	728	4	0.8	\N	1.3	5170176
27	736	4	1.2	Loss wind statement decade yes them.	1.0	4289536
175	533	5	0	\N	1.8	2751488
209	628	4	2.9	\N	1.9	103424
230	202	4	2.4	Sell exist learn sport green buy even.	0.6	5164032
268	638	1	0	Agree wish catch list.	0.8	448512
274	770	3	0	\N	0.7	4824064
312	223	9	0	Data make fight affect tree. Relate together law fight American knowledge.	1.7	4651008
322	694	1	0	Already mention wear quality.	0.6	4020224
115	114	4	1.6	Few side claim market record chair.	1.3	1253376
42	485	4	1.3	Eat under base.	0.5	3460096
219	344	5	0	Develop base next type care.	1.9	281600
282	972	4	1.6	Begin professor general animal.	2.0	1165312
267	309	4	2.0	Senior event including fly.	1.4	5141504
195	500	5	0	White expert party reveal evening build economy.	1.7	1410048
285	858	4	2.7	Write religious wide generation save center around.	0.9	8200192
206	711	10	0	\N	0.9	6175744
319	897	3	0	Exist per ok before part often purpose.	1.1	7055360
196	747	1	0	Kitchen generation realize tax network hot bring.	1.3	4518912
88	574	4	2.4	Goal land forget prevent.	1.2	6364160
22	493	9	0	\N	1.0	1935360
17	972	4	0.9	\N	1.5	740352
88	575	6	0	\N	1.6	7754752
83	427	10	0	Too fight moment wind suddenly set.	1.9	3194880
78	883	4	1.8	\N	1.7	3529728
164	794	6	0	\N	1.8	4514816
128	718	4	2.6	\N	1.3	2576384
320	481	4	1.2	Yet design western shake.	1.9	3351552
121	346	4	2.7	\N	1.7	3138560
229	263	4	2.9	\N	1.7	5392384
319	895	4	1.4	The two series building. Read fall lawyer sound around.	1.2	6672384
295	944	1	0	\N	1.0	5318656
271	509	1	0	Likely it hard environment.	1.9	6643712
24	12	4	2.1	Remember up upon science after cover.	1.7	4216832
10	427	8	0	Newspaper cultural both test.	1.4	6412288
68	246	4	1.4	Scientist our meeting discuss mention add western.	0.8	331776
278	253	3	0	\N	1.1	2987008
274	764	7	0	Investment site fire black thus tend cup.	0.5	4297728
155	61	4	1.8	\N	0.6	3386368
308	370	4	1.8	\N	1.0	1277952
275	782	4	1.2	Fall second exist art walk general. Thought mother only foreign help economic let.	1.6	369664
17	962	7	0	Happen nothing meeting attack hospital across find.	1.2	1330176
160	176	10	0	Everything decision able marriage cultural scene.	0.6	715776
10	450	1	0	\N	0.6	3943424
64	561	4	2.8	Late defense car money.	1.3	1329152
276	379	1	0	Vote current key remain.	1.2	1923072
266	939	5	0	Director easy yes half.	1.9	617472
289	938	1	0	We hospital coach any include each.	1.0	498688
282	979	4	1.8	Stay better never program local difficult popular.	1.3	3453952
45	915	8	0	Really approach back seven night. Rest final sense everyone give three.	1.7	1623040
252	952	9	0	Two into drop view write society accept. Social perform training whatever.	1.0	652288
315	506	4	2.9	\N	1.4	538624
276	367	4	2.0	\N	1.6	715776
30	489	4	2.8	Front administration method wish own loss under. Structure amount organization dog represent book whole.	1.0	7297024
62	403	10	0	\N	1.5	1333248
193	138	1	0	Scientist by special responsibility tax.	0.7	4548608
226	939	4	1.8	Society fast simply behavior indeed environmental size language.	0.7	1879040
256	784	5	0	\N	1.7	470016
313	106	4	1.6	My hand box body.	1.6	3188736
150	145	4	0.9	Put lawyer so.	0.9	360448
89	343	4	2.9	Nor deep east doctor financial attack seem administration.	1.2	7441408
105	498	4	2.9	\N	1.9	3871744
158	272	4	0.9	Dog member stay seven.	1.2	5475328
242	74	4	1.5	Player model degree then.	0.8	7911424
280	831	4	1.3	\N	2.0	2972672
291	116	4	1.9	Opportunity over sure effect find I. Rise yeah skin thus wall test girl us.	1.9	7954432
33	983	4	2.3	Use live far rich nothing buy social.	1.5	5226496
89	351	10	0	\N	1.3	1059840
307	882	6	0	Development protect six whose main.	1.7	3672064
119	862	5	0	\N	1.1	782336
251	593	5	0	Activity project hand.	0.8	3403776
7	775	6	0	Training plan machine offer information try debate after.	0.9	7065600
44	744	4	1.8	Style very left candidate.	1.1	2611200
60	736	4	1.2	Local individual ground. Large budget Mr partner current.	1.9	5111808
233	462	4	2.2	Style part degree movement reveal person.	0.8	3784704
282	982	6	0	\N	1.0	1403904
104	814	4	0.5	\N	1.2	3429376
286	925	4	2.4	Open woman concern draw deal fine. Word open expert government leader public per.	1.0	4535296
83	451	4	1.4	\N	1.4	6902784
188	724	4	1.7	Case through drug former under road into charge.	1.0	5867520
165	228	8	0	Involve pay war media nice.	1.5	436224
46	261	4	2.5	Picture clear camera natural she make.	1.9	7569408
84	485	3	0	\N	0.6	1921024
208	130	3	0	\N	1.9	4561920
231	663	4	1.5	\N	1.1	6464512
283	294	9	0	\N	1.9	5458944
207	300	5	0	Training detail early half responsibility paper.	1.4	949248
203	335	4	1.6	Successful wind race dinner determine star build.	1.7	2107392
114	702	4	1.6	Everyone available order main issue interesting she. Performance really into service individual.	0.5	2490368
2	725	10	0	\N	0.5	8250368
33	958	4	2.4	Clear democratic miss represent kid win.	1.5	2107392
226	936	5	0	Most guess second. Know themselves debate way stand need network.	1.1	5040128
41	537	4	1.4	\N	1.8	5434368
270	143	4	1.5	Every measure teacher seek.	1.2	7945216
237	283	4	1.7	\N	1.6	7134208
193	148	1	0	\N	0.5	2113536
276	366	1	0	Determine sure much. Billion while morning even coach child service.	0.8	3009536
325	551	6	0	Party stop total reason.	0.6	1920000
147	318	4	1.5	Agreement case between most.	1.4	7011328
193	139	10	0	\N	2.0	1370112
198	898	4	0.6	\N	1.3	2221056
171	176	5	0	Former treatment market church traditional.	1.4	2373632
26	61	8	0	\N	0.7	584704
297	532	3	0	\N	0.9	3258368
124	409	9	0	Man someone author. Meet majority coach stay few color.	1.1	3344384
154	706	4	1.1	\N	0.5	220160
148	12	1	0	Course throw note process. Some any those door cell water key.	2.0	2352128
160	177	4	0.1	\N	1.4	5456896
311	285	9	0	Writer there mention know article how trouble.	1.2	4388864
129	407	4	2.1	\N	0.5	8187904
165	225	1	0	Player however he section. Bed child first.	1.2	3737600
145	336	4	1.5	Treat market perform.	0.5	6110208
171	154	4	2.1	Study gas what several kitchen medical control.	1.7	6148096
280	833	4	1.4	Politics sit long difference own.	1.8	3476480
206	709	9	0	\N	0.7	632832
120	770	4	1.2	Represent collection place knowledge night middle seat. System consider instead six tell until federal.	0.9	2728960
20	226	6	0	\N	1.3	4027392
305	281	3	0	\N	1.9	111616
242	82	8	0	\N	1.8	6766592
314	913	7	0	Human main role season where treat catch.	1.3	3632128
203	321	10	0	Call word require music country billion together.	1.8	539648
71	783	4	0.9	\N	0.7	423936
138	422	4	2.3	\N	0.8	7737344
83	434	3	0	Tough those do.	1.4	5989376
188	735	8	0	\N	1.6	7417856
97	656	4	1.1	\N	1.9	6004736
149	408	8	0	Player popular forward.	0.8	3337216
155	64	4	1.5	\N	0.9	2651136
221	818	4	1.7	Resource avoid enjoy through people.	0.8	6696960
151	386	9	0	Own game person. Seek when teacher detail discover morning far.	2.0	3491840
197	116	4	1.9	We try task. Affect politics everything industry movement pass business.	1.7	1093632
155	86	4	2.3	\N	1.7	2626560
190	685	4	2.4	\N	0.9	7208960
224	310	4	2.5	Claim pull friend gas rock.	1.0	3351552
247	160	8	0	History something lose.	0.7	7488512
322	670	4	2.6	\N	0.9	4074496
296	444	4	1.9	Nearly material pay almost training.	1.4	7204864
177	761	4	0.7	Activity remain process want change whose.	1.7	6321152
184	47	4	1.7	Any perform land action marriage determine song.	0.8	1885184
301	570	4	1.2	\N	1.0	3721216
147	332	5	0	Rock fire idea dark cold source.	1.0	3410944
304	344	4	2.7	Letter always man already computer evening.	1.9	2699264
78	871	10	0	Agency take development.	0.9	5245952
186	746	4	1.0	Poor student agreement. Where listen three stage range let interesting.	1.5	5715968
192	48	4	2.5	Film program add officer often.	1.7	4342784
11	854	6	0	Individual push law concern according.	0.9	2024448
72	633	4	0.8	Present instead least capital.	0.6	5955584
245	36	5	0	\N	2.0	6209536
20	224	10	0	\N	1.4	7040000
292	731	4	1.9	Chair security would.	0.7	5809152
194	766	9	0	Class table woman collection.	0.6	492544
298	204	4	2.6	Wind a few although.	0.8	2362368
326	634	1	0	News push recognize fine serious physical many save. Relate happy everything physical late recently.	0.8	1546240
111	780	4	0.8	\N	1.4	970752
202	804	4	1.3	\N	1.5	659456
141	489	9	0	Standard member allow nice their three young.	1.9	7898112
288	610	7	0	Later suggest level long mean.	1.2	5601280
71	789	9	0	\N	1.4	1332224
165	221	4	2.7	\N	0.8	1994752
263	272	7	0	After call civil situation seek.	1.8	4361216
2	732	7	0	Ready final respond together will like look.	1.9	2277376
282	978	4	1.3	American present recently well material general.	1.7	606208
224	306	5	0	\N	1.8	4602880
232	761	5	0	\N	1.7	5763072
72	639	10	0	\N	0.8	3733504
267	315	4	0.6	Culture dog free laugh stock bank church.	1.4	7794688
29	583	4	2.5	\N	1.6	2968576
123	712	4	1.5	Want worker party president crime together add order. Which dark many song father through major.	1.4	4214784
184	46	10	0	\N	1.6	5059584
33	982	6	0	Month just likely large air program part.	1.8	6489088
242	61	9	0	Method money hand blue share challenge message drop.	1.1	5317632
250	37	5	0	\N	0.9	1133568
247	176	4	2.3	\N	1.4	2464768
304	342	10	0	\N	0.9	1471488
14	978	4	0.8	\N	1.1	3365888
171	177	4	1.2	\N	1.5	125952
146	151	5	0	\N	0.5	2652160
144	700	8	0	\N	1.0	5435392
192	60	4	2.4	Door its let control artist when land risk.	1.1	6760448
58	967	4	1.3	\N	1.9	2256896
292	727	4	0.3	\N	1.5	1217536
93	148	10	0	Left address little project.	1.7	8254464
235	264	10	0	Need laugh expert by one single trouble.	1.7	7872512
86	162	4	1.6	Every treat measure similar stand church end.	1.1	6337536
303	799	4	2.4	Almost your dream buy we.	1.7	6320128
107	853	4	1.9	\N	0.9	726016
277	79	4	1.4	\N	1.3	2608128
75	403	8	0	\N	1.3	4890624
321	145	8	0	\N	1.5	2657280
308	369	6	0	\N	1.2	4686848
27	729	4	1.5	Management run common.	0.5	4979712
78	875	4	2.1	\N	1.9	7857152
205	76	4	2.9	South position pass pattern range walk.	0.6	720896
189	725	4	1.8	\N	0.5	2706432
256	790	4	0.1	\N	0.5	6112256
268	619	5	0	At compare about hotel born dark however.	1.5	2135040
3	425	4	2.9	\N	1.0	7419904
13	888	4	1.0	\N	0.8	2780160
27	731	4	0.2	\N	1.5	7134208
233	469	9	0	Resource run collection oil late. Car new your.	0.8	2794496
261	274	10	0	Maintain property cell Mr actually rise.	1.9	3564544
270	145	9	0	\N	1.2	7813120
144	703	4	2.1	\N	1.3	8150016
26	70	4	2.5	Relate real try go machine fine.	1.2	1786880
43	856	4	1.3	\N	0.7	3433472
86	152	4	2.1	Movie let nor.	0.5	3584000
54	790	7	0	Happy least college quickly get goal right.	1.7	1986560
185	291	8	0	\N	0.9	6425600
209	617	4	1.4	Food send series why administration.	1.7	5872640
48	365	4	2.5	\N	1.4	438272
184	43	4	2.6	Few direction evidence enough. Author heart world require thing.	1.2	1052672
1	135	4	2.9	\N	1.7	7568384
140	704	3	0	\N	1.2	2553856
275	783	4	2.1	Item cold mother wife name pull matter. Age focus trial western long team.	1.8	2251776
286	923	6	0	Heavy together add west big past.	1.9	7964672
61	720	3	0	College woman so audience.	1.0	4340736
23	267	6	0	\N	2.0	6820864
81	738	6	0	\N	1.0	6708224
71	793	9	0	Next art person Mr leader.	0.9	1705984
155	75	7	0	Tree month mother relate huge sure behavior rather.	1.0	1653760
101	770	4	1.2	\N	0.9	5446656
277	80	4	1.1	After nice remain should than type.	1.6	241664
135	56	10	0	\N	2.0	1923072
83	437	4	2.4	\N	1.9	5583872
325	542	4	1.0	Several change ever child product.	1.1	620544
163	848	5	0	Population front purpose today effort newspaper reason. Price ago serious condition allow begin positive.	0.6	3443712
24	9	4	1.5	\N	1.8	6794240
320	474	1	0	History two as pay. Daughter carry image none peace.	0.9	6476800
211	256	10	0	Lose threat drug chair provide usually thing. Lay east southern.	1.0	3200000
207	301	4	0.7	\N	1.2	5459968
219	342	4	1.9	\N	1.8	2042880
222	239	4	1.2	\N	1.9	3021824
209	616	4	1.1	Forget quite development cover similar daughter then area.	1.9	1104896
109	119	4	2.6	Father alone manage establish.	1.1	2542592
264	121	4	2.8	\N	1.4	7173120
59	659	3	0	\N	0.9	4583424
264	128	4	2.5	\N	1.8	2449408
230	195	4	2.1	Recognize whose education. Type seem pick road week ball.	1.8	6025216
125	656	4	1.7	\N	1.7	4485120
181	337	6	0	Fish level power sure.	1.2	3362816
268	637	4	1.1	Wall on describe wonder democratic total. It since process their you whether when.	1.3	2715648
303	811	9	0	Citizen goal writer staff.	1.9	4763648
113	704	4	1.5	Room make big agent face effect investment.	1.8	7675904
156	444	4	1.9	\N	0.8	6712320
304	346	1	0	Sound like professional stuff.	1.8	7218176
90	29	9	0	Sure minute which without service. Recognize call American huge community market.	0.9	2485248
276	370	4	1.8	Specific western rather artist foot hear.	1.9	3532800
110	348	4	1.0	Hair or crime fall he treatment though.	1.5	6371328
195	510	9	0	\N	1.7	4642816
251	601	4	0.3	\N	1.0	4770816
272	383	8	0	Play control southern reflect.	0.8	910336
188	727	4	0.4	\N	1.4	5455872
285	862	4	2.7	Well which stuff coach. Low spend here reflect always.	1.9	5156864
107	852	4	2.2	Can energy think probably TV language stage.	0.8	1095680
31	223	3	0	Majority finish generation evening down sort.	1.6	5747712
209	634	4	2.9	Consider serious remain they.	1.9	2685952
261	259	10	0	Away white pressure relate book again. Fly star may information before weight citizen.	1.1	6232064
58	985	8	0	\N	1.7	7007232
91	920	4	0.8	Soon note experience out none. These increase beyond entire try war.	1.8	2450432
122	708	1	0	\N	0.6	5744640
303	804	1	0	\N	0.9	7006208
58	982	4	1.6	Movement since care need certainly idea apply. Relationship understand argue garden piece general two.	1.0	3275776
45	910	4	1.5	\N	1.5	5322752
115	129	4	1.8	College catch animal building hotel dog training.	1.5	2795520
251	605	1	0	People former change bit.	0.9	1788928
214	281	4	2.8	\N	1.1	294912
250	27	8	0	Be oil fly.	0.6	1380352
151	389	10	0	Upon something visit officer.	0.7	5356544
32	478	6	0	Interest let itself blood phone trouble.	2.0	2808832
12	213	3	0	Watch gas face believe subject character stand.	1.2	8217600
192	46	4	2.8	\N	1.4	7522304
265	883	4	1.8	Prevent ten every outside six only. Manage huge stay learn.	1.7	8019968
86	157	4	1.9	Market machine product point serve role score.	0.5	4546560
152	297	4	2.7	\N	1.7	7985152
56	875	5	0	\N	1.0	3466240
45	901	4	2.8	Activity feel answer myself difficult.	1.3	3423232
112	4	4	1.5	Still more chance new official.	1.7	7034880
204	210	4	2.8	\N	1.6	5583872
9	232	8	0	\N	0.6	3223552
14	970	7	0	\N	0.8	7656448
83	428	4	2.4	Smile able model world soldier letter. Local question power maintain cost customer buy.	1.7	3853312
175	531	1	0	\N	1.0	1144832
22	491	9	0	Almost seven by leave current score key.	1.9	5609472
170	290	10	0	Commercial man almost phone rich affect doctor.	1.8	7792640
225	335	6	0	Understand especially class rise message dog site.	2.0	1426432
281	500	10	0	\N	0.8	3027968
209	613	4	2.2	Bar officer quite trade seat own.	1.7	6620160
257	294	10	0	\N	1.2	3094528
263	259	4	1.9	\N	0.6	5838848
185	286	4	2.4	Turn herself suddenly test toward form human.	1.4	7778304
264	118	8	0	\N	1.9	7931904
106	284	1	0	Station degree great identify.	1.9	6664192
125	644	4	2.9	Performance memory citizen single politics situation some.	1.4	1370112
55	536	4	1.3	\N	1.5	8140800
225	319	4	1.7	\N	0.7	930816
239	699	4	1.1	Piece environmental policy there cell site material dark.	1.5	2955264
246	360	4	2.4	Receive very management because bring.	0.5	2721792
261	262	1	0	Yes dog allow success summer.	1.1	7345152
263	269	4	2.8	\N	1.2	4116480
10	440	4	1.2	\N	0.8	3819520
115	131	4	1.9	\N	1.9	3812352
177	760	9	0	\N	1.6	4187136
271	512	4	2.2	Their law structure site four bad. Federal some individual.	1.5	7481344
25	511	1	0	\N	0.6	1737728
247	174	9	0	Arm rich often thank require.	0.7	4342784
222	244	4	2.8	\N	1.3	7177216
95	408	8	0	Remain low few ok response.	1.0	1810432
173	917	5	0	\N	0.7	1975296
171	167	4	1.2	\N	1.7	776192
245	14	3	0	Above operation concern.	1.4	3015680
263	276	7	0	\N	1.1	679936
160	167	8	0	Field tree land family. When stay see strong position.	0.6	8010752
292	732	10	0	\N	1.1	354304
308	368	4	1.3	\N	0.9	7654400
104	813	4	0.9	\N	1.2	3868672
304	345	4	2.7	Industry hand senior never ask bag politics.	1.9	5954560
215	856	9	0	\N	1.4	3929088
56	893	4	1.2	Board for bad soldier election unit only.	1.5	5841920
109	114	4	1.6	\N	1.8	6119424
199	97	4	1.2	\N	0.6	4480000
92	937	4	2.0	Race back while beyond not win piece. Choose exist will why middle.	0.6	8210432
115	117	4	1.2	\N	2.0	6383616
3	421	5	0	\N	1.5	2540544
312	221	4	2.7	Argue such data level magazine social score sell.	1.8	2469888
198	897	4	2.8	Wind her structure white order.	0.9	2184192
70	288	8	0	Early perform involve risk difficult dream.	1.9	236544
19	619	4	1.9	Friend throw available everything indicate.	0.7	3016704
112	2	9	0	\N	1.2	7711744
203	334	4	0.3	Activity five piece so dark Democrat.	1.4	4557824
276	374	7	0	Majority four doctor relate threat. Theory manager language allow game.	1.3	296960
19	636	4	1.7	\N	1.9	3704832
296	446	4	0.3	Way church almost practice wait. Trouble you attorney power direction carry.	1.6	5855232
17	980	4	1.9	\N	0.9	7900160
247	169	9	0	Girl rather policy.	0.9	417792
264	115	6	0	Firm behind best government owner interest sea.	1.7	1851392
114	699	4	2.3	\N	1.8	5210112
146	160	4	1.6	Concern happy what suddenly leg need beautiful. Serve everyone old positive include piece wonder.	1.9	4970496
250	42	4	2.6	Machine successful outside upon.	1.9	384000
278	256	4	2.0	Medical dinner their.	1.5	5713920
275	784	4	0.0	Night measure fall paper billion often.	2.0	4503552
313	105	8	0	\N	2.0	7804928
70	287	6	0	Pay billion unit out.	1.7	3475456
22	472	4	1.7	Hold husband cultural question.	1.8	4714496
17	959	1	0	\N	1.0	4873216
68	258	4	1.8	Instead try condition blue seven wrong can news.	0.8	6287360
118	937	5	0	\N	1.5	2578432
122	710	4	2.9	\N	1.0	6702080
97	647	5	0	\N	1.1	3823616
230	198	4	0.1	\N	0.8	5322752
263	271	5	0	\N	0.8	7248896
265	871	7	0	Sort she pay effect.	1.5	7389184
316	52	4	2.2	\N	1.1	977920
244	384	6	0	Official thousand ever note soldier local hot.	0.7	1527808
256	780	4	2.0	\N	1.9	3041280
262	1	4	2.3	Second affect reduce painting hour something civil.	1.4	4028416
161	239	4	1.2	\N	0.8	590848
184	56	4	1.3	\N	1.6	1758208
284	119	4	1.6	\N	0.9	4260864
325	554	4	1.2	Sometimes begin meet item too anything. Must later common property road.	1.9	2228224
243	567	4	2.9	\N	1.1	7521280
314	904	4	1.1	Their look would program box increase have. Cell traditional board establish together kitchen food.	0.5	7352320
33	978	4	1.5	Able so point of simply management.	1.6	215040
169	790	9	0	\N	1.9	457728
261	271	1	0	Talk fall almost step popular hit training scene.	0.7	115712
64	536	4	1.3	\N	1.2	4979712
164	813	4	0.2	\N	1.3	1096704
150	148	4	0.8	\N	1.7	2994176
250	14	5	0	\N	1.4	741376
127	662	1	0	Relationship surface in election American save describe. Total tonight young process law such strong.	1.0	7126016
39	770	4	0.0	\N	1.8	502784
11	855	4	2.0	\N	1.2	918528
17	970	6	0	\N	1.2	3715072
307	874	5	0	\N	0.9	5466112
323	3	7	0	\N	1.9	2152448
46	278	3	0	Rule tell laugh full high.	0.5	4571136
87	851	5	0	Least name likely chance serious about adult add. Huge recently both room walk professor scientist.	0.8	6918144
264	122	4	1.4	Onto local several laugh weight rise far.	1.7	306176
321	143	9	0	Usually behind at agency.	0.9	5768192
8	640	4	1.7	\N	1.9	3361792
212	845	3	0	\N	1.8	5724160
283	290	3	0	Popular property administration nothing. Future environmental hit surface well little within.	1.6	2077696
32	472	4	1.7	\N	1.8	7491584
6	848	4	2.4	Quite sport all coach role year. Push serious ground member yard home it allow.	1.5	4441088
268	634	4	2.9	\N	1.8	1454080
192	43	4	2.6	More nation place within.	1.9	7864320
121	343	4	2.9	Choose even actually run clear store.	1.2	5398528
170	294	4	0.7	Recent risk case all them include low.	0.6	969728
155	93	6	0	\N	1.3	2293760
17	986	8	0	\N	1.3	5753856
281	512	4	0.1	\N	1.8	1976320
86	156	4	1.6	Use prevent bed benefit. Enter step mission.	1.8	7489536
128	715	4	2.8	\N	1.6	4850688
123	713	3	0	\N	0.8	3241984
108	365	4	1.7	Strong night instead.	0.7	6900736
288	600	5	0	Lose you adult almost hundred. Support network leader owner.	0.6	2740224
24	37	8	0	\N	0.6	6643712
78	891	10	0	Her almost appear see.	0.7	1963008
90	18	4	1.6	\N	1.3	8025088
135	49	4	0.9	Note body current. Yes news professor believe western recent.	1.3	4676608
150	144	4	2.7	First key bar room who.	1.3	6438912
157	241	6	0	\N	1.4	8020992
172	278	5	0	\N	0.9	2139136
294	148	4	1.8	Republican late evening meet politics customer even present.	1.7	8138752
156	449	10	0	\N	1.2	3667968
276	368	5	0	Reason a expect.	1.9	2932736
211	255	10	0	All member spring better kitchen president. Government again smile anything simply loss.	2.0	7518208
326	617	4	1.4	\N	1.0	6305792
168	296	4	2.4	Organization course television during his may.	1.7	4726784
270	134	4	1.1	Learn him degree.	1.6	7003136
83	446	4	1.3	Rock make decide whatever ability argue.	1.9	2237440
83	443	4	1.1	\N	1.3	667648
115	116	9	0	\N	0.8	5017600
275	791	9	0	\N	1.1	499712
297	515	9	0	\N	1.1	5297152
156	440	4	1.2	Real forward run perhaps.	2.0	6168576
231	662	8	0	Food good himself.	1.8	7981056
162	662	7	0	\N	1.9	2993152
205	79	5	0	Look suggest though position.	1.0	7640064
208	122	4	1.4	Feeling foot could very police.	0.9	3931136
292	728	4	1.3	\N	1.4	2842624
33	966	5	0	Garden purpose argue. Staff thank receive arm doctor wish.	1.7	359424
100	380	1	0	House sport she Republican operation behavior. Common along first partner treatment reach board.	1.7	3104768
56	882	4	1.6	Woman dinner job sing commercial. Particular color how energy third scene.	1.4	1545216
123	708	4	1.4	Five dog worker pick.	1.7	8240128
36	759	4	2.5	\N	1.8	5699584
259	118	4	2.4	\N	0.6	6341632
64	546	9	0	Black sometimes baby indeed.	0.8	3658752
58	971	4	1.8	Situation appear direction manager. Local direction maybe decision.	1.0	3610624
245	20	10	0	\N	0.7	7747584
224	313	4	1.0	\N	1.3	3734528
100	377	4	2.4	\N	1.6	1214464
41	549	4	0.8	Seem seven us face third daughter training.	0.6	2967552
185	297	9	0	Strategy it growth democratic goal near.	1.9	5404672
209	615	4	1.0	\N	0.7	7205888
32	479	4	2.2	Ever place three strong what.	0.9	5885952
61	715	4	2.4	\N	1.3	5873664
268	613	6	0	\N	0.6	5289984
290	567	6	0	Stop fall long expect. Poor why nothing memory.	1.1	1599488
232	759	3	0	Follow red above lose take enjoy bill claim. Budget return who.	1.3	188416
295	954	4	1.6	\N	0.8	7470080
298	215	4	2.3	Down goal brother project attention bad detail.	1.6	7149568
299	986	7	0	\N	1.2	761856
90	36	1	0	\N	1.1	194560
209	633	4	1.1	\N	1.6	5860352
103	206	3	0	Affect her card.	0.7	1444864
104	809	6	0	\N	2.0	2380800
135	54	4	1.3	Kid must support hold rock three assume late.	0.8	2971648
78	887	4	2.3	Media thus available teacher receive health. Day maybe use yeah system.	1.0	259072
298	208	4	2.2	Whom who play because start until against upon.	0.9	555008
87	854	10	0	Defense check ago week.	1.1	5307392
133	710	4	2.9	\N	1.0	5642240
134	411	10	0	\N	1.7	4910080
175	526	4	2.5	\N	1.4	2025472
103	207	7	0	\N	1.2	5454848
206	712	4	1.5	Woman draw term mouth item.	1.6	1049600
55	562	9	0	\N	1.7	1474560
159	3	4	1.8	\N	1.7	1036288
299	967	9	0	\N	1.0	2671616
195	498	4	2.9	\N	0.9	6002688
201	918	7	0	\N	0.6	6766592
64	535	4	2.8	\N	1.4	2667520
285	856	4	0.3	Old herself young next.	1.9	4958208
29	573	3	0	Ever wear score movement sense level.	1.7	5039104
73	514	4	2.8	\N	1.1	5104640
150	149	4	1.8	Section activity site.	1.7	7247872
102	771	9	0	Enjoy young former allow pattern practice here walk.	1.3	7238656
15	146	4	2.9	\N	1.2	6332416
111	788	3	0	\N	1.0	7184384
326	628	9	0	Office something sometimes look west short our. Rather series time large plan management.	0.9	3009536
134	418	4	1.6	All account plant realize simple care.	1.2	1508352
59	663	4	1.6	We both open both.	1.9	7457792
88	571	7	0	Usually deal case ask wait decide hope father.	1.9	1838080
196	745	6	0	\N	0.6	2804736
259	131	4	1.9	\N	1.3	2835456
26	75	4	1.4	Easy product low.	1.4	3802112
211	257	4	1.5	Go subject many.	1.4	7318528
86	172	5	0	\N	1.8	7664640
76	358	4	0.3	Easy structure language dream key. Especially week difference by analysis likely.	1.3	3729408
87	865	7	0	\N	1.9	3055616
160	169	4	0.0	Figure Republican ball.	2.0	6321152
229	278	3	0	\N	1.0	1735680
212	847	7	0	\N	0.7	873472
316	47	5	0	Challenge around fly fast world relate. Movement agent catch sure both.	1.3	6397952
156	442	4	1.9	\N	1.0	7083008
190	683	4	2.4	Take commercial star.	1.9	1698816
280	844	8	0	Production off approach necessary well room marriage.	1.8	5508096
85	316	6	0	\N	0.6	1705984
19	624	4	2.2	\N	1.2	499712
39	763	4	1.0	Standard not trial despite race perhaps.	1.4	2320384
272	399	4	1.7	\N	1.9	1241088
276	376	4	0.3	\N	1.9	2060288
310	717	4	1.2	Artist her clearly perhaps. Middle size cultural conference.	0.6	5827584
129	405	4	2.7	Stand value collection carry record yard buy.	0.9	6099968
267	302	4	2.3	\N	1.8	2170880
125	650	9	0	\N	1.2	708608
201	926	4	2.7	Type administration major activity dinner.	1.7	3444736
42	496	3	0	Office contain whether light dog good hit. Door name interest medical space second down.	1.7	6133760
24	30	10	0	\N	0.5	820224
122	711	4	1.4	\N	1.7	3979264
164	811	10	0	Well series hotel decision message thus.	0.7	5852160
175	530	4	2.2	Address test could know memory.	1.3	2485248
23	276	4	2.5	\N	1.6	5711872
325	557	7	0	Each friend middle call stuff owner.	1.9	6187008
90	10	9	0	\N	0.7	620544
100	366	8	0	\N	1.7	4679680
58	970	4	2.4	\N	1.4	7261184
268	635	8	0	See friend threat type. Beautiful heart whether team ago catch.	0.9	7942144
78	882	7	0	\N	1.6	1430528
160	165	8	0	\N	0.8	7061504
245	32	4	2.9	\N	1.4	5391360
317	570	4	1.2	\N	2.0	759808
52	322	8	0	\N	1.6	812032
76	359	7	0	\N	0.9	2657280
175	523	4	0.1	\N	1.4	5877760
90	11	4	1.1	Throughout project size material choice care never.	1.4	1120256
166	217	4	1.5	\N	1.5	4044800
97	641	4	2.3	\N	1.9	5817344
179	741	4	1.5	Scientist defense affect place beautiful our. Republican special there either physical rock kid.	1.1	1876992
291	114	5	0	From boy nor leg appear occur.	1.8	3723264
152	295	4	0.2	Seek site tonight serve difference nature carry. Serious beat less father.	1.3	8231936
209	632	4	1.3	\N	0.9	2477056
154	705	1	0	\N	1.3	7763968
44	745	8	0	System attorney energy which success side teacher already.	0.6	6906880
282	983	4	0.8	Sense community speak too back now rich everyone.	0.7	5628928
97	652	5	0	\N	1.1	1026048
162	661	3	0	Data understand actually often. Level white sing look purpose explain.	1.8	6106112
14	967	1	0	Audience mention benefit important whatever fire item.	1.5	1474560
128	719	10	0	Property land many born act small talk.	1.0	958464
303	803	4	2.0	\N	1.8	7328768
208	115	4	1.7	Piece simple six score night best join. Dinner my develop event skin.	1.7	8258560
100	376	4	2.4	Music drive report say. Miss standard third.	1.7	6076416
171	171	4	1.2	Create another travel wish admit certain whom.	1.3	3953664
160	173	4	2.3	Area writer side either middle recently.	1.3	2857984
205	67	4	1.9	Interesting recently war gas.	1.0	2308096
247	152	10	0	Everybody summer value because.	1.9	1664000
326	623	3	0	\N	1.7	2528256
141	495	3	0	\N	1.0	5642240
321	135	4	2.9	\N	1.7	2722816
225	320	8	0	\N	1.9	104448
30	492	4	1.8	The heavy must development. Authority middle card believe.	1.0	7804928
111	792	5	0	\N	0.8	431104
122	709	4	0.9	\N	1.3	3718144
199	94	4	1.8	Design become six party.	1.1	2332672
67	375	7	0	\N	1.2	8164352
88	580	4	1.5	\N	1.9	4304896
83	429	4	1.6	\N	1.3	5191680
26	85	4	2.3	\N	0.9	3058688
236	704	10	0	Public cut item sport scene.	1.3	4799488
238	767	4	2.6	Fast fall audience success build use reveal else.	0.6	1657856
266	935	9	0	Job phone seem continue south agent score charge.	1.0	3031040
174	570	4	1.2	Treatment grow against a unit manage.	0.8	3438592
133	709	4	0.7	Prevent score particular sort.	1.2	3235840
132	321	9	0	Just hour own near see community.	1.2	3825664
134	414	4	0.9	\N	1.1	5300224
239	703	1	0	\N	1.2	7392256
296	456	1	0	Pretty produce citizen figure.	1.3	577536
307	883	4	0.7	\N	1.5	4129792
307	892	8	0	\N	1.4	3001344
70	289	4	0.7	Study fly manager I country likely scene. Stage among speak share cultural rise southern.	1.4	5019648
318	207	4	2.0	Much Democrat newspaper structure gas blue condition. Buy as instead suggest.	1.6	651264
49	937	4	2.6	Safe indicate without build.	0.8	7592960
148	13	10	0	Music put bad out behavior agency teach each.	1.3	5465088
56	884	1	0	The board as present affect next decision.	1.3	5663744
75	404	4	2.9	\N	0.8	2141184
156	458	3	0	Relationship week once ready.	0.8	4059136
172	270	4	2.4	\N	1.6	2561024
287	360	4	2.4	\N	1.9	1226752
271	498	4	0.9	Kitchen protect position send special hit agent.	1.0	4427776
100	370	6	0	\N	1.3	4755456
268	624	4	2.5	\N	1.4	1988608
19	615	4	1.0	Soldier image TV law four everything role.	1.0	6568960
24	38	7	0	Hear election wall decision fire raise rest. Peace treat training phone three.	1.5	6555648
45	903	4	1.5	Year left outside several when. Area one seem worker past we cut.	1.0	914432
320	489	4	2.8	Yard drop difficult reach.	1.8	5526528
84	492	4	1.8	Capital she election service surface affect.	1.2	6780928
115	122	5	0	Simple true maybe animal. Color tend teacher difference.	0.9	5760000
194	770	7	0	\N	1.8	3118080
277	83	8	0	\N	0.8	4704256
263	260	10	0	\N	1.6	7235584
151	400	10	0	Performance special Mrs great provide. Paper too make sit because.	0.6	4085760
10	435	4	2.3	Within it something develop any woman.	1.2	5953536
33	984	4	1.9	\N	0.8	7771136
146	164	9	0	Morning wall catch.	0.8	6029312
263	261	4	2.5	\N	2.0	8045568
13	870	4	2.5	\N	1.7	1980416
125	653	4	2.1	\N	1.9	4339712
90	15	4	2.5	\N	1.0	713728
233	461	7	0	\N	0.8	2881536
293	576	7	0	\N	0.7	2264064
278	250	1	0	Property onto speak think.	0.8	1602560
66	908	4	2.1	Institution possible direction.	0.7	3923968
203	330	6	0	Lay experience need eight country population.	1.8	2256896
144	706	7	0	\N	1.0	5083136
72	617	4	0.9	Food camera require treat drop discuss machine suffer.	0.9	576512
298	205	4	1.8	Stage sense floor both figure activity sort reduce.	1.9	4183040
213	934	6	0	\N	0.9	6038528
201	919	4	0.4	\N	1.1	8002560
215	868	9	0	Various nature level.	1.0	4818944
44	740	4	2.8	Represent friend great before.	1.5	363520
107	851	7	0	Collection best Mr interesting response. Role down business bad bill ball we.	1.1	2637824
26	90	4	1.5	Describe anyone road responsibility significant still view eye.	1.2	5040128
72	627	7	0	Tree air least.	1.9	7590912
184	53	4	1.5	Lose young be return say hotel.	1.2	5884928
205	62	4	1.2	Follow quality process goal back account.	1.4	1178624
32	482	4	2.4	\N	2.0	877568
318	213	8	0	Prove value animal student.	1.9	8004608
313	102	4	1.5	One enough your box describe skill along.	1.0	4874240
168	291	4	1.7	\N	1.3	5495808
1	139	9	0	\N	1.0	634880
294	147	6	0	\N	1.2	1789952
33	960	4	2.3	Over year represent get.	1.2	4501504
104	801	3	0	Manage page whether movie.	1.2	1864704
277	71	4	2.5	Serve against three but citizen chair.	1.8	7515136
297	530	3	0	Significant heart allow whom tough.	1.6	1627136
101	767	8	0	\N	1.8	6935552
146	153	4	0.6	\N	1.6	5839872
14	960	4	2.3	\N	1.0	3565568
299	958	4	2.4	\N	1.0	8241152
208	118	3	0	\N	1.4	2494464
177	759	10	0	\N	0.6	3650560
56	874	4	2.5	Environmental another without determine month. Shake rest sea once approach hard light approach.	1.1	2605056
11	856	8	0	\N	1.3	6742016
52	328	9	0	Those name until month rest practice. So civil Mrs else explain ground suddenly.	0.7	5613568
57	864	4	0.8	\N	1.7	4952064
155	76	4	2.9	No feel sell finish.	0.9	3865600
33	970	4	2.8	\N	1.8	8038400
158	262	4	1.9	From standard too go.	1.0	5131264
306	223	6	0	\N	0.6	7142400
309	287	9	0	\N	1.6	6111232
259	132	1	0	\N	1.5	5580800
46	260	4	0.1	Financial get month deep.	1.8	6140928
134	416	8	0	Paper staff base.	0.6	6529024
269	326	6	0	\N	1.9	3903488
245	29	3	0	\N	1.7	2472960
22	482	4	2.4	Evidence myself thank serve rate bank like.	1.0	7255040
288	609	7	0	\N	1.8	7657472
12	209	4	1.4	\N	1.2	4050944
220	720	5	0	Blood quality happen for arrive area line west.	0.9	2043904
308	375	6	0	Possible those opportunity professor positive large.	1.6	2496512
32	477	10	0	Room their easy in art.	0.9	4367360
16	767	7	0	\N	1.1	6457344
261	275	4	2.2	\N	0.6	2748416
318	209	5	0	\N	1.7	1634304
174	568	4	1.7	Area let far if home stuff.	0.8	3102720
306	224	6	0	War environmental key vote side form six enjoy.	1.3	4247552
64	560	4	2.2	\N	0.7	751616
229	272	4	1.1	\N	0.8	5046272
8	642	4	2.0	\N	1.8	7873536
278	245	4	1.1	Up on box heart even brother enjoy.	0.7	2902016
203	327	9	0	Money above husband forward.	1.1	5704704
58	966	6	0	\N	2.0	7332864
148	10	3	0	Support thank establish employee work financial nature hour.	0.8	1394688
101	764	4	2.6	Single federal right.	1.1	3558400
30	474	4	1.1	Reason most trade price describe Mr address.	1.2	2980864
224	309	4	2.9	Radio room focus arm would two course.	1.5	303104
62	406	7	0	\N	1.2	6310912
135	43	4	0.9	\N	1.2	5520384
202	814	4	2.5	\N	1.3	4490240
30	475	4	2.3	Include stock walk few management carry. Personal government pressure range.	0.9	5708800
46	270	3	0	Anyone better room full prepare boy bring.	2.0	2760704
207	313	4	1.0	Service candidate two use point.	1.9	6683648
192	56	6	0	Resource apply north.	1.2	7347200
282	961	3	0	Yeah still coach than.	1.6	4454400
29	580	10	0	\N	1.0	119808
168	288	4	0.4	Bed red risk data new.	1.1	4541440
137	120	4	2.7	\N	1.9	3775488
235	272	1	0	\N	1.0	7416832
250	39	4	2.0	Store perform stay sister east statement.	0.9	5649408
247	153	4	0.6	\N	1.1	6714368
199	102	4	1.5	\N	0.7	4779008
182	899	4	2.3	Break Democrat official receive free figure.	1.6	517120
291	128	4	1.6	Best court politics fight decide data.	0.9	1866752
20	218	4	1.8	\N	0.8	2807808
46	275	4	2.2	\N	1.8	506880
41	544	4	2.2	\N	1.5	4357120
112	1	3	0	Surface front case long action determine interesting.	0.5	5792768
40	380	4	2.4	\N	1.1	4048896
164	802	4	1.5	Candidate himself strategy fill them thousand.	1.6	657408
48	367	4	2.0	Together pull on million evidence since. Stand culture media environment easy per focus.	1.3	6560768
181	341	5	0	\N	1.6	392192
180	336	10	0	Whole answer month very. Attorney population remember half poor food.	0.7	7989248
24	41	4	2.9	South at they owner. Collection study blue we report itself instead very.	1.2	409600
250	10	4	1.5	Listen even pay any south increase. Meet activity beyond camera need peace pass.	1.2	6719488
255	583	4	2.5	Forward bad store American region safe difference season. Role threat manager task.	1.3	1053696
229	273	4	1.4	\N	0.6	2850816
50	704	4	1.5	\N	1.6	7814144
257	297	4	2.7	Better wind management account reality. Apply position give fear cultural impact very.	1.4	529408
148	40	4	1.3	\N	1.2	3494912
225	322	6	0	\N	1.7	2733056
291	117	4	1.2	\N	1.7	6981632
24	34	1	0	\N	1.7	3778560
195	511	3	0	Buy live vote my less ability music. Itself politics business article individual.	1.9	7208960
302	339	4	1.2	\N	0.8	889856
302	340	4	1.6	\N	1.8	6508544
313	113	4	1.1	\N	1.5	6176768
66	912	4	1.7	Challenge true chance home.	1.8	7141376
98	346	4	1.0	Reality exist hair low speech president source.	0.8	2956288
127	660	4	2.7	Forward she share fish.	1.9	4144128
189	734	10	0	\N	0.6	2538496
209	614	6	0	\N	1.2	3312640
167	604	5	0	Agent participant beyond be push trade. Rise service middle stage.	0.6	1236992
257	286	4	2.4	\N	1.5	4784128
167	603	1	0	Little place story development point tell.	1.0	973824
224	315	4	1.4	\N	1.4	8256512
160	172	10	0	\N	0.9	2245632
22	487	4	2.9	Property soldier main determine big.	0.6	634880
170	288	4	2.6	Fall spend care suffer themselves sell send.	1.1	2463744
244	399	9	0	\N	1.5	4371456
228	106	1	0	\N	1.0	7233536
271	507	10	0	However spring set our fish seven.	0.6	3739648
15	143	9	0	Including gun vote five whom painting board.	2.0	5405696
256	782	9	0	\N	0.8	6516736
207	312	4	2.4	\N	1.4	4289536
223	848	4	2.4	Happy food development plan.	1.1	6164480
295	941	1	0	\N	0.7	920576
291	121	4	2.8	\N	1.4	2995200
22	479	4	2.2	Investment those spring among activity because lawyer.	1.4	3808256
247	154	4	2.1	Sit oil join nature.	2.0	301056
227	937	4	2.6	\N	1.7	2697216
23	273	1	0	Community foot level knowledge.	0.8	5207040
296	439	7	0	Play oil past threat.	1.7	2755584
242	87	4	1.1	Teach positive college.	1.3	3136512
276	380	4	1.0	Camera use education black soon own. Order seat hospital part.	0.8	3047424
195	508	4	2.9	\N	1.1	4756480
186	740	1	0	\N	1.7	1795072
148	24	7	0	Consumer huge fine rest opportunity main.	1.3	8276992
175	532	4	1.2	\N	1.0	4090880
264	116	6	0	Chance easy make fall.	1.7	788480
13	884	9	0	Believe single prevent develop.	1.4	3731456
91	922	3	0	\N	0.9	2816000
268	631	4	1.7	\N	1.5	6552576
292	734	6	0	Ball success stand true factor.	1.4	3539968
9	240	4	2.9	Century seat trade majority name school over serve.	0.7	6751232
255	573	4	1.5	For report Republican structure.	0.9	5159936
229	268	3	0	List hot boy director.	0.6	6079488
192	55	3	0	Family question language according dark after personal.	1.7	1930240
247	172	5	0	\N	1.7	4538368
17	968	10	0	\N	1.7	5371904
190	695	8	0	\N	1.0	2059264
261	276	9	0	\N	1.7	4015104
184	50	9	0	\N	0.7	7143424
270	135	6	0	Necessary whatever rise near eye market.	1.3	2070528
68	249	10	0	\N	1.9	1840128
299	970	3	0	\N	1.0	6342656
253	404	4	0.3	\N	1.2	6598656
147	333	4	0.0	\N	1.5	1955840
183	244	1	0	Newspaper son tend difficult pattern myself.	1.4	3482624
42	482	6	0	\N	0.6	6858752
135	60	4	2.4	Town interesting community where.	0.6	4934656
147	331	7	0	Argue amount likely together nor.	1.1	2991104
314	908	4	0.1	\N	1.1	3603456
207	315	4	1.4	\N	1.5	6848512
315	512	10	0	\N	1.5	2484224
147	334	4	2.4	Wide quite too couple.	1.5	5198848
13	891	3	0	\N	0.7	561152
23	271	9	0	\N	0.5	4410368
308	377	4	2.4	\N	0.7	6925312
32	471	4	1.1	\N	0.7	3096576
296	438	7	0	\N	1.9	2760704
132	324	4	1.4	\N	0.9	1854464
86	177	4	1.2	\N	1.2	4321280
107	867	5	0	Keep point threat whom. Certainly blue agency guy.	1.9	3633152
83	431	4	1.4	Produce manager stay. Have gun others safe.	1.2	4860928
111	789	6	0	Here to agent century deep boy beat.	1.0	2520064
160	151	7	0	Else either local should west throw own.	1.1	4764672
213	931	4	1.9	\N	0.9	6406144
247	168	4	1.8	Claim though entire change.	1.7	4547584
58	976	9	0	\N	1.3	4718592
303	796	4	1.1	\N	0.6	5050368
313	109	4	2.3	\N	1.1	2529280
319	898	4	2.9	Able red edge evening section.	1.5	2689024
8	651	4	0.4	Or yet chair nor they. Who western movie treat.	0.6	451584
60	724	5	0	Represent add collection join something side new. These item star low head state down Mrs.	1.7	2244608
10	428	4	2.4	Less create maybe represent to only bank.	0.7	1616896
71	792	4	2.4	\N	1.6	2180096
245	8	3	0	Set drug response feel window eye next.	1.6	1461248
244	401	4	2.7	Those company list yard forward question. Know course evidence agree more agent bit phone.	1.3	1865728
312	222	1	0	Material yourself too everybody probably make foot.	1.4	1595392
72	616	4	1.1	Feel toward friend local. These positive question system store together.	0.8	3038208
202	811	4	2.3	\N	1.6	226304
322	683	6	0	Authority pass fact.	0.5	2616320
259	129	4	1.9	Wrong call north. Plant blood eight stock three industry between.	1.8	2996224
303	812	4	1.6	\N	0.9	1815552
228	105	1	0	Same training prepare.	0.8	7146496
239	700	7	0	Personal outside time green eye sit for.	1.2	1945600
119	868	4	1.6	Should brother by card.	0.9	2024448
235	265	4	1.3	His camera explain. Skin writer reflect situation money modern.	1.7	6986752
257	289	4	1.0	Analysis eat indicate they rich court investment.	1.5	4691968
131	567	4	2.9	\N	0.9	6406144
199	110	4	2.0	After law fund reach expect. Kid main strong.	0.6	2239488
271	511	8	0	\N	1.5	4878336
225	332	6	0	Benefit move key at.	0.6	7464960
277	66	4	0.2	Throughout green tree few food bar rise.	0.7	2310144
55	553	6	0	Able game large painting to accept kind. Claim put enough physical behind first audience.	1.3	1181696
81	747	5	0	Every goal possible picture.	1.3	2361344
313	112	4	1.0	\N	0.8	7565312
32	473	10	0	\N	0.8	6531072
146	157	4	1.9	\N	1.4	2332672
236	699	7	0	\N	2.0	6585344
211	258	4	1.8	Forward race approach lawyer. Half movement though serious.	1.4	842752
150	136	5	0	\N	0.9	218112
43	857	4	2.7	Management ready none government fact kitchen.	1.4	661504
26	87	4	1.1	Tend ready since tend make Mrs.	1.4	4214784
111	778	4	1.3	Budget character kid figure.	1.8	5322752
282	969	6	0	\N	1.5	7183360
148	32	4	0.9	Outside keep no general near every.	1.2	6126592
20	220	4	1.3	Amount people high require. Several respond black war both.	0.6	784384
155	78	10	0	Against kind quickly claim.	1.4	206848
252	946	1	0	\N	1.7	3261440
28	360	7	0	\N	1.5	1336320
12	212	4	1.2	\N	1.4	5135360
195	502	4	2.4	Identify necessary present.	1.4	8229888
155	63	1	0	\N	0.7	2673664
185	290	3	0	\N	0.8	2283520
192	54	4	1.3	\N	1.3	3883008
17	963	9	0	\N	1.4	1196032
19	616	4	1.1	\N	0.7	328704
19	627	10	0	\N	1.8	2584576
24	18	7	0	Yeah instead city program bad serve fight our. Make activity value listen security than result.	2.0	3787776
85	317	4	2.6	\N	1.4	3556352
295	948	4	2.6	\N	0.5	2704384
56	871	6	0	\N	0.9	1461248
148	39	4	2.0	\N	0.7	2132992
258	937	4	2.6	Exactly picture we find mention begin.	0.7	379904
242	81	4	1.7	Education energy lead within paper method.	1.7	936960
235	260	4	2.0	West reflect history prevent choice.	1.4	1903616
52	325	4	1.8	\N	0.5	5926912
299	961	8	0	\N	1.8	6502400
80	822	4	1.5	Week another radio political check eat teacher usually.	0.6	2041856
19	634	3	0	\N	0.8	5111808
58	959	4	2.0	Modern similar message bed remember shake perhaps.	0.6	7883776
245	33	4	1.5	Wonder window real nature finally.	1.3	7380992
236	703	8	0	Source provide seven life catch.	1.6	1487872
169	785	9	0	\N	1.4	5719040
161	241	3	0	\N	1.8	5261312
8	655	4	2.6	\N	1.2	4953088
192	57	3	0	\N	0.8	1371136
135	58	4	2.2	Up capital myself structure.	1.0	6511616
125	642	7	0	Others leave left security region.	0.8	8276992
233	467	8	0	Itself college approach attack outside affect.	1.4	952320
230	185	9	0	\N	1.1	5281792
295	951	4	1.1	\N	2.0	1870848
112	3	4	0.5	\N	1.6	3032064
197	122	8	0	Turn leader recent.	1.0	7642112
282	984	1	0	Statement public trial realize available officer lay vote.	1.9	6659072
5	744	4	0.7	\N	1.5	2877440
17	984	10	0	\N	0.5	3372032
205	73	4	1.0	Military effect letter administration the memory.	1.9	1042432
228	99	7	0	Building southern until huge yard drive throw. Executive sense Republican those anyone reason physical fund.	1.8	6502400
200	746	4	0.5	Answer leg teach focus give race other.	1.0	5558272
247	150	4	1.2	\N	1.9	6190080
43	851	6	0	\N	1.7	663552
10	451	5	0	\N	1.5	706560
314	916	4	1.3	Piece program before fight. Federal look even create show.	1.5	4908032
123	710	4	2.9	Thousand feeling friend us education skill without.	1.1	2391040
67	365	8	0	Off difference little fast hit consider attorney.	0.9	6182912
299	987	4	1.1	Successful audience report gun plant along billion east.	0.7	4599808
325	550	4	1.5	\N	1.8	5187584
137	116	4	1.9	\N	1.8	2483200
248	936	3	0	\N	1.8	5688320
284	130	7	0	\N	1.3	332800
130	406	1	0	Indeed entire she speech authority.	1.2	1988608
204	216	6	0	\N	1.7	4070400
230	178	4	1.0	Hit friend democratic voice imagine.	1.6	756736
67	373	6	0	\N	1.4	4988928
214	280	4	1.6	\N	1.3	5018624
292	733	4	2.5	Spring turn key single.	0.8	3033088
146	176	3	0	Option condition onto money.	1.8	2349056
9	229	4	1.9	\N	1.8	6705152
152	290	1	0	Book all respond father season thank soon draw. Him real analysis guy.	1.3	2146304
311	279	4	2.4	Animal method for push.	1.3	1167360
108	371	1	0	\N	1.2	3141632
72	638	4	2.8	\N	1.9	2824192
150	134	4	1.1	Central front card.	0.7	3470336
24	16	9	0	Offer lay moment may summer use.	0.5	2864128
61	718	4	2.6	Industry group development skill themselves wait computer democratic.	0.9	1076224
208	116	4	0.4	\N	1.4	2682880
25	508	4	1.6	Choice example science apply individual.	1.4	4164608
249	337	4	2.9	\N	0.6	7831552
251	597	7	0	\N	0.8	176128
30	472	4	1.7	Foreign power cause scene hope whom plan statement.	0.8	6719488
291	133	1	0	\N	1.2	4265984
54	793	4	0.6	She method military your. Service safe from chance big what whole compare.	2.0	4856832
242	76	5	0	\N	0.9	3349504
85	309	7	0	\N	1.2	4977664
27	726	7	0	\N	1.2	1300480
292	724	4	1.7	Record support nation war animal. Understand everything our town anything budget instead tax.	1.8	1091584
280	836	8	0	\N	1.6	6808576
295	952	4	0.9	Quite and forget why develop.	1.6	7596032
269	328	10	0	\N	1.0	2442240
74	569	9	0	\N	1.5	2243584
72	632	4	2.0	Evidence take behind yard analysis peace. Administration small similar cover benefit move truth industry.	1.6	1449984
86	164	4	0.8	\N	1.8	3281920
32	474	3	0	\N	1.6	3563520
175	524	4	0.2	Democratic social wall debate money leader.	1.0	2579456
90	25	4	1.9	Page site base open.	1.5	3287040
161	233	4	1.3	Think to land east.	1.9	5978112
197	129	5	0	Several stop guess structure prevent leave spring.	0.8	3169280
56	886	4	1.9	\N	1.4	1328128
264	125	4	1.9	History scientist force a add throughout.	1.0	7493632
172	271	8	0	Order industry company.	1.6	5910528
32	476	4	2.2	Final break much everyone.	1.2	7296000
249	340	9	0	Bar use entire cut class. Between provide loss drug which.	2.0	5647360
87	853	4	1.9	Reveal conference allow attorney executive then.	1.0	247808
187	3	4	1.8	Soon new however itself with. Surface spend present time various true professional.	1.4	6487040
33	973	7	0	\N	0.6	4596736
48	370	5	0	Wonder beyond fine as surface personal.	0.7	2865152
192	45	9	0	Leg involve four think.	1.2	1848320
54	784	4	1.9	Blue local leg resource name they. Baby speak stuff true something skin spring.	0.8	7216128
148	42	7	0	\N	1.6	5460992
247	170	1	0	\N	1.6	5963776
160	168	1	0	Mission firm father represent decade safe.	0.7	4912128
212	850	8	0	Place decide almost question health recognize become.	1.2	5024768
202	798	6	0	\N	0.6	6410240
278	249	3	0	\N	1.8	1986560
303	797	4	0.6	Room effort beyond along play.	1.0	4258816
316	44	4	1.1	\N	1.1	4939776
6	846	4	1.6	Movement crime situation.	1.4	2299904
52	329	4	2.8	Close first gas.	1.0	4488192
225	328	4	1.0	\N	0.5	167936
325	549	9	0	\N	1.5	1427456
242	69	4	1.3	Identify role purpose box.	1.4	7538688
296	427	6	0	\N	1.5	8271872
17	983	1	0	Congress interview majority language responsibility memory.	1.9	475136
272	391	4	1.2	Three true admit as this exist. Gun of responsibility record short.	1.7	7177216
242	85	9	0	Box pull plan moment other staff.	0.7	3082240
250	9	4	1.5	\N	1.2	508928
271	497	4	2.8	Letter writer few theory.	1.3	4196352
22	476	7	0	Already material key mission fast white answer.	1.5	3019776
10	459	4	1.5	\N	0.7	8215552
119	851	4	1.6	Factor town tree religious TV.	0.5	3648512
144	701	4	2.5	New dream require hot allow.	1.1	3793920
326	615	4	0.2	Reason brother mean artist trouble responsibility blue surface.	1.6	3903488
10	433	4	2.0	\N	1.2	5562368
33	980	4	1.2	Late start simply act ten usually up local.	1.1	4907008
74	570	4	1.2	Behavior grow happen arrive professor read.	1.5	5137408
117	935	7	0	Low newspaper reveal. Material blue building contain east perhaps fall.	1.1	1605632
249	336	1	0	\N	1.8	913408
83	435	4	2.3	Form good ask reason more degree what happen.	0.8	7858176
128	716	4	2.6	\N	1.9	5040128
93	149	4	2.8	Our exactly much sell success goal.	1.5	6508544
222	236	9	0	Smile ok pretty PM if his. Career crime life more.	0.7	1012736
315	498	5	0	\N	1.0	8006656
300	346	4	2.7	\N	0.8	3608576
64	547	9	0	\N	0.5	3220480
45	916	5	0	Bill me oil hot name central town guy. Whom fund environment politics.	0.6	1845248
97	658	5	0	Often myself ago scene else between she up.	1.1	3598336
326	620	5	0	Game moment market identify would. Film final cold avoid state inside worker.	1.4	1226752
60	735	9	0	Ahead contain audience leave bring director relate.	0.8	1395712
10	448	5	0	Red anyone population executive. Sure performance official cell no mouth machine road.	0.6	285696
304	347	3	0	\N	0.6	4490240
143	214	4	0.8	Probably price weight.	2.0	2499584
316	48	7	0	\N	1.1	8139776
246	362	8	0	\N	1.4	7785472
84	471	10	0	Offer support bank form first. Risk actually wrong contain.	1.3	5508096
268	639	1	0	\N	0.6	6064128
295	957	4	1.5	\N	1.1	3684352
312	219	7	0	Country there call indeed window.	2.0	6610944
156	459	4	0.1	\N	0.9	7141376
10	432	4	1.9	Question mission energy outside hotel practice skin ready.	1.0	4123648
281	499	9	0	Skill difference democratic him make age local.	1.6	979968
57	858	4	2.7	Owner apply Republican. Southern life different.	1.3	575488
47	752	4	1.6	Energy community indeed fish.	0.5	4477952
87	867	1	0	Goal law bag specific where.	0.8	2741248
160	160	6	0	\N	1.3	2551808
172	268	10	0	\N	0.5	1674240
326	632	9	0	Believe project certain notice. Gas reveal scene to environmental.	1.4	4831232
60	730	4	1.7	\N	1.3	3842048
245	40	8	0	Member likely fight guy.	2.0	1145856
165	224	4	1.8	Environment lay street him.	1.8	1015808
195	509	10	0	Image recent collection our.	1.3	1098752
93	144	8	0	\N	1.6	5302272
164	810	3	0	Sometimes understand water the read that police language.	1.9	7357440
207	298	4	2.8	\N	0.8	3349504
207	310	5	0	\N	1.2	351232
40	376	4	1.5	Can teacher involve help.	0.6	1572864
232	756	1	0	\N	0.9	1278976
188	725	1	0	Morning study direction major mission. Break write network style nor act place.	1.0	4002816
91	917	4	1.1	Push sort fire kind bar while.	1.2	5404672
196	741	4	0.8	Mr teach ok stage.	1.4	6307840
26	66	10	0	Beat Mrs forget this.	0.9	1810432
27	727	4	1.0	\N	0.9	4084736
94	659	9	0	\N	1.3	6801408
107	857	4	2.7	Sea add western.	1.8	2475008
15	138	3	0	\N	0.9	8133632
143	207	10	0	Necessary check student very worker spring.	1.4	4983808
105	507	4	1.0	Determine vote month phone may.	0.6	6865920
107	865	8	0	Until save reflect development exist evening. Care member morning choice wear media.	1.1	6177792
151	382	9	0	Contain result down.	0.9	7588864
30	496	6	0	\N	1.8	7217152
148	19	8	0	Child compare by decade.	1.9	7224320
155	88	8	0	\N	1.7	4883456
14	985	4	1.9	Return music body room feeling realize.	1.7	2543616
98	350	4	0.5	\N	1.6	6500352
250	7	4	2.1	\N	0.7	4926464
204	205	4	1.8	Study phone decide forward partner age.	1.7	1405952
65	283	5	0	Road practice per interesting process since.	1.0	2718720
78	884	6	0	\N	0.5	651264
77	896	6	0	Eat teacher section line news president property.	0.5	1703936
120	765	4	1.6	\N	0.6	6914048
59	661	10	0	Record draw huge floor business population. Base still money set.	0.9	6925312
132	333	8	0	Service think security itself wide north really. Play general down state involve capital key.	1.4	5155840
156	429	7	0	\N	1.4	1794048
30	471	4	1.1	Read almost stage concern successful.	2.0	2380800
197	131	4	1.9	\N	1.9	929792
322	693	8	0	\N	1.4	676864
92	939	4	1.8	\N	1.9	4299776
309	286	5	0	Stage according home key other true same.	1.0	3401728
167	609	4	2.0	\N	1.3	4802560
48	375	3	0	Pm ago ground.	1.3	2597888
240	354	4	2.0	Area how official arrive nor.	0.8	374784
13	877	4	1.9	Against night meet thank.	1.6	1944576
22	488	4	2.7	\N	1.6	3159040
205	63	4	1.2	Senior green explain audience structure get data rather.	1.8	2100224
257	288	4	2.6	\N	1.0	8130560
319	900	3	0	\N	1.7	6677504
23	259	9	0	\N	1.3	4202496
90	9	4	1.5	Few member exist student west painting. Type animal senior federal.	0.8	448512
56	891	4	2.0	Season down idea night say.	1.1	3709952
48	372	4	2.3	Son doctor happen pretty project plan.	1.1	3618816
141	484	9	0	\N	0.8	3363840
146	158	4	2.2	Care development nothing push paper own heavy and.	0.9	6699008
175	529	5	0	\N	0.8	2156544
202	812	4	0.1	\N	1.6	2907136
297	529	4	0.7	Mrs movement wonder who official study. Ten listen article again enjoy.	0.9	4267008
67	366	6	0	\N	0.6	348160
93	147	4	0.4	Board middle service late. Involve mind reflect.	1.2	570368
86	155	4	1.3	\N	1.8	5450752
232	760	1	0	Market common walk nice exactly to.	0.9	8240128
132	331	7	0	\N	1.8	4420608
272	389	4	1.6	Down become serious large soon notice wear.	1.5	7756800
234	177	4	1.2	\N	1.2	2411520
297	523	9	0	\N	1.2	4570112
45	911	4	2.5	Sure mean tend call us themselves yourself score.	0.6	2397184
296	457	4	1.8	\N	1.3	3751936
156	427	9	0	\N	0.5	1331200
216	938	4	1.5	Stage argue close option someone. Form break soon seven this act authority explain.	0.5	2928640
95	407	3	0	Move nice understand similar stuff specific once number. Responsibility nice then along.	0.5	4368384
288	612	4	2.8	Why should arm eight red play agency.	0.6	3061760
41	563	4	1.9	\N	1.8	1381376
307	884	4	2.0	Else skin town past set time. Strong finish public keep debate beautiful.	1.4	2744320
265	880	8	0	\N	1.3	2331648
247	156	4	1.6	\N	1.8	406528
210	748	1	0	\N	0.8	7355392
322	692	10	0	Enjoy similar case in property clear under. Lot him position everybody positive over man.	1.8	3022848
322	690	9	0	\N	1.6	5141504
245	31	6	0	\N	1.6	1240064
268	627	4	1.5	Side factor know person.	1.3	251904
184	45	4	1.1	End sort believe family old professor. Young serious create message maybe sense.	1.8	7823360
157	238	1	0	\N	0.5	4221952
326	631	4	0.3	Sister song ten design cause themselves. Degree condition though develop Democrat.	0.9	3780608
230	193	7	0	Same less certainly. Civil contain cup chair.	1.6	6759424
24	27	5	0	\N	1.2	1940480
1	149	7	0	\N	1.5	5066752
17	960	4	2.3	\N	1.7	7274496
177	762	3	0	\N	1.0	5361664
60	725	5	0	Point loss most. Rest most media when less.	1.0	5275648
3	414	4	1.2	On no occur simple.	1.0	6567936
30	482	4	2.4	\N	1.4	7364608
107	866	3	0	\N	1.0	6849536
52	323	5	0	\N	2.0	4041728
302	337	3	0	Public make stand section must us.	1.4	4215808
15	147	6	0	\N	1.1	7207936
65	281	4	2.8	President bit fund lose after sometimes crime.	1.4	7738368
67	380	4	2.3	\N	1.3	1380352
228	109	10	0	Gun fund choose walk morning simply same.	0.5	4248576
155	82	7	0	\N	0.8	971776
101	769	3	0	Player than because ok. Must inside next great.	1.5	4490240
183	233	4	1.3	\N	1.2	5596160
267	317	6	0	Say analysis situation deal stay no teacher member.	1.0	524288
268	636	4	1.8	\N	1.5	7731200
202	799	4	2.4	\N	1.0	3832832
172	262	4	1.3	\N	1.9	7976960
320	476	4	2.6	\N	0.8	3442688
11	852	9	0	More race child half specific break.	0.6	3995648
32	494	4	0.1	Room lay language first despite.	1.3	4194304
77	894	4	1.1	\N	0.8	2369536
164	803	9	0	\N	1.9	7307264
190	686	4	2.2	\N	1.0	2497536
202	807	5	0	Machine more very yard film. Believe travel fill cover.	1.3	260096
10	446	4	1.2	Fast pick type measure say between probably.	0.7	842752
183	241	4	0.6	\N	0.9	2578432
189	737	4	2.2	\N	1.3	4951040
234	150	4	1.2	\N	1.8	6453248
141	485	4	1.3	East field even growth senior.	1.9	7070720
87	863	4	2.7	\N	0.9	2946048
1	145	10	0	\N	2.0	8139776
264	131	10	0	Participant but single respond machine protect shake.	1.3	6765568
85	315	6	0	\N	0.6	483328
143	204	8	0	Message explain board out.	1.6	5955584
43	865	1	0	\N	1.7	5133312
198	894	8	0	\N	1.6	1530880
2	734	4	1.6	\N	0.8	3126272
15	139	4	2.9	\N	1.3	5788672
164	805	8	0	Key physical low draw catch sing.	0.9	862208
306	226	4	2.3	Effect industry shoulder Republican off once.	1.1	5815296
148	29	4	1.4	\N	1.9	3111936
223	846	9	0	Music quality ready might several possible. Beat smile provide ok wait.	1.7	1868800
228	94	5	0	Order assume seek figure after today.	1.1	1947648
14	973	4	1.4	Hold less field group yeah study.	1.0	2649088
43	859	4	1.9	\N	1.9	3742720
150	143	7	0	\N	1.7	6228992
199	113	4	0.6	Structure clearly level street water.	0.8	6083584
249	341	1	0	Not sport president especially her everybody may.	0.7	345088
171	168	4	1.1	Sea just likely future here like include.	2.0	2390016
126	405	3	0	\N	1.1	7247872
265	885	3	0	\N	0.8	6520832
282	976	4	2.6	\N	0.7	3030016
273	338	9	0	\N	1.2	1368064
293	588	4	1.5	Enter course alone impact growth.	1.8	1134592
281	503	4	1.0	Almost eight Democrat health no.	0.8	2621440
307	877	7	0	\N	1.4	8222720
14	982	4	1.4	\N	1.6	2792448
55	548	4	0.8	\N	1.9	4475904
303	814	10	0	\N	2.0	6795264
205	88	10	0	Majority who individual participant.	1.5	7847936
229	276	7	0	\N	0.7	5192704
250	16	4	2.3	Should expect goal training these someone return.	0.7	7054336
157	236	4	1.0	Indicate national go top.	1.3	2813952
12	204	4	0.2	\N	0.6	3819520
73	502	1	0	Full or catch clearly.	1.8	1961984
96	364	4	2.7	\N	0.9	6306816
100	365	6	0	\N	1.8	1207296
235	275	4	1.2	Next course environment job situation door night. Give mother fear Democrat edge foot break.	0.7	1828864
264	114	4	1.6	\N	0.6	6608896
64	551	4	2.2	\N	0.8	3075072
110	350	4	1.7	\N	1.1	6147072
214	279	4	2.4	\N	1.9	3382272
212	846	4	1.6	Sort issue hard safe yourself major wonder. Defense summer work suggest increase seek.	1.4	5856256
278	247	7	0	Full rest notice series natural account skill.	1.3	4707328
325	538	4	2.6	\N	1.2	764928
224	307	9	0	\N	0.9	5606400
104	816	4	2.6	\N	1.4	333824
9	241	5	0	Listen establish however fly. Great remember well money theory.	2.0	564224
238	764	4	0.9	\N	1.7	6254592
265	890	4	1.0	Production good learn prepare enjoy very.	1.8	190464
113	705	4	2.1	Picture middle account meeting some could.	1.4	1992704
299	971	1	0	Send firm usually reality.	1.4	6236160
325	535	5	0	Game relationship month popular list player learn management.	1.7	5026816
315	497	4	2.8	\N	1.2	6933504
316	54	4	1.3	\N	1.3	4880384
108	366	4	1.0	Foot lead control building law music. Camera against who turn.	1.4	3998720
22	496	4	1.5	\N	0.7	2537472
9	230	8	0	\N	1.2	5946368
109	131	4	1.9	Finally issue common pretty performance action company.	1.8	3574784
156	454	4	2.8	\N	0.9	3737600
133	712	5	0	Knowledge truth behavior character. Show season key fire final risk.	1.9	6306816
245	13	4	2.3	\N	1.6	5935104
148	33	4	1.1	Force herself or professor yard stay land.	0.9	1471488
250	26	8	0	\N	0.7	3386368
10	454	4	0.6	Bit life itself bank.	1.4	4500480
223	847	9	0	Its board computer last.	1.3	7005184
265	876	4	0.2	Throughout because a most person.	1.7	670720
58	981	4	2.5	\N	1.4	6450176
251	606	10	0	\N	0.7	6236160
135	50	4	1.1	Car man base strong attorney however society.	1.8	4084736
2	730	4	1.7	Already enough region reach responsibility prevent.	0.6	2904064
196	744	6	0	\N	1.0	6716416
263	263	4	2.9	Card you language fly decide social hour exactly.	1.7	6170624
207	316	9	0	\N	1.0	1427456
303	815	4	2.3	Relationship politics them international somebody argue so glass. Concern investment future scene kitchen test.	1.2	8266752
265	874	4	2.5	\N	1.6	5156864
199	103	4	2.3	\N	1.9	2608128
175	528	7	0	Glass opportunity almost woman after tough.	1.5	7751680
292	723	4	1.3	\N	1.8	2988032
41	547	7	0	Imagine certainly significant marriage wife treatment.	1.0	4086784
149	402	4	2.7	\N	1.5	2946048
222	242	4	2.5	\N	1.2	2509824
288	594	10	0	Report against thus natural away.	0.6	3567616
8	643	7	0	Woman space increase such.	1.1	5050368
157	234	4	2.5	Rock then during.	0.7	561152
283	293	8	0	Page use its. Hold campaign baby without result card.	1.6	7292928
277	61	4	2.8	Guess add tell evidence provide pressure reduce. Approach sing represent charge bring.	0.6	7080960
12	207	4	2.0	\N	1.5	5635072
67	367	4	2.0	\N	0.9	2985984
70	296	3	0	Child keep their pay ten design. Send memory stuff business nothing check see.	0.7	6703104
265	887	10	0	Probably better crime sound. Buy amount company wind hard.	1.1	2840576
84	496	5	0	Practice light drop represent.	1.2	4683776
190	668	4	1.6	Top with voice paper add in note guess.	0.6	7749632
275	789	10	0	\N	2.0	5538816
141	478	4	1.2	\N	0.6	1622016
68	250	4	1.9	\N	1.5	5199872
39	769	4	1.0	Shake role join what international music cultural.	1.6	4982784
277	65	4	2.3	Letter court control interesting. Once discussion after large but reduce.	1.2	4798464
88	572	3	0	Change pass of event develop sea.	1.9	6146048
143	215	7	0	\N	1.2	5137408
23	266	8	0	\N	0.6	2971648
299	960	9	0	Boy degree question table.	1.1	4533248
45	912	1	0	Toward itself hospital sell here line conference.	1.1	5493760
225	323	8	0	May before police.	0.5	1755136
132	318	9	0	\N	1.7	555008
312	217	4	1.5	\N	1.8	3328000
113	698	4	0.2	Almost economy report tree successful popular nice bag. Hour think table positive cost yet tree.	0.7	2237440
22	480	4	1.7	Authority agency write. Trial current garden what.	1.7	5881856
241	698	4	0.2	Could spring movement from language.	1.9	5999616
125	655	4	2.6	\N	0.6	7946240
151	384	4	1.2	Last standard explain yourself simply north sea.	1.9	617472
256	785	4	1.2	Force bar local perhaps page admit.	1.5	194560
256	792	4	1.0	\N	1.0	786432
98	344	4	0.1	Relate hand already system drive family.	1.9	2198528
245	30	6	0	More participant above tell guy direction.	1.6	1930240
207	305	4	2.5	Collection develop performance financial.	1.2	2720768
277	90	4	1.3	\N	1.8	1283072
202	802	4	1.5	\N	0.9	833536
155	71	4	2.6	\N	0.6	7831552
199	107	1	0	\N	1.3	699392
85	310	10	0	Each toward during three start.	1.8	1674240
67	371	3	0	\N	1.7	2788352
120	769	4	1.0	\N	1.6	851968
185	296	4	1.8	Goal defense move. Lay situation control once president painting improve.	0.7	7694336
141	472	4	1.7	\N	1.8	916480
204	206	3	0	\N	1.8	7170048
26	76	4	2.9	\N	1.2	580608
64	548	5	0	\N	2.0	440320
7	771	4	2.1	\N	1.4	7657472
293	578	3	0	Near science sense follow social station mind discussion.	1.3	7026688
109	122	4	0.6	Go else most theory style.	0.6	2922496
267	299	4	1.6	While conference approach stuff consumer we. Usually agency yard especially again.	1.5	6966272
78	872	4	2.0	Information reach than available door. Fight current action night record value agreement.	1.1	2183168
252	951	3	0	Heavy suddenly rest give field operation use. Great instead long notice condition to.	1.2	1085440
287	362	9	0	Present another religious attorney enough rise add. President call top debate leave central.	0.8	1009664
85	307	10	0	Not whether him he.	0.7	4354048
27	730	8	0	Push early unit peace such allow. Same people yes if.	1.5	3825664
52	318	1	0	\N	0.6	4268032
223	849	5	0	\N	0.9	7689216
271	513	4	1.1	\N	1.0	3291136
30	476	4	2.9	Author there outside care against media.	1.6	2709504
28	358	5	0	Single onto change myself.	0.9	6379520
184	52	4	0.0	Continue process show group imagine plant threat.	1.3	2823168
134	419	9	0	\N	0.8	1406976
201	921	4	1.2	Reveal study spring. Share prepare there shake current wrong.	0.9	6127616
253	402	4	2.7	Issue news sing financial push.	1.8	3439616
229	277	4	1.6	Million everyone toward language purpose.	1.2	6184960
292	737	10	0	\N	1.4	3949568
148	11	4	1.0	\N	0.8	893952
326	616	4	1.1	Back they establish red. Anything business around establish degree stop prepare information.	0.9	1477632
141	496	4	0.1	\N	1.7	2020352
72	622	4	0.2	Age explain audience hand black. Affect discussion these discussion present site couple black.	1.5	206848
13	881	4	2.0	\N	1.1	2337792
55	540	3	0	\N	0.5	2194432
138	421	9	0	\N	1.6	7500800
296	454	9	0	\N	1.5	6011904
247	159	4	1.0	Chair PM capital heart.	1.9	6748160
108	370	6	0	\N	1.9	657408
298	211	4	2.3	\N	1.1	2037760
167	596	3	0	Left three of herself vote inside democratic.	1.8	292864
282	970	4	2.8	\N	0.7	5939200
103	215	4	2.3	\N	0.8	523264
272	387	4	2.5	Picture force pretty of break live.	1.7	955392
277	89	5	0	\N	0.6	1700864
323	5	6	0	Spring main others economic.	1.0	247808
10	456	7	0	\N	1.1	5962752
56	879	4	2.0	\N	1.3	6242304
9	237	4	0.8	Across hope them hope letter.	1.3	3383296
189	726	4	2.0	Find certain worry father concern.	1.5	4900864
276	378	4	1.2	Mean his type service my brother laugh.	0.9	148480
115	125	4	1.9	Push book response pattern.	1.1	2438144
197	117	4	1.2	\N	2.0	7706624
211	249	4	2.0	Take go center.	1.9	3731456
207	299	4	1.7	\N	1.7	2091008
90	13	4	0.6	Drive tell a at.	1.6	8098816
265	873	1	0	\N	1.0	7475200
272	385	10	0	\N	0.8	4496384
114	700	4	1.5	\N	0.7	4186112
303	798	4	2.4	\N	0.9	6533120
315	505	4	1.8	\N	0.9	2152448
146	169	1	0	Surface one help pretty service.	0.9	4032512
33	963	1	0	Prepare especially already environmental foot bill area guy.	0.8	6798336
199	108	4	1.3	\N	1.1	3419136
307	876	4	1.0	Imagine whom instead total guy power.	1.5	2519040
325	559	4	2.5	Believe stop under receive major within Democrat. Fire might fish forward.	1.5	1229824
133	711	4	1.4	Someone final world down.	0.7	6906880
141	480	9	0	Note best son money build.	1.9	5907456
2	726	4	2.0	\N	0.9	873472
55	554	4	1.2	Suffer north around draw safe.	1.8	6184960
105	509	10	0	\N	1.5	2974720
257	293	4	2.2	\N	0.8	4597760
255	587	4	2.6	\N	0.6	6520832
297	526	4	2.5	\N	1.4	3470336
11	853	4	1.9	\N	0.9	7755776
9	236	9	0	\N	1.8	559104
50	699	4	1.8	Old investment join change fact seat nearly.	1.9	7661568
183	238	4	1.8	\N	1.4	3216384
275	787	4	2.0	Every remember several major write about certainly then. Wait memory upon wide research buy run.	0.8	3169280
291	127	6	0	Us total may major research because. Husband room fear find.	1.7	171008
10	452	10	0	\N	0.6	2280448
310	721	4	1.1	\N	0.8	4275200
147	327	8	0	\N	1.4	1125376
192	51	5	0	\N	0.9	4451328
202	797	1	0	Other ball design ability fall. As administration street policy catch.	0.7	6611968
167	608	4	1.0	\N	1.5	680960
294	141	4	1.4	\N	2.0	5535744
19	632	4	0.9	Research never resource off until result.	0.6	4307968
97	653	1	0	Medical yourself without within material.	1.0	5884928
182	894	4	0.3	Not floor summer suddenly miss loss. Else age plant example third eight.	1.9	5646336
148	41	7	0	\N	1.5	6658048
229	266	4	1.5	Yourself between push hair certain weight price.	1.6	2211840
322	669	1	0	\N	0.9	5821440
71	784	4	1.9	Eight yourself career anyone detail oil. Chance there thought certainly.	0.7	4583424
209	624	5	0	Officer health something resource total company response.	1.6	6832128
168	297	4	0.4	\N	2.0	2048000
314	905	3	0	\N	1.4	3354624
148	15	8	0	\N	0.8	525312
244	387	4	2.5	\N	1.8	7442432
90	32	4	2.9	\N	0.9	6660096
174	569	4	1.7	Example bad plant whatever.	0.8	5245952
11	858	4	2.7	Catch prevent enough American list without.	1.7	768000
308	365	4	2.2	\N	1.1	3155968
286	919	9	0	Economic employee give important recently. Security defense answer provide.	1.3	7846912
320	493	10	0	By pressure enjoy ahead.	0.7	7731200
40	373	4	1.5	\N	1.8	5323776
30	494	4	1.1	Section again decade friend. System idea yourself suddenly matter least look.	1.7	1366016
54	779	4	0.7	Attorney collection black draw arrive site industry.	1.1	1859584
203	331	1	0	Across turn race organization show myself.	0.9	3197952
234	157	9	0	\N	1.7	721920
90	8	5	0	Be whole would industry carry until.	1.7	2125824
235	266	6	0	Manager sure including pass.	1.0	2306048
245	17	5	0	Sea behind drop perform. Ahead current exist worker machine blood seem news.	1.6	5715968
93	134	4	1.1	Technology bed price across. Color offer whole already movement explain Republican.	1.7	879616
123	709	10	0	Wind natural none represent though article.	1.1	5316608
296	434	7	0	Include themselves nation begin sound.	1.1	391168
115	123	6	0	Something whose take support present lose store finally. Myself chair involve third give important amount.	1.9	2853888
14	975	3	0	Material author party why style. Subject fact participant at daughter movie.	1.0	2817024
38	771	4	2.1	Film number social meeting fill.	1.4	4508672
135	59	4	0.5	Significant ask improve air.	1.2	7163904
255	581	4	2.5	Federal among though example part.	1.2	7001088
66	909	6	0	\N	1.0	1022976
268	618	4	1.4	\N	0.8	7504896
24	7	10	0	\N	0.7	322560
118	939	5	0	\N	0.7	7549952
120	767	4	2.6	Explain poor establish foot reach.	1.4	5421056
285	851	4	1.6	Day section modern energy know a.	1.1	4969472
230	196	4	0.4	Policy pull type doctor TV. Data marriage floor culture.	1.8	2336768
8	658	4	1.9	\N	1.3	6519808
172	261	4	1.6	Present civil federal.	1.9	4765696
5	741	10	0	\N	1.2	1380352
190	684	4	1.4	Memory each likely spend off product among.	1.2	3444736
41	535	4	2.8	Anyone of market ahead tax success.	0.7	5451776
155	73	1	0	Maybe billion serious arrive tax top.	1.4	6704128
81	740	6	0	Improve activity identify throw it real measure.	0.6	6597632
118	935	4	2.8	\N	0.9	2095104
325	547	4	0.2	\N	1.8	7275520
186	739	4	1.1	\N	1.2	5022720
32	485	4	1.3	Drug candidate necessary defense morning value nation.	1.0	5319680
242	72	9	0	Attack really director experience baby.	1.7	2131968
140	698	4	2.8	\N	0.8	743424
54	781	4	0.5	\N	0.8	5788672
267	311	4	1.9	Down listen offer per hear region. Wife of notice become possible decade there add.	1.2	7726080
17	966	4	2.9	\N	1.7	5819392
34	337	7	0	Food grow from south cell cup instead.	1.9	2049024
41	556	4	1.8	Network difference usually information statement top not generation.	1.2	1382400
164	798	7	0	Sister anything hot local. Friend other break one.	1.9	5496832
213	930	4	2.6	Their full process occur.	1.8	3059712
247	157	6	0	\N	1.2	2279424
121	342	4	1.9	Paper peace happy as mission.	1.5	2816000
257	296	4	1.6	\N	1.2	4804608
84	475	4	2.3	Great then message than training.	1.0	6986752
160	174	4	1.9	Determine staff local issue sell six summer thus. Peace protect economy daughter.	1.5	6511616
143	205	10	0	Story each sure argue new. Sort certainly of central my dinner account make.	2.0	5372928
311	280	4	1.6	Right crime upon attorney agency month top.	1.5	1244160
19	613	9	0	Answer staff receive view good find.	1.7	6777856
218	757	4	1.4	Guess foreign leg him never movie majority. General dream Republican college level and hospital write.	0.6	2042880
157	244	4	0.2	Expert good best matter her call.	1.0	5272576
220	716	4	2.6	\N	1.9	2642944
108	368	1	0	\N	1.2	4244480
141	488	4	2.7	No open thought land family whom middle system. Full blood thank she let entire act rather.	0.6	2971648
297	518	9	0	\N	2.0	3245056
55	546	4	1.2	Which agreement source walk. Serve computer far protect share.	0.9	1603584
90	22	4	2.1	Certainly walk sound too. Structure drug physical itself.	1.5	2084864
137	121	4	1.0	\N	0.8	6412288
55	559	4	2.8	\N	0.5	3191808
316	51	4	2.2	\N	1.9	2511872
230	182	6	0	Start administration appear either goal name. Middle front major strategy.	1.0	1399808
80	825	4	1.9	Already wall final they.	1.6	1597440
10	457	4	1.8	\N	1.2	1829888
98	349	8	0	\N	1.7	2724864
113	700	1	0	\N	1.8	245760
254	719	4	1.3	Support begin drive especially reflect director way.	1.6	5084160
314	914	4	0.2	\N	0.8	1783808
43	854	4	2.8	East final among evidence collection let exactly.	1.6	4980736
148	34	7	0	\N	0.9	6077440
219	349	9	0	\N	0.6	6545408
307	880	1	0	\N	1.8	1162240
255	585	4	2.6	Into enough staff.	0.7	6986752
148	28	3	0	Value inside build.	1.4	4571136
183	235	4	2.1	Its pass within. Option themselves hundred life attention.	1.5	3890176
222	233	10	0	Evidence particular a commercial.	0.7	2920448
84	494	4	0.6	Activity report key now senior.	0.6	6569984
8	650	4	2.5	Successful research theory Democrat recognize name.	1.4	6557696
103	212	7	0	\N	1.2	6804480
279	945	10	0	\N	0.8	5303296
137	124	4	1.1	Laugh bring article floor policy just image serious.	1.1	1582080
215	854	4	2.8	\N	0.9	2673664
24	22	9	0	\N	1.8	3716096
305	283	3	0	Explain poor word compare test loss.	1.5	4671488
282	967	4	1.3	Spend much message project stop.	1.2	7601152
311	283	3	0	\N	1.5	7218176
209	638	4	1.4	\N	1.3	5874688
224	300	4	1.2	Pass term evening growth.	0.7	394240
48	373	4	1.1	\N	1.6	6379520
71	785	4	1.2	Number upon wife check effect man dinner.	1.5	7318528
141	471	4	1.1	Should population woman process such gas.	1.6	1250304
245	27	5	0	\N	1.6	6715392
326	627	9	0	\N	1.2	115712
106	285	9	0	\N	1.9	1189888
105	512	4	2.0	Spend write strong offer. Head visit country.	1.3	6700032
269	329	3	0	\N	0.6	2696192
205	77	4	2.3	Difficult look discuss night black language.	0.7	187392
169	786	4	1.8	\N	1.2	1156096
244	395	4	1.6	Forget edge sister.	2.0	6500352
153	565	8	0	Him oil economy view.	0.8	1075200
299	975	4	2.1	\N	0.5	6673408
262	4	4	1.5	Year chance half much tree school risk onto.	1.6	969728
42	489	5	0	\N	1.6	4446208
55	542	1	0	Parent one seem order skin television. Morning entire chance.	1.8	589824
229	274	9	0	Charge ever page particular unit ago.	1.2	405504
271	502	5	0	\N	1.3	5870592
126	404	4	2.9	Child size indeed themselves.	0.7	6012928
36	761	3	0	Win reality five politics rise most.	1.5	6427648
186	744	4	1.8	Evidence door practice country assume become left.	1.7	4627456
208	114	4	1.6	\N	1.1	5203968
247	162	4	1.6	\N	1.2	7477248
46	268	5	0	\N	1.8	3683328
325	545	5	0	\N	1.2	6377472
190	669	4	1.3	\N	0.8	2444288
269	327	4	2.9	Budget debate across outside.	1.2	3377152
147	329	4	2.2	Serve threat fine sport really development bed. Democratic former key health.	1.5	393216
84	495	1	0	Memory clearly father most.	1.5	5805056
208	131	3	0	\N	1.7	8213504
164	809	4	1.1	Thus sell high color.	1.5	2746368
225	324	3	0	\N	1.9	7144448
314	909	9	0	\N	0.5	3632128
104	808	3	0	Eat even thousand explain result particularly summer. Should total hot everyone yet federal any.	0.7	8028160
268	625	10	0	\N	1.3	4085760
311	281	4	2.8	\N	1.1	3333120
62	408	10	0	\N	0.7	3526656
73	503	1	0	\N	1.3	6928384
236	706	5	0	Senior painting table these foreign they hotel kind.	1.7	4710400
297	521	4	1.0	Say who base play.	1.4	1367040
32	475	4	2.3	\N	1.2	6007808
282	964	4	2.9	Start before part cold under civil.	1.5	5629952
195	497	10	0	\N	0.9	794624
207	302	9	0	Customer truth trial.	0.9	4238336
252	954	4	1.6	\N	1.5	6512640
2	731	4	0.9	\N	1.0	7014400
166	227	4	2.5	Still system forget hotel list.	0.6	3080192
129	402	4	2.7	\N	1.5	6962176
21	281	4	0.9	Science debate art go member.	1.7	2791424
277	81	4	0.4	\N	0.7	4170752
316	59	4	2.9	\N	1.9	7205888
161	242	4	1.6	Own nor reveal collection culture.	1.7	490496
20	223	8	0	Group break resource court fine us grow.	0.7	1135616
138	416	4	1.1	\N	1.6	886784
250	13	4	2.3	\N	1.5	2568192
39	767	10	0	Garden grow son require employee voice thousand.	1.8	3209216
279	955	4	1.3	Include woman itself may year series seek.	1.9	5746688
277	86	4	1.4	\N	1.9	7268352
130	403	4	1.5	Kid one popular avoid.	0.9	7885824
267	308	5	0	\N	0.6	3168256
250	32	4	0.5	\N	1.2	6793216
229	270	6	0	\N	1.3	6086656
241	702	1	0	Support article second good.	1.3	8132608
146	163	3	0	Conference practice visit yes country end condition.	1.5	2978816
228	100	4	1.7	\N	1.4	2163712
4	818	7	0	\N	1.9	7961600
277	74	1	0	\N	1.3	8246272
286	922	4	2.9	\N	0.8	1635328
22	475	4	2.3	Expert southern moment pretty technology word bring. Will theory money.	1.1	1404928
33	985	3	0	\N	0.6	6188032
151	383	6	0	\N	1.8	6562816
24	19	8	0	Citizen term church sing kitchen.	1.2	4184064
264	119	8	0	Lay interesting central country father better. Single no hit million hard.	1.6	1930240
104	803	9	0	Seven heavy picture special great between. Door home just next hotel determine.	1.2	3472384
145	341	4	1.9	Run tree reason simply become time role service.	1.6	5078016
250	35	4	2.8	\N	1.8	7035904
272	390	4	1.6	\N	1.2	1884160
296	448	3	0	Too me company offer family much behind.	1.2	5181440
12	216	5	0	\N	1.2	7443456
322	677	4	1.8	Idea member ten although unit stop.	1.9	8185856
111	784	6	0	Majority arrive share partner.	1.1	7219200
32	480	3	0	Against economy hour.	1.7	6983680
152	287	4	1.9	Response source southern expect.	1.5	795648
294	134	3	0	Note still eat hold.	2.0	5056512
197	118	7	0	\N	1.5	3544064
326	626	4	1.0	\N	1.1	161792
23	262	9	0	\N	1.7	5854208
1	140	8	0	Catch most involve center share door. Itself evidence daughter hit center grow.	0.7	2759680
255	589	10	0	Keep father last standard easy reality less. Sell activity citizen hand hard significant agent.	0.6	8091648
85	300	4	2.3	\N	1.9	133120
283	291	4	1.7	Agency make cup bank reach low why step. Close pay customer himself.	1.9	1168384
170	286	9	0	\N	0.7	1721344
113	706	4	1.4	Experience response turn gas any role summer. Choose more respond.	1.6	2543616
50	705	7	0	Try hold question little physical.	0.9	3654656
48	366	5	0	First Republican laugh strategy society much.	1.8	3101696
68	251	7	0	Here sit soon fall safe dark. Catch thank us argue its imagine southern.	2.0	5086208
294	149	4	2.8	Indeed she suffer risk particularly them.	1.9	389120
83	432	4	1.9	\N	1.7	4070400
3	417	4	2.3	\N	1.6	5315584
234	172	4	0.1	Bring you scientist air above task find.	0.8	455680
125	640	4	1.7	Agent past tough himself.	1.4	6129664
299	965	4	2.5	\N	1.3	1601536
259	124	8	0	\N	1.8	940032
306	228	4	0.2	\N	0.8	744448
98	348	7	0	Clearly but until approach walk.	1.9	7780352
115	124	4	1.1	Base tonight last party business everyone nothing.	1.1	4393984
138	423	4	2.5	Teacher realize pass walk learn beautiful.	0.9	514048
271	505	3	0	Anything read theory. Floor house film less.	1.2	563200
4	817	4	2.1	Capital both human we politics.	1.1	3609600
251	607	10	0	\N	0.6	2888704
14	966	4	2.9	Career space seven artist off then. You unit laugh.	1.1	1933312
245	18	9	0	Debate should always require skin. All before change ever leave somebody.	1.6	8233984
288	593	6	0	Course Democrat measure answer tough.	0.9	2505728
275	786	9	0	\N	0.5	1676288
294	142	4	1.8	\N	0.6	2833408
22	489	4	0.4	\N	0.7	4561920
58	975	4	2.1	\N	1.2	6903808
64	543	10	0	\N	1.9	6660096
17	981	4	1.3	\N	0.9	3193856
315	514	4	2.8	Religious able newspaper sometimes now all medical outside.	1.0	3844096
3	420	7	0	\N	1.3	2816000
14	969	1	0	Nice true end. Stop institution far identify country high.	1.9	5733376
25	512	4	2.2	Manage her affect. Race understand wear every wide name question.	1.3	2491392
77	898	4	2.9	\N	1.0	8161280
82	660	10	0	\N	1.4	1649664
172	276	3	0	\N	0.6	5067776
75	408	4	1.7	Just language evening another technology establish.	0.6	2462720
85	305	4	2.5	Return image guess worry.	1.5	4054016
164	808	4	2.4	\N	1.4	183296
72	624	4	2.5	Build price herself how success decision.	1.5	376832
263	275	4	2.2	Full group low. Since relationship million politics head actually tree.	0.8	8188928
109	120	4	0.4	Kid in force.	1.5	7247872
314	912	9	0	Leave skill onto.	1.7	4841472
160	154	4	2.1	Face practice area certain scene product human.	1.7	5288960
156	433	4	1.0	Past walk some six mind ball.	1.9	8239104
138	415	5	0	Whom fund wind.	1.3	4164608
24	15	4	2.5	\N	2.0	1086464
143	212	8	0	Want spend doctor firm girl.	1.5	5770240
173	921	4	1.5	\N	1.9	8249344
95	405	4	0.3	Political him television view oil.	1.9	1846272
2	733	3	0	Possible especially officer realize.	1.5	3398656
197	125	4	1.9	\N	0.9	293888
249	339	10	0	\N	1.8	5242880
83	454	4	2.8	Capital account remember address.	1.9	4410368
147	328	4	1.0	Budget sport nature fire run soon.	1.6	1387520
244	386	4	2.8	\N	0.9	5136384
40	365	3	0	Sign artist land scientist policy customer economy. Direction determine example officer.	0.5	5639168
255	572	4	2.0	Character result man to whom network.	1.0	1927168
184	57	1	0	\N	2.0	5646336
325	556	1	0	\N	1.0	2241536
148	21	4	1.3	Range special kind mouth you.	2.0	4515840
317	568	5	0	Family produce above others represent.	1.6	8006656
300	348	4	1.7	We set against blue address high right letter.	0.6	5531648
275	779	10	0	Need what crime owner. Set night able cover maintain child.	0.6	1486848
17	977	4	0.9	\N	1.2	4959232
113	703	4	2.1	Item ability power wife by can.	0.7	4676608
29	584	8	0	\N	0.6	2538496
143	211	8	0	Star anything what focus discuss candidate land onto.	1.6	1097728
1	134	4	0.5	\N	1.2	1372160
275	790	4	1.2	\N	0.7	7577600
95	403	4	1.2	\N	1.9	5598208
134	417	7	0	Seek reason whole increase mind you might.	0.8	8104960
141	494	4	1.1	\N	1.0	7207936
276	371	4	1.6	\N	0.8	4886528
296	453	4	0.8	Land business product east senior describe place.	1.7	2819072
150	140	4	1.1	Offer industry partner hundred.	0.6	1753088
111	781	10	0	Trade government maybe amount. Situation result event money.	0.7	3973120
321	138	5	0	\N	1.3	5857280
8	652	9	0	Become early bring newspaper true professor claim.	0.7	710656
295	956	4	0.0	\N	2.0	6064128
2	724	4	1.7	Audience PM day white. Player of food lot tough move their ten.	0.5	8038400
168	287	4	0.0	\N	0.9	1451008
224	314	4	0.1	\N	1.2	7130112
195	499	1	0	Why early husband plan serious ago meet.	0.9	5159936
268	620	1	0	Follow worker position newspaper.	1.8	4008960
218	753	4	0.1	\N	0.7	7780352
298	209	4	1.4	Mean situation fact face score position watch successful. Tell piece with commercial fast great bad.	1.2	1764352
291	126	4	2.9	People truth action air.	1.2	6902784
90	26	4	1.2	Partner then else.	1.4	2793472
279	949	4	2.9	\N	0.8	5156864
81	739	4	1.9	Allow letter word.	0.5	3590144
284	132	4	1.6	\N	1.6	7188480
326	613	1	0	Among improve majority successful difficult training. Thought set room pressure national another middle big.	1.4	2002944
57	859	7	0	\N	2.0	630784
40	370	4	1.8	\N	1.3	3464192
224	311	3	0	\N	0.7	5741568
167	605	9	0	Simply summer sing cover. Black tonight fact end above minute.	1.9	1287168
211	252	4	1.4	Hold him clearly assume.	0.9	1683456
244	394	9	0	\N	1.9	6755328
25	514	4	2.8	Produce production population. Suffer agent community white people individual available left.	2.0	3977216
83	450	10	0	Guess sort writer outside.	1.9	1931264
222	232	4	2.9	Him really approach threat media major medical.	0.8	6156288
155	92	1	0	Deal crime ball bill always.	1.3	4847616
154	697	10	0	Head suggest democratic.	1.8	4087808
202	801	4	1.5	\N	1.6	7739392
256	791	4	1.3	\N	1.7	4958208
172	275	3	0	\N	0.9	3406848
271	500	4	0.7	\N	0.6	2135040
166	220	4	2.8	\N	0.7	4604928
55	538	4	2.6	\N	0.7	7801856
146	162	8	0	Always time window describe change.	0.7	2094080
321	149	4	2.8	\N	1.1	6414336
250	15	4	2.3	Especially glass appear low various interest simple.	1.5	6691840
322	665	4	2.8	At focus so.	0.8	1988608
325	558	4	1.5	\N	1.3	6252544
190	666	7	0	Performance against thousand put.	1.0	488448
288	611	4	1.7	Art hour paper thousand young.	1.2	6077440
185	294	9	0	Thus beat possible which significant personal.	1.4	6668288
15	140	4	1.1	\N	1.7	7858176
50	697	4	2.5	\N	1.2	3169280
64	559	5	0	\N	1.8	7546880
156	426	9	0	\N	1.2	1779712
87	856	4	0.0	\N	0.5	2420736
33	959	8	0	\N	0.8	3733504
307	888	7	0	Minute that us stock general shake practice.	0.9	1282048
55	547	4	1.8	Scientist hotel machine skin later radio.	0.6	6117376
316	46	3	0	Door drop traditional read.	0.7	940032
325	564	4	1.8	History kind us bring friend our whatever.	0.8	2171904
29	589	4	1.4	\N	1.8	8209408
132	328	4	1.0	Daughter dream space agreement study growth them.	1.1	3408896
86	166	9	0	\N	0.6	4990976
320	483	4	1.9	Particularly church outside amount your thought interest. Perhaps stock side.	1.3	7751680
168	293	4	2.2	Range have speech husband beautiful.	1.9	2573312
292	735	5	0	Special rate they describe per source.	0.8	278528
322	685	1	0	\N	1.8	285696
284	128	4	2.8	Quite day wish west.	1.5	3356672
234	164	4	2.3	\N	0.6	1793024
295	947	4	2.1	Information action writer wide situation include main.	1.5	3231744
222	237	4	1.5	Same change investment imagine not fast edge. Offer institution out economy program against.	0.7	2581504
156	430	9	0	\N	0.6	2023424
203	319	8	0	Arrive production president me middle international truth.	0.7	5911552
268	623	10	0	\N	1.9	1220608
27	737	4	2.2	\N	1.7	6870016
111	779	5	0	\N	1.1	5021696
299	968	9	0	Behind side weight guy traditional.	1.0	3323904
277	70	5	0	\N	0.7	6445056
310	716	4	2.6	Piece draw record direction before.	0.6	3618816
294	146	4	2.9	\N	1.2	3792896
10	426	1	0	\N	1.6	8018944
19	617	9	0	Feeling explain suddenly magazine sign.	1.2	7598080
161	229	4	1.9	Attorney little will campaign strong tax.	0.6	1639424
227	936	4	1.1	Six southern another character require carry.	1.0	4438016
13	890	9	0	Apply maybe development enough senior economy return.	1.6	1885184
309	288	3	0	\N	1.7	314368
251	602	4	2.4	Best black perhaps tough huge hundred catch.	0.8	4093952
123	711	3	0	Remain expert check movement building.	1.6	6158336
270	136	1	0	Road chair several front only model far.	1.1	5212160
214	285	4	1.0	\N	1.6	6345728
235	278	8	0	\N	0.8	7116800
254	722	9	0	Them expert nothing past management owner cause.	1.2	2819072
278	246	5	0	\N	1.3	567296
146	150	1	0	\N	1.6	2725888
195	506	1	0	\N	1.3	6415360
209	621	4	2.7	\N	1.5	3802112
254	716	9	0	\N	1.6	4816896
315	503	4	1.0	\N	1.2	7871488
267	306	8	0	\N	1.5	4827136
73	500	3	0	Mean job us. Leg officer maintain lose environmental certainly.	1.3	4692992
87	862	4	2.7	Arm respond production no.	0.9	8059904
141	491	9	0	Present help song them see high.	1.4	1946624
190	689	3	0	\N	1.3	5597184
44	739	3	0	Floor senior fast third history indicate mother foreign.	1.5	4370432
70	292	4	2.5	Hand dinner wide send four nation ago.	1.6	3555328
249	338	4	1.6	\N	0.6	4744192
284	127	1	0	\N	0.7	5970944
286	926	4	2.7	\N	1.2	3615744
259	126	4	2.9	\N	1.2	2340864
44	738	10	0	Blood night save a reflect message many bad. Try senior start civil our.	0.8	5921792
158	277	4	1.6	Offer man clear less size prove major.	1.9	227328
123	714	4	1.7	\N	2.0	5107712
13	873	8	0	Charge should executive someone.	1.9	7695360
197	114	4	0.6	Investment on mother rich eat.	1.9	4817920
78	880	4	2.1	Garden line today far enough whole lawyer.	1.5	1079296
264	129	6	0	\N	0.6	6215680
313	108	4	1.3	\N	1.2	1976320
52	333	1	0	\N	0.6	4633600
27	733	4	1.3	\N	0.6	4549632
324	409	4	2.4	\N	1.2	2456576
54	787	4	2.0	\N	2.0	1169408
171	159	8	0	\N	1.2	2107392
148	17	4	1.4	Recently organization million professor recognize.	1.2	312320
34	339	4	1.2	\N	1.7	428032
276	369	1	0	Cover term skin child.	1.1	2595840
119	861	4	1.1	Figure character occur discuss suggest what market try.	1.7	1627136
135	45	8	0	Happen parent them thing during our whether rise.	1.2	4318208
150	138	1	0	\N	1.8	3402752
89	346	1	0	Medical group process sell laugh.	1.7	4897792
146	161	6	0	Walk sound agreement visit moment.	1.4	2817024
161	231	4	1.9	\N	1.1	5122048
294	138	5	0	\N	1.5	2890752
167	594	1	0	High such material outside.	1.1	575488
11	867	1	0	\N	1.1	2267136
86	160	9	0	Reduce network fly there key leg sport.	1.8	1130496
88	577	4	1.0	\N	0.8	7446528
309	289	1	0	\N	1.6	1309696
55	545	4	2.3	\N	1.9	266240
64	552	4	2.0	Human hear never soon.	0.5	8285184
41	541	4	1.5	Expect third price exactly four. Person ready material.	1.6	6477824
22	474	4	1.3	Political discussion tax effort threat.	0.9	393216
253	408	4	1.7	\N	0.7	3987456
11	863	3	0	\N	1.9	646144
93	146	6	0	\N	1.0	2364416
252	945	4	1.2	Most others minute opportunity produce.	1.2	927744
103	211	4	2.3	\N	1.5	5867520
183	231	4	1.9	Yourself general always. Full create community main.	1.4	2632704
264	130	4	2.0	Team new buy west close hot deep give.	1.4	491520
33	961	4	2.6	Current next animal Mr.	0.6	4803584
152	288	4	2.6	\N	0.8	4749312
270	147	3	0	\N	1.4	893952
42	475	5	0	\N	1.5	6652928
154	700	4	1.5	Clearly information serious health choice resource ever.	1.9	4074496
252	953	4	1.0	Likely out subject.	1.4	6821888
259	117	4	0.5	\N	1.4	5977088
83	455	10	0	Investment other together ok.	1.3	5858304
27	725	1	0	\N	2.0	3558400
115	121	3	0	Back say series lead.	1.8	6093824
70	286	8	0	Not hear indicate war.	0.7	6377472
74	568	4	1.7	\N	1.4	2230272
131	565	4	1.5	\N	0.9	480256
56	890	5	0	Despite standard field item first recognize power.	0.9	7873536
68	245	4	1.1	And something suffer continue degree suffer consumer. Power here seat well vote.	0.8	4875264
211	246	8	0	\N	1.3	4213760
67	368	4	0.4	Southern believe data same.	1.5	6648832
225	330	1	0	\N	1.2	1925120
104	794	4	1.8	Next forget past allow maintain. Person role scene true.	1.1	5242880
211	254	4	2.1	\N	0.5	2499584
54	789	9	0	\N	0.6	7098368
197	115	10	0	Expert PM fight safe southern.	1.3	1030144
170	293	10	0	\N	0.6	5840896
53	282	4	2.7	Debate executive need although picture.	1.0	950272
234	169	4	1.2	Against magazine and dog.	1.1	899072
247	173	5	0	\N	1.8	2307072
184	54	8	0	Whom purpose sound me two.	0.9	6318080
214	284	4	1.1	Another group yet focus might nation sure half.	1.2	2562048
220	718	4	2.6	\N	1.3	5433344
154	699	4	2.3	Must themselves challenge.	2.0	1902592
278	251	10	0	Result hand of might.	1.8	3698688
56	889	7	0	Suggest car difficult move everybody performance.	1.2	7454720
282	987	4	1.4	\N	2.0	7537664
26	78	10	0	Suggest center second.	1.7	2897920
71	778	1	0	Money each accept who probably we before little. Tonight material moment.	1.8	2242560
277	76	4	2.9	\N	1.9	6127616
41	552	4	2.0	\N	0.9	107520
296	442	4	0.4	\N	0.5	5083136
31	228	4	1.2	\N	1.5	3962880
299	976	4	2.6	Task thought million trial. They his able score effort.	0.5	5492736
297	528	6	0	\N	1.6	5064704
212	848	6	0	Voice kitchen protect.	1.5	5271552
285	868	4	1.6	Total create tonight finally pressure none.	1.2	1374208
222	231	4	1.9	\N	1.1	1456128
235	259	5	0	Education condition usually partner rest sea expert right.	1.2	8211456
87	866	1	0	\N	1.5	3811328
73	498	4	2.9	\N	1.3	115712
88	579	7	0	It take rather scientist remain. Money public century turn prevent how.	2.0	6402048
235	274	4	1.8	Grow old evening short. Change assume step week public.	2.0	6813696
281	498	4	2.9	\N	0.6	294912
307	872	4	2.5	\N	0.6	3202048
313	100	1	0	\N	1.8	7485440
83	453	4	1.4	\N	1.3	1724416
296	452	4	1.6	\N	0.5	4538368
58	977	9	0	Big others song cell can much though.	1.7	3997696
144	704	5	0	In relationship writer remember gun guess television.	1.8	3612672
326	614	6	0	Course military story goal reveal paper across.	1.2	5164032
22	494	4	0.3	\N	0.6	4711424
168	295	9	0	\N	0.5	2473984
151	381	6	0	Resource minute receive expert wind. Trip citizen research leader international quality worry.	0.8	8259584
234	151	4	2.8	Similar quite organization.	0.5	3215360
72	636	4	2.0	They country true decision large. Scientist him nice set perhaps suggest small as.	2.0	5241856
52	319	9	0	Spend clearly country development author.	1.7	7616512
208	120	4	2.7	Month defense general majority offer. Writer course can believe administration.	1.3	1329152
254	717	4	1.6	News anyone will true guy.	1.1	1949696
111	785	8	0	\N	1.1	6082560
255	584	4	1.6	\N	1.0	6115328
25	510	6	0	\N	1.5	5793792
139	346	1	0	Give study door over national bad police.	1.7	7386112
73	508	4	0.8	Born check outside around on sort discussion short.	1.7	6094848
277	77	1	0	\N	1.8	538624
42	486	4	0.6	\N	1.7	6982656
322	671	4	1.9	\N	1.7	1361920
216	935	4	2.8	Next chair card control.	1.7	8269824
122	713	4	1.2	Generation none thing window. Sure require carry trouble woman minute.	1.3	5447680
89	348	7	0	\N	1.9	5966848
146	173	4	2.3	Road lead environment tax including hospital eight. North final move now against him.	0.6	6059008
173	922	4	2.9	\N	1.4	2889728
3	423	4	2.5	Model thing major quality. Clear operation ready professor.	1.1	2067456
193	149	1	0	Artist west on fast high computer bring.	0.7	6316032
246	358	4	2.5	Lot present partner these.	1.5	1246208
308	366	6	0	\N	1.2	3685376
264	120	4	2.7	During let walk southern.	1.7	201728
257	290	10	0	\N	1.5	680960
251	609	3	0	Painting line chance history hot air oil.	1.1	4981760
238	766	4	1.1	Southern article full nation.	1.4	7895040
263	274	4	2.0	Want official service perhaps especially who.	1.8	6951936
81	745	6	0	\N	0.8	3093504
125	641	3	0	For change together nothing black. Themselves deal very go general.	1.5	6432768
19	635	10	0	\N	1.3	8081408
225	326	4	1.5	\N	2.0	1996800
40	367	4	2.0	Nor firm require western.	1.8	3672064
326	625	4	2.7	Size return phone out.	1.3	7847936
204	213	8	0	Nearly chair generation fire former coach.	1.5	6400000
103	205	9	0	\N	1.6	3615744
208	126	3	0	Daughter agreement from certain agent skin.	0.8	6755328
27	732	4	1.5	\N	1.4	4261888
246	364	4	2.7	\N	1.9	6035456
92	936	4	0.7	Over season develop start interview study.	1.7	2267136
147	319	4	1.7	Several on try. Management process become.	2.0	3362816
150	147	4	2.6	Picture present pressure paper raise model.	1.9	7240704
293	579	4	2.6	Town news ago movement.	1.8	7095296
193	136	4	0.6	Never group example culture training effort.	0.9	7878656
299	980	4	1.9	\N	1.0	4069376
293	573	8	0	Campaign every nearly.	1.4	1442816
24	33	4	1.5	\N	1.5	8022016
39	768	4	2.6	Vote exactly return by along.	0.8	3813376
83	449	4	1.5	Yes agree close generation.	1.4	7801856
46	273	8	0	Later first word buy.	0.6	2771968
189	735	1	0	Strategy vote attention number few huge. Agency save however song hold whether provide yourself.	0.9	5226496
272	384	4	1.2	Surface evening arrive traditional.	1.8	3973120
104	797	4	0.9	\N	1.5	3298304
245	37	3	0	\N	1.7	1736704
64	537	3	0	Personal participant many five next nature blood.	1.4	1206272
259	121	6	0	Language bit think picture.	1.6	1756160
86	173	4	2.3	Before coach those until executive hot. Want statement attention Mrs because enjoy under.	1.9	6175744
102	775	4	0.7	\N	1.1	4440064
254	715	4	2.8	Develop resource test film.	1.0	1655808
151	397	4	1.0	Good beyond write. More once life similar.	2.0	6212608
138	425	9	0	\N	1.6	2080768
224	312	4	2.4	\N	1.2	2386944
55	563	4	1.9	\N	1.4	4035584
26	80	5	0	\N	0.7	3610624
320	492	4	1.8	\N	1.7	7503872
77	895	4	1.4	Me be realize continue decade. Goal true her growth letter sure.	0.7	3677184
255	588	9	0	Take benefit probably likely risk.	2.0	2518016
221	826	4	1.6	\N	1.0	3631104
142	659	4	2.0	\N	1.3	984064
239	701	4	2.5	\N	0.6	2314240
6	850	10	0	\N	1.9	7651328
287	364	4	2.7	Decision imagine season agree sign room girl child.	0.8	8160256
120	766	3	0	\N	1.2	3053568
191	336	4	1.5	\N	1.4	3208192
134	415	8	0	Part between left state.	1.7	726016
153	567	4	2.9	\N	1.4	3102720
240	353	4	2.9	Still might suffer minute.	1.3	6309888
128	721	6	0	North administration southern election build why one. Argue young thank then several window plan.	1.4	524288
285	855	4	0.9	Kid full do expect Democrat.	1.2	3378176
315	500	6	0	Together nice term success boy.	1.6	465920
158	265	1	0	Stop however medical beautiful society kitchen.	0.9	1789952
52	331	1	0	Fall body plant again behavior make investment.	1.6	2358272
96	363	3	0	\N	1.0	473088
93	139	5	0	Live country newspaper character.	0.9	480256
280	835	5	0	Everybody focus water than cause.	1.4	2119680
195	512	7	0	\N	1.3	2031616
40	368	6	0	\N	0.6	1458176
140	701	4	2.5	Little cup station put.	1.2	4500480
70	295	4	0.5	\N	1.5	4137984
33	981	4	2.5	\N	0.9	4471808
17	967	4	1.3	\N	1.0	4110336
196	738	4	2.3	Expert Republican unit believe body kind Mr cover.	1.0	7700480
289	937	7	0	\N	1.3	6564864
216	939	3	0	Total administration throughout that billion soldier call.	1.5	657408
90	20	4	1.0	\N	0.7	4711424
197	124	1	0	\N	1.4	3727360
14	974	4	1.0	Successful practice animal serious ahead.	0.6	6341632
148	8	4	1.6	\N	0.6	4405248
200	747	4	1.4	\N	0.7	7223296
322	689	4	1.7	Week source opportunity poor hard side.	1.9	669696
40	378	7	0	\N	1.1	2799616
103	213	4	1.7	\N	1.0	4455424
10	444	4	1.9	Reason hair mouth push. Sit notice around ask color believe.	1.9	376832
163	846	4	1.6	Bit happy theory number.	0.9	174080
235	261	9	0	\N	1.4	1014784
250	25	4	1.1	\N	0.9	3549184
16	769	6	0	Evidence again other career value instead political.	0.6	5194752
199	100	4	1.7	\N	0.8	1440768
14	972	4	1.6	\N	0.9	5786624
268	633	4	0.4	\N	0.8	4408320
64	558	4	1.5	Prepare need from process those across major gas.	0.6	292864
121	351	1	0	\N	0.5	7883776
27	724	6	0	\N	1.5	7763968
25	504	4	1.4	\N	0.7	875520
171	174	5	0	\N	0.9	1628160
17	973	1	0	Increase not stuff center inside school represent.	0.6	1467392
19	618	8	0	\N	0.9	6482944
188	726	4	2.0	Represent sport protect measure.	1.2	6230016
226	935	8	0	\N	1.8	4270080
195	513	4	1.1	\N	1.6	8008704
312	220	8	0	Pretty record detail future toward scientist.	1.1	237568
36	754	4	0.7	Yet to teacher you money fund. Moment describe police her society.	1.4	7071744
90	17	10	0	\N	0.6	1901568
177	758	4	0.1	Impact represent her save our study let.	1.0	1805312
32	481	4	0.5	\N	0.7	7092224
100	371	9	0	Wrong view culture participant prevent sit.	2.0	5784576
236	698	7	0	\N	1.5	2660352
30	493	10	0	Ago current size.	1.8	643072
53	283	4	1.7	\N	1.6	4346880
229	271	4	1.1	Game care consider current ever specific.	0.8	8228864
120	763	7	0	Concern phone present move almost away.	1.4	7566336
50	700	4	1.5	Window strong tough.	1.7	6888448
305	280	4	1.6	Goal bring light economy.	1.6	5915648
252	956	8	0	\N	1.2	8085504
17	976	4	2.6	\N	1.3	1127424
21	285	7	0	Continue painting relate improve myself bag worker.	0.6	2596864
109	115	9	0	\N	1.8	6941696
3	410	4	0.9	\N	1.0	4261888
255	590	4	0.3	\N	1.8	158720
281	505	4	1.8	Choose face sometimes nice.	1.2	5995520
137	131	5	0	Sound blue food line care happen.	1.5	1111040
24	8	4	1.6	History cut month toward.	1.9	1784832
244	388	6	0	Value fill certainly public brother should. Good store while.	1.6	5036032
73	510	4	1.9	Democratic forward participant remember.	1.7	1658880
215	858	4	2.7	\N	0.8	2769920
171	158	7	0	\N	1.5	886784
122	707	5	0	Look half moment.	1.2	5645312
55	539	4	0.2	Style road somebody establish method contain history how.	1.4	1107968
93	138	5	0	Ok attack by public outside garden responsibility.	0.6	8138752
117	937	4	2.6	Several door out.	1.8	470016
199	105	4	0.1	Yes especially idea dinner.	0.8	7946240
177	756	6	0	Carry community two mind customer if opportunity.	1.6	5124096
86	176	4	2.4	\N	1.5	654336
207	303	8	0	Recognize window quality old physical. Upon church agree resource task.	1.5	8043520
291	132	4	1.6	\N	1.1	5329920
218	756	8	0	Have on do environmental onto capital.	1.6	4218880
12	208	8	0	Writer recent structure.	1.5	3107840
132	330	4	0.3	Relate picture leave guy. Past soldier whose science name good.	0.9	5550080
13	878	4	2.5	Somebody ok and far.	0.7	5874688
320	495	4	2.2	\N	1.2	7038976
151	395	10	0	\N	1.7	608256
176	565	5	0	\N	1.7	2539520
307	871	4	1.9	Camera cover no theory. Away seem that manage yeah throw official.	1.9	582656
5	740	4	2.8	\N	1.1	3102720
135	44	1	0	Would see late example. Night quickly civil information chance answer.	0.9	4653056
54	788	8	0	Between door rule it system. Media before gas human there message series student.	1.8	3396608
167	611	4	1.7	\N	1.2	7933952
312	226	4	2.3	Public his often hard.	1.3	2514944
27	734	4	1.6	\N	1.2	3840000
23	272	4	1.1	Authority finish drive whatever mean.	1.4	1552384
57	862	10	0	Standard business per.	1.3	7643136
143	213	1	0	\N	1.2	5207040
293	574	5	0	\N	2.0	3338240
83	445	4	0.7	Me however under soldier share. Plan nature fish.	1.9	7297024
138	410	4	0.9	\N	0.9	267264
107	863	4	2.7	\N	1.8	7448576
26	79	4	1.4	\N	1.5	2798592
156	445	4	1.1	Center subject leg customer agent.	1.2	6891520
5	742	3	0	\N	0.7	7871488
115	120	4	2.3	\N	1.1	4680704
178	570	4	1.2	\N	0.5	3651584
321	139	4	2.9	Lead moment task.	1.0	5224448
83	444	1	0	Choose attention follow.	1.2	7026688
197	126	4	2.9	\N	1.1	3661824
15	142	4	0.4	\N	1.8	3721216
28	362	1	0	Medical whole sea western institution. Reduce history network any find election feeling example.	0.9	1746944
108	377	4	2.4	Himself stand watch. Rule require money majority production.	0.7	4163584
120	768	4	2.6	Product garden pressure across they on city. Stop assume operation season ability through.	0.5	7495680
246	357	4	2.6	\N	0.5	1302528
103	208	4	2.2	If involve ask this.	1.5	4286464
259	122	8	0	Child strategy player energy center forget knowledge. Character win back central.	1.2	6204416
283	296	6	0	Defense low nice continue.	1.7	6468608
288	602	4	2.5	Civil treatment available throughout because school.	0.6	5841920
234	155	5	0	Anything similar defense.	1.5	7964672
272	398	7	0	Practice economy wrong anyone. Manager inside lot father court.	1.4	8236032
104	811	4	1.1	\N	0.9	4258816
209	625	4	2.7	\N	0.8	8221696
72	621	4	2.7	Consider rock official mission account why.	1.1	242688
52	335	9	0	Nature class deal.	1.6	2499584
62	404	4	2.9	Son throughout list stay one open financial section. Everyone must political shake.	1.9	7582720
67	378	4	1.2	\N	0.7	5381120
105	499	4	1.6	Great three public among provide.	0.7	4175872
177	754	8	0	Possible particular bed market each.	0.9	1851392
145	337	4	2.3	\N	0.9	1093632
58	984	4	1.6	Test college write food board.	0.6	6608896
268	614	4	2.1	Hot security section information.	0.9	1430528
164	816	4	2.6	Garden clear share Democrat research rich position.	1.9	6562816
179	738	4	1.3	Feel should real suddenly writer ahead. Show threat fire security shoulder kitchen poor.	0.8	453632
237	284	4	0.3	Standard example serious similar data happen receive teach.	1.0	8204288
152	286	4	2.4	Than avoid less short imagine not.	0.6	2242560
166	219	5	0	\N	1.4	6385664
282	985	4	1.9	\N	0.9	7874560
280	827	8	0	\N	0.6	5875712
86	169	6	0	Me whole project.	1.6	4464640
97	649	9	0	\N	0.9	6721536
245	6	4	1.6	Billion store day point adult generation staff.	0.8	1914880
155	65	3	0	\N	1.9	7157760
84	482	4	0.2	Measure race white then necessary sort.	0.6	2197504
258	935	1	0	Pm spend remember sport.	0.8	1435648
307	878	4	2.5	Relate question call example chair first.	1.1	2761728
296	445	6	0	\N	1.9	6762496
111	790	4	1.2	\N	0.6	2382848
165	223	4	1.8	Country to doctor name program college.	1.1	4051968
215	857	4	2.7	Control news poor them ready.	1.4	4431872
229	267	9	0	Action add phone require administration that.	1.6	3715072
295	955	7	0	Oil people vote education six local hand.	0.9	6438912
223	845	6	0	Newspaper old begin join image they site.	1.3	679936
299	963	5	0	\N	1.1	3330048
250	17	7	0	Itself interesting interview poor name.	1.8	649216
225	318	5	0	\N	2.0	3246080
26	86	6	0	Beat get site.	0.6	5382144
45	908	4	2.1	Boy economic face range operation toward president.	1.0	3762176
271	510	4	0.4	Magazine agency too author light best require.	1.1	1123328
184	48	7	0	\N	1.6	1441792
72	623	3	0	\N	2.0	509952
225	325	9	0	\N	0.9	2357248
215	855	7	0	\N	1.2	900096
241	706	4	1.9	\N	0.8	3931136
20	228	4	1.1	\N	1.4	148480
88	590	4	1.0	Read customer central day one big record.	0.7	5408768
238	768	8	0	\N	1.9	4781056
83	439	4	2.0	\N	1.8	8043520
147	325	6	0	\N	0.8	8176640
144	702	4	1.6	\N	0.7	2636800
189	729	9	0	Manager structure build mention for face husband.	1.8	7515136
288	608	4	1.0	\N	1.4	5412864
138	424	3	0	\N	0.7	5066752
253	405	9	0	Cut memory choice your throughout own baby range. Sign player voice break.	1.3	7629824
105	501	4	1.5	Source present agree community art model analysis.	1.7	3853312
320	484	4	2.2	\N	1.6	2461696
320	471	4	0.8	\N	0.6	4819968
179	747	4	0.7	\N	1.1	3326976
156	434	5	0	Special executive speak form such step somebody.	2.0	1996800
155	72	4	2.1	\N	1.0	4845568
172	269	4	2.8	Culture myself its section traditional against. Blue speech great affect.	1.2	5760000
208	125	8	0	\N	0.9	7913472
222	243	4	0.9	\N	1.8	4427776
261	264	4	0.7	\N	1.8	3954688
268	626	4	1.0	\N	1.5	4935680
300	345	4	2.7	Data central phone development war.	1.5	1763328
242	79	4	1.4	According sometimes recent idea PM. Girl forget soon radio performance wind history.	1.1	6762496
250	41	4	2.9	Eye although provide total professional his.	1.2	5604352
322	678	5	0	\N	1.0	4415488
233	466	5	0	\N	0.8	4541440
242	90	8	0	\N	1.3	5730304
121	347	4	0.7	\N	1.6	8131584
272	397	5	0	\N	0.8	820224
298	213	10	0	\N	1.4	7311360
16	768	4	0.7	\N	1.5	2624512
26	67	4	1.9	\N	1.6	6140928
323	4	4	0.1	Plant institution wife either.	0.8	8169472
171	151	3	0	\N	2.0	3689472
203	320	4	0.7	Finally play fish purpose green yard.	1.6	388096
52	320	4	1.9	Let election give four machine.	1.8	7541760
256	781	4	1.0	\N	0.5	506880
182	896	9	0	\N	0.7	3215360
26	69	4	0.1	Pattern could food.	1.3	1666048
326	639	3	0	Figure science quite increase reflect relationship news on.	0.7	6635520
303	810	4	1.5	Improve trade bag.	0.9	3926016
79	353	10	0	Analysis history director. Between minute tough edge wear race understand learn.	0.6	7481344
118	936	4	1.1	\N	0.9	4326400
318	205	10	0	Outside his can fund card company human. Toward peace itself shake month.	1.1	3036160
54	786	8	0	\N	1.5	8008704
158	259	4	1.9	Major attack movement modern goal big to.	1.7	5108736
31	226	3	0	Stop small include by sense during hotel. East usually site move recently significant part.	1.5	6563840
148	16	4	2.3	\N	1.6	5613568
241	701	3	0	\N	1.3	5831680
146	156	4	1.6	\N	0.7	1803264
110	344	4	0.1	Level than spring store. Certain thousand capital social student stage.	0.8	2486272
86	167	4	1.2	Purpose create painting party however move individual article.	1.5	1223680
157	235	4	2.1	\N	0.5	3914752
167	593	4	0.7	\N	0.9	1548288
99	361	4	2.0	\N	1.4	5903360
325	561	9	0	Brother student decision fish occur.	0.7	7470080
109	133	6	0	Cost federal wall concern red.	1.2	2382848
24	42	7	0	\N	1.8	435200
218	760	8	0	Agent authority consumer hundred.	1.0	616448
171	157	6	0	\N	1.1	6333440
285	857	9	0	\N	0.8	6620160
298	214	8	0	Forward growth especially hold growth.	1.4	4830208
285	865	4	1.7	Century level open small.	1.1	7311360
308	374	4	1.0	Reflect bad star bar design.	1.9	1644544
17	965	4	0.8	\N	1.2	1047552
45	905	9	0	\N	1.2	6611968
247	177	4	0.7	\N	0.6	1325056
224	301	4	1.4	\N	1.9	4622336
30	484	9	0	Occur model whole color someone learn. Close general season involve late.	1.6	6650880
8	657	3	0	Hear cup probably age laugh more pull into.	1.4	1717248
325	540	10	0	Two set majority enjoy.	1.0	6810624
307	889	4	2.5	Eat director free ten a. Sometimes she once officer close world.	0.8	6378496
166	221	5	0	\N	1.3	2882560
234	173	4	2.3	Country boy together. Country relationship within but scene challenge technology.	0.9	7986176
200	738	4	2.3	\N	0.6	6159360
293	582	4	2.6	Pull old kitchen activity.	0.7	3092480
119	855	6	0	\N	1.3	4533248
300	349	10	0	\N	2.0	7630848
251	592	4	0.5	Lose air little director such follow. Include poor building son enjoy hotel we with.	1.3	6858752
213	927	4	2.8	Stay I wear baby consider.	1.8	3651584
20	222	7	0	Public admit couple and clearly car.	1.4	5653504
171	161	5	0	\N	1.2	5136384
303	794	10	0	\N	1.6	8074240
242	73	10	0	Beautiful what money enter.	0.6	1098752
130	405	8	0	Each four develop daughter me time commercial.	1.8	6401024
250	11	4	1.1	Because green once.	0.7	2978816
277	62	10	0	\N	1.1	5720064
138	419	10	0	\N	0.9	4211712
10	455	8	0	\N	1.9	3957760
138	412	4	1.4	\N	1.4	5307392
296	459	5	0	Bank perhaps hold enter. Several loss black board tree rate add.	1.7	3439616
84	477	4	2.7	Firm exactly course hour feel that market car. Be result all forward sport despite.	2.0	2166784
297	524	4	1.0	Total person occur any argue better.	0.6	3772416
108	380	4	2.6	Usually eight road member huge money better relate.	0.6	2229248
190	671	8	0	\N	1.7	8183808
119	859	5	0	Democrat party follow task artist throw whose than.	1.3	7415808
230	183	6	0	\N	1.0	559104
9	234	6	0	\N	1.2	7189504
88	576	4	1.5	\N	1.1	7314432
219	351	7	0	Without whether later family recently rich a.	0.8	6799360
100	378	4	0.4	Tough large manager.	1.4	6679552
202	816	3	0	\N	0.5	2400256
38	777	4	2.3	Partner finally month body could wait.	1.7	5826560
233	464	4	1.0	\N	1.5	5080064
271	514	7	0	Stay need put image issue bit. Along likely reality go by think.	1.5	7472128
160	156	4	1.6	Moment five across receive of above.	1.0	2981888
250	34	6	0	\N	1.3	5853184
322	666	10	0	\N	0.9	4720640
76	363	4	2.3	Agent street sport lawyer prevent safe explain. Resource certainly along structure where candidate.	1.2	3173376
125	648	4	2.8	The group control attack drive represent.	1.8	7106560
180	339	7	0	That crime whether she.	0.7	4802560
8	648	4	2.8	News leg win light including like pretty. Security price surface probably green significant spring.	0.6	5067776
155	80	9	0	Popular imagine work work piece. Voice history almost large rather like action.	1.2	2285568
42	480	9	0	Word they tough apply serious upon financial building. Something major ten establish quite.	1.6	2975744
277	73	5	0	Case weight trade education two report.	0.9	6902784
106	281	4	2.8	Save perhaps how for ago possible according.	2.0	671744
132	329	6	0	Fund term rule important pick ten base. Easy reality provide relate indeed too ask.	1.0	2975744
244	392	4	2.9	Institution know major sell man daughter business.	1.0	7600128
281	502	4	1.9	Night according spend stage if before risk hot. Save us collection bad.	1.1	6208512
322	682	4	2.5	\N	1.2	4631552
176	567	3	0	\N	0.6	3045376
279	943	4	1.0	Box claim news mean large Mrs.	0.7	2206720
320	488	10	0	\N	1.3	7158784
43	858	9	0	Hour scene sea buy will effect during.	1.1	2520064
320	494	4	1.1	Business value current institution than large pretty.	1.1	4469760
251	603	5	0	If create police than. Head fear one discover.	1.2	5143552
62	402	4	2.7	Film Republican benefit professional yard.	1.0	2868224
28	364	4	2.7	International five prepare for however answer.	0.5	1571840
150	142	4	1.1	\N	1.6	3086336
248	938	4	1.5	\N	1.3	486400
282	980	4	0.5	Past wrong until beyond poor without article.	1.1	6469632
72	626	4	1.0	Act tough parent executive order middle fact.	1.3	3529728
293	590	4	1.0	\N	1.0	6227968
269	322	4	1.6	\N	1.6	2041856
56	873	4	1.9	Father wear case management near.	1.0	6896640
60	732	3	0	Deep wind rate while white. Gun important game something explain focus note.	1.9	4853760
100	379	4	1.5	\N	1.3	5795840
29	585	3	0	\N	0.7	6080512
197	121	6	0	Visit receive history clearly responsibility idea stand.	1.9	7336960
297	534	1	0	\N	0.8	811008
265	872	4	2.5	\N	0.6	7198720
3	415	8	0	\N	1.3	4346880
163	850	4	2.3	Young real meeting close night key section.	1.1	1378304
39	764	1	0	\N	1.7	1391616
64	542	10	0	Itself cut they for.	1.4	5439488
107	856	4	1.3	\N	1.1	1046528
152	289	8	0	Should government century special.	0.9	4169728
296	426	4	0.7	She training example drive prepare court.	1.9	2331648
1	138	4	1.9	\N	0.8	3851264
299	959	8	0	Move ability close beat PM everyone.	0.7	3698688
24	24	4	0.2	\N	0.6	2190336
7	774	4	1.4	\N	1.1	4849664
200	745	1	0	Want mission deal modern board she color military.	1.6	4737024
169	781	4	1.0	Drop never member kind whom.	2.0	6994944
16	764	4	0.3	\N	1.1	3988480
297	533	9	0	\N	1.2	7747584
150	146	9	0	Sign me toward image.	1.5	4916224
209	619	4	1.9	\N	1.4	3569664
282	960	4	2.3	Huge often animal here over able. North think catch thank under with experience.	0.9	5837824
203	333	4	2.3	\N	1.7	463872
205	64	5	0	Happy defense store society west Republican. Son challenge son.	1.6	4118528
107	855	10	0	\N	0.7	6905856
146	155	9	0	Feeling each degree sing whose kitchen energy.	0.8	3464192
50	698	9	0	Very alone leave that.	1.4	1289216
171	170	10	0	Fly drive positive military wear expert.	0.8	1361920
110	343	4	2.9	\N	2.0	3506176
1	147	4	2.6	\N	1.9	5566464
55	557	8	0	Rather child senior case meet run look.	1.4	285696
98	351	4	1.1	Case together instead president baby.	1.2	6130688
300	344	10	0	\N	1.1	5043200
183	234	4	2.5	\N	0.9	3189760
294	137	4	1.6	\N	1.6	5598208
150	139	4	1.1	\N	0.7	2009088
197	128	8	0	\N	1.7	712704
320	486	7	0	\N	0.7	6340608
65	280	3	0	\N	1.7	966656
90	37	4	1.7	\N	1.5	8061952
179	739	1	0	Else ready pretty break style time kid.	1.4	7189504
19	631	4	1.7	Conference front capital economy available staff read. Or necessary board full specific.	1.0	1428480
175	521	4	1.0	Professional sister television something stage letter. Ask him condition huge let buy.	0.6	6882304
131	566	4	2.1	\N	1.1	4713472
71	779	4	0.9	Himself street raise situation dinner rise think.	0.6	5501952
260	568	8	0	\N	1.6	5232640
228	111	5	0	\N	1.6	5523456
10	438	4	2.8	\N	1.2	7571456
23	278	4	1.0	\N	1.1	2162688
15	149	10	0	Dog good specific report enough mouth.	1.0	7530496
46	266	4	1.5	Church understand current discuss if his. See believe skin exactly at turn.	0.9	6643712
98	347	4	1.0	Early direction event lose region process simply me.	1.6	7777280
213	929	4	2.1	Necessary fire professional what student admit. Loss measure seem.	1.4	664576
77	900	7	0	\N	1.5	5645312
83	458	1	0	Family car call southern near sport best military.	1.6	7291904
100	369	4	1.5	Air ok age hard.	1.9	2771968
109	123	4	2.3	\N	0.9	6279168
42	474	4	1.4	\N	1.2	1821696
26	71	4	2.8	Meet one author wear program fire poor. Crime when at much decide whole.	0.9	826368
52	332	9	0	\N	0.8	456704
99	360	4	0.6	Policy condition once your.	0.8	8243200
185	289	7	0	\N	1.8	1475584
197	133	4	2.8	\N	1.2	1217536
24	28	10	0	\N	1.0	1646592
115	119	4	2.6	\N	1.1	7261184
45	913	4	1.0	\N	1.2	5228544
20	221	4	2.7	\N	1.7	6641664
107	861	9	0	\N	0.7	5883904
152	291	4	1.7	\N	1.6	4150272
209	636	4	2.0	Improve success down brother somebody.	1.1	3954688
299	982	6	0	Especially store despite expect.	1.3	2555904
132	332	7	0	Ahead born herself officer.	1.5	2983936
228	101	1	0	\N	1.4	7907328
250	20	8	0	\N	1.0	7604224
199	109	4	1.5	\N	1.3	6938624
155	70	7	0	More town what factor never light. Unit push who trade.	0.5	2107392
181	340	3	0	Change hit executive.	1.6	3295232
8	647	4	2.1	Figure simply entire others decade mention Republican religious.	1.1	626688
321	140	4	1.1	\N	0.9	3277824
235	263	8	0	\N	0.8	3957760
64	538	4	2.6	\N	1.1	6693888
185	293	4	2.2	\N	2.0	6743040
326	635	4	1.0	\N	1.9	5307392
12	205	4	1.8	Like sea toward wonder. Yeah follow nice hospital kid.	1.5	3363840
84	489	4	2.8	Arrive theory assume past say product result. Month require political suddenly civil benefit.	0.8	5421056
183	240	10	0	\N	1.0	6526976
11	865	6	0	Prepare admit brother crime weight also physical.	0.8	5148672
30	488	4	0.3	Strategy big whole pay during less.	1.5	2643968
1	146	4	2.9	Explain listen site go.	1.6	5073920
242	80	4	0.7	\N	0.8	1912832
205	68	9	0	\N	1.2	4206592
32	489	4	2.8	\N	1.8	834560
158	269	4	2.8	\N	1.2	6769664
200	741	4	1.7	\N	0.6	2296832
313	96	4	1.7	\N	1.4	3039232
141	477	4	2.3	Author some wait couple card.	1.1	8272896
81	744	4	1.8	\N	1.9	1529856
303	795	10	0	Employee picture green recently.	1.2	4397056
153	566	1	0	Choice out Mr artist use. Explain rate culture summer clear foot.	1.9	444416
173	923	7	0	Media collection suddenly happy cultural truth owner.	1.3	190464
55	560	4	2.2	Change act rich into for.	1.7	7296000
78	878	9	0	Anyone back land step speech.	2.0	2933760
87	858	4	2.7	Report their also truth prevent.	1.7	4111360
42	477	3	0	Nor community particular up front.	0.6	4345856
159	2	9	0	Whose star manage well employee.	1.5	6621184
182	895	4	1.4	Seem Mrs moment. Section find general south wall investment because affect.	1.0	1180672
236	701	8	0	Read nice reality for area authority challenge weight.	0.6	3875840
56	887	6	0	Society once food early foreign education edge parent.	1.5	7139328
171	155	4	1.4	\N	1.1	4366336
168	292	10	0	Wind instead thought energy.	1.0	8072192
22	486	4	1.7	Agency without politics.	1.8	3569664
67	372	4	2.3	Position learn scientist third simply water.	0.9	1436672
41	554	8	0	Model develop treatment he these back late.	0.7	3715072
200	744	4	1.8	\N	0.9	7552000
205	85	4	1.1	Son building military order.	0.7	2046976
41	550	7	0	Face board girl history these though race.	1.6	3496960
280	838	4	1.2	\N	1.4	8249344
64	544	6	0	Receive else do Congress step movement.	0.7	5676032
183	242	1	0	Trade under recognize age phone one person.	0.9	8041472
23	274	4	1.7	Perhaps new college still major money note page.	1.7	1086464
235	270	4	1.6	\N	1.6	1318912
187	2	4	1.7	\N	0.7	7215104
321	141	9	0	Fast pull course. Shoulder wrong condition employee include relate.	1.3	7921664
66	911	9	0	Base occur only key which defense figure clearly.	2.0	476160
154	704	4	1.5	See lead stay wish popular.	1.4	3357696
191	338	10	0	\N	2.0	4365312
202	809	9	0	\N	1.6	3575808
264	117	4	0.1	\N	1.1	5067776
26	92	4	2.4	\N	0.7	3722240
91	923	8	0	\N	1.5	461824
101	768	4	2.6	\N	1.6	8117248
307	879	4	1.1	\N	1.0	1722368
15	141	3	0	\N	1.1	4547584
32	488	8	0	Interest feel dog reflect learn. Pay writer west run them.	0.8	3713024
7	777	8	0	\N	2.0	5626880
242	71	4	2.8	High describe consumer half her hour. Grow century admit suddenly six major.	1.2	5639168
199	104	10	0	\N	1.3	8133632
217	935	4	1.8	Recognize heavy share goal air still.	2.0	7234560
121	348	4	1.8	Inside health fight window. Begin memory compare miss score.	0.5	1588224
23	268	4	1.6	\N	1.9	1650688
55	556	6	0	\N	0.6	6542336
63	774	3	0	Matter collection window another.	0.6	2945024
102	777	4	1.5	\N	1.9	3054592
9	231	4	1.9	Seat across much peace might determine. Weight name arrive.	1.7	1427456
160	157	4	1.9	\N	1.0	734208
88	573	9	0	Outside draw themselves available serve low.	1.8	976896
150	141	4	1.4	Different item job great role green themselves. I skill huge turn others family type still.	1.7	1021952
134	420	1	0	\N	1.2	8157184
164	807	5	0	Inside raise probably own left when.	0.6	3538944
187	1	4	2.3	\N	1.4	4682752
244	385	4	2.3	\N	0.9	6926336
78	885	5	0	Site appear leave yes case house as.	1.6	7688192
251	612	3	0	Natural vote like sit respond.	0.8	4423680
42	490	4	0.0	Environmental approach computer simply financial half.	1.1	6677504
280	829	4	2.4	Entire state energy.	1.9	6547456
25	500	4	0.2	\N	0.7	2227200
226	938	3	0	\N	1.5	6234112
154	702	7	0	\N	1.2	6705152
148	14	10	0	Significant operation investment say.	1.3	6274048
147	323	7	0	More half fact toward significant tend avoid.	1.9	4774912
57	855	7	0	\N	1.1	3719168
90	35	4	2.8	\N	1.3	2448384
234	168	7	0	\N	1.9	1803264
303	802	4	1.5	\N	0.6	5407744
259	130	5	0	\N	1.9	5266432
135	57	6	0	Manage understand direction so now party.	0.8	6766592
89	349	9	0	Rather method war fly south three site.	1.9	7092224
90	38	5	0	Main condition political much since mention deep throughout.	1.6	887808
202	805	3	0	Group rock evidence agency back name.	1.7	611328
148	36	1	0	\N	1.3	6701056
199	101	9	0	\N	1.1	8099840
208	117	3	0	\N	1.7	3108864
240	352	4	1.1	\N	1.5	3997696
306	220	4	2.8	Including everyone with understand.	1.3	3324928
316	49	4	0.2	\N	1.7	8051712
234	156	9	0	\N	1.5	122880
267	304	4	1.1	Heart catch her our drop.	1.0	8242176
270	142	10	0	\N	0.9	1943552
303	809	4	1.1	Office several beautiful sport understand sure party.	1.8	7772160
325	539	5	0	We play likely despite.	1.5	6677504
156	453	1	0	Inside real what carry.	1.0	8267776
105	510	4	1.9	\N	1.5	6026240
75	406	4	2.8	\N	0.6	8242176
58	979	5	0	Consider someone let crime indicate.	2.0	6048768
167	595	5	0	Age who involve pull mention successful. Various painting myself central.	1.7	7699456
30	495	9	0	Try college region spring kitchen politics. Mission war share family charge meet bad Mrs.	1.2	1258496
154	701	9	0	Ever range television school.	1.5	1254400
183	236	4	0.8	When sound hit court federal.	1.3	243712
185	295	4	1.8	\N	1.3	2980864
91	924	4	2.9	\N	1.3	1597440
186	738	4	2.3	\N	0.6	653312
29	586	4	2.4	\N	1.2	2306048
247	164	9	0	\N	0.6	3013632
322	686	4	2.2	\N	1.4	6182912
263	277	4	1.4	\N	1.7	801792
242	84	4	2.6	We pretty event. Available ball administration your issue anything.	1.9	870400
187	4	4	1.5	\N	1.1	4131840
104	799	4	2.4	Difficult wish care discover almost turn successful.	1.3	5737472
205	71	4	2.8	Democrat better reflect politics mind election result standard.	0.8	3466240
299	964	8	0	\N	1.4	5289984
42	472	8	0	Sport since either body compare.	1.7	6332416
44	742	3	0	Likely alone PM source.	1.8	678912
293	580	5	0	\N	1.4	240640
104	796	4	1.1	Note team experience exist.	1.1	1117184
188	728	4	0.5	\N	1.6	5811200
202	808	3	0	Because truth try process short.	1.3	4277248
259	116	4	1.9	Similar study difficult concern kitchen institution. Field really woman support recent.	1.1	1671168
266	937	4	0.7	\N	1.2	8262656
312	228	4	1.2	\N	0.6	1797120
93	135	9	0	\N	1.3	353280
183	237	3	0	Board usually food third probably then soldier.	1.2	5306368
109	125	4	1.8	\N	1.3	1086464
296	440	8	0	\N	1.2	5340160
172	259	3	0	He story reality street structure. Claim indicate just campaign.	1.5	3910656
167	592	4	0.9	System risk might camera role sell. Others such manage station hold size.	0.6	5362688
250	36	1	0	\N	0.9	2469888
274	763	9	0	\N	0.5	3113984
158	278	4	1.5	\N	1.7	4201472
108	373	10	0	\N	1.2	5377024
146	154	1	0	\N	1.1	4588544
238	763	4	1.0	\N	1.6	4251648
61	719	1	0	\N	0.5	5564416
86	150	7	0	\N	1.8	6831104
261	261	1	0	\N	1.6	2167808
19	626	4	1.0	News guy skin wind not level else.	1.5	8224768
13	892	4	1.0	\N	1.4	1788928
242	64	4	1.5	Team shoulder standard public true include.	1.7	2935808
33	965	4	2.5	Ten individual hotel care indicate decision.	2.0	7608320
183	243	9	0	\N	1.5	6602752
230	200	4	2.0	Something image spring challenge.	0.9	5297152
85	312	4	2.4	\N	0.8	6847488
109	132	4	1.6	Operation better after Mr.	1.7	3040256
156	431	4	0.7	Word body rise anyone.	0.9	266240
259	119	3	0	\N	1.0	7455744
73	497	4	2.8	\N	0.7	4686848
155	68	4	1.3	Eat near support upon some clearly edge cold.	0.7	8290304
205	90	4	1.5	\N	0.6	345088
315	501	4	1.4	\N	0.9	4525056
38	776	4	2.7	\N	1.2	3164160
90	16	8	0	Theory drug instead purpose newspaper rise. Information ground more imagine person assume now.	1.4	7884800
307	881	4	2.0	President wear piece political worry project special least.	1.2	4794368
310	722	1	0	\N	1.8	3064832
11	862	3	0	\N	1.5	7480320
16	765	7	0	\N	0.9	5859328
40	374	4	2.4	\N	0.8	1666048
186	745	4	2.1	Bring church receive.	1.8	5576704
228	110	10	0	\N	1.6	5459968
230	201	4	0.5	\N	1.1	2539520
282	958	9	0	Travel particularly level this however.	0.7	997376
322	676	4	2.1	Tv make north could will professional.	0.8	6484992
119	866	4	0.9	Production probably professional improve hit.	1.2	3410944
26	72	4	2.4	\N	0.6	1260544
1	141	4	1.4	Every indeed require factor.	1.2	4055040
43	862	4	2.7	Eat daughter easy trial toward single size state.	1.2	3196928
104	800	3	0	\N	1.9	2364416
65	279	8	0	\N	1.1	1721344
251	599	4	1.4	\N	1.7	1957888
48	377	9	0	Necessary kitchen glass local every major choose. Moment film thus degree institution whom pressure.	1.3	1166336
41	542	9	0	Leader range financial there.	1.2	566272
282	968	7	0	\N	1.1	3892224
247	175	1	0	\N	0.8	7354368
80	824	4	2.4	\N	1.3	4560896
84	486	7	0	\N	0.9	6895616
85	299	4	0.5	\N	0.9	2078720
93	145	4	2.2	\N	1.7	6715392
269	334	4	2.4	Head so everything together past nearly.	1.0	8193024
215	852	4	0.6	Mr environmental whole generation then fear others.	1.9	3880960
160	159	6	0	\N	1.4	6331392
172	263	1	0	\N	1.6	4418560
205	78	4	1.3	\N	1.0	5613568
295	949	8	0	Republican people herself.	0.7	2676736
101	766	9	0	\N	1.4	6349824
139	348	6	0	American our major choice career.	1.1	6254592
267	300	3	0	\N	1.6	4785152
238	765	4	1.6	\N	1.7	161792
114	698	4	2.8	\N	0.8	2038784
34	340	6	0	\N	1.8	5975040
291	129	10	0	\N	1.5	7370752
4	824	4	1.8	Show center maintain national health.	1.0	7083008
220	717	4	1.5	\N	0.7	7779328
320	477	4	2.7	Range four situation fund. Food despite run now wall road matter.	1.2	2357248
13	886	4	1.9	Effort part toward follow value mother Democrat.	0.7	2259968
46	269	4	2.8	Minute team near Congress.	1.5	6133760
8	645	4	1.3	\N	1.3	3003392
266	938	4	1.5	\N	1.0	5534720
40	371	4	0.6	\N	1.9	5669888
60	723	4	0.3	Nearly medical safe ever civil when sport.	1.7	1850368
107	864	5	0	Whole business change protect five.	1.4	1296384
275	778	4	0.6	\N	1.2	2861056
318	211	4	2.3	Page benefit than however and over say. Stop conference heart again try pay.	1.6	7317504
218	759	3	0	\N	1.0	5497856
245	28	4	1.6	Affect wear foreign evidence its medical upon energy.	1.7	479232
261	260	4	2.0	\N	1.4	7720960
257	295	7	0	\N	1.3	2956288
296	450	6	0	Tell around item term avoid for. Still hope game commercial network for science.	0.5	8254464
199	99	4	0.9	\N	2.0	5844992
257	287	4	1.9	Increase really federal court hair sense seat maybe. Store fight citizen future eye.	1.8	5065728
278	254	3	0	\N	0.7	3800064
43	868	1	0	\N	1.5	2044928
149	406	4	1.9	\N	1.3	2260992
192	59	4	2.9	During six rise air.	1.9	3187712
307	873	1	0	Plan allow across minute western relate.	1.2	539648
40	366	1	0	\N	1.1	112640
98	342	4	1.9	Rule again thousand parent true Republican fly.	0.9	6440960
22	471	4	1.1	Source where probably with while professor.	1.4	2400256
100	374	4	1.2	Board return summer single fund. Exist option artist politics.	1.4	1682432
175	518	7	0	\N	1.0	2288640
242	66	4	1.0	\N	1.8	1082368
40	372	9	0	Operation occur set feeling item industry security. Action indeed suggest.	1.2	2159616
76	362	4	2.8	\N	0.9	6433792
259	114	5	0	Garden appear tree drive.	0.9	446464
215	860	4	2.8	\N	1.8	438272
86	163	6	0	\N	0.9	7542784
98	345	4	2.7	Western close factor.	0.8	1552384
269	330	4	2.4	Trade day reason stock help from almost her.	1.3	4713472
64	539	4	1.8	Wind miss health religious notice Mrs whether.	0.8	402432
14	980	6	0	Community off try ball professor professional can school. List end make.	0.7	2470912
20	217	4	1.5	Season government until often.	1.5	2056192
77	899	4	2.3	Impact hospital else training read Mrs until.	1.0	3319808
175	516	4	2.8	\N	1.9	5786624
277	84	4	2.6	\N	0.6	1117184
319	894	4	1.1	Prove him each letter affect against.	0.7	7523328
105	497	7	0	\N	1.6	4222976
70	290	3	0	\N	0.9	3828736
255	574	5	0	Theory card each if test determine serve. Control remain class trip management far.	1.0	6734848
71	781	4	1.0	\N	1.7	6217728
88	584	1	0	Team word popular especially medical ground must.	0.7	4372480
114	697	10	0	Pass together through white image sound building.	1.6	2484224
96	357	4	2.6	\N	1.6	2222080
151	388	6	0	Reflect himself affect write society human key. Source he professor.	1.1	5588992
262	2	5	0	\N	1.1	5554176
84	491	4	0.2	Protect method top. Deal edge friend statement police.	1.5	5317632
272	400	4	1.7	Reduce room woman book have traditional north. Pressure movie mention month another myself west through.	1.9	7436288
8	641	4	2.3	\N	0.5	2212864
308	373	7	0	\N	1.6	6069248
160	150	3	0	Smile service language city career above.	0.8	2657280
296	428	4	1.2	Describe respond simply word blue special.	0.6	4739072
41	546	6	0	Or medical different to head. Everything series information notice.	1.6	761856
213	932	8	0	Area over maintain son.	1.2	4298752
141	482	4	1.4	Night special whatever reveal hear. Nature maintain professional room including strong reality.	1.2	4503552
156	432	4	1.9	Carry region imagine share.	1.6	5482496
11	866	10	0	\N	1.9	6849536
13	869	1	0	Responsibility money them box eat during win. Or likely sound.	0.6	5231616
22	492	7	0	Stage work able long television.	1.3	6209536
204	215	4	2.3	\N	1.8	1443840
80	821	4	2.4	Thought energy tonight employee common.	1.0	4110336
299	972	4	1.6	\N	0.8	5834752
30	478	4	0.4	\N	1.0	7386112
134	421	3	0	\N	1.3	392192
203	326	4	1.5	Either system four thank assume.	1.1	901120
267	303	4	2.8	Fish from hot material watch because.	1.3	3043328
307	869	4	2.5	Management no alone before.	1.8	4875264
132	320	1	0	Modern western hour government born.	1.7	328704
265	881	4	0.8	\N	1.2	3334144
165	220	7	0	Tv kitchen get into of Mrs per sister.	1.6	2050048
56	881	4	2.0	\N	1.0	674816
152	293	10	0	Purpose unit general his interest allow.	1.3	2117632
31	218	5	0	Technology Congress effect sign.	0.6	7316480
92	938	4	1.5	\N	0.9	561152
198	899	3	0	Box simple also need. Exactly south anyone wear line.	1.6	599040
222	235	4	2.1	\N	0.6	4360192
164	800	4	2.8	\N	1.4	7035904
18	409	4	2.4	\N	0.7	1971200
230	194	4	1.3	Way mother behavior meet.	0.9	3679232
62	405	4	2.7	\N	0.5	3500032
85	313	4	1.0	\N	1.4	6871040
137	115	10	0	Man model career party. Once approach hear turn serve what fill.	1.2	933888
253	403	4	1.5	\N	1.0	3182592
297	517	10	0	\N	1.0	7290880
310	715	7	0	Parent part truth born.	1.8	7649280
105	505	6	0	\N	1.5	3245056
117	938	5	0	\N	1.8	5652480
281	507	5	0	News likely again participant that member choice. Easy behind event laugh me our head.	0.9	5151744
277	88	4	1.2	Million impact similar production able respond executive.	0.8	6969344
125	657	3	0	\N	2.0	7971840
51	752	4	0.6	\N	0.7	2195456
24	10	1	0	Defense step same cover resource knowledge industry modern.	1.0	5801984
55	551	4	2.6	\N	1.1	869376
83	456	4	2.0	\N	0.9	3667968
10	436	4	1.1	West raise new beat west simple true argue.	1.7	1782784
140	700	4	1.5	\N	1.2	5935104
195	503	4	0.1	Such truth news go war.	2.0	5788672
25	507	4	1.1	Vote age join describe especially.	0.9	5454848
277	67	4	1.9	Meeting type move figure walk defense. Onto head practice.	0.8	6341632
21	280	4	1.6	Direction a executive thank majority draw painting.	1.4	532480
202	813	3	0	\N	1.6	5082112
52	334	1	0	Table add population section leader dog thing.	1.9	3526656
265	878	4	2.5	Than machine miss check.	1.8	7808000
148	7	4	2.1	\N	0.7	1136640
206	710	3	0	\N	1.9	6230016
296	429	4	2.4	They certain away clear seat ball.	1.9	2772992
61	717	4	0.2	\N	1.0	388096
234	174	4	1.1	\N	0.7	4190208
99	363	4	2.3	\N	0.6	4209664
263	266	8	0	\N	1.5	1393664
287	359	5	0	Source standard idea my card fly face.	1.5	624640
151	393	7	0	\N	1.9	3933184
58	963	4	1.3	\N	1.4	5773312
61	716	1	0	Teach thus include even blue.	0.6	7469056
58	962	4	2.0	Organization summer will enter share. Fund alone act.	1.6	1036288
64	541	5	0	\N	1.6	799744
316	57	4	0.6	Contain across class rise bill bag.	1.9	7111680
50	701	3	0	\N	1.5	6811648
8	654	3	0	\N	0.8	6992896
165	219	10	0	Center two deep together.	1.6	7957504
165	222	7	0	\N	1.6	4043776
268	629	4	2.4	\N	0.8	3355648
56	872	7	0	Production degree so back.	1.7	1370112
108	376	4	2.4	\N	1.9	8172544
261	273	4	1.4	\N	1.8	2667520
269	324	4	1.4	Draw man of.	1.6	1164288
322	687	4	1.0	Congress radio think site wear.	1.0	3963904
326	638	4	0.8	Subject because stand prevent ten three why.	1.8	7641088
70	293	9	0	\N	1.9	1782784
161	236	4	1.0	Rate phone similar always. Writer carry mind subject.	1.5	811008
204	203	8	0	\N	1.2	6254592
42	471	7	0	\N	0.6	768000
106	282	7	0	Hope question shoulder most apply receive whether.	0.7	7945216
251	608	7	0	Share list American scene difficult movie.	1.6	6848512
284	131	10	0	\N	1.6	1532928
42	476	4	1.8	\N	1.9	3575808
185	288	4	2.6	\N	1.7	5608448
83	440	4	1.2	\N	0.8	6696960
135	47	4	0.9	\N	1.5	3486720
23	269	4	0.5	Likely measure nor society.	1.7	7069696
307	875	4	2.1	First soldier yard subject lead.	0.7	3233792
312	225	4	1.8	Find reveal those body go.	1.5	7874560
29	572	7	0	View admit voice drive trip although view pull.	1.7	4301824
186	741	4	1.6	Mean remember find product guess note. Better standard enter build high if.	1.8	5012480
298	207	8	0	Alone more mind skill record address pass.	1.1	2734080
155	85	1	0	\N	1.7	1013760
87	855	8	0	Agreement certainly rule dog top author tree reality.	1.1	2436096
210	749	3	0	\N	0.6	3640320
224	305	4	2.5	During college hotel. With pressure information shake step feel.	2.0	7728128
144	699	4	2.3	\N	2.0	6724608
54	792	6	0	\N	1.9	7500800
47	750	3	0	\N	0.6	2157568
137	129	4	1.9	\N	1.0	3023872
141	490	10	0	Network born already.	0.5	8109056
82	662	4	2.3	\N	1.1	7985152
103	203	8	0	\N	1.1	7012352
239	698	6	0	Popular price team woman candidate others a.	1.0	5826560
280	837	10	0	Until grow cold attorney.	1.4	4920320
97	657	4	2.0	Cultural play take here stay level. Series market make newspaper.	1.2	4375552
99	357	7	0	In successful doctor him occur movement.	0.9	4182016
60	726	5	0	Ahead involve white least surface.	0.9	1061888
188	729	4	1.5	Deal really better listen present.	1.0	2172928
251	600	4	1.8	Answer church others final mind thousand term. Reality special where rest anyone.	0.8	6089728
111	783	4	2.1	\N	1.5	4119552
25	498	4	2.9	\N	2.0	8211456
66	915	4	1.6	Speech majority artist can.	0.6	750592
1	136	7	0	Step able consumer product outside third.	0.8	1811456
22	485	4	1.3	\N	1.7	6746112
326	621	6	0	Quite edge student cup. Not drug wonder mean ask condition.	0.6	6674432
274	767	3	0	Impact knowledge improve well human.	0.9	6899712
17	975	4	2.1	\N	1.6	4318208
190	696	4	1.9	\N	1.2	1434624
175	517	4	2.9	Reduce positive glass firm but protect.	1.1	2358272
283	287	10	0	I eight example right memory.	2.0	2957312
294	136	4	2.0	You discussion night nothing perhaps maintain single. Body they go nor consider machine expect.	0.9	1931264
326	633	6	0	\N	1.6	7530496
229	275	4	2.2	\N	0.6	3473408
87	868	9	0	Eight hospital outside go.	0.6	4078592
78	873	3	0	Fall radio population follow.	0.6	4157440
260	569	5	0	Miss avoid animal general.	0.6	3012608
326	622	8	0	Offer degree without.	1.5	902144
211	250	4	1.9	\N	1.0	3693568
148	38	4	1.1	\N	1.8	7419904
228	107	7	0	\N	0.9	7736320
7	773	7	0	Democrat social father authority animal never think. Per color of still office movement different personal.	0.6	5515264
288	607	4	0.2	\N	1.9	5020672
299	962	7	0	\N	1.8	5131264
245	22	4	0.5	\N	1.2	221184
11	857	6	0	\N	0.6	7955456
20	225	6	0	\N	1.2	1216512
36	755	6	0	\N	1.3	6407168
115	127	8	0	\N	1.5	2449408
133	707	4	1.6	\N	2.0	3364864
188	734	4	0.1	Throw determine education clearly baby hotel build.	0.5	7395328
90	24	4	0.4	\N	1.0	5080064
123	707	4	1.6	\N	1.6	2068480
275	788	4	0.8	\N	1.3	1887232
279	948	4	2.6	Boy stage season six.	0.5	4919296
183	232	9	0	\N	1.2	4812800
261	265	9	0	Form near series sort west.	1.4	7245824
265	888	4	0.6	\N	1.0	6430720
122	712	4	1.5	\N	0.9	1838080
169	783	10	0	Lay accept behind war have maintain.	2.0	2987008
171	166	4	1.3	Fish defense compare rock.	1.3	2860032
205	66	10	0	Represent determine a analysis.	1.5	3065856
291	120	3	0	Research energy person ok. Identify me go whatever.	1.6	6134784
234	176	9	0	Movement attack information.	1.3	3022848
142	662	1	0	Standard item then. Suffer understand eat color finish between.	0.5	6397952
245	11	3	0	\N	1.0	8181760
155	87	4	1.1	Situation interview role first often. Already policy mention still.	1.9	7731200
172	272	10	0	\N	1.5	1327104
130	402	4	2.7	Large bill else where. Education suddenly forward finally building success.	1.9	5381120
205	70	4	0.4	\N	0.8	827392
10	442	6	0	\N	1.7	1758208
228	104	4	0.6	\N	1.7	1197056
63	771	4	2.1	\N	1.0	4744192
101	765	4	1.6	\N	0.8	614400
75	402	4	2.7	\N	0.5	6784000
83	426	4	1.0	Wall drop throughout situation practice ten. Letter establish identify example five.	1.4	3214336
73	505	7	0	Hear discussion school perhaps pass certain medical.	1.3	8132608
189	724	5	0	\N	0.9	3597312
58	961	6	0	How this especially actually mind. Computer main rule watch friend only maintain.	1.7	5796864
295	950	4	1.9	General business space instead. General see name interesting owner store claim.	1.0	3803136
10	443	4	1.1	Accept want himself glass manage. Watch recently room your standard high theory.	1.1	3119104
55	550	4	1.9	\N	2.0	5106688
161	237	4	1.5	Next either trial.	1.3	535552
114	703	1	0	By final teach former.	0.8	229376
315	499	4	1.6	Investment child forget world final.	0.9	718848
47	749	3	0	My film modern try member near physical.	1.3	6006784
2	737	4	2.2	However material plant she skin line public.	1.0	4120576
325	552	4	2.0	Lead industry now cup fish. Child thing seem around science contain middle.	0.7	2871296
202	806	4	1.6	Office fact heavy show book success. Away cell country still left.	1.0	2139136
43	866	4	1.4	Member water structure.	1.0	6224896
216	936	7	0	Image answer action. Little soon Mrs future.	0.7	6021120
219	343	7	0	\N	1.6	6752256
88	589	3	0	\N	1.8	6092800
191	341	4	1.9	\N	1.9	248832
63	775	7	0	Over game safe century model poor ground each.	1.9	3034112
30	491	10	0	\N	1.1	3410944
1	148	6	0	Drug action turn theory itself.	1.7	5923840
184	51	4	0.1	\N	1.0	1619968
179	746	4	0.6	Statement light front successful. Strong serious environmental western plant community.	1.2	2575360
252	955	4	0.2	\N	0.9	2664448
84	487	4	2.9	\N	1.8	2075648
259	125	4	1.9	Assume event buy head without.	0.8	7294976
318	216	4	2.8	\N	0.5	249856
54	783	4	2.1	Above positive billion food.	1.1	2238464
72	618	10	0	\N	0.9	4248576
300	351	4	2.1	\N	1.8	4947968
291	122	4	0.8	\N	0.7	7021568
307	886	10	0	One help try view.	1.9	2145280
33	969	4	1.5	\N	1.9	1897472
252	949	4	2.9	Enter surface wish rather issue note next. Study nearly of table she.	1.4	3600384
320	478	9	0	\N	1.2	2381824
134	413	4	1.1	\N	1.1	7568384
4	819	4	0.5	\N	1.6	4117504
41	557	4	1.3	Throughout face who stock threat impact.	1.6	3026944
259	128	7	0	Time no contain wind tell.	0.8	406528
248	937	10	0	\N	1.5	1486848
283	286	4	2.4	\N	0.7	1832960
80	817	9	0	Big family base speak behavior establish decade.	1.7	993280
286	921	4	1.5	\N	1.4	3260416
192	58	4	2.2	So ready cost authority.	2.0	1738752
167	610	4	2.3	Service develop discover along office pull throughout.	1.6	4385792
55	564	5	0	\N	1.0	4188160
33	964	10	0	\N	1.4	1043456
146	167	1	0	Including without nor moment.	0.9	2635776
32	491	4	1.6	\N	1.6	5031936
84	493	8	0	\N	1.7	8223744
157	243	4	0.2	Style house push ago might but.	1.0	2448384
48	371	4	1.3	West hotel approach television.	1.2	2802688
264	127	7	0	\N	1.2	3994624
278	257	8	0	\N	1.1	2069504
146	175	3	0	Citizen join fill decide hard. Child on quickly quickly.	1.9	1955840
205	83	5	0	Little participant sound dark hotel.	0.6	2827264
230	189	4	2.6	\N	1.6	5719040
293	572	4	2.0	\N	1.3	4956160
321	134	10	0	\N	0.6	5753856
149	407	8	0	\N	2.0	8196096
139	345	4	2.7	\N	0.8	2984960
52	326	6	0	\N	1.6	1044480
32	486	4	1.7	Result audience impact speak bar prove yard house.	0.7	7498752
133	714	4	1.7	Age turn development strategy member prepare marriage.	1.6	1269760
322	696	1	0	Mrs movement attention fine least work fly. Newspaper long any risk.	1.9	3863552
173	926	4	2.7	\N	0.8	1440768
224	302	4	0.2	\N	0.6	5199872
16	763	4	0.3	\N	0.6	922624
54	782	3	0	Language wonder program.	1.3	5867520
214	283	4	1.7	\N	0.6	2653184
251	596	4	1.8	Seat mouth check. Develop either nice whose worker drop apply.	1.2	3377152
158	270	4	2.4	\N	1.4	187392
73	504	9	0	\N	1.2	7367680
215	853	4	1.5	Level first learn.	1.9	773120
13	880	8	0	Three method turn pattern.	1.0	4879360
68	253	4	1.4	\N	1.4	2057216
316	53	1	0	\N	1.5	8187904
46	259	1	0	Individual decision popular remember trade wait.	1.4	6378496
256	787	4	2.0	Hard magazine federal prevent glass.	1.2	4060160
156	437	9	0	Relationship opportunity second to appear.	1.3	2221056
259	123	4	2.3	Main scientist more late many ahead again. Few charge only respond environmental analysis inside very.	1.6	6748160
139	342	9	0	Heart second year control success tonight investment.	0.7	3379200
66	902	4	1.7	Walk score campaign. Yeah real sell.	1.1	5721088
94	661	5	0	\N	1.7	179200
51	750	1	0	\N	0.7	3240960
208	129	4	1.9	\N	0.6	8240128
277	64	4	1.5	Security south every although buy sister treatment.	0.8	2398208
160	158	4	2.2	\N	0.8	8023040
4	821	8	0	Collection final any information shoulder without. Article seven figure drop have.	1.6	367616
119	857	1	0	\N	1.1	8056832
125	645	4	1.3	Positive size maybe your money own. Day nothing vote effort prevent early.	2.0	5038080
194	768	10	0	Program structure pay coach spring suggest process. Responsibility race somebody per exactly door education.	1.6	215040
100	375	1	0	Tonight now recognize town fund eight second.	1.0	6716416
64	562	3	0	Floor get admit.	0.5	4531200
296	455	7	0	\N	1.3	3203072
326	619	1	0	\N	0.9	7269376
42	484	7	0	\N	1.8	2373632
140	702	8	0	Class that picture experience view measure peace.	0.7	8049664
143	206	4	1.7	Course money yourself than fill.	1.3	5574656
209	627	8	0	\N	1.9	7453696
115	126	5	0	\N	1.5	4953088
219	346	10	0	Scientist list name. Take us production then decide American evening.	0.6	6085632
226	937	6	0	\N	1.8	7700480
19	639	4	1.7	Shoulder as she affect store this day financial.	1.0	7044096
31	221	4	2.7	\N	1.2	3289088
90	33	4	1.5	\N	1.9	2191360
130	408	7	0	Through seek fund machine whatever officer.	0.7	745472
57	867	4	2.9	Majority piece same opportunity. Plant though increase market stage.	1.9	7270400
296	431	5	0	\N	1.2	2917376
304	343	4	2.9	\N	1.1	1863680
288	592	9	0	\N	0.8	7251968
67	374	10	0	\N	0.9	2850816
148	37	10	0	Inside gas civil push.	1.2	4257792
205	92	6	0	Modern of participant.	2.0	5641216
232	758	4	1.7	\N	1.3	8128512
224	299	4	1.7	\N	1.7	2972672
309	293	4	2.2	Later life yourself gas.	1.2	3399680
41	560	4	2.2	\N	1.3	2643968
309	295	8	0	Fill safe eight wall stand up important.	0.5	4211712
146	177	3	0	\N	0.7	4473856
135	53	8	0	\N	1.1	4364288
15	136	10	0	Give quality employee rich night behind.	1.0	6863872
208	127	4	0.6	\N	1.8	3468288
104	812	7	0	Necessary improve owner detail matter room.	1.4	3662848
147	330	4	2.4	Onto artist exactly responsibility hair.	1.4	4370432
41	553	6	0	Company word point thing player seem.	1.7	6345728
279	942	4	2.8	Enjoy may treatment expect Congress.	1.9	4000768
250	21	4	1.3	\N	0.7	6937600
297	520	4	0.2	Stay away wear structure his although recognize. Friend turn set series.	0.6	6321152
151	401	3	0	\N	1.0	6301696
85	314	4	0.6	By ok begin free especially reality when TV. Official bank here law commercial speak.	0.5	2657280
39	765	4	1.6	Number skill skin newspaper short boy Congress.	1.5	5059584
94	662	6	0	Minute as statement win general third.	0.9	5889024
308	371	4	1.6	Begin you scientist yeah particularly raise.	1.6	417792
299	966	4	2.9	Soldier cut sense my beyond second.	1.4	8034304
80	820	7	0	\N	1.2	1205248
269	319	4	1.7	Green actually me dark.	0.7	6823936
309	294	4	2.9	Turn production ago exactly stage building.	1.5	578560
50	706	8	0	Necessary four choose guy we magazine available. Purpose what our defense television figure.	1.3	5544960
197	130	5	0	Fear receive collection analysis.	1.0	5643264
325	553	3	0	\N	1.5	2795520
259	115	4	0.4	Put bill process water government.	0.6	6950912
193	137	4	1.6	Offer white heart general. Common bit through join box end.	0.9	1119232
312	224	4	1.8	Both behavior without determine itself space brother.	1.1	5317632
314	915	4	1.4	Though result today challenge economy man.	1.8	611328
315	509	7	0	\N	0.7	3270656
295	953	3	0	Dark billion market share find send.	0.7	510976
1	143	4	1.5	\N	1.5	1123328
265	875	5	0	\N	0.7	2973696
97	643	7	0	Force state network score.	1.2	4264960
215	862	3	0	\N	1.3	5245952
274	765	4	1.6	Citizen brother especially who.	0.7	1819648
73	512	4	2.2	\N	0.7	2712576
261	266	5	0	\N	0.8	2978816
277	72	4	2.4	Bar market sign west continue response wonder collection.	1.3	7061504
1	144	4	2.2	Instead table home.	1.8	3337216
23	265	7	0	Community fly young quickly sometimes send should.	1.7	4233216
325	562	7	0	Hot trial leader daughter return.	0.7	5872640
205	69	5	0	Camera hope development.	1.9	7537664
21	282	4	2.7	Who process every measure. Would whether doctor even.	1.6	4936704
208	133	8	0	\N	0.5	7085056
258	938	5	0	\N	1.9	2456576
202	796	4	1.1	\N	1.7	3248128
211	245	8	0	Happy security today oil PM crime.	1.1	5678080
14	965	4	2.5	Light scene music reality special laugh appear.	1.5	8121344
205	91	3	0	At even then artist economy always report.	0.8	7632896
36	760	4	1.3	\N	0.9	2681856
19	621	4	2.7	Five defense something cold certainly create.	1.2	5989376
284	115	4	1.7	Far reduce probably run heart issue.	1.8	1072128
175	522	4	1.7	Traditional way get paper.	1.8	4159488
14	961	7	0	\N	0.6	6482944
272	401	4	2.7	\N	0.7	7131136
252	950	4	1.9	\N	1.9	4648960
155	91	5	0	Near stop set serious report speak find.	1.7	6720512
171	163	4	2.5	Quality worker improve explain thousand business.	1.2	4313088
84	484	4	2.2	\N	1.2	3604480
204	212	6	0	Rest what away. Enjoy lose result certainly.	0.9	7395328
279	952	1	0	Money win indeed today play follow let.	1.4	1789952
288	595	4	0.6	Movement push animal pull ready in.	1.8	1807360
3	411	10	0	Answer government day sing wait. Value drop music prevent hour fall.	0.8	7075840
241	704	4	1.5	\N	0.9	7347200
215	859	1	0	\N	1.1	7869440
85	301	7	0	\N	1.5	1869824
250	23	7	0	\N	0.8	3063808
291	115	1	0	Thought when talk career debate direction end. Wish heart often energy notice but identify serious.	1.4	7132160
206	714	4	1.7	Party morning run agree owner either.	0.9	6630400
22	481	4	1.2	Student usually true technology everyone.	1.5	2419712
288	597	4	1.9	Themselves without set painting no.	0.9	6179840
4	823	10	0	\N	1.2	2668544
267	312	6	0	\N	1.1	2339840
237	285	3	0	\N	1.1	2821120
53	281	4	2.8	\N	0.7	3297280
261	263	7	0	\N	2.0	6072320
156	448	7	0	\N	0.6	5874688
108	375	4	2.7	\N	1.1	454656
270	141	4	0.4	\N	1.5	2985984
141	479	10	0	Community company as member process thousand.	1.0	6686720
230	188	4	1.1	Attorney state arm culture table appear might.	1.1	695296
305	285	5	0	\N	0.7	402432
315	511	8	0	Buy marriage young choose discussion. Mention and serious ever above card subject instead.	1.3	4507648
36	757	10	0	\N	0.7	7556096
192	52	4	2.2	Leave test easy mother cut apply manager first. Suffer add wide present vote common civil.	1.1	3360768
269	333	4	2.4	\N	0.7	5188608
252	942	4	2.8	Bar new purpose eight just option.	1.8	7495680
242	62	6	0	Affect capital side.	0.8	1320960
167	597	4	1.9	Compare bag toward whatever family beautiful.	1.4	4870144
45	909	4	2.4	Rich soon affect sport physical at piece cut.	0.8	5022720
135	46	4	2.8	Start however heavy let audience else. Suffer study generation.	1.4	7119872
29	575	4	2.4	Skin week necessary short.	2.0	2505728
293	585	4	2.6	\N	0.9	5523456
25	502	4	2.4	\N	0.6	360448
43	860	4	2.8	\N	1.8	7098368
157	231	4	1.9	\N	1.6	6247424
313	110	4	2.0	\N	1.4	222208
299	983	6	0	Rise year five year player.	1.5	915456
190	664	4	1.2	Relate participant black notice.	1.7	4947968
20	227	7	0	\N	2.0	6903808
280	834	9	0	\N	1.1	6433792
25	499	4	1.6	Region just result region.	0.6	6623232
109	128	8	0	\N	0.6	5245952
163	845	4	0.3	\N	1.6	7144448
322	672	4	2.6	\N	1.4	7709696
141	474	6	0	\N	0.8	1888256
10	429	1	0	\N	0.7	6033408
84	490	4	0.7	\N	0.7	885760
193	145	4	2.2	Student cut charge middle source not pick.	1.0	537600
13	882	4	1.6	Animal special nature already.	1.8	3638272
80	819	8	0	\N	2.0	2117632
91	918	4	2.6	Family simply glass truth. Black level ago drive fish board far.	1.7	1264640
202	803	3	0	\N	1.1	4329472
84	480	10	0	Amount cover growth between gun health.	1.6	437248
179	742	4	2.7	\N	1.8	4732928
318	215	4	2.3	\N	0.8	7962624
26	89	9	0	\N	1.8	5297152
252	943	4	2.1	\N	1.5	6798336
219	348	7	0	\N	1.2	3650560
89	342	9	0	\N	1.5	3767296
76	364	4	2.7	Reveal foreign truth perform nor fact him.	1.9	4082688
41	558	5	0	Speak on series late grow reduce.	0.7	3715072
313	99	8	0	Finally others lose. Will according interest lose.	1.8	6176768
156	451	4	1.4	Soon add other affect.	0.5	7597056
33	986	9	0	\N	0.7	7157760
17	982	8	0	Happy party financial kid chair a car. Such perform relate rule kid.	0.9	386048
107	858	10	0	\N	1.4	8189952
199	106	5	0	Hour oil yet concern continue system.	0.9	1056768
229	259	4	1.9	\N	1.2	7996416
16	770	3	0	\N	2.0	4835328
26	83	8	0	Small last order career special home.	1.5	6998016
86	151	6	0	\N	0.7	5514240
208	119	4	2.6	Participant book medical whole drop apply. Write campaign third front.	0.6	7475200
282	981	4	0.0	Mrs per rather theory traditional cup attorney.	1.3	6891520
188	736	1	0	\N	1.5	2801664
298	216	4	2.6	\N	1.7	7957504
64	549	4	1.2	Order consumer end newspaper speech identify attorney along. Social quite image attack.	1.3	6120448
322	691	7	0	Billion quite people.	1.1	7186432
164	797	8	0	\N	1.4	4319232
247	155	6	0	Nearly offer there something pick.	1.0	259072
63	772	10	0	\N	1.0	8060928
111	791	4	1.3	Respond whether feel body. Democratic no line our themselves military too.	1.2	814080
247	166	1	0	\N	1.8	5692416
296	443	4	1.1	\N	1.9	6361088
317	569	4	1.7	Site sing Republican movie specific from single.	1.3	7875584
44	743	4	1.4	\N	1.5	3344384
171	169	4	1.2	Else knowledge already adult huge.	0.9	7060480
58	968	4	2.1	Success culture drive floor inside concern prevent.	1.5	6575104
281	514	4	2.8	Discuss kitchen visit forward music life. Mr operation ball inside.	0.6	2848768
228	102	4	0.2	\N	1.8	5471232
57	861	5	0	\N	1.5	4962304
107	868	6	0	\N	1.6	5379072
126	406	1	0	\N	0.7	260096
190	679	3	0	\N	1.6	7495680
77	897	4	2.8	\N	1.9	3710976
132	323	4	2.3	\N	1.6	5629952
166	224	9	0	\N	1.3	4320256
175	525	4	2.0	Fear budget value where source thank continue.	1.3	1600512
19	630	4	0.1	Wind company nice use send.	1.1	6999040
33	987	4	1.4	Watch those tell top group. Like tell big degree exist.	1.6	4060160
64	555	9	0	Talk cause available level artist.	0.6	8274944
1	142	10	0	Plan usually recently business among tell hour.	0.5	6549504
160	171	4	1.2	Evidence pattern imagine minute. Fill believe group nice since recent.	0.6	2416640
172	264	3	0	\N	0.7	1043456
148	20	1	0	Despite state sister student woman increase. Region data study type general agreement.	1.9	5428224
199	96	4	1.2	\N	0.5	8214528
256	778	6	0	\N	0.6	1792000
171	152	4	2.1	Seek top need.	1.3	7471104
171	162	8	0	\N	1.2	5783552
169	787	4	2.0	\N	1.9	6628352
97	642	4	2.0	\N	0.7	7480320
41	551	4	2.6	\N	1.2	5780480
277	87	7	0	\N	0.5	7186432
318	208	4	0.3	\N	0.9	7861248
161	232	4	2.9	Above push remain option. Around affect forget know impact.	1.3	4688896
271	508	4	2.3	\N	1.8	388096
305	279	4	2.4	Particular same item glass movie improve.	0.7	6473728
184	55	1	0	Serve face half.	2.0	659456
217	938	7	0	\N	1.0	4822016
320	475	4	2.3	East administration by career.	0.8	4719616
2	727	4	0.2	Play likely drop.	1.4	5494784
201	923	4	1.2	Several foot theory begin. Own nothing wear strategy simple.	0.6	7598080
169	778	4	1.3	\N	0.9	1513472
265	889	4	2.5	Man between near growth action.	1.3	1892352
277	68	6	0	\N	1.3	2388992
282	973	4	1.4	State military stock scientist.	1.7	4486144
147	321	4	2.4	Maintain next miss may great high amount.	1.6	1695744
308	379	4	2.9	Them tell well.	1.3	3335168
70	297	9	0	\N	1.6	4280320
315	502	4	2.4	Charge future treatment last if face direction.	1.9	1391616
207	309	4	0.8	Play sense forget boy both.	1.8	4037632
244	383	4	0.1	\N	1.8	6837248
171	173	4	2.3	\N	1.7	1505280
103	210	7	0	\N	1.2	828416
66	906	3	0	Moment wife your act reality force religious.	1.0	3661824
146	174	4	1.9	\N	1.6	7356416
180	338	4	1.9	\N	1.2	675840
234	152	4	2.1	\N	1.0	7006208
137	128	4	2.8	\N	1.0	3415040
277	91	3	0	\N	1.4	2081792
298	203	1	0	\N	1.0	4261888
308	378	4	1.2	\N	0.8	4457472
194	764	4	2.7	Toward cell doctor bring address beautiful manager.	1.6	2211840
326	618	4	0.4	\N	2.0	4435968
285	864	4	1.7	\N	0.5	8020992
245	21	4	0.6	\N	0.9	268288
182	897	4	2.8	\N	1.2	6706176
10	445	4	0.2	Poor family better.	1.2	7318528
66	904	10	0	Instead herself despite sister always music beyond.	1.2	376832
3	418	6	0	Deal serve chance model charge.	0.9	3300352
4	820	8	0	Trial individual inside else.	0.9	2477056
293	587	4	2.6	\N	0.7	7920640
201	917	10	0	\N	0.8	1081344
245	10	4	1.5	\N	1.9	6395904
117	939	1	0	Voice true positive word unit play.	0.8	6638592
146	171	4	1.2	\N	1.5	5289984
90	34	4	0.7	Difficult positive argue finish indicate.	1.4	299008
164	815	4	2.6	\N	0.9	3616768
232	757	4	1.4	\N	1.6	2613248
277	75	4	1.4	Wait become indicate direction.	2.0	6901760
296	436	1	0	\N	0.9	1011712
85	306	4	2.5	\N	0.6	5036032
19	629	4	0.3	Method benefit need gun.	1.1	2604032
119	867	6	0	\N	0.9	5047296
159	4	8	0	\N	1.6	1550336
78	869	6	0	Agree become business.	1.9	4254720
200	743	3	0	Central expert project population begin green.	0.8	1936384
42	495	9	0	\N	1.2	1515520
241	699	4	2.3	Policy Mr radio husband collection.	1.8	6477824
166	228	6	0	\N	1.4	2935808
24	21	8	0	Next later the protect improve activity measure.	2.0	3893248
24	20	9	0	\N	0.6	4335616
46	276	6	0	Senior huge huge eye ability exist yet.	1.7	7951360
218	754	6	0	\N	1.2	436224
291	123	8	0	Policy billion service. Our tax any finally nation.	0.6	2745344
326	637	4	1.1	Oil goal relationship particular executive.	0.6	1994752
272	381	6	0	\N	1.4	4450304
156	456	4	2.1	\N	0.6	6078464
44	741	4	1.7	Eye visit while evening environmental result phone.	1.1	1394688
291	130	7	0	Suddenly blue simply turn stuff drive become.	0.5	150528
314	901	4	2.8	Between offer debate close.	1.1	4610048
320	480	8	0	\N	0.6	975872
325	544	5	0	Rest produce from then magazine exist.	0.6	2879488
263	270	3	0	\N	1.7	994304
294	139	4	2.2	\N	0.5	5641216
297	516	3	0	\N	1.2	153600
245	38	5	0	\N	1.3	823296
106	283	4	1.3	Scene national again speak management. Crime tonight material least situation.	1.0	2649088
134	424	4	1.7	Window employee tell operation. True get some if set game.	1.5	5242880
195	501	4	1.9	\N	1.8	1488896
255	591	4	1.1	Contain both heavy condition within well do.	1.9	6544384
83	452	4	0.1	Evening why including local action Republican.	1.4	4531200
277	85	9	0	At budget eight anyone. Agency line several new.	2.0	3869696
55	537	4	1.3	\N	1.9	463872
109	121	5	0	\N	1.0	6880256
158	276	1	0	\N	1.3	2951168
179	744	4	1.8	Blood only three person marriage least.	1.0	7131136
99	364	7	0	\N	0.8	376832
12	211	10	0	\N	0.6	6848512
88	587	4	2.6	Health role account education son. Well entire reflect appear consumer edge new.	1.0	7511040
135	55	4	2.9	Grow most response reach just message certain he. Economic late education nice campaign.	1.8	7428096
320	487	10	0	\N	1.4	5485568
280	830	3	0	\N	0.7	7228416
146	166	4	1.3	\N	1.7	438272
309	290	7	0	\N	1.3	6782976
296	449	6	0	Score television civil attention people name.	0.6	5156864
242	91	5	0	\N	1.2	1270784
22	495	7	0	\N	1.5	3060736
220	722	4	1.1	Art green commercial happy allow as head.	1.5	6717440
191	339	10	0	\N	1.4	6747136
251	604	4	1.6	\N	1.6	3745792
265	882	6	0	Speak effect service wait movement. Event anything follow sport among.	1.4	7286784
248	935	3	0	\N	1.6	2296832
73	506	8	0	Talk film century. Yeah former get of whether staff step.	1.8	2365440
31	225	4	1.8	\N	1.9	1238016
196	743	4	1.4	Of move teach find when religious.	1.1	6699008
272	395	4	0.3	\N	1.2	517120
229	264	4	1.1	\N	1.4	6566912
169	780	4	2.0	\N	1.8	3277824
108	369	4	1.5	Send two modern against attack.	0.8	4070400
81	742	4	1.1	Not name early.	1.9	5605376
52	321	9	0	Accept this give spend control sense.	1.5	111616
165	227	5	0	Summer respond blood stop respond never.	1.1	3837952
87	857	4	2.7	Station movement run old.	1.9	5636096
178	569	7	0	Similar wait nature none think. Fact commercial write scene commercial peace court.	0.6	2426880
15	148	4	0.3	Office morning recently run usually. Recent will lawyer including side possible lead.	2.0	7574528
66	914	6	0	Huge decide no Republican.	1.8	1683456
89	345	4	1.8	Lay occur choose summer plant peace.	1.9	5334016
53	285	4	1.0	Report though recent.	0.9	4018176
110	345	10	0	\N	0.7	4754432
234	175	4	1.7	Culture pretty feel area news. Audience window prove research take live wife.	2.0	6039552
280	840	10	0	Practice pretty thousand enjoy thing particular grow themselves.	1.1	3249152
284	122	4	1.4	Common medical economy catch boy every nation.	0.6	6353920
36	756	10	0	Speak cup remain in spring visit outside attack.	1.1	7803904
19	628	4	2.9	Natural should describe reveal agree move toward. Particular front charge international catch consumer determine.	1.8	1228800
205	93	5	0	\N	1.3	2087936
97	654	5	0	\N	1.9	2644992
207	308	4	2.8	\N	1.2	1513472
293	589	4	1.4	Media court two Democrat.	1.5	7570432
213	928	5	0	\N	1.7	1054720
84	474	4	0.1	Member attack question off full another. Type every western radio expect else imagine direction.	1.7	2010112
255	576	4	1.0	Former voice same director.	1.5	808960
64	564	3	0	Certain seek actually coach practice present. Result sure allow former wrong each weight model.	1.2	2697216
82	659	4	2.0	Like medical share. Him peace campaign center carry.	0.5	5695488
68	257	5	0	Represent company today.	1.3	896000
173	919	4	1.2	Word trade enjoy customer.	1.7	5955584
60	734	4	1.6	\N	0.6	3182592
285	867	4	2.9	Community top something.	0.5	5266432
245	16	7	0	Court worry life would.	0.6	5400576
32	490	8	0	Light it reach memory.	0.9	1477632
267	298	8	0	\N	1.0	7641088
54	785	7	0	Mother plant for big off. Feeling design dog scene establish finish main.	1.6	3433472
110	349	4	2.6	\N	2.0	1504256
307	890	1	0	Star among clear even partner. Rich list seven growth experience table policy record.	1.2	4488192
72	619	4	1.9	Exist either build. Seek everybody find everyone always.	1.0	3356672
56	877	6	0	\N	0.6	6478848
81	746	8	0	\N	2.0	1518592
86	170	4	2.5	\N	1.6	1025024
110	347	4	1.4	\N	1.3	4510720
121	345	4	2.7	\N	0.9	5904384
139	343	7	0	Resource north beat cover song foreign very.	0.7	7225344
68	255	4	0.5	Conference indeed such media rich theory. It Democrat investment enter throw condition this.	1.4	3471360
284	114	8	0	Water professional policy. Table class question agree trouble.	1.0	1882112
192	53	4	1.5	\N	0.6	327680
155	62	4	1.2	Participant within respond population medical member.	1.5	4540416
31	227	1	0	Not board environment cup three.	1.3	5801984
78	874	4	2.5	Animal past a stage page.	1.9	4384768
211	247	3	0	Let structure art.	0.9	1065984
150	137	7	0	Firm catch attorney.	0.6	1346560
295	945	4	0.0	\N	1.3	1362944
250	40	1	0	\N	1.7	6867968
296	433	8	0	Model on various same skin fly will. Magazine play music keep hospital.	1.8	1746944
10	431	3	0	Part physical debate be learn indicate serve.	0.6	4845568
5	746	9	0	Bank without bag green these.	1.6	1720320
225	333	4	2.4	Image maintain eye I.	0.8	502784
244	391	6	0	Inside follow lose American age six owner.	0.9	1753088
76	361	10	0	\N	1.1	107520
92	935	4	2.8	\N	1.2	2769920
97	648	4	2.8	Major western future foreign while.	1.7	590848
162	660	1	0	Citizen manager feeling say figure face standard.	0.6	7526400
259	133	4	2.8	Yourself better plan so. Commercial major news parent pay subject say simply.	0.9	1872896
11	859	4	0.8	\N	0.9	769024
282	962	10	0	Should politics learn on watch.	1.8	1049600
114	704	10	0	\N	1.8	3637248
14	976	1	0	\N	1.1	5618688
22	478	1	0	\N	0.9	4521984
30	480	4	1.7	\N	0.6	1058816
209	639	4	1.7	\N	1.5	5168128
274	768	6	0	Democrat data often identify always report stay lot.	1.2	8097792
12	203	4	1.7	In decide according song well contain hospital.	1.4	3272704
250	31	9	0	Life upon start leave. My within begin five.	0.9	495616
46	262	9	0	Recognize station kid own vote.	0.7	6468608
134	425	7	0	\N	1.3	8251392
99	358	4	2.1	Few condition though stop total.	1.3	4043776
325	536	3	0	Control miss against thought major wrong.	1.3	8086528
205	75	4	1.4	Language though become. Around factor record.	1.2	4467712
104	810	10	0	Father tend attention even. War stop leader exactly.	1.4	5730304
293	581	4	2.9	Finish Mr thing our.	1.4	1667072
151	391	4	1.2	Support room tend real.	0.8	3875840
190	690	4	0.6	\N	0.6	6701056
143	203	8	0	Medical seek side among reveal sport. Skin wish condition example admit chance.	1.2	8218624
278	248	4	2.3	\N	1.5	1157120
109	127	8	0	Record policy hour tough three market huge. Deep stop may national technology official arm.	1.7	8048640
272	392	4	2.9	\N	1.9	3130368
218	761	4	2.5	\N	1.7	3737600
134	410	4	1.6	\N	1.6	5401600
4	822	8	0	History strategy age husband yeah truth eight. Sell suggest moment myself impact provide.	1.5	4486144
72	613	7	0	\N	1.3	7862272
72	629	4	2.4	Image will quite thousand billion.	1.4	3538944
125	651	4	2.5	\N	1.6	5311488
148	31	1	0	\N	1.2	5037056
184	60	4	2.4	\N	1.5	2704384
87	852	4	2.2	\N	1.6	2142208
134	422	5	0	Send region worry author write nearly nearly police. Group difference recognize put.	1.0	6531072
234	170	8	0	\N	1.0	712704
270	139	4	2.9	\N	1.6	5672960
87	859	5	0	\N	1.0	6755328
105	502	4	2.4	Land memory well we American. Against out song apply sure participant four where.	1.9	2211840
193	134	4	1.1	\N	1.2	5267456
195	504	1	0	\N	1.3	2663424
241	705	5	0	Set election soldier.	1.8	2383872
160	153	8	0	\N	1.5	3733504
240	356	4	1.1	Group writer behind you together miss debate.	1.0	4547584
310	720	4	1.1	Green west she.	1.7	2488320
88	585	6	0	Less beautiful sort long ten.	1.8	5137408
105	500	4	0.1	Pull husband laugh piece operation upon sense. Research must instead other.	1.7	2028544
151	385	4	2.3	Hair interview rule her see.	0.5	3471360
29	588	9	0	\N	1.1	3444736
78	879	4	2.0	What economic its strategy.	1.5	1465344
79	356	9	0	Speak defense husband doctor south.	1.5	3350528
12	206	7	0	Hit continue loss.	0.9	6671360
219	345	4	2.7	\N	1.6	4449280
197	120	6	0	\N	1.2	6598656
41	562	4	1.5	\N	0.8	6627328
180	340	4	1.1	Let exist water involve.	0.8	5841920
41	548	4	1.9	\N	1.9	1952768
242	78	1	0	A state relate nature site know.	0.7	131072
316	58	4	1.7	\N	0.7	7282688
29	577	4	1.0	\N	1.1	7232512
173	925	8	0	\N	1.8	6304768
325	555	4	1.9	Marriage late tax front happy whose.	1.7	249856
191	337	7	0	Because anyone action lay.	1.2	2206720
100	373	4	1.5	Laugh body professor will different word major sister.	1.9	1584128
221	820	10	0	\N	1.5	2526208
278	255	10	0	Reach resource kitchen already rise Democrat approach feeling.	1.7	5233664
279	957	4	0.8	\N	0.8	8104960
280	832	4	1.9	Yet trouble west close or several.	0.7	3687424
147	320	4	0.9	\N	1.7	5588992
152	294	4	2.9	\N	1.0	5468160
207	317	5	0	\N	1.2	5509120
171	156	4	1.6	\N	1.4	8003584
147	326	4	1.5	\N	1.8	1292288
160	161	4	1.6	Dog born discussion whole remember.	0.9	2706432
261	268	4	0.1	\N	0.7	5177344
159	5	4	1.4	\N	1.5	946176
217	937	4	2.6	\N	1.9	5276672
235	271	10	0	\N	1.1	1092608
88	591	5	0	Your room pattern happy fear stop as.	0.8	3578880
139	351	4	1.6	\N	0.6	1032192
111	793	3	0	\N	1.0	7849984
265	893	1	0	\N	1.7	2909184
66	916	4	1.3	\N	0.5	5680128
252	944	6	0	\N	1.4	4841472
294	145	4	2.2	\N	0.6	7291904
78	890	10	0	\N	1.1	4824064
42	478	4	2.8	\N	0.7	3257344
8	653	9	0	\N	1.1	248832
93	142	3	0	Worker room town from its parent market.	1.9	3318784
169	793	4	0.9	Race inside shoulder.	0.7	4612096
265	884	9	0	\N	1.1	4895744
208	123	3	0	Appear dream prevent we. Environment special right decision protect fire.	0.6	2293760
269	318	9	0	\N	1.6	4077568
273	340	5	0	\N	1.3	1645568
177	753	4	1.9	Summer lay material TV series least light.	0.6	5968896
299	969	6	0	\N	1.3	5209088
57	856	5	0	\N	1.0	585728
158	268	9	0	Bed trial read seem sure sense get. Standard build figure indicate you.	1.0	1984512
299	981	10	0	Alone stop study remember story catch mission.	1.0	8038400
35	355	8	0	Throughout community care put wall ability. Including continue still address real again.	0.7	7412736
67	369	6	0	\N	0.5	2046976
82	663	5	0	\N	0.9	5313536
170	297	4	0.2	Idea paper past partner thought own smile. Yes include left body less test.	0.6	873472
171	172	4	2.6	\N	1.5	2240512
239	706	5	0	Claim mean over.	0.6	251904
292	730	4	1.7	\N	2.0	4530176
201	920	4	1.0	Production church music training loss radio. Bring discover third home Democrat move story.	2.0	576512
238	770	8	0	\N	0.5	2550784
116	569	4	1.7	Movie its eat tell south despite put paper.	1.8	4395008
164	804	4	1.3	\N	1.8	6994944
293	586	8	0	\N	0.8	216064
141	493	4	2.3	Example future him no within collection expect PM.	1.7	1015808
143	216	3	0	Claim yet particularly.	0.6	1826816
214	282	4	2.7	\N	0.8	1489920
250	33	10	0	Leader of loss around throw question either. Hour result bill expect ball compare eye.	1.7	8172544
83	448	3	0	\N	1.6	152576
299	979	4	1.4	Century mention usually gas figure government.	0.9	6837248
58	974	4	1.0	\N	0.6	3565568
151	398	5	0	\N	0.8	5778432
79	352	4	0.5	Street finish trouble travel market.	1.9	6538240
12	210	4	2.8	\N	2.0	7418880
65	282	10	0	\N	1.6	5852160
205	61	10	0	Age participant produce.	1.0	6777856
209	635	4	0.8	Himself mother listen begin.	1.0	6958080
119	856	4	0.8	\N	1.2	6591488
26	81	4	0.7	Camera step behavior production green.	1.0	5066752
11	860	4	2.0	Air up such eight gun old detail authority.	0.5	1531904
221	825	4	1.9	Education program tell player memory consumer indicate.	0.6	6595584
205	74	5	0	\N	0.6	757760
272	394	6	0	Cell whether parent usually woman them better.	1.3	6617088
9	243	4	1.6	\N	1.5	6172672
\.
COPY submit_results (submit_id, score, status) FROM STDIN;
128	10.200000000000001	10
129	9.2	8
10	29.5	10
74	2.9	9
298	18.2	10
288	18.599999999999998	10
102	3.5999999999999996	9
140	10.8	10
164	19.800000000000004	10
263	23.199999999999996	10
283	7.6	10
96	11.6	4
119	15.600000000000001	9
17	26.700000000000003	10
105	27.0	10
266	2.2	9
86	26.499999999999996	10
159	3.2	9
193	9.499999999999998	10
88	15.0	9
13	28.199999999999996	9
106	4.3999999999999995	9
28	6.300000000000001	10
91	7.699999999999999	9
124	0	9
226	1.8	8
186	14.2	4
53	10.9	4
306	11.5	10
235	12.999999999999998	10
143	2.5	10
173	14.2	8
89	10.5	10
113	15.399999999999999	4
25	20.4	7
31	14.2	9
142	9.0	4
245	27.800000000000004	10
260	1.2	8
165	8.6	10
218	7.1	8
231	8.600000000000001	8
219	4.6	10
189	11.399999999999999	10
27	12.3	10
177	4.1	10
115	23.500000000000004	9
221	8.3	10
209	37.4	10
319	8.299999999999999	8
64	29.8	10
5	4.8999999999999995	10
156	33.9	10
16	1.9	7
238	7.199999999999999	8
147	17.7	8
281	16.1	10
267	17.599999999999998	10
33	34.6	10
318	17.400000000000002	10
293	27.2	8
149	10.200000000000001	8
167	18.799999999999997	10
126	7.700000000000001	5
272	21.099999999999998	10
11	12.0	10
39	7.300000000000001	10
66	12.200000000000001	10
153	2.9	8
228	12.199999999999998	10
285	22.399999999999995	9
302	2.8	10
222	27.799999999999997	10
169	17.1	10
308	16.4	8
9	16.200000000000003	9
46	16.900000000000002	9
101	8.0	9
227	3.7	8
312	13.8	9
202	21.1	9
175	21.799999999999997	10
114	8.2	10
232	6.1	7
110	10.4	10
121	14.400000000000002	10
174	4.6	4
295	15.9	8
154	9.2	10
117	2.6	7
24	24.9	10
116	3.4	9
216	4.3	7
257	15.0	10
1	15.900000000000002	10
307	24.500000000000004	10
12	13.599999999999998	10
203	12.600000000000001	10
130	6.300000000000001	8
277	31.999999999999993	10
60	10.5	10
44	7.7	10
163	8.8	5
253	6.4	9
104	15.500000000000002	10
158	19.7	9
134	6.9	10
276	13.6	7
317	2.9	5
133	8.299999999999999	7
286	17.2	9
29	22.299999999999997	10
162	0	8
296	21.6	10
311	6.8	9
201	6.5	10
270	10.600000000000001	10
41	30.1	9
8	24.400000000000002	10
146	19.2	9
241	8.0	5
59	4.699999999999999	10
325	23.4	10
58	38.300000000000004	10
6	4.0	10
84	21.4	10
261	14.0	10
3	17.499999999999996	10
55	31.900000000000002	10
103	10.5	10
122	7.9	5
204	14.600000000000001	8
90	40.70000000000001	10
76	10.7	10
20	8.4	10
43	25.7	9
38	13.099999999999998	5
49	2.6	10
7	3.5	9
199	16.099999999999998	10
269	20.799999999999997	10
135	20.6	10
192	24.999999999999996	9
70	8.3	9
4	4.4	10
176	2.1	5
252	17.000000000000004	9
254	5.7	9
42	13.399999999999999	9
264	22.200000000000003	10
208	16.6	9
181	1.9	7
213	11.299999999999999	8
144	8.7	10
172	13.8	10
22	30.1	9
279	18.3	10
268	26.2	10
275	14.0	10
282	33.0	10
54	7.9	10
224	21.999999999999996	9
81	6.199999999999999	10
139	12.699999999999998	9
247	19.099999999999998	10
248	3.3	10
301	1.7999999999999998	9
65	4.5	10
36	6.8	10
107	10.8	10
52	10.799999999999999	9
93	11.0	10
194	2.7	10
40	19.3	9
249	4.5	10
79	2.1	10
37	1.5	9
127	5.1	5
72	28.599999999999998	10
206	4.6	10
97	19.5	9
50	9.5	9
62	10.4	10
313	21.0	8
220	11.7	10
290	2.1	10
109	18.8	9
271	12.7	10
57	13.4	10
45	16.4	9
83	40.300000000000004	10
94	2.7	9
145	7.3	6
297	12.2	10
132	13.0	9
217	5.5	7
316	19.0	9
196	7.299999999999999	10
294	25.8	6
289	4.6	7
315	17.299999999999997	10
321	15.899999999999999	10
61	5.2	10
21	9.3	7
244	23.0	10
150	17.499999999999996	9
256	15.6	9
265	21.300000000000004	10
314	13.8	9
30	26.9	10
187	7.3	4
211	16.4	10
323	1.9000000000000001	7
185	14.3	9
71	14.1	10
51	1.0	8
309	11.700000000000001	9
207	19.7	9
168	8.100000000000001	10
111	6.7	10
292	15.299999999999999	10
236	1.5	10
322	27.800000000000004	10
166	10.0	9
82	4.3	10
305	4.0	10
237	6.300000000000001	9
273	3.4000000000000004	9
262	5.199999999999999	10
14	30.299999999999997	7
80	8.3	9
112	3.4	9
300	13.200000000000001	10
136	0	8
151	10.3	10
197	14.8	10
160	18.7	10
251	11.299999999999999	10
284	24.200000000000003	10
230	21.600000000000005	10
183	15.1	10
233	8.0	9
\.
CREATE OR REPLACE FUNCTION erase_all_task_results(problem_id INT) RETURNS VOID AS 
$$
DELETE 
FROM task_results
WHERE submit_id IN (SELECT id FROM submits WHERE problem_id = $1);
$$ LANGUAGE SQL;


-- This function checks two things:
-- 1. Every task of the submit's problem has a result
-- 2. Every task result that references this submit belongs to the submit's problem
CREATE OR REPLACE FUNCTION check_results_integrity(submit_id INT) RETURNS BOOLEAN AS 
$$
-- We select id of task two times:
-- first we find all tasks that have a result for this submit
-- second we find all task that should have a result
-- If those two sets are not equal we get a pair (id, NULL) or (NULL, id) thanks to the full outer join.
-- Collation handles case where problem has no tasks at all and both subqueries return NULL
SELECT 
  COALESCE(bool_and(tr.id IS NOT NULL AND t.id IS NOT NULL), True)
FROM (
    -- task results assigned to the submit
    SELECT task_id AS id 
    FROM task_results 
    WHERE submit_id = $1
) tr 
FULL OUTER JOIN 
(
    -- tasks that are assigned to the status' problem
    -- i.e. all tasks that should have results
    SELECT t.id AS id 
    FROM tasks t 
    JOIN task_groups tg ON (t.task_group = tg.id) 
    JOIN submits s ON (tg.problem_id = s.problem_id)
    WHERE s.id = $1
) t 
ON (t.id = tr.id)
$$ 
LANGUAGE SQL;

-- Upon adding results for tasks validate that all of them are added
-- Since we need to insert many tasks we do it with a transaction
-- and thus we create constraint trigger that is deferred
CREATE OR REPLACE FUNCTION validate_results_integrity() RETURNS trigger AS 
$$ 
BEGIN 
  IF NOT (SELECT check_results_integrity(NEW.submit_id)) THEN 
    RAISE EXCEPTION 'Insertion that compromises data integrity';
  END IF;
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE CONSTRAINT TRIGGER validate_results_integrity
AFTER INSERT ON task_results 
DEFERRABLE INITIALLY DEFERRED 
FOR EACH ROW EXECUTE PROCEDURE validate_results_integrity();


-- Pretty self explanatory - results cannot have more points than maximum
CREATE OR REPLACE FUNCTION task_result_points_cannot_exceed_max() RETURNS TRIGGER AS 
$$ 
BEGIN 
  IF NEW.points > (SELECT points FROM tasks WHERE id = NEW.task_id) THEN 
    RAISE EXCEPTION 'Insertion that compromises data integrity';
  END IF;
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER task_points_have_to_be_in_range
BEFORE INSERT ON task_results 
FOR EACH ROW EXECUTE PROCEDURE task_result_points_cannot_exceed_max();

-- This function is meant to be called after successful insertion of all task results for given submits
-- Basing on those it calculates score and status using default methods
CREATE OR REPLACE FUNCTION add_submit_results(submit_id int) RETURNS VOID AS 
$$
INSERT INTO submit_results
VALUES (
    submit_id,
    submit_score(submit_id),
    submit_status(submit_id)
);
$$ 
LANGUAGE SQL;-- Indexes on some things that are looked up often

-- Contests
CREATE INDEX contests_activity
ON contests (is_active);

-- Problems
CREATE INDEX problems_closing_date
ON problems(closing_date);

CREATE INDEX problems_due_date
ON problems(due_date);

CREATE INDEX problems_contest_id
ON problems(contest_id);

-- Submits
CREATE INDEX submits_subbmision_time
ON submits(submission_time);

CREATE INDEX submits_user_id
ON submits(user_id);

CREATE INDEX submits_problem_id
ON submits(problem_id);

-- Task groups
CREATE INDEX task_groups_problem_id
ON task_groups(problem_id);

-- Tasks
CREATE INDEX tasks_task_group
ON tasks(task_group);

-- Submit results
CREATE INDEX submit_results_status
ON submit_results(status);

-- Task results
CREATE INDEX task_results_submit_id
ON task_results(submit_id);

CREATE INDEX task_results_task_id
ON task_results(task_id);

CREATE INDEX task_results_status_id
ON task_results(status_id);


