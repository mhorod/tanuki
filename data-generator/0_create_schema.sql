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
	user_id              integer  NOT NULL REFERENCES tanuki.users
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
	short_name            varchar(16)  UNIQUE NOT NULL  ,
	contest_id           integer  NOT NULL REFERENCES tanuki.contests ,
	statement_uri        varchar(256)  NOT NULL  ,
	uses_points          boolean  NOT NULL  ,
	"position"           integer  NOT NULL  ,
	points               numeric    ,
	due_date             timestamptz    ,
	closing_date         timestamptz    ,
	published            boolean  NOT NULL  ,
	scoring_method       integer REFERENCES tanuki.scoring_methods ,
	source_limit         integer    ,
	id                   serial  PRIMARY KEY,
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