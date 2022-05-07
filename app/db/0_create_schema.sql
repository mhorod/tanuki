DROP SCHEMA IF EXISTS tanuki CASCADE;

CREATE SCHEMA IF NOT EXISTS tanuki;

CREATE SEQUENCE tanuki.contests_id_seq START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE tanuki.languages_id_seq START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE tanuki.permissions_for_contests_id_seq START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE tanuki.problems_id_seq START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE tanuki.scoring_methods_id_seq START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE tanuki.statuses_id_seq START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE tanuki.submits_id_seq START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE tanuki.task_groups_id_seq START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE tanuki.tasks_id_seq START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE tanuki.users_id_seq START WITH 1 INCREMENT BY 1;

CREATE  TABLE tanuki.contests ( 
	id                   serial  NOT NULL  ,
	name                 varchar(64)  NOT NULL  ,
	shortname            varchar(16)    ,
	is_active            boolean  NOT NULL  ,
	CONSTRAINT pk_contests PRIMARY KEY ( id )
 );

CREATE  TABLE tanuki.languages ( 
	id                   serial  NOT NULL  ,
	name                 varchar(50)  NOT NULL  ,
	CONSTRAINT pk_languages PRIMARY KEY ( id )
 );

CREATE  TABLE tanuki.permissions_for_contests ( 
	id                   serial  NOT NULL  ,
	name                 varchar(64)  NOT NULL  ,
	description          varchar(256)    ,
	CONSTRAINT pk_tbl PRIMARY KEY ( id )
 );

CREATE  TABLE tanuki.scoring_methods ( 
	id                   serial  NOT NULL  ,
	name                 varchar(32)    ,
	CONSTRAINT idx_scoring_methods PRIMARY KEY ( id )
 );

CREATE  TABLE tanuki.statuses ( 
	id                   serial  NOT NULL  ,
	name                 char(5)  NOT NULL  ,
	description          varchar(128)    ,
	priority             integer  NOT NULL  ,
	CONSTRAINT pk_statuses PRIMARY KEY ( id )
 );

CREATE  TABLE tanuki.users ( 
	id                   serial  NOT NULL  ,
	login                char(32)  NOT NULL  ,
	name                 varchar(64)  NOT NULL  ,
	surname              varchar(64)  NOT NULL  ,
	password_hash        char(256)  NOT NULL  ,
	email                varchar  NOT NULL  ,
	CONSTRAINT pk_users PRIMARY KEY ( id ),
	CONSTRAINT unique_login UNIQUE ( login ) 
 );

CREATE  TABLE tanuki.administrators ( 
	user_id              integer  NOT NULL  ,
	CONSTRAINT user_id FOREIGN KEY ( user_id ) REFERENCES tanuki.users( id )   
 );

CREATE  TABLE tanuki.contests_permissions ( 
	user_id              integer  NOT NULL  ,
	permission_id        integer  NOT NULL  ,
	contest_id           integer  NOT NULL  ,
    CONSTRAINT pk_contests_permissions PRIMARY KEY ( user_id, permission_id, contest_id )  ,
	CONSTRAINT contest_id FOREIGN KEY ( contest_id ) REFERENCES tanuki.contests( id )   ,
	CONSTRAINT permissions_for_contests_id FOREIGN KEY ( permission_id ) REFERENCES tanuki.permissions_for_contests( id )   ,
	CONSTRAINT user_id FOREIGN KEY ( user_id ) REFERENCES tanuki.users( id )   
 );

CREATE  TABLE tanuki.extensions ( 
	extension            char(8)  NOT NULL  ,
	language_id          integer  NOT NULL  ,
	CONSTRAINT idx_extensions PRIMARY KEY ( extension, language_id ),
	CONSTRAINT fk_extensions_languages FOREIGN KEY ( language_id ) REFERENCES tanuki.languages( id )   
 );

CREATE  TABLE tanuki.problems ( 
	id                   serial  NOT NULL  ,
	name                 varchar(64)  NOT NULL  ,
	shortname            varchar(16)  NOT NULL  ,
	contest_id           integer  NOT NULL  ,
	statement_uri        varchar(256)  NOT NULL  ,
	uses_points          boolean  NOT NULL  ,
	"position"           integer  NOT NULL  ,
	points               numeric    ,
	due_date             date    ,
	closing_date         date    ,
	published            boolean  NOT NULL  ,
	scoring_method       integer    ,
	source_limit         integer    ,
	CONSTRAINT pk_problems PRIMARY KEY ( id ),
	CONSTRAINT contest_id FOREIGN KEY ( contest_id ) REFERENCES tanuki.contests( id )   ,
	CONSTRAINT fk_problems_scoring_methods FOREIGN KEY ( scoring_method ) REFERENCES tanuki.scoring_methods( id )   
 );

CREATE  TABLE tanuki.submits ( 
	id                   serial  NOT NULL  ,
	source_uri           char(128)  NOT NULL  ,
	user_id              integer  NOT NULL  ,
	problem_id           integer  NOT NULL  ,
	language_id          integer    ,
	submission_time      date DEFAULT ('now'::text)::date NOT NULL  ,
	CONSTRAINT pk_submits PRIMARY KEY ( id ),
	CONSTRAINT fk_submits_languages FOREIGN KEY ( language_id ) REFERENCES tanuki.languages( id )   ,
	CONSTRAINT problem_id FOREIGN KEY ( problem_id ) REFERENCES tanuki.problems( id )   ,
	CONSTRAINT user_id FOREIGN KEY ( user_id ) REFERENCES tanuki.users( id )   
 );

CREATE  TABLE tanuki.task_groups ( 
	id                   serial  NOT NULL  ,
	problem_id           integer  NOT NULL  ,
	name                 varchar(32)  NOT NULL  ,
	requires_full_points boolean  NOT NULL  ,
	CONSTRAINT pk_tasks PRIMARY KEY ( id ),
	CONSTRAINT problem_id FOREIGN KEY ( problem_id ) REFERENCES tanuki.problems( id )   
 );

CREATE  TABLE tanuki.tasks ( 
	id                   serial  NOT NULL  ,
	task_group           integer  NOT NULL  ,
	test_uri             varchar(256)  NOT NULL  ,
	points               numeric  NOT NULL  ,
	time_limit           numeric  NOT NULL  ,
	memory_limit         integer  NOT NULL  ,
	show_output          boolean  NOT NULL  ,
	CONSTRAINT pk_tasks_0 PRIMARY KEY ( id ),
	CONSTRAINT task_group_id FOREIGN KEY ( task_group ) REFERENCES tanuki.task_groups( id )   
 );

CREATE  TABLE tanuki.problem_languages ( 
	problem_id           integer  NOT NULL  ,
	language_id          integer  NOT NULL  ,
	CONSTRAINT language_id FOREIGN KEY ( language_id ) REFERENCES tanuki.languages( id )   ,
	CONSTRAINT problem_id FOREIGN KEY ( problem_id ) REFERENCES tanuki.problems( id )   
 );

CREATE  TABLE tanuki.submit_results ( 
	submit_id            integer  NOT NULL  ,
	points               numeric  NOT NULL  ,
	status               integer    ,
	CONSTRAINT idx_submit_results PRIMARY KEY ( submit_id ),
	CONSTRAINT fk_submit_results_statuses FOREIGN KEY ( status ) REFERENCES tanuki.statuses( id )   ,
	CONSTRAINT fk_submit_results_submits FOREIGN KEY ( submit_id ) REFERENCES tanuki.submits( id )   
 );

CREATE  TABLE tanuki.task_results ( 
	submit_id            integer  NOT NULL  ,
	task_id              integer  NOT NULL  ,
	status_id            integer  NOT NULL  ,
	summary              varchar    ,
	execution_time       numeric(6,3)  NOT NULL  ,
	used_memory          integer    ,
	CONSTRAINT idx_task_results PRIMARY KEY ( submit_id, task_id ),
	CONSTRAINT status_id FOREIGN KEY ( status_id ) REFERENCES tanuki.statuses( id )   ,
	CONSTRAINT submit_id FOREIGN KEY ( submit_id ) REFERENCES tanuki.submits( id )   ,
	CONSTRAINT task_id FOREIGN KEY ( task_id ) REFERENCES tanuki.tasks( id )   
 );

ALTER TABLE tanuki.problems ADD CONSTRAINT problem_closes_later_than_due_date CHECK ( (closing_date > due_date) );

ALTER TABLE tanuki.tasks ADD CONSTRAINT ck_tasks CHECK ( (points >= 0) );

ALTER TABLE tanuki.task_results ADD CONSTRAINT used_memory_is_positive CHECK ( (used_memory > 0) );

ALTER TABLE tanuki.task_results ADD CONSTRAINT time_is_positive CHECK ( (execution_time > (0)::numeric) );

COMMENT ON COLUMN tanuki.contests.shortname IS 'abbreviated name of the contest';

COMMENT ON COLUMN tanuki.statuses.priority IS 'in case of multiple statuses in group the one with highest priority is displayed';

COMMENT ON COLUMN tanuki.problems.shortname IS 'abbreviated name of the problem';

COMMENT ON COLUMN tanuki.problems.statement_uri IS 'link to statement that is rendered on the problem page';

COMMENT ON COLUMN tanuki.problems.source_limit IS 'Limits the size of submitted file (in bytes).';

COMMENT ON COLUMN tanuki.submits.source_uri IS 'link to submitted source file';

COMMENT ON COLUMN tanuki.task_groups.requires_full_points IS 'has every task to be completed for group to have points';

COMMENT ON COLUMN tanuki.tasks.test_uri IS 'link to test that is invoked on submit';

COMMENT ON COLUMN tanuki.tasks.time_limit IS 'time limit in seconds';

COMMENT ON COLUMN tanuki.tasks.memory_limit IS 'memory limit (in bytes)';

COMMENT ON COLUMN tanuki.task_results.summary IS 'additional description of the results e.g. expected output';

COMMENT ON COLUMN tanuki.task_results.execution_time IS 'execution time in seconds';

COMMENT ON COLUMN tanuki.task_results.used_memory IS 'used memory (in bytes)';

SET search_path TO tanuki;
INSERT INTO languages VALUES (0, 'Fortran');
INSERT INTO languages VALUES (1, 'C++');
INSERT INTO languages VALUES (2, 'Java');

INSERT INTO extensions VALUES ('f', 0);
INSERT INTO extensions VALUES ('cpp', 1);
INSERT INTO extensions VALUES ('hpp', 1);
INSERT INTO extensions VALUES ('h', 1);
INSERT INTO extensions VALUES ('java', 2);

INSERT INTO users VALUES (0, 'admin', 'Jowita', 'Szef', '6f7900d309a6ed96c4677c81eedc3f6c', 'jowita.szef@gmail.com');
INSERT INTO users VALUES (1, 'super_prowadzacy', 'Bartosz', 'Algorytm', '9e301dfc77aeac8e3b6fc4c8fe28607d', 'bartosz.algorytm@[123.123.123.123]');
INSERT INTO users VALUES (2, 'niesuper_prowadzacy', 'Tycjan', 'Koder', 'd350d14e52114698fbf5206f9ae7e4d2', 'tycjan"()[]"koder-@domena');
INSERT INTO users VALUES (3, 'PilnyStudent', 'Evialina', 'Okejka', 'd7f3ec4fe96072168e6b39caae9705d6', 'ev2001@fajnapoczta.pl');
INSERT INTO users VALUES (4, 'pijepiwozamiastsieuczyc', 'Sergiusz', 'Znowuans', 'f12cbf3fe366d7f02304b5aff794a1ee', 'serg.ans@fajnapoczta.pl');
INSERT INTO users VALUES (5, 'I<3Mexico', 'Pablo Diego José Francisco', 'de Paula Juan Nepomuceno María de los Remedios Cipriano', '87bccbacffc1592e88f855b16f73faba', 'pablo@correos.mx');

INSERT INTO administrators VALUES (0);

INSERT INTO contests VALUES (0, 'Kurs obsługi dziurkacza', 'FORTRAN 1977', false);
INSERT INTO contests VALUES (1, 'Trudne problemy', 'C++ 2022', true);
INSERT INTO contests VALUES (2, 'Boilerplate', 'JAVA 2024', true);

INSERT INTO permissions_for_contests VALUES (0, 'CAN_EDIT');
INSERT INTO permissions_for_contests VALUES (1, 'CAN_SUBMIT');

INSERT INTO contests_permissions VALUES (1, 0, 1);
INSERT INTO contests_permissions VALUES (2, 0, 2);

INSERT INTO contests_permissions VALUES (3, 1, 1);
INSERT INTO contests_permissions VALUES (3, 1, 2);
INSERT INTO contests_permissions VALUES (4, 1, 1);
INSERT INTO contests_permissions VALUES (4, 1, 2);
INSERT INTO contests_permissions VALUES (5, 1, 1);
INSERT INTO contests_permissions VALUES (5, 1, 2);

INSERT INTO scoring_methods VALUES (0, 'LINEAR_TO_ZERO');
INSERT INTO scoring_methods VALUES (1, 'LINEAR_TO_NEGATIVE');

INSERT INTO problems VALUES (0, 'Dziurkacz robi brrr', 'A', 0, 'archive.tanuki.uczelnia.pl/fortran/A', false, 0, 5, '1977-11-10', '1977-11-17', true, 0, 500);
INSERT INTO problem_languages VALUES (0, 0);

INSERT INTO problems VALUES (1, 'Bardzo trudne zadanie', 'A', 1, 'tanuki.uczelnia.pl/cpp2022/A', false, 0, 5, '2022-11-10', '2022-11-17', true, 0, 10000);
INSERT INTO problems VALUES (2, 'Jeszcze trudniejsze zadanie', 'B', 1, 'tanuki.uczelnia.pl/cpp2022/B', false, 0, 5, '2022-12-15', '2022-12-22', true, 0, 10000);
INSERT INTO problems VALUES (3, 'Żodyn z was nie zrobi', 'C', 1, 'tanuki.uczelnia.pl/cpp2022/C', false, 0, 5, '2023-01-07', '2023-01-14', true, 0, 10000);
INSERT INTO problems VALUES (4, 'Generator warunków', 'D', 1, 'tanuki.uczelnia.pl/cpp2022/D', false, 0, 5, '2023-02-20', '2023-02-27', false, 0, 10000);
INSERT INTO problem_languages VALUES (1, 1);
INSERT INTO problem_languages VALUES (2, 1);
INSERT INTO problem_languages VALUES (3, 1);
INSERT INTO problem_languages VALUES (4, 1);

INSERT INTO problems VALUES (5, 'Brzydka klasa', 'A', 2, 'tanuki.uczelnia.pl/java2024/A', true, 0, 5, '2025-11-10', '2025-11-17', true, 1, 50000);
INSERT INTO problem_languages VALUES (5, 2);

INSERT INTO task_groups VALUES (0, 1, 'main', true);
INSERT INTO tasks VALUES (0, 0, 'cpp/tests/A', 1, 10.0, 100000000, false);
INSERT INTO task_groups VALUES (1, 2, 'main', true);
INSERT INTO tasks VALUES (1, 1, 'cpp/tests/B', 1, 10.0, 100000000, false);
INSERT INTO task_groups VALUES (2, 3, 'main', true);
INSERT INTO tasks VALUES (2, 2, 'cpp/tests/C', 1, 10.0, 100000000, false);
INSERT INTO task_groups VALUES (3, 4, 'main', true);
INSERT INTO tasks VALUES (3, 3, 'cpp/tests/D', 1, 10.0, 100000000, false);

INSERT INTO task_groups VALUES (4, 5, 'public tests', true);
INSERT INTO tasks VALUES (4, 4, 'java/tests/A/00', 1, 10.0, 100000000, true);
INSERT INTO tasks VALUES (5, 4, 'java/tests/A/01', 1, 10.0, 100000000, true);
INSERT INTO tasks VALUES (6, 4, 'java/tests/A/02', 1, 10.0, 100000000, true);

INSERT INTO task_groups VALUES (5, 5, 'private tests', true);
INSERT INTO tasks VALUES (7, 5, 'java/tests/A/03', 1, 10.0, 100000000, false);
INSERT INTO tasks VALUES (8, 5, 'java/tests/A/04', 1, 10.0, 100000000, false);
INSERT INTO tasks VALUES (9, 5, 'java/tests/A/05', 1, 10.0, 100000000, false);

INSERT INTO statuses VALUES (0, 'OK', 'Program works correctly', 0);
INSERT INTO statuses VALUES (1, 'ANS', 'Program produces wrong answer', 2);
INSERT INTO statuses VALUES (2, 'MEM', 'Memory limit exceeded', 3);
INSERT INTO statuses VALUES (3, 'RTE', 'Runtime error', 4);
INSERT INTO statuses VALUES (4, 'CME', 'Compilation failed', 5);
INSERT INTO statuses VALUES (5, 'TLE', 'Time limit exceeded', 1);

INSERT INTO submits VALUES (0, 'submitted_files/234jka.cpp', 3, 1, 1, '2022-11-01 16:24');
INSERT INTO task_results VALUES (0, 0, 0, NULL, 3.0, 123456);
INSERT INTO submit_results VALUES (0, 5.0, 0);

INSERT INTO submits VALUES (1, 'submitted_files/321aja.cpp', 3, 2, 1, '2022-11-01 21:38');
INSERT INTO task_results VALUES (1, 0, 0, NULL, 3.0, 123456);
INSERT INTO submit_results VALUES (1, 5.0, 0);

INSERT INTO submits VALUES (2, 'submitted_files/adsf23.cpp', 3, 5, 2, '2025-11-01 16:24');
INSERT INTO task_results VALUES (2, 4, 0, NULL, 1.0, 123456);
INSERT INTO task_results VALUES (2, 5, 0, NULL, 1.0, 123456);
INSERT INTO task_results VALUES (2, 6, 0, NULL, 1.0, 123456);
INSERT INTO task_results VALUES (2, 7, 0, NULL, 1.0, 123456);
INSERT INTO task_results VALUES (2, 8, 0, NULL, 1.0, 123456);
INSERT INTO task_results VALUES (2, 9, 0, NULL, 1.0, 123456);
INSERT INTO submit_results VALUES (2, 5.0, 0);

INSERT INTO submits VALUES (3, 'submitted_files/34254a.cpp', 4, 5, 2, '2025-11-01 16:24');
INSERT INTO task_results VALUES (3, 4, 0, NULL, 1.0, 123456);
INSERT INTO task_results VALUES (3, 5, 5, NULL, 11.0, 123456);
INSERT INTO task_results VALUES (3, 6, 1, 'for data 0 1 2 program returned 2 1 0, but it should be 0 1 2', 1.0, 123456);
INSERT INTO task_results VALUES (3, 7, 0, NULL, 1.0, 123456);
INSERT INTO task_results VALUES (3, 8, 3, NULL, 1.0, 123456);
INSERT INTO task_results VALUES (3, 9, 0, NULL, 1.0, 123456);
INSERT INTO submit_results VALUES (3, 0.0, 3);