SET search_path TO tanuki;
COPY users (login, name, surname, password_hash, email) FROM STDIN;
pagemitchell	Karen	Mendoza	$2b$12$QZToSJIs8uV8lInSjRsiDe5ObR.Wjgn7ISFKQXr1lztOovo7qc49G	crosscharles@example.com
david70	Brian	Ritter	$2b$12$MeRRUMej25q5j81TEDbjvuEO63kGmLqD5bgYBb3MEYAs6MBtOgJU2	caleb25@example.com
perezjulia	Roger	Harmon	$2b$12$YrCpO1dlmxlSI61S61f4TeKmPKJOxkhMsia.4QQJRo/lxl7kJsuyy	evansbradley@example.net
roachstacy	Tracy	King	$2b$12$rP/s4oA5yKCXXuSCY0XTCenCktZPs1R5ixiNe12Fn8HFQv9mzXuUm	richardwatson@example.org
lauriecooper	Michael	George	$2b$12$PekbXXloT/pqIyP2Uo3G3.d8KuW5j9P9tqoL4S6dq3N62G2b9ik6m	higginsbarbara@example.com
sarah03	Benjamin	Zuniga	$2b$12$jhSr9lXZlOgFfCyH/hTYreamNf13VrwdRMh6/zEH6WVgV.MOTsevm	diana16@example.org
breanna06	Timothy	Harris	$2b$12$xFt6wu3j0P6k2xfOujevCOzAAWDpgr2JJtc/23OrgyRI9Gy54sTAq	owarner@example.com
irichards	George	Johnson	$2b$12$0Y/7EDAOL8vDoAZ1m11kTeAypaL1EfqEhWQiDGSYBAiqjWy2WdF7y	gwang@example.org
mcox	Nicolas	Mccall	$2b$12$TJtUVMyz4CYh0JaMHAGWlO9VVJspPp7qh0C4boI5kj3qDOmsMUBbu	michael03@example.org
david83	Michael	Davenport	$2b$12$y3KOuMu1njLZzb.vJNhhhOZ3MX9P/LWNbL.65JxRdjF8.1p364jUO	cassandrareed@example.net
admin	A0	D	$2b$12$c1ZXryXOmE1EaWAaggtq.u1YxXEWHSPQtHz/9iAO5bNO88QWIEwh.	administracja@tanuki.pl
admin1	A1	D	$2b$12$W2ZrkSns6PwJ4CL11s/YdeTFPTOi8hOxYcr9e.8aNyGALUY56yapm	administracja@tanuki.pl
admin2	A2	D	$2b$12$CZykYbV5D0pLZMKgD.WKl.DzkZkCufOXhtXr.o7ZjnFwSNUikKQSW	administracja@tanuki.pl
admin3	A3	D	$2b$12$Cz6A5E9IeNkfgz9CBY1bHeIqeq6eBjt.fbF.dsCcwwf7gV55p9LL6	administracja@tanuki.pl
admin4	A4	D	$2b$12$m3XQqHEMFOr5PMhZPtkMPOr2peTRJNXvtcbBn1JdBmrqiesKj7rXq	administracja@tanuki.pl
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
Her plan term.	Forward.	False
Ready ever so story meeting.	Rule hit.	True
List can deep scene TV never.	Often.	True
Instead fill brother.	Office.	True
Move write scene simply.	City.	True
Goal quality catch upon how.	Any best.	True
Wife wrong like author.	Apply both.	False
College usually role game.	Pull speak.	True
Close add thank price.	Theory.	True
Star create employee coach.	System.	True
\.
COPY permissions_for_contests (name, description) FROM STDIN;
MANAGE	Allows user to edit contest and manage participants
SUBMIT	Allows user to view problems and sending submissions
\.
COPY contest_permissions (user_id, permission_id, contest_id) FROM STDIN;
2	1	6
2	2	5
4	2	7
3	2	1
5	2	4
8	1	3
8	2	2
6	2	9
7	2	9
10	2	5
2	2	7
4	2	9
5	2	6
6	2	2
8	2	4
7	2	2
4	2	2
2	2	9
6	2	4
8	2	6
7	2	4
9	2	6
2	2	2
4	2	4
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
8	2	1
9	2	1
7	2	8
9	2	10
10	2	7
5	2	5
1	2	3
3	2	5
7	1	2
7	2	1
9	2	3
5	2	7
1	2	5
3	2	7
4	1	8
7	2	3
9	2	5
10	2	2
2	1	5
1	2	7
3	1	10
3	2	9
6	2	8
8	2	10
9	2	7
10	2	4
5	2	2
4	2	8
3	2	2
1	2	9
8	2	3
6	2	10
1	1	1
7	2	7
9	2	9
10	1	7
10	2	6
4	2	1
2	1	9
2	2	8
1	2	2
4	2	10
3	2	4
6	2	3
8	2	5
9	2	2
7	1	4
2	2	1
10	2	8
2	2	10
1	2	4
3	2	6
5	2	9
6	2	5
8	2	7
2	2	3
10	2	10
4	2	5
1	2	6
3	2	8
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
COPY problems (name, short_name, contest_id, statement_uri, uses_points, position, points, due_date, closing_date, published, scoring_method, source_limit) FROM STDIN;
Fund surface type court.	Lawyer.	1	/problems/dummy	True	0	0.3	\N	\N	False	3	71680
Already light dog lead.	Behind.	1	/problems/dummy	True	1	0.2	\N	\N	True	2	6144
Decide require husband.	Maybe.	1	/problems/dummy	True	2	0.0	2007-06-07, 00:05:40	2013-09-14, 20:12:21	True	1	37888
Cost stage throughout she.	Guess.	1	/problems/dummy	False	3	0.3	1995-09-30, 14:57:28	2011-04-26, 03:38:16	True	3	28672
Later out animal bring.	North.	1	/problems/dummy	True	4	0.1	2000-03-14, 17:00:03	2012-10-14, 15:28:11	True	1	75776
This health address do son.	Pick.	1	/problems/dummy	True	5	0.3	1997-07-27, 18:57:13	2005-05-26, 06:50:36	True	2	43008
Need heart candidate hair.	Model.	1	/problems/dummy	False	6	0.3	2011-08-01, 14:26:22	2016-06-25, 05:05:50	True	2	7168
Gas food win ever crime.	Laugh.	1	/problems/dummy	True	7	0.4	1995-04-15, 10:03:34	2018-10-07, 07:23:50	False	2	25600
Child ahead night.	Begin.	1	/problems/dummy	False	8	0.2	1997-01-15, 22:54:31	2009-11-27, 23:19:53	True	2	80896
Girl full item focus.	Gas bag.	2	/problems/dummy	False	0	0.1	2006-03-04, 11:10:09	2017-08-07, 11:43:46	True	1	63488
Huge believe kitchen part.	Billion.	3	/problems/dummy	True	0	0.0	1996-06-20, 23:02:25	2000-06-20, 14:53:14	True	3	38912
Step choice likely piece.	Modern.	3	/problems/dummy	False	1	0.4	2001-12-20, 12:10:32	2021-01-17, 11:13:36	True	1	102400
Vote north red meet hour.	Feeling.	3	/problems/dummy	False	2	0.0	1993-07-09, 10:04:26	2019-08-28, 04:17:13	True	3	84992
Skin wife note rich despite.	Contain.	3	/problems/dummy	False	3	0.0	\N	\N	True	1	93184
Value still back argue head.	Sing.	3	/problems/dummy	False	4	0.0	2000-05-05, 08:36:08	2004-11-15, 02:43:10	False	3	8192
Huge man indeed your.	Prepare.	3	/problems/dummy	False	5	0.2	2009-08-20, 15:34:05	2021-10-24, 03:46:03	True	3	48128
Would thing decide own.	Rich.	3	/problems/dummy	False	6	0.4	2013-02-04, 05:09:30	2016-08-30, 22:50:23	False	3	100352
Evidence owner set soon.	Range.	3	/problems/dummy	False	7	0.0	\N	\N	True	2	67584
Be most over box field my.	Decade.	4	/problems/dummy	False	0	0.4	\N	\N	True	3	89088
Upon available no off next.	Article.	4	/problems/dummy	False	1	0.1	2016-03-19, 18:27:17	2016-10-22, 05:09:07	False	3	99328
Board which personal his.	Carry.	4	/problems/dummy	False	2	0.2	1994-07-19, 09:00:06	2018-12-11, 11:15:24	False	2	18432
Also forget cup.	Control.	4	/problems/dummy	False	3	0.1	2016-03-10, 08:09:32	2017-05-08, 00:55:58	True	3	54272
Rather line television our.	Decide.	5	/problems/dummy	True	0	0.3	1998-05-12, 16:52:02	2018-08-18, 14:22:59	False	2	55296
Ball bank major.	Run.	5	/problems/dummy	False	1	0.4	2003-12-03, 20:40:32	2005-06-02, 19:24:55	True	2	65536
Give evidence film as.	Dream.	6	/problems/dummy	False	0	0.4	2010-11-05, 21:46:41	2022-04-21, 14:08:24	True	1	40960
Former again similar.	Late.	6	/problems/dummy	True	1	0.2	1995-07-16, 11:28:02	2014-11-08, 08:51:55	True	1	37888
Purpose news mean eight cup.	Human.	6	/problems/dummy	True	2	0.4	2017-11-02, 09:37:38	2021-02-06, 08:44:45	True	1	60416
Buy skill both student.	Stock.	6	/problems/dummy	True	3	0.3	1999-01-26, 08:00:35	2005-03-15, 17:57:57	True	3	24576
Involve raise rule idea.	Buy.	6	/problems/dummy	True	4	0.4	2008-03-07, 08:44:39	2019-04-09, 06:29:35	True	3	43008
Ready teacher fear necessary.	Ten.	6	/problems/dummy	False	5	0.3	1993-08-31, 15:18:58	2017-06-23, 04:22:35	True	3	15360
Those seat outside whole.	Ready.	6	/problems/dummy	True	6	0.4	1995-07-18, 17:18:53	2020-05-11, 19:54:57	False	3	44032
Second space camera step.	Also.	6	/problems/dummy	False	7	0.0	2002-06-10, 21:58:27	2017-06-11, 11:54:26	True	1	92160
Support according thank.	Much.	6	/problems/dummy	False	8	0.2	\N	\N	True	1	86016
Skill exactly successful act.	Option.	7	/problems/dummy	False	0	0.0	2017-04-15, 19:14:02	2019-02-28, 13:37:42	True	3	99328
Box however mind hold.	Above.	7	/problems/dummy	True	1	0.0	2010-08-15, 15:49:21	2011-10-09, 22:37:04	True	2	84992
Both down much state eye.	Make.	8	/problems/dummy	True	0	0.0	1995-02-18, 15:35:35	2002-04-10, 22:28:12	True	1	5120
Cover beyond also.	Music.	8	/problems/dummy	True	1	0.3	1999-03-14, 04:16:14	2003-03-21, 17:21:56	False	3	92160
Face tonight finish safe.	Entire.	8	/problems/dummy	False	2	0.1	1998-11-30, 08:54:13	2000-06-01, 01:12:41	True	3	96256
Be mention institution.	Middle.	8	/problems/dummy	True	3	0.2	\N	\N	True	2	83968
Cultural system science be.	Stand.	8	/problems/dummy	False	4	0.3	2010-12-15, 16:16:38	2014-03-04, 08:26:11	True	2	53248
Huge rich article.	Measure.	8	/problems/dummy	False	5	0.2	1997-02-03, 21:50:01	1999-02-21, 21:08:22	False	1	9216
Chair current box blue.	Theory.	9	/problems/dummy	True	0	0.2	\N	\N	True	3	58368
Too about crime speech.	College.	9	/problems/dummy	False	1	0.0	\N	\N	True	3	9216
College song many open.	Get.	9	/problems/dummy	True	2	0.3	1993-12-05, 06:39:36	2014-01-03, 14:01:53	True	2	15360
Campaign different picture.	Any.	9	/problems/dummy	False	3	0.4	\N	\N	True	1	61440
These against service you.	Second.	10	/problems/dummy	False	0	0.2	1997-09-20, 04:55:19	2004-12-22, 04:10:33	False	1	82944
Action carry myself it.	Law.	10	/problems/dummy	False	1	0.2	2007-11-10, 09:21:18	2007-12-21, 02:59:27	True	2	43008
Data last region son window.	By.	10	/problems/dummy	False	2	0.0	\N	\N	True	1	45056
\.
COPY problem_languages (problem_id, language_id) FROM STDIN;
23	4
34	1
36	7
5	1
10	6
2	2
32	3
15	5
29	4
7	1
18	1
4	2
28	5
24	1
6	4
21	2
22	3
45	5
28	7
9	3
32	7
43	7
6	6
39	3
45	7
3	1
14	1
9	5
11	2
1	3
38	4
24	5
25	4
35	5
18	7
31	1
47	6
17	2
11	4
1	5
15	4
26	4
16	3
20	3
31	3
33	3
44	3
15	6
2	6
20	5
22	2
10	3
13	2
24	2
35	2
48	5
40	1
12	3
27	3
41	2
42	1
10	5
22	6
3	2
37	4
4	1
32	1
19	1
1	4
46	3
4	3
8	3
30	3
16	4
48	2
40	7
21	3
47	3
44	4
2	7
31	6
12	2
36	5
47	5
28	1
19	7
30	7
9	6
13	6
38	5
\.
COPY submits (source_uri, user_id, problem_id, language_id, submission_time) FROM STDIN;
/submitted/dummy	1	6	4	2009-08-16, 01:12:26
/submitted/dummy	1	20	5	1993-05-12, 07:23:59
/submitted/dummy	1	6	6	2019-11-25, 23:32:27
/submitted/dummy	1	20	3	2004-06-29, 10:36:13
/submitted/dummy	1	37	4	2006-06-16, 13:26:04
/submitted/dummy	1	39	3	1997-08-17, 21:44:40
/submitted/dummy	1	22	3	2002-08-03, 06:01:36
/submitted/dummy	1	11	4	2008-09-06, 00:01:22
/submitted/dummy	1	2	2	2016-01-26, 19:08:45
/submitted/dummy	1	37	4	2000-01-20, 21:37:25
/submitted/dummy	1	13	6	2005-05-30, 17:46:01
/submitted/dummy	1	13	6	1995-12-18, 11:55:16
/submitted/dummy	1	12	3	2007-12-20, 11:28:36
/submitted/dummy	1	28	1	2013-09-30, 22:27:51
/submitted/dummy	1	36	7	1998-05-01, 23:37:11
/submitted/dummy	1	25	4	1996-09-23, 14:51:57
/submitted/dummy	1	11	4	2016-11-12, 14:02:10
/submitted/dummy	1	17	2	2016-12-17, 10:02:11
/submitted/dummy	1	17	2	2017-05-14, 02:17:07
/submitted/dummy	1	20	5	2019-01-03, 19:27:22
/submitted/dummy	1	20	5	2009-07-06, 04:55:22
/submitted/dummy	1	13	6	2013-12-21, 20:38:36
/submitted/dummy	1	14	1	1994-06-28, 10:24:19
/submitted/dummy	1	45	5	2015-07-03, 17:03:42
/submitted/dummy	1	29	4	1997-09-24, 15:27:04
/submitted/dummy	1	18	7	1992-11-06, 13:48:26
/submitted/dummy	1	41	2	2007-08-27, 12:26:32
/submitted/dummy	1	18	7	2008-07-06, 19:18:51
/submitted/dummy	1	45	7	2019-12-05, 15:17:37
/submitted/dummy	1	38	5	2018-09-09, 09:21:57
/submitted/dummy	1	17	2	2001-12-25, 04:59:51
/submitted/dummy	1	35	2	2002-07-09, 23:20:40
/submitted/dummy	1	32	7	2003-02-01, 22:21:11
/submitted/dummy	1	44	4	2008-07-06, 23:16:15
/submitted/dummy	1	12	3	2021-02-20, 01:19:36
/submitted/dummy	1	10	5	2006-05-08, 18:24:27
/submitted/dummy	1	25	4	2020-09-07, 04:06:23
/submitted/dummy	1	25	4	2018-09-08, 09:07:42
/submitted/dummy	1	11	4	2005-07-28, 16:34:40
/submitted/dummy	1	6	6	2015-07-09, 20:15:29
/submitted/dummy	1	10	6	2006-08-10, 01:14:33
/submitted/dummy	1	29	4	2000-11-23, 17:53:10
/submitted/dummy	2	31	1	2012-11-07, 08:08:17
/submitted/dummy	2	4	2	2003-02-21, 10:34:55
/submitted/dummy	2	1	3	2001-01-26, 13:30:27
/submitted/dummy	2	35	5	2001-05-31, 02:05:15
/submitted/dummy	2	22	2	2002-03-10, 00:20:13
/submitted/dummy	2	20	3	2014-03-06, 20:27:08
/submitted/dummy	2	44	4	2005-05-08, 11:34:44
/submitted/dummy	2	14	1	2020-11-22, 21:36:31
/submitted/dummy	2	11	4	2015-06-23, 00:29:26
/submitted/dummy	2	19	7	1996-06-19, 13:57:53
/submitted/dummy	2	42	1	2004-05-23, 05:10:09
/submitted/dummy	2	24	1	2010-12-18, 12:52:05
/submitted/dummy	2	47	5	2009-11-28, 15:03:00
/submitted/dummy	2	31	6	1993-12-14, 22:07:58
/submitted/dummy	2	29	4	2003-02-07, 20:24:44
/submitted/dummy	2	29	4	2009-10-29, 18:14:39
/submitted/dummy	3	39	3	1999-11-30, 21:07:56
/submitted/dummy	3	20	3	2001-12-14, 17:55:52
/submitted/dummy	3	41	2	2000-02-13, 05:35:28
/submitted/dummy	3	40	7	1997-02-25, 01:25:44
/submitted/dummy	3	3	1	2019-01-05, 08:21:05
/submitted/dummy	3	11	4	1996-05-29, 02:14:47
/submitted/dummy	3	12	2	2006-04-26, 01:45:25
/submitted/dummy	3	26	4	2011-02-24, 21:31:00
/submitted/dummy	3	9	3	2002-10-06, 20:52:11
/submitted/dummy	3	37	4	1994-12-07, 08:27:13
/submitted/dummy	3	44	4	2011-05-17, 15:37:28
/submitted/dummy	3	13	6	1993-11-22, 12:43:49
/submitted/dummy	3	3	1	1996-12-22, 01:53:13
/submitted/dummy	3	38	4	2021-10-30, 15:51:11
/submitted/dummy	3	24	1	2013-05-27, 03:56:25
/submitted/dummy	3	28	5	2021-03-28, 14:32:58
/submitted/dummy	3	6	6	1996-01-07, 22:06:02
/submitted/dummy	3	20	5	2018-07-04, 19:21:44
/submitted/dummy	3	23	4	2003-09-14, 03:07:04
/submitted/dummy	3	15	6	2001-09-05, 02:30:15
/submitted/dummy	3	47	6	2017-12-02, 02:18:05
/submitted/dummy	3	15	6	1995-11-12, 17:19:11
/submitted/dummy	3	44	3	2012-12-06, 02:56:54
/submitted/dummy	3	25	4	2018-02-01, 09:21:55
/submitted/dummy	3	25	4	2005-01-18, 22:34:51
/submitted/dummy	3	34	1	2004-12-24, 02:32:41
/submitted/dummy	3	1	3	1992-12-10, 18:01:23
/submitted/dummy	3	31	6	2015-04-03, 01:31:07
/submitted/dummy	3	26	4	2003-02-20, 07:32:25
/submitted/dummy	3	27	3	2019-06-06, 03:17:28
/submitted/dummy	3	35	2	2022-01-15, 14:57:27
/submitted/dummy	3	6	6	2004-08-17, 00:33:46
/submitted/dummy	3	38	4	2008-06-23, 11:10:03
/submitted/dummy	3	40	1	2008-11-09, 15:26:11
/submitted/dummy	3	40	1	1996-10-04, 10:11:38
/submitted/dummy	4	19	7	2005-08-14, 08:41:08
/submitted/dummy	4	21	2	2006-02-28, 23:28:12
/submitted/dummy	4	38	4	2008-12-03, 17:46:05
/submitted/dummy	4	45	5	1997-10-16, 00:05:24
/submitted/dummy	4	40	7	2009-04-25, 18:44:30
/submitted/dummy	4	1	5	2008-02-04, 02:49:07
/submitted/dummy	4	40	1	2000-09-13, 17:57:00
/submitted/dummy	4	41	2	2012-07-28, 07:28:42
/submitted/dummy	4	44	4	2022-01-15, 23:19:36
/submitted/dummy	4	10	6	1995-03-26, 07:25:16
/submitted/dummy	4	31	3	1993-05-21, 14:27:34
/submitted/dummy	4	6	6	2001-04-27, 02:50:09
/submitted/dummy	4	8	3	2007-01-09, 04:48:27
/submitted/dummy	4	25	4	2005-08-08, 05:28:22
/submitted/dummy	4	41	2	2009-06-25, 05:30:23
/submitted/dummy	4	39	3	1997-11-18, 06:45:34
/submitted/dummy	4	1	5	2010-09-05, 23:26:23
/submitted/dummy	4	20	3	2017-08-30, 14:20:38
/submitted/dummy	4	22	3	1995-11-14, 20:42:02
/submitted/dummy	4	30	3	2008-03-29, 22:24:16
/submitted/dummy	4	28	7	2013-08-13, 14:37:47
/submitted/dummy	4	6	6	2019-02-04, 14:25:01
/submitted/dummy	4	5	1	2008-11-12, 04:33:32
/submitted/dummy	4	19	7	2005-09-05, 05:32:43
/submitted/dummy	4	27	3	2010-03-14, 14:46:16
/submitted/dummy	4	19	7	2017-01-15, 01:51:44
/submitted/dummy	4	35	5	2004-02-20, 05:56:20
/submitted/dummy	4	40	7	2019-10-31, 06:41:20
/submitted/dummy	4	27	3	2003-10-24, 09:32:26
/submitted/dummy	5	43	7	2021-04-23, 08:28:10
/submitted/dummy	5	20	5	2007-01-10, 02:37:30
/submitted/dummy	5	8	3	1997-01-01, 07:19:32
/submitted/dummy	5	1	3	2008-03-01, 02:53:58
/submitted/dummy	5	4	2	2014-10-20, 00:14:24
/submitted/dummy	5	7	1	2005-11-03, 14:52:39
/submitted/dummy	5	33	3	1998-11-11, 23:13:01
/submitted/dummy	5	1	3	2009-09-30, 03:42:17
/submitted/dummy	5	47	6	2021-11-05, 18:38:28
/submitted/dummy	5	2	7	1998-07-20, 13:55:43
/submitted/dummy	5	43	7	2008-04-10, 14:18:03
/submitted/dummy	5	8	3	2022-01-08, 10:15:51
/submitted/dummy	5	15	5	2004-07-22, 12:25:10
/submitted/dummy	5	12	2	2015-09-07, 13:00:31
/submitted/dummy	5	28	5	1996-11-07, 20:42:23
/submitted/dummy	5	15	5	1995-12-02, 22:27:21
/submitted/dummy	5	32	3	1997-01-03, 09:32:51
/submitted/dummy	5	22	2	1993-10-28, 13:57:22
/submitted/dummy	5	21	3	1999-06-09, 09:57:36
/submitted/dummy	5	32	3	1997-11-08, 13:56:24
/submitted/dummy	5	6	6	2006-11-03, 02:49:46
/submitted/dummy	5	6	6	1997-10-05, 23:51:03
/submitted/dummy	5	21	3	1993-10-06, 13:19:29
/submitted/dummy	5	33	3	1993-04-15, 19:41:49
/submitted/dummy	5	17	2	2004-09-08, 06:52:28
/submitted/dummy	5	24	1	2015-06-23, 03:45:07
/submitted/dummy	5	24	1	2006-12-26, 13:56:40
/submitted/dummy	5	24	2	2018-02-04, 00:40:11
/submitted/dummy	5	7	1	2000-12-07, 21:07:14
/submitted/dummy	5	46	3	2011-11-22, 09:10:13
/submitted/dummy	5	5	1	1997-12-08, 02:17:41
/submitted/dummy	5	26	4	2010-04-22, 08:46:17
/submitted/dummy	5	27	3	1999-02-17, 20:41:44
/submitted/dummy	5	3	2	1997-11-01, 08:10:54
/submitted/dummy	5	12	2	1993-04-15, 06:12:17
/submitted/dummy	5	12	2	2006-07-12, 03:35:44
/submitted/dummy	5	24	5	2005-06-07, 04:16:09
/submitted/dummy	5	9	3	2016-03-02, 07:50:17
/submitted/dummy	5	44	3	2015-09-05, 00:22:34
/submitted/dummy	5	46	3	1993-05-28, 08:08:22
/submitted/dummy	5	17	2	1993-04-10, 04:43:22
/submitted/dummy	6	30	7	2002-01-25, 01:23:49
/submitted/dummy	6	17	2	2018-10-20, 11:10:44
/submitted/dummy	6	18	7	2009-01-03, 11:46:59
/submitted/dummy	6	47	5	2006-04-07, 18:58:57
/submitted/dummy	6	18	1	2009-12-06, 14:21:32
/submitted/dummy	6	21	3	2015-10-23, 09:09:00
/submitted/dummy	6	22	3	2013-03-29, 10:43:31
/submitted/dummy	6	47	6	1995-10-01, 03:26:37
/submitted/dummy	6	47	6	2014-07-03, 22:02:42
/submitted/dummy	6	15	6	1994-10-13, 23:38:11
/submitted/dummy	6	20	5	1997-08-27, 12:19:24
/submitted/dummy	6	30	3	2022-04-22, 09:19:07
/submitted/dummy	6	29	4	2013-07-20, 21:47:44
/submitted/dummy	6	13	6	1992-07-22, 09:50:55
/submitted/dummy	6	12	3	1995-03-18, 14:30:46
/submitted/dummy	6	37	4	2008-01-15, 17:56:48
/submitted/dummy	6	31	6	2013-03-17, 23:44:37
/submitted/dummy	6	44	3	2020-09-24, 05:01:36
/submitted/dummy	6	13	6	1999-06-04, 00:27:46
/submitted/dummy	6	10	5	2006-08-17, 17:23:48
/submitted/dummy	6	48	5	2005-03-29, 19:58:04
/submitted/dummy	6	44	3	2017-09-15, 06:20:52
/submitted/dummy	6	43	7	1996-12-11, 18:31:17
/submitted/dummy	6	13	6	1995-09-03, 02:41:34
/submitted/dummy	6	25	4	2021-03-15, 21:25:08
/submitted/dummy	6	36	5	2012-12-15, 21:19:20
/submitted/dummy	6	22	6	2013-09-26, 10:22:57
/submitted/dummy	6	42	1	2019-10-14, 09:54:57
/submitted/dummy	6	41	2	2004-03-01, 21:00:34
/submitted/dummy	6	30	3	2006-07-12, 05:47:27
/submitted/dummy	6	33	3	1995-03-29, 05:15:53
/submitted/dummy	6	24	2	2021-08-19, 02:03:22
/submitted/dummy	6	16	3	2012-03-14, 20:17:55
/submitted/dummy	6	48	5	2019-10-17, 08:55:12
/submitted/dummy	6	47	6	1993-11-06, 08:55:49
/submitted/dummy	6	33	3	2016-09-08, 21:24:40
/submitted/dummy	6	16	3	2016-12-23, 04:37:17
/submitted/dummy	6	47	3	2014-01-23, 15:42:11
/submitted/dummy	6	27	3	2020-07-12, 04:15:05
/submitted/dummy	6	44	4	1993-02-07, 03:35:15
/submitted/dummy	6	36	7	1992-10-11, 18:40:04
/submitted/dummy	6	16	3	1997-09-14, 19:40:16
/submitted/dummy	6	23	4	2005-06-13, 05:49:33
/submitted/dummy	6	24	5	2008-01-10, 05:46:44
/submitted/dummy	6	32	1	1999-05-20, 02:29:35
/submitted/dummy	6	23	4	2002-09-05, 05:52:58
/submitted/dummy	6	27	3	2010-11-10, 15:14:09
/submitted/dummy	6	46	3	2012-10-30, 21:41:19
/submitted/dummy	7	19	7	2006-12-12, 15:12:46
/submitted/dummy	7	33	3	1993-10-27, 04:19:16
/submitted/dummy	7	13	6	2017-01-11, 18:11:35
/submitted/dummy	7	30	3	2006-08-30, 11:04:55
/submitted/dummy	7	37	4	2017-08-22, 11:44:28
/submitted/dummy	7	15	4	1998-04-26, 01:27:25
/submitted/dummy	7	42	1	2018-10-25, 04:45:05
/submitted/dummy	7	5	1	1992-09-21, 18:46:17
/submitted/dummy	7	3	1	1995-06-20, 06:16:01
/submitted/dummy	7	28	7	1999-12-10, 00:49:43
/submitted/dummy	7	27	3	2015-04-26, 10:50:26
/submitted/dummy	7	25	4	1994-12-03, 07:42:37
/submitted/dummy	7	3	1	2009-09-15, 02:34:16
/submitted/dummy	7	40	7	2013-01-22, 12:15:17
/submitted/dummy	7	38	5	2005-06-08, 12:01:01
/submitted/dummy	7	38	4	2002-08-22, 21:56:35
/submitted/dummy	7	39	3	1998-03-08, 13:27:11
/submitted/dummy	7	3	2	1992-12-08, 15:29:58
/submitted/dummy	7	38	5	2003-10-21, 15:30:04
/submitted/dummy	7	29	4	1999-03-22, 00:00:26
/submitted/dummy	8	20	3	2008-09-23, 10:37:12
/submitted/dummy	8	6	6	2004-09-16, 03:43:16
/submitted/dummy	8	25	4	2012-10-19, 12:27:48
/submitted/dummy	8	25	4	2004-07-21, 11:59:50
/submitted/dummy	8	17	2	2007-10-31, 15:29:02
/submitted/dummy	8	2	2	1992-10-11, 06:38:26
/submitted/dummy	8	36	7	1993-05-21, 04:51:01
/submitted/dummy	8	14	1	2012-11-08, 15:45:28
/submitted/dummy	8	5	1	2000-08-25, 20:43:50
/submitted/dummy	8	3	2	2009-01-30, 23:29:40
/submitted/dummy	8	17	2	2001-02-18, 16:52:27
/submitted/dummy	8	26	4	2018-10-30, 09:35:38
/submitted/dummy	8	42	1	1997-11-18, 10:08:48
/submitted/dummy	8	22	2	2014-03-04, 23:24:43
/submitted/dummy	8	28	5	1994-09-29, 03:54:32
/submitted/dummy	8	11	2	2017-05-03, 08:28:54
/submitted/dummy	8	38	4	2003-04-22, 15:52:45
/submitted/dummy	8	20	3	2008-05-18, 09:15:57
/submitted/dummy	8	17	2	1999-05-21, 15:25:26
/submitted/dummy	8	8	3	2015-09-18, 08:58:57
/submitted/dummy	8	15	6	1993-04-28, 07:47:37
/submitted/dummy	8	45	5	2004-04-11, 03:16:05
/submitted/dummy	8	46	3	2006-11-29, 06:01:46
/submitted/dummy	8	5	1	2018-01-26, 12:16:58
/submitted/dummy	8	17	2	2011-09-11, 11:10:03
/submitted/dummy	8	16	3	2016-11-07, 09:12:18
/submitted/dummy	8	18	7	1999-07-30, 03:04:36
/submitted/dummy	8	47	3	1998-03-02, 15:08:29
/submitted/dummy	8	10	6	1993-03-03, 09:09:13
/submitted/dummy	8	24	5	1997-02-03, 22:16:13
/submitted/dummy	8	38	5	2004-10-10, 05:54:14
/submitted/dummy	9	26	4	1996-01-28, 01:52:32
/submitted/dummy	9	8	3	2001-10-17, 18:22:53
/submitted/dummy	9	23	4	1999-08-05, 07:48:09
/submitted/dummy	9	43	7	2011-11-20, 03:06:04
/submitted/dummy	9	41	2	2009-01-03, 08:19:59
/submitted/dummy	9	42	1	2008-05-08, 20:33:58
/submitted/dummy	9	26	4	2007-05-27, 03:11:56
/submitted/dummy	9	8	3	2014-02-08, 04:43:12
/submitted/dummy	9	10	6	2013-11-01, 23:15:11
/submitted/dummy	9	42	1	2001-06-11, 09:54:08
/submitted/dummy	9	29	4	2007-06-12, 20:30:37
/submitted/dummy	9	5	1	2013-05-18, 12:33:59
/submitted/dummy	9	13	6	1993-09-22, 10:40:48
/submitted/dummy	9	46	3	2003-02-26, 00:07:38
/submitted/dummy	9	36	7	2009-06-23, 07:46:58
/submitted/dummy	9	39	3	1998-07-19, 10:26:01
/submitted/dummy	9	24	5	2013-03-18, 09:20:22
/submitted/dummy	9	40	7	2014-01-05, 12:05:01
/submitted/dummy	9	26	4	2019-11-20, 12:34:25
/submitted/dummy	9	24	1	2006-02-15, 07:20:36
/submitted/dummy	9	2	6	2017-01-30, 12:17:44
/submitted/dummy	9	36	5	1992-08-10, 06:44:42
/submitted/dummy	9	29	4	2016-08-23, 11:28:22
/submitted/dummy	9	9	5	2005-12-06, 06:05:37
/submitted/dummy	9	8	3	2021-03-20, 05:35:09
/submitted/dummy	9	46	3	2022-01-04, 10:50:04
/submitted/dummy	9	4	3	1994-04-07, 09:52:17
/submitted/dummy	9	23	4	1998-11-12, 12:19:09
/submitted/dummy	9	16	4	2013-09-16, 05:13:06
/submitted/dummy	9	25	4	2006-10-27, 11:25:28
/submitted/dummy	10	19	1	2015-06-21, 11:29:29
/submitted/dummy	10	27	3	2011-10-20, 11:40:25
/submitted/dummy	10	35	2	2017-06-19, 21:45:53
/submitted/dummy	10	26	4	1996-05-13, 20:02:53
/submitted/dummy	10	40	1	2016-03-17, 06:30:10
/submitted/dummy	10	40	7	1994-03-15, 22:53:34
/submitted/dummy	10	23	4	1998-05-20, 08:26:41
/submitted/dummy	10	41	2	2009-03-10, 19:03:59
/submitted/dummy	10	20	3	2005-05-02, 08:16:48
/submitted/dummy	10	31	3	1995-01-19, 16:02:43
/submitted/dummy	10	20	5	2004-11-04, 17:38:44
/submitted/dummy	10	32	1	2015-12-08, 05:21:11
/submitted/dummy	10	39	3	2019-07-25, 21:55:57
/submitted/dummy	10	31	1	2004-12-13, 12:55:24
/submitted/dummy	10	23	4	1995-05-27, 21:12:28
/submitted/dummy	10	47	5	1999-07-12, 00:09:19
/submitted/dummy	10	22	3	1998-01-06, 02:30:38
/submitted/dummy	10	33	3	2017-03-14, 02:46:26
/submitted/dummy	10	20	5	1996-05-25, 15:39:26
\.
COPY task_groups (problem_id, name, requires_all_ok) FROM STDIN;
1	Group 1	False
1	Group 2	True
1	Group 3	False
2	Group 1	True
2	Group 2	False
2	Group 3	True
2	Group 4	False
3	Group 1	True
3	Group 2	True
4	Group 1	True
4	Group 2	False
4	Group 3	False
4	Group 4	False
4	Group 5	False
5	Group 1	False
5	Group 2	False
5	Group 3	False
5	Group 4	True
6	Group 1	True
6	Group 2	False
6	Group 3	True
6	Group 4	True
7	Group 1	False
7	Group 2	True
7	Group 3	True
7	Group 4	True
7	Group 5	False
8	Group 1	False
8	Group 2	True
9	Group 1	False
9	Group 2	True
9	Group 3	True
9	Group 4	False
9	Group 5	False
10	Group 1	True
10	Group 2	False
11	Group 1	False
11	Group 2	False
11	Group 3	True
12	Group 1	False
12	Group 2	True
13	Group 1	True
13	Group 2	True
13	Group 3	False
13	Group 4	True
14	Group 1	True
14	Group 2	True
14	Group 3	True
15	Group 1	False
15	Group 2	True
15	Group 3	False
15	Group 4	True
15	Group 5	False
16	Group 1	False
16	Group 2	False
17	Group 1	True
17	Group 2	False
18	Group 1	True
18	Group 2	True
18	Group 3	True
18	Group 4	False
18	Group 5	True
19	Group 1	False
20	Group 1	False
20	Group 2	False
20	Group 3	False
21	Group 1	False
21	Group 2	True
22	Group 1	True
22	Group 2	True
22	Group 3	False
22	Group 4	False
22	Group 5	True
23	Group 1	True
23	Group 2	True
24	Group 1	True
24	Group 2	False
24	Group 3	True
24	Group 4	False
25	Group 1	False
26	Group 1	True
26	Group 2	False
26	Group 3	True
27	Group 1	False
27	Group 2	False
27	Group 3	True
27	Group 4	True
28	Group 1	False
28	Group 2	True
28	Group 3	False
28	Group 4	False
29	Group 1	True
30	Group 1	True
30	Group 2	True
30	Group 3	False
30	Group 4	False
31	Group 1	True
31	Group 2	True
31	Group 3	True
32	Group 1	False
32	Group 2	True
33	Group 1	False
33	Group 2	False
33	Group 3	False
34	Group 1	True
34	Group 2	False
34	Group 3	True
35	Group 1	True
35	Group 2	True
35	Group 3	False
36	Group 1	True
36	Group 2	False
36	Group 3	True
36	Group 4	False
36	Group 5	True
37	Group 1	True
37	Group 2	False
37	Group 3	False
37	Group 4	True
38	Group 1	True
38	Group 2	True
38	Group 3	True
38	Group 4	True
39	Group 1	True
39	Group 2	False
39	Group 3	True
39	Group 4	False
39	Group 5	False
40	Group 1	False
40	Group 2	False
40	Group 3	False
40	Group 4	True
40	Group 5	False
41	Group 1	False
41	Group 2	False
41	Group 3	False
42	Group 1	True
42	Group 2	True
42	Group 3	False
43	Group 1	True
43	Group 2	True
43	Group 3	False
43	Group 4	False
44	Group 1	False
44	Group 2	False
45	Group 1	True
45	Group 2	True
46	Group 1	True
46	Group 2	False
46	Group 3	False
46	Group 4	False
46	Group 5	True
47	Group 1	False
47	Group 2	True
47	Group 3	True
48	Group 1	True
48	Group 2	True
48	Group 3	False
48	Group 4	True
48	Group 5	True
\.
COPY tasks (task_group, name, test_uri, points, time_limit, memory_limit, show_output) FROM STDIN;
1	Test 0	tasks/explore/category/wp-content	1.8	2.7	84992	True
1	Test 1	tasks/blog/category/tag	2.4	1.1	27262976	False
1	Test 2	tasks/category/tag	1.6	1.6	82944	False
1	Test 3	tasks/blog/category	2.0	1.8	98304	False
1	Test 4	tasks/search/main	1.2	0.7	81920	True
1	Test 5	tasks/list/explore/main	2.0	3.0	3072	False
1	Test 6	tasks/posts/tag/main	1.4	1.9	33554432	True
2	Test 0	tasks/blog/categories/tag	1.2	1.0	60416	False
3	Test 0	tasks/tags/list/categories	2.0	1.9	27262976	True
3	Test 1	tasks/posts/wp-content/categories	1.2	1.2	37748736	True
3	Test 2	tasks/search/posts/tag	1.7	0.5	96468992	False
3	Test 3	tasks/category	1.3	1.0	79872	False
3	Test 4	tasks/blog/tag/list	2.9	0.5	18874368	False
3	Test 5	tasks/tag/search/explore	1.9	0.9	54525952	False
4	Test 0	tasks/wp-content/tags/tag	2.5	1.2	97517568	False
4	Test 1	tasks/tag	2.5	2.4	94208	False
4	Test 2	tasks/main	2.5	3.4	84992	False
4	Test 3	tasks/posts	1.0	0.5	99614720	True
4	Test 4	tasks/app/categories	1.4	2.5	60817408	True
5	Test 0	tasks/posts/tags	2.8	1.4	53477376	True
5	Test 1	tasks/wp-content	1.4	1.2	74448896	False
5	Test 2	tasks/main	1.4	2.4	59392	True
5	Test 3	tasks/posts/tag	2.8	1.2	82944	False
5	Test 4	tasks/category	1.2	2.8	25600	True
5	Test 5	tasks/tags/blog	2.2	2.4	15728640	True
6	Test 0	tasks/category/main/wp-content	2.7	3.3	45088768	False
6	Test 1	tasks/app	1.5	2.5	39845888	False
6	Test 2	tasks/categories	1.5	3.2	40960	False
6	Test 3	tasks/blog	2.7	1.9	15360	False
6	Test 4	tasks/category/app/posts	1.8	1.6	99328	True
6	Test 5	tasks/tag/categories	1.8	2.8	40894464	True
6	Test 6	tasks/tags/tags/posts	2.1	2.4	93184	True
6	Test 7	tasks/app/app	1.3	2.8	19456	True
6	Test 8	tasks/category/main	1.5	0.9	73400320	True
6	Test 9	tasks/category/posts/category	1.1	2.1	6144	False
7	Test 0	tasks/search	1.9	0.9	39936	False
7	Test 1	tasks/categories/explore/explore	1.1	3.4	45056	False
8	Test 0	tasks/search	2.2	1.0	1024	False
8	Test 1	tasks/tags	1.2	0.8	87040	False
8	Test 2	tasks/list/category/explore	1.3	1.4	9216	True
8	Test 3	tasks/posts/main/wp-content	2.6	2.7	87040	False
8	Test 4	tasks/tag/search/category	2.8	2.7	97280	False
8	Test 5	tasks/wp-content	1.7	0.7	91136	True
8	Test 6	tasks/app/tags	1.4	1.0	6144	True
8	Test 7	tasks/search/wp-content/wp-content	2.0	1.8	75497472	True
8	Test 8	tasks/search/blog	2.9	1.4	28672	False
9	Test 0	tasks/list	2.8	2.1	39936	True
9	Test 1	tasks/blog	2.1	1.1	87031808	False
9	Test 2	tasks/tags/explore	1.4	3.4	94371840	True
9	Test 3	tasks/categories/tag/main	1.4	1.8	12582912	False
9	Test 4	tasks/app/tags/search	2.9	1.3	78848	False
9	Test 5	tasks/tags/search/main	2.7	2.0	102400	True
9	Test 6	tasks/list/posts	1.5	2.0	11534336	True
9	Test 7	tasks/categories/blog	2.7	0.8	29696	True
9	Test 8	tasks/categories/wp-content/wp-content	1.9	0.5	40894464	False
9	Test 9	tasks/wp-content/search/wp-content	2.9	2.4	48234496	True
10	Test 0	tasks/explore/wp-content	1.8	3.2	66560	False
10	Test 1	tasks/blog/app	1.4	3.2	95420416	True
10	Test 2	tasks/wp-content/posts/tag	1.7	2.8	56623104	False
10	Test 3	tasks/wp-content/tag	2.9	1.0	74752	False
10	Test 4	tasks/main	2.3	1.8	99328	False
10	Test 5	tasks/wp-content	1.0	2.4	44032	False
10	Test 6	tasks/search	2.1	2.8	14336	False
10	Test 7	tasks/wp-content	2.2	0.5	33554432	True
10	Test 8	tasks/app/list/list	1.6	2.1	13312	False
10	Test 9	tasks/tags/list/app	2.0	2.2	59768832	True
11	Test 0	tasks/list	2.1	2.4	56320	False
12	Test 0	tasks/category/list	2.4	1.7	13631488	False
13	Test 0	tasks/wp-content	1.5	2.3	48128	True
13	Test 1	tasks/category/posts/categories	2.5	2.8	94371840	True
13	Test 2	tasks/list/blog/search	1.9	2.9	62464	True
13	Test 3	tasks/list/list/wp-content	2.6	2.1	31457280	True
13	Test 4	tasks/app/tag/posts	2.4	1.3	15360	True
14	Test 0	tasks/blog/main	1.1	2.3	65536	False
15	Test 0	tasks/list	2.8	1.2	7340032	True
15	Test 1	tasks/explore/blog	1.5	0.9	52428800	False
15	Test 2	tasks/main/category	1.7	3.4	35651584	True
15	Test 3	tasks/tag/list	2.2	3.1	90177536	True
15	Test 4	tasks/categories/list	2.1	2.5	27262976	True
15	Test 5	tasks/tag/tag/main	1.8	1.3	90177536	False
16	Test 0	tasks/wp-content/categories/tag	2.9	3.2	59392	False
16	Test 1	tasks/tags/wp-content	1.2	2.2	54272	False
17	Test 0	tasks/posts/category	2.6	3.2	75776	True
17	Test 1	tasks/blog	1.7	1.2	43008	True
17	Test 2	tasks/app	1.5	1.8	24576	True
17	Test 3	tasks/category/blog/tag	1.2	2.7	48234496	False
18	Test 0	tasks/tag/blog	2.6	2.5	57671680	True
18	Test 1	tasks/app/search	2.7	1.4	58720256	True
18	Test 2	tasks/category/wp-content	2.9	2.0	26624	True
19	Test 0	tasks/main/wp-content/explore	1.8	2.7	49283072	True
19	Test 1	tasks/app/categories	2.7	0.5	57671680	True
19	Test 2	tasks/tags/posts/posts	1.3	1.6	58720256	False
19	Test 3	tasks/app/main/blog	1.8	1.6	9437184	False
19	Test 4	tasks/posts/tag/app	1.1	1.7	23068672	True
19	Test 5	tasks/search/app	2.1	2.4	88080384	False
20	Test 0	tasks/posts/blog	2.9	3.1	64512	False
20	Test 1	tasks/main/posts/tag	1.1	1.0	28672	False
20	Test 2	tasks/search/search/app	1.7	1.2	100663296	True
20	Test 3	tasks/tag	1.4	1.4	92274688	True
20	Test 4	tasks/tags	2.7	2.0	13312	False
20	Test 5	tasks/list/main/search	2.6	1.1	52428800	False
21	Test 0	tasks/tags/search	2.6	0.6	80740352	True
21	Test 1	tasks/search/search/categories	2.8	0.9	67108864	True
21	Test 2	tasks/categories	2.6	2.1	28311552	True
21	Test 3	tasks/categories/blog	1.7	2.7	61440	True
22	Test 0	tasks/tags	2.0	2.8	74448896	True
22	Test 1	tasks/app	1.2	1.7	62914560	False
22	Test 2	tasks/categories/blog/main	2.5	2.8	39845888	False
22	Test 3	tasks/blog	2.5	1.3	58720256	False
22	Test 4	tasks/search	2.0	1.3	37888	True
22	Test 5	tasks/app/list/explore	2.2	2.8	93323264	True
22	Test 6	tasks/app/main	2.2	1.5	91226112	True
22	Test 7	tasks/list	2.8	3.3	17825792	True
23	Test 0	tasks/category/wp-content	1.6	1.8	39936	False
23	Test 1	tasks/tags	1.2	1.9	50176	True
23	Test 2	tasks/category	2.7	2.7	20480	True
23	Test 3	tasks/list/list/wp-content	2.8	0.6	3072	False
23	Test 4	tasks/wp-content	2.2	2.3	58720256	False
24	Test 0	tasks/blog/categories	2.2	0.5	12582912	False
24	Test 1	tasks/tag	1.2	3.4	68608	True
24	Test 2	tasks/posts	1.1	0.7	8388608	True
24	Test 3	tasks/category/categories	1.4	3.1	79691776	True
25	Test 0	tasks/tags/categories	2.2	3.2	99614720	True
25	Test 1	tasks/main/tag	2.1	1.1	4194304	False
25	Test 2	tasks/list	2.2	3.2	76546048	False
25	Test 3	tasks/app/categories/app	1.2	1.3	35651584	True
25	Test 4	tasks/posts	1.8	0.7	2097152	True
25	Test 5	tasks/tag/app	1.9	2.9	5120	True
26	Test 0	tasks/tag/category/blog	2.4	0.6	28672	True
26	Test 1	tasks/main	2.7	1.3	26624	True
27	Test 0	tasks/tags	1.9	2.8	38912	False
27	Test 1	tasks/list/category/blog	1.7	2.2	39936	True
27	Test 2	tasks/main/main/wp-content	2.9	3.0	52428800	False
28	Test 0	tasks/explore	2.0	1.9	68157440	True
28	Test 1	tasks/tag/main/explore	1.0	1.5	25165824	False
28	Test 2	tasks/categories	1.5	2.4	81920	False
28	Test 3	tasks/main	1.8	2.7	74448896	False
28	Test 4	tasks/explore	1.3	0.6	35651584	True
28	Test 5	tasks/posts/explore/posts	1.2	1.2	62914560	False
28	Test 6	tasks/blog/search/explore	2.8	2.6	3145728	True
28	Test 7	tasks/tag/app/category	2.3	0.8	48234496	False
28	Test 8	tasks/tag	2.2	0.5	45088768	True
28	Test 9	tasks/search	1.0	1.2	4194304	True
29	Test 0	tasks/blog	1.5	0.7	54272	False
29	Test 1	tasks/tag	1.7	2.1	53477376	False
29	Test 2	tasks/app/list/tag	1.6	3.2	55296	False
29	Test 3	tasks/posts/categories	2.7	2.5	88080384	True
29	Test 4	tasks/search	2.6	1.2	56623104	True
29	Test 5	tasks/posts/explore/list	2.9	1.9	55574528	True
29	Test 6	tasks/explore/list/category	2.8	2.9	27262976	True
29	Test 7	tasks/explore	1.6	1.9	31744	True
29	Test 8	tasks/wp-content/main	1.6	1.4	79691776	True
29	Test 9	tasks/main/posts/main	2.9	0.8	26214400	False
30	Test 0	tasks/tag/blog	2.2	1.8	104857600	True
30	Test 1	tasks/wp-content/main/wp-content	1.7	3.0	53248	False
30	Test 2	tasks/tags/explore	1.7	2.8	24576	True
30	Test 3	tasks/search/tag	2.2	2.3	35651584	True
30	Test 4	tasks/tag/categories/blog	1.9	2.5	29696	True
30	Test 5	tasks/blog/explore	2.8	2.1	60416	True
30	Test 6	tasks/explore/main	2.6	0.6	6291456	False
30	Test 7	tasks/main/main/wp-content	1.9	1.9	17825792	False
30	Test 8	tasks/search/app/app	2.0	2.3	3072	True
30	Test 9	tasks/search/tags/blog	1.9	1.2	63488	True
31	Test 0	tasks/search	1.4	1.8	85983232	False
31	Test 1	tasks/category	1.0	2.5	99328	True
31	Test 2	tasks/explore/explore/category	1.3	1.0	80896	False
31	Test 3	tasks/category	1.3	1.8	13312	False
31	Test 4	tasks/wp-content/list	1.4	2.6	103809024	True
31	Test 5	tasks/explore	1.4	1.9	31744	True
31	Test 6	tasks/search	2.4	0.6	25600	True
31	Test 7	tasks/search/categories	2.1	2.7	72351744	False
31	Test 8	tasks/list	2.3	2.0	35651584	True
32	Test 0	tasks/posts	2.3	1.5	88064	True
32	Test 1	tasks/wp-content	1.1	0.6	104857600	True
32	Test 2	tasks/posts/wp-content	1.5	1.1	44040192	True
32	Test 3	tasks/explore	1.1	2.1	56320	False
33	Test 0	tasks/category	1.9	1.5	84992	True
33	Test 1	tasks/main	1.1	1.8	19922944	True
33	Test 2	tasks/main	2.7	1.6	36864	True
33	Test 3	tasks/wp-content	2.5	0.5	95232	True
33	Test 4	tasks/main/posts/blog	2.6	1.5	6144	True
33	Test 5	tasks/posts/categories/main	1.6	2.6	59392	True
33	Test 6	tasks/tag/search/blog	1.7	2.6	93323264	False
33	Test 7	tasks/explore/blog	1.2	3.1	12288	True
34	Test 0	tasks/categories/tag/blog	1.8	1.5	79691776	False
34	Test 1	tasks/explore	2.9	1.8	13312	True
34	Test 2	tasks/blog	1.9	3.4	104857600	False
34	Test 3	tasks/categories	2.2	3.3	87040	True
34	Test 4	tasks/categories/app/explore	1.0	3.1	11534336	False
35	Test 0	tasks/list/explore	2.5	0.5	30720	True
36	Test 0	tasks/wp-content/explore/wp-content	2.5	2.3	24117248	True
36	Test 1	tasks/list/app/blog	1.6	3.1	65536	False
36	Test 2	tasks/list/list	1.6	2.7	75776	True
36	Test 3	tasks/list	2.9	0.8	67584	True
37	Test 0	tasks/tag/tag/posts	1.4	3.4	11534336	False
38	Test 0	tasks/app/list	2.8	1.0	10240	False
38	Test 1	tasks/explore	2.5	1.5	24117248	True
38	Test 2	tasks/explore/tag/search	2.1	1.0	49283072	False
38	Test 3	tasks/blog/app	1.3	2.2	99614720	False
38	Test 4	tasks/categories/explore	1.0	0.8	76800	True
38	Test 5	tasks/search	1.0	2.8	71680	True
38	Test 6	tasks/tag/categories	1.7	3.4	74752	False
38	Test 7	tasks/categories	1.2	2.5	57671680	True
38	Test 8	tasks/explore/category	1.8	2.8	55574528	False
38	Test 9	tasks/app/main	2.8	0.8	96256	False
39	Test 0	tasks/category/tag/main	2.9	2.4	22528	True
39	Test 1	tasks/explore/tag/list	1.0	0.6	26214400	True
39	Test 2	tasks/main/category/wp-content	1.3	3.3	101376	True
39	Test 3	tasks/list/posts/tag	1.2	0.8	82944	False
40	Test 0	tasks/app/explore/explore	1.4	1.8	49283072	False
40	Test 1	tasks/category	2.5	1.8	6291456	True
40	Test 2	tasks/list/tag/tags	1.2	1.5	77594624	False
41	Test 0	tasks/wp-content/main	1.2	1.0	96256	True
42	Test 0	tasks/search	2.3	1.0	98304	True
42	Test 1	tasks/list	2.1	3.3	40960	False
42	Test 2	tasks/list/search/category	1.8	2.7	76546048	False
42	Test 3	tasks/categories/main	1.0	2.6	58368	False
42	Test 4	tasks/blog/search	1.2	2.5	67108864	False
42	Test 5	tasks/category/category/app	2.4	2.4	27648	True
42	Test 6	tasks/explore/main/explore	1.2	3.1	48128	True
42	Test 7	tasks/wp-content/explore	1.1	1.4	65536	True
42	Test 8	tasks/posts/tag	1.8	2.5	26214400	True
42	Test 9	tasks/wp-content	2.4	2.1	101376	False
43	Test 0	tasks/tag/tags	2.3	2.7	7340032	True
43	Test 1	tasks/app/main	2.1	2.2	4096	False
43	Test 2	tasks/wp-content/blog	1.2	3.1	25165824	False
43	Test 3	tasks/search/list/blog	2.6	3.4	99614720	False
43	Test 4	tasks/posts	1.7	0.6	68157440	True
43	Test 5	tasks/blog	2.0	3.0	104857600	False
44	Test 0	tasks/app/categories/tags	2.0	2.3	24576	False
44	Test 1	tasks/list/tags/search	1.3	0.6	88064	False
45	Test 0	tasks/app/app	1.4	3.1	99328	True
45	Test 1	tasks/list/category/category	2.2	1.6	16384	False
46	Test 0	tasks/categories/posts	2.6	3.2	14680064	False
46	Test 1	tasks/tags/main/search	1.6	2.1	68608	False
46	Test 2	tasks/category/posts/blog	2.2	2.7	49152	True
46	Test 3	tasks/blog	1.8	2.6	3072	True
46	Test 4	tasks/main/category	2.5	3.0	48234496	True
46	Test 5	tasks/app/tag	2.2	0.8	41943040	True
47	Test 0	tasks/app/blog/explore	2.0	3.1	21504	False
47	Test 1	tasks/categories/category/main	1.8	1.6	25600	True
47	Test 2	tasks/app/search/tags	2.0	1.7	75776	False
47	Test 3	tasks/categories	1.0	2.0	92274688	True
47	Test 4	tasks/wp-content	1.5	0.9	68157440	False
47	Test 5	tasks/app/explore	2.8	1.4	55296	True
48	Test 0	tasks/search/search/category	1.7	3.4	92274688	False
48	Test 1	tasks/tag/category	2.6	3.1	7340032	False
48	Test 2	tasks/categories	1.2	2.5	1048576	True
48	Test 3	tasks/search/main	1.5	2.1	97280	True
49	Test 0	tasks/categories	1.7	1.5	31457280	False
49	Test 1	tasks/tags/wp-content	1.9	1.0	49152	True
49	Test 2	tasks/categories/app/search	2.4	2.8	5242880	True
49	Test 3	tasks/tag/list	2.0	2.3	23068672	True
49	Test 4	tasks/main	2.0	1.5	81788928	False
50	Test 0	tasks/explore/tags/tag	1.0	2.5	61440	True
50	Test 1	tasks/list/search/list	1.9	0.6	3072	True
50	Test 2	tasks/list/main	1.4	2.8	12288	True
50	Test 3	tasks/posts/posts	1.9	0.6	7168	False
50	Test 4	tasks/posts/wp-content	2.4	3.1	93184	False
50	Test 5	tasks/app	1.4	2.9	104857600	True
50	Test 6	tasks/list	2.1	2.8	30720	False
50	Test 7	tasks/tags	2.9	2.3	78848	True
50	Test 8	tasks/wp-content/list	1.9	2.8	17825792	False
51	Test 0	tasks/category/list	2.4	3.0	42991616	False
51	Test 1	tasks/categories/main/posts	2.3	2.4	23068672	True
51	Test 2	tasks/list/tags	2.1	0.9	30408704	False
51	Test 3	tasks/blog/search	2.1	2.0	63488	True
51	Test 4	tasks/category/category/categories	2.9	3.0	83886080	True
51	Test 5	tasks/tag	2.4	2.9	51380224	True
51	Test 6	tasks/posts/list	2.2	1.6	64512	True
51	Test 7	tasks/explore	1.3	1.5	9216	False
52	Test 0	tasks/app/explore/posts	1.3	3.1	15728640	True
53	Test 0	tasks/tag/wp-content	2.8	1.3	53477376	True
53	Test 1	tasks/blog/tags/search	2.8	2.4	24117248	True
53	Test 2	tasks/wp-content	1.0	0.7	64512	False
53	Test 3	tasks/categories/tags/category	2.2	2.7	57671680	False
53	Test 4	tasks/list/main/explore	1.8	2.9	28672	False
53	Test 5	tasks/categories	2.1	0.7	18432	False
53	Test 6	tasks/tags	1.6	0.6	35651584	True
53	Test 7	tasks/search	2.8	1.6	44040192	False
53	Test 8	tasks/search	1.5	1.4	55574528	True
53	Test 9	tasks/category/explore/categories	1.0	1.9	43008	True
54	Test 0	tasks/tags/categories	2.3	0.9	84992	False
54	Test 1	tasks/app/categories/search	2.8	3.2	32768	False
54	Test 2	tasks/list/app/wp-content	1.3	2.4	90112	True
54	Test 3	tasks/wp-content/search	2.3	0.5	61865984	True
54	Test 4	tasks/blog/category/list	2.8	1.1	49283072	False
54	Test 5	tasks/search/tags	1.6	0.5	19922944	False
54	Test 6	tasks/app	2.4	1.8	43008	True
54	Test 7	tasks/categories	2.5	1.0	68608	True
54	Test 8	tasks/main/app	1.4	2.3	54272	False
54	Test 9	tasks/list/category	1.2	1.7	1024	True
55	Test 0	tasks/wp-content	1.5	2.4	59768832	False
55	Test 1	tasks/tags/tag	2.8	0.9	18874368	False
55	Test 2	tasks/main/app	1.0	2.5	55296	True
55	Test 3	tasks/app	1.0	2.1	34816	True
55	Test 4	tasks/tags	2.5	3.2	27262976	False
55	Test 5	tasks/posts	2.4	2.7	44040192	True
56	Test 0	tasks/blog/app/tag	2.9	3.4	100663296	True
57	Test 0	tasks/explore/blog	1.5	2.6	93184	False
57	Test 1	tasks/posts/search	1.9	3.0	96468992	False
57	Test 2	tasks/tag/app/blog	2.9	0.9	15728640	False
58	Test 0	tasks/categories/posts/search	2.4	2.2	101711872	True
58	Test 1	tasks/list/main	2.0	1.0	33792	True
58	Test 2	tasks/blog	1.7	0.6	61865984	True
58	Test 3	tasks/blog/posts	2.9	3.4	33554432	False
58	Test 4	tasks/tags/main/list	2.7	2.5	83968	True
59	Test 0	tasks/blog/blog/search	2.7	2.7	98304	False
59	Test 1	tasks/categories/tag	2.5	2.8	60416	True
59	Test 2	tasks/category/blog/explore	1.4	0.5	97517568	False
59	Test 3	tasks/tags	2.3	2.1	83886080	True
60	Test 0	tasks/category	2.4	0.6	18874368	False
60	Test 1	tasks/tags	1.7	1.2	86016	True
60	Test 2	tasks/category	1.0	1.9	63963136	False
60	Test 3	tasks/explore/category/category	1.4	2.1	98304	True
60	Test 4	tasks/explore/tag/tag	1.4	0.9	4096	False
60	Test 5	tasks/search/blog	1.0	2.1	28672	False
60	Test 6	tasks/explore	2.2	1.3	52428800	True
61	Test 0	tasks/explore	1.2	0.6	38797312	False
61	Test 1	tasks/tags	2.9	3.0	93323264	True
61	Test 2	tasks/app/blog/list	2.2	3.4	46080	True
61	Test 3	tasks/blog/tag/tag	1.6	2.5	22528	False
61	Test 4	tasks/list/posts/category	2.8	2.1	73728	True
61	Test 5	tasks/posts/posts	2.2	0.7	50331648	True
61	Test 6	tasks/tag/categories	1.4	2.0	11264	True
61	Test 7	tasks/tag	2.9	1.9	59392	True
61	Test 8	tasks/category/category/categories	2.0	0.7	80896	False
62	Test 0	tasks/search/blog	1.9	2.0	76800	False
62	Test 1	tasks/category/posts	2.6	2.5	14336	False
62	Test 2	tasks/posts/tag	1.0	0.8	39936	True
62	Test 3	tasks/app/list/tag	2.0	2.7	92274688	False
62	Test 4	tasks/explore/tag/app	2.5	0.6	36864	True
63	Test 0	tasks/explore/blog/app	1.9	2.8	90177536	False
63	Test 1	tasks/tags/blog/category	1.6	2.0	88080384	False
63	Test 2	tasks/tag/tags/category	1.3	1.8	96468992	True
63	Test 3	tasks/category/posts/list	1.0	2.6	42991616	False
63	Test 4	tasks/tag/categories	2.6	0.7	1024	False
63	Test 5	tasks/explore	1.1	2.5	28672	True
63	Test 6	tasks/wp-content/posts	2.9	2.1	100663296	True
64	Test 0	tasks/explore	1.7	1.0	48128	False
64	Test 1	tasks/main	1.5	2.0	44040192	False
64	Test 2	tasks/main	1.7	2.3	95420416	True
64	Test 3	tasks/tags/explore/tag	2.0	3.0	41984	False
64	Test 4	tasks/tag/tag/posts	2.9	2.5	76546048	True
65	Test 0	tasks/main/tag/list	2.6	2.6	69632	True
65	Test 1	tasks/categories/tags	1.3	0.5	2048	True
66	Test 0	tasks/posts	2.6	2.6	9216	False
67	Test 0	tasks/categories/tag/categories	1.8	1.4	3145728	False
67	Test 1	tasks/explore/tags	1.4	1.5	1024	False
67	Test 2	tasks/posts	2.5	3.1	93323264	False
67	Test 3	tasks/tag/tag/explore	1.0	2.7	77594624	False
67	Test 4	tasks/wp-content/app	2.3	1.6	75497472	True
67	Test 5	tasks/wp-content/explore	2.1	3.2	66560	True
67	Test 6	tasks/search/wp-content	1.4	1.5	56623104	False
67	Test 7	tasks/search/explore/explore	1.2	2.1	57671680	False
67	Test 8	tasks/categories	2.7	3.3	81788928	False
67	Test 9	tasks/explore/list/explore	2.2	2.2	65536	True
68	Test 0	tasks/tag/search	2.2	1.1	57671680	False
68	Test 1	tasks/search/posts/search	2.0	1.0	55296	False
68	Test 2	tasks/search	2.0	2.3	8388608	True
68	Test 3	tasks/categories/search	2.1	1.7	10240	False
68	Test 4	tasks/tags/tag/posts	1.1	1.8	34816	True
68	Test 5	tasks/app	1.0	2.9	11264	True
68	Test 6	tasks/blog/category/wp-content	2.1	0.9	38912	False
68	Test 7	tasks/category/categories/search	1.2	0.6	47104	False
69	Test 0	tasks/tags	1.5	3.4	88064	True
69	Test 1	tasks/tags/blog/list	2.4	1.4	44032	True
69	Test 2	tasks/search/explore	1.8	2.7	53477376	False
69	Test 3	tasks/blog/categories/tags	1.6	3.1	68608	False
69	Test 4	tasks/categories/search/wp-content	1.2	1.1	67584	True
69	Test 5	tasks/category/main	2.9	3.1	53248	False
69	Test 6	tasks/category	2.0	3.3	52224	False
70	Test 0	tasks/category/posts	1.6	2.4	63488	False
70	Test 1	tasks/explore	2.2	1.0	55574528	False
70	Test 2	tasks/blog/category	2.7	1.4	60817408	False
70	Test 3	tasks/posts	1.8	3.0	63488	True
71	Test 0	tasks/categories/main	2.0	2.7	77594624	True
71	Test 1	tasks/tag	1.3	1.0	6144	True
71	Test 2	tasks/explore/categories/list	1.4	2.1	18432	True
71	Test 3	tasks/tag	1.0	2.5	38912	False
71	Test 4	tasks/blog	2.6	3.1	3145728	False
71	Test 5	tasks/category	1.1	2.4	18432	False
71	Test 6	tasks/tags	2.8	0.5	72351744	True
72	Test 0	tasks/tags/categories	2.2	1.4	11534336	False
72	Test 1	tasks/app/explore/search	2.7	3.2	51380224	False
72	Test 2	tasks/app/wp-content	2.7	2.3	38797312	False
72	Test 3	tasks/categories	2.9	3.0	79872	True
73	Test 0	tasks/wp-content/list/blog	1.2	0.7	55296	True
73	Test 1	tasks/blog	1.2	1.8	27262976	False
73	Test 2	tasks/categories/tags/categories	1.3	1.5	70656	False
74	Test 0	tasks/explore/main/blog	2.7	2.5	12288	False
74	Test 1	tasks/explore/category	2.0	1.5	66060288	False
74	Test 2	tasks/main/list/tag	2.6	2.1	71303168	False
74	Test 3	tasks/app/categories/wp-content	1.8	2.5	69206016	False
74	Test 4	tasks/list	2.3	1.5	67108864	False
74	Test 5	tasks/explore/blog	1.6	2.9	22020096	True
74	Test 6	tasks/wp-content/search/list	1.1	3.2	70254592	False
74	Test 7	tasks/app/app	2.6	1.7	87031808	True
74	Test 8	tasks/tag	2.2	1.8	22528	False
74	Test 9	tasks/tag	2.6	1.0	56623104	True
75	Test 0	tasks/app	1.5	0.7	83968	False
75	Test 1	tasks/tag/app/tags	1.9	1.1	36864	False
75	Test 2	tasks/explore/search	2.5	1.4	63963136	False
76	Test 0	tasks/search/wp-content/category	2.0	1.8	90112	True
76	Test 1	tasks/tag/search/tag	2.6	2.5	88064	True
76	Test 2	tasks/blog/explore	1.9	0.6	38797312	False
76	Test 3	tasks/categories	1.4	1.4	58368	True
76	Test 4	tasks/list	1.8	2.7	57344	True
76	Test 5	tasks/app	1.0	1.8	103809024	True
76	Test 6	tasks/wp-content/list	1.4	0.7	78643200	False
76	Test 7	tasks/search/category/blog	2.8	1.4	21504	True
76	Test 8	tasks/tags/categories/explore	2.2	1.9	102400	True
77	Test 0	tasks/tags	2.3	0.9	87031808	True
77	Test 1	tasks/blog/posts	1.3	1.6	45056	False
77	Test 2	tasks/search/explore	2.1	1.0	63963136	True
77	Test 3	tasks/wp-content	2.1	1.6	72704	True
77	Test 4	tasks/tag/tags	2.4	3.1	51380224	True
77	Test 5	tasks/app/category	2.5	3.4	63963136	True
77	Test 6	tasks/wp-content/explore/tag	2.1	3.2	86016	True
78	Test 0	tasks/blog/blog/tags	1.9	2.9	57344	False
78	Test 1	tasks/posts/tag/search	1.4	1.7	15360	True
78	Test 2	tasks/category	1.4	2.3	41943040	True
78	Test 3	tasks/app/wp-content	1.9	2.7	67584	True
78	Test 4	tasks/posts	2.7	1.3	84934656	True
78	Test 5	tasks/search/list/wp-content	2.6	1.8	34603008	True
78	Test 6	tasks/tags/tag/tag	1.8	2.5	9216	False
78	Test 7	tasks/wp-content/category/posts	2.8	2.4	89128960	False
79	Test 0	tasks/tags	2.0	1.9	5242880	True
80	Test 0	tasks/tags/explore	2.1	3.4	58368	True
81	Test 0	tasks/search/app	1.3	2.3	56623104	False
81	Test 1	tasks/search/category/explore	1.0	2.2	21504	False
81	Test 2	tasks/tag/tags/app	2.6	2.2	13631488	False
81	Test 3	tasks/tags	2.2	3.2	97517568	False
81	Test 4	tasks/blog/main/explore	1.8	0.7	66560	False
81	Test 5	tasks/tags/tags	2.9	1.0	70254592	True
81	Test 6	tasks/category/search	2.7	0.9	99328	True
81	Test 7	tasks/explore/main	1.6	0.5	12288	False
82	Test 0	tasks/category	1.9	1.6	60416	False
83	Test 0	tasks/blog	1.7	1.8	87031808	True
83	Test 1	tasks/category/app	2.9	1.0	87040	True
83	Test 2	tasks/list/posts	1.5	3.0	27262976	False
83	Test 3	tasks/list/app	2.7	3.3	53248	False
83	Test 4	tasks/tag	2.9	0.8	97280	False
84	Test 0	tasks/main/tag	2.4	1.8	68157440	False
84	Test 1	tasks/category/tag/explore	2.5	1.9	54525952	True
84	Test 2	tasks/app	1.1	0.6	50331648	False
84	Test 3	tasks/categories	2.6	1.5	87031808	True
84	Test 4	tasks/tag	2.8	1.0	47185920	False
84	Test 5	tasks/wp-content/search	1.6	1.5	29696	True
85	Test 0	tasks/main/explore/category	2.3	2.7	61440	True
85	Test 1	tasks/search/search/blog	1.4	3.4	26624	False
86	Test 0	tasks/list/categories/categories	2.7	1.2	42991616	True
86	Test 1	tasks/tag/blog	1.7	3.0	100663296	False
86	Test 2	tasks/search	1.1	3.1	92160	True
86	Test 3	tasks/app/posts	1.5	3.1	90112	True
86	Test 4	tasks/tags/category	1.3	2.6	52428800	True
87	Test 0	tasks/posts/explore/search	1.7	1.3	31457280	True
87	Test 1	tasks/explore	1.2	2.3	53477376	True
87	Test 2	tasks/list	2.5	2.6	37888	True
87	Test 3	tasks/list	2.2	2.8	81920	True
87	Test 4	tasks/explore/explore	2.4	2.9	39845888	False
87	Test 5	tasks/app	1.0	1.9	102400	True
88	Test 0	tasks/tags/tags/posts	2.3	2.9	26214400	False
88	Test 1	tasks/wp-content/explore/tags	1.7	1.8	98566144	True
88	Test 2	tasks/tags/search/tags	2.7	1.0	79691776	True
88	Test 3	tasks/app	2.6	3.0	2048	False
88	Test 4	tasks/tag	2.3	0.7	77824	False
88	Test 5	tasks/list/explore/blog	2.9	0.5	10240	False
88	Test 6	tasks/category/app/main	1.4	2.8	88064	True
89	Test 0	tasks/blog/tags/search	1.0	0.9	78643200	False
89	Test 1	tasks/main	1.2	2.3	24576	True
89	Test 2	tasks/category/main/app	1.7	1.6	37888	True
89	Test 3	tasks/blog/tags	2.3	0.8	66060288	True
89	Test 4	tasks/tags/blog	2.9	2.0	12582912	True
89	Test 5	tasks/category/app	2.3	1.6	21504	False
89	Test 6	tasks/search/tags	2.6	0.8	79872	True
89	Test 7	tasks/list/tag/tag	2.5	3.3	19456	True
89	Test 8	tasks/list/tags	1.6	2.3	76800	False
90	Test 0	tasks/blog/main	1.3	2.2	85983232	True
90	Test 1	tasks/app	1.5	0.7	23552	True
90	Test 2	tasks/tag/search	2.3	0.5	59392	True
90	Test 3	tasks/explore	1.9	3.0	74752	True
90	Test 4	tasks/search	1.8	3.0	7340032	True
90	Test 5	tasks/tags/tags	1.4	3.2	45088768	True
91	Test 0	tasks/categories/blog/wp-content	1.2	0.8	12288	False
91	Test 1	tasks/main	2.4	2.4	14336	False
91	Test 2	tasks/category	1.5	1.0	58720256	False
91	Test 3	tasks/category	1.8	2.5	80896	False
91	Test 4	tasks/main	2.8	2.3	22020096	True
91	Test 5	tasks/categories/list/search	2.6	3.2	9437184	True
91	Test 6	tasks/posts/main	1.5	0.9	74448896	False
91	Test 7	tasks/blog	2.0	1.1	62464	True
91	Test 8	tasks/posts/app	1.8	1.4	58368	False
92	Test 0	tasks/blog	2.8	1.4	57671680	True
92	Test 1	tasks/categories	2.3	0.6	58720256	True
92	Test 2	tasks/app	2.5	2.6	72351744	False
92	Test 3	tasks/posts	2.4	1.2	34603008	False
93	Test 0	tasks/app/category/search	1.9	3.2	49283072	False
93	Test 1	tasks/list/explore	2.9	2.1	11264	True
93	Test 2	tasks/category/blog/posts	2.3	0.7	8192	True
93	Test 3	tasks/explore	1.0	1.7	76800	False
93	Test 4	tasks/search/categories	2.4	2.6	19922944	False
93	Test 5	tasks/category/search	1.8	1.3	56320	True
93	Test 6	tasks/tags/wp-content	1.6	3.3	48128	True
93	Test 7	tasks/main/app/tag	2.8	0.6	6291456	False
94	Test 0	tasks/wp-content/list	1.5	2.2	26214400	False
94	Test 1	tasks/wp-content	1.8	0.7	20480	True
94	Test 2	tasks/tag/explore/list	2.7	1.8	8388608	True
94	Test 3	tasks/search	1.8	2.4	77594624	False
94	Test 4	tasks/app/categories/wp-content	2.5	2.2	52428800	True
94	Test 5	tasks/category/main	1.3	3.2	89088	True
94	Test 6	tasks/app/search/explore	1.1	1.5	98566144	True
94	Test 7	tasks/tags	2.2	0.5	50176	False
94	Test 8	tasks/list/main/category	2.7	2.9	73728	True
94	Test 9	tasks/wp-content/list/app	1.5	3.4	38797312	False
95	Test 0	tasks/categories	1.2	1.3	40894464	False
95	Test 1	tasks/category	2.7	0.9	76546048	False
96	Test 0	tasks/blog	1.6	0.6	100352	True
96	Test 1	tasks/blog/search	2.6	2.1	89088	True
96	Test 2	tasks/blog/main	1.7	2.0	104857600	True
96	Test 3	tasks/tags/wp-content	1.4	0.5	70656	True
96	Test 4	tasks/explore	2.0	1.3	27648	False
96	Test 5	tasks/main/posts	2.7	0.5	70254592	True
96	Test 6	tasks/app/posts	1.9	2.8	54272	False
96	Test 7	tasks/explore/blog	2.0	2.6	40894464	False
96	Test 8	tasks/categories/blog/category	2.3	3.0	69632	False
96	Test 9	tasks/list/posts/posts	1.0	0.8	32768	False
97	Test 0	tasks/blog/posts/list	1.2	2.0	77594624	True
97	Test 1	tasks/wp-content/list	1.4	1.7	2097152	False
97	Test 2	tasks/tag	1.2	0.7	85983232	True
97	Test 3	tasks/tags	2.5	1.8	9216	True
98	Test 0	tasks/tag	2.3	1.4	18432	True
98	Test 1	tasks/tag/posts	2.3	3.0	65011712	False
98	Test 2	tasks/wp-content	2.6	2.5	93323264	True
98	Test 3	tasks/category/main	1.8	2.1	102760448	True
99	Test 0	tasks/main	2.2	2.6	91136	True
99	Test 1	tasks/app/posts	1.8	0.7	45088768	False
99	Test 2	tasks/categories	2.0	2.3	50331648	True
99	Test 3	tasks/search	2.5	3.2	4096	True
99	Test 4	tasks/wp-content/category	2.2	2.4	58368	False
99	Test 5	tasks/tags/app	2.0	1.3	47104	True
99	Test 6	tasks/app/explore/categories	2.5	2.8	65011712	True
99	Test 7	tasks/tag/posts	1.3	2.0	96256	True
100	Test 0	tasks/explore/search/explore	2.8	3.4	85983232	True
101	Test 0	tasks/tag	1.5	2.3	93323264	True
101	Test 1	tasks/blog/list/search	1.3	2.7	35840	False
101	Test 2	tasks/tags/posts/main	1.7	0.5	71303168	True
101	Test 3	tasks/explore/list/tag	1.9	2.7	67584	True
101	Test 4	tasks/posts/explore	1.9	1.4	29696	False
101	Test 5	tasks/blog/search	1.3	2.5	50176	False
101	Test 6	tasks/categories/tag	1.8	3.4	69206016	True
101	Test 7	tasks/app/category/tag	1.5	1.6	74752	True
101	Test 8	tasks/category	2.1	1.6	4096	False
102	Test 0	tasks/category/explore/explore	2.8	0.6	27262976	False
102	Test 1	tasks/wp-content	1.8	0.7	79872	False
102	Test 2	tasks/app/wp-content	2.4	2.4	11264	True
102	Test 3	tasks/search	1.3	0.9	20971520	False
102	Test 4	tasks/explore	1.3	1.2	6291456	False
102	Test 5	tasks/posts/search	2.3	2.4	38912	False
102	Test 6	tasks/app/posts/list	1.1	2.0	92274688	True
102	Test 7	tasks/posts/categories/category	1.1	1.9	83886080	True
102	Test 8	tasks/explore/blog/posts	2.3	3.2	55296	False
102	Test 9	tasks/tags	1.4	2.7	102760448	False
103	Test 0	tasks/explore	1.4	0.9	77824	False
103	Test 1	tasks/main/list	1.6	1.4	96468992	True
103	Test 2	tasks/categories/posts/tag	1.0	1.8	100352	False
103	Test 3	tasks/categories/app	1.4	2.2	23068672	False
104	Test 0	tasks/wp-content/posts/blog	1.4	2.4	69206016	True
104	Test 1	tasks/list/posts/app	2.6	2.6	3072	False
104	Test 2	tasks/wp-content	1.6	1.0	74448896	False
104	Test 3	tasks/category/tag/explore	1.4	2.2	27262976	True
104	Test 4	tasks/wp-content/app	2.7	1.2	73400320	True
104	Test 5	tasks/posts/category	2.5	3.1	34816	True
104	Test 6	tasks/list/posts/categories	1.1	2.3	55296	False
104	Test 7	tasks/category	1.1	2.6	66560	True
105	Test 0	tasks/categories/wp-content	2.3	1.1	13312	False
105	Test 1	tasks/tags	1.6	2.8	52224	True
105	Test 2	tasks/tag/search/wp-content	1.4	2.9	35840	True
105	Test 3	tasks/posts	2.6	1.8	37888	False
105	Test 4	tasks/tag/posts	1.6	0.6	60416	True
106	Test 0	tasks/list/main/wp-content	2.4	1.4	34603008	False
107	Test 0	tasks/search/main/blog	2.9	1.9	102400	False
107	Test 1	tasks/list/posts/main	2.7	2.1	30720	True
107	Test 2	tasks/main	1.1	0.6	94208	True
107	Test 3	tasks/blog/category/categories	1.1	2.4	29696	False
107	Test 4	tasks/search/tag	2.1	2.7	16777216	False
107	Test 5	tasks/posts/wp-content	2.3	0.8	49283072	True
107	Test 6	tasks/explore/tags/category	1.2	1.9	101376	True
107	Test 7	tasks/explore/app/category	2.4	2.2	102760448	False
108	Test 0	tasks/posts/search/category	2.2	0.7	95232	True
108	Test 1	tasks/posts/main/app	1.6	1.6	47185920	True
108	Test 2	tasks/categories/explore/wp-content	2.1	2.8	19456	True
108	Test 3	tasks/tags/tags	1.4	3.0	26624	False
108	Test 4	tasks/tags/category	2.0	1.6	32505856	False
108	Test 5	tasks/posts/tags	1.0	2.6	4194304	True
108	Test 6	tasks/posts/category	1.4	0.8	95232	True
108	Test 7	tasks/main/search	1.3	0.5	37748736	False
108	Test 8	tasks/app/wp-content/search	1.5	0.8	48128	False
108	Test 9	tasks/explore	1.3	0.6	91136	True
109	Test 0	tasks/posts/search/categories	2.2	2.0	33792	True
110	Test 0	tasks/search	1.5	2.1	62464	False
110	Test 1	tasks/category/categories	1.7	2.0	88064	True
110	Test 2	tasks/list/explore/explore	1.8	1.1	51200	True
110	Test 3	tasks/posts	2.7	2.0	77824	False
110	Test 4	tasks/blog/posts	2.8	2.4	3145728	False
110	Test 5	tasks/list/wp-content	1.7	1.2	58368	False
110	Test 6	tasks/explore/category/category	2.0	2.5	11534336	False
111	Test 0	tasks/main/category/search	2.9	1.0	20971520	False
112	Test 0	tasks/app	2.1	1.2	88064	True
113	Test 0	tasks/main	2.8	1.4	99614720	True
113	Test 1	tasks/tag	1.6	3.1	34816	False
113	Test 2	tasks/wp-content/search	2.7	1.5	11264	True
113	Test 3	tasks/category/app/blog	2.9	1.9	63963136	False
113	Test 4	tasks/tag/category	2.6	2.1	35840	True
113	Test 5	tasks/posts/tag	2.7	0.9	93323264	False
113	Test 6	tasks/main/search/explore	2.0	1.8	32505856	True
113	Test 7	tasks/list	1.6	3.4	66060288	True
113	Test 8	tasks/category/blog/search	2.0	0.6	35651584	False
113	Test 9	tasks/tag/app	1.1	1.2	33792	False
114	Test 0	tasks/category/list	2.8	3.4	62914560	False
114	Test 1	tasks/blog	2.8	0.6	65536	False
114	Test 2	tasks/tags/list	2.4	1.5	62464	False
114	Test 3	tasks/category/posts/posts	2.5	1.1	31457280	True
114	Test 4	tasks/tags	2.4	2.9	4194304	False
114	Test 5	tasks/tag	1.1	3.4	50331648	False
114	Test 6	tasks/list/category/wp-content	1.9	2.4	64512	False
115	Test 0	tasks/categories/search/categories	1.0	1.8	79872	False
115	Test 1	tasks/wp-content	1.2	2.5	53477376	False
115	Test 2	tasks/tag/list/list	2.8	3.1	19456	False
116	Test 0	tasks/tag/explore	2.3	2.8	15728640	True
116	Test 1	tasks/search/tag/tags	1.9	1.4	70254592	True
116	Test 2	tasks/tags/blog/categories	2.5	1.7	68157440	False
116	Test 3	tasks/wp-content	1.7	1.1	46137344	True
117	Test 0	tasks/tag/list/category	1.0	1.4	93323264	True
117	Test 1	tasks/category	2.2	3.0	59768832	True
117	Test 2	tasks/tags/tags/posts	1.6	0.6	17408	True
117	Test 3	tasks/posts	2.9	1.2	74448896	True
117	Test 4	tasks/app	2.0	1.2	56623104	True
117	Test 5	tasks/category	1.7	1.0	12582912	False
117	Test 6	tasks/app/wp-content	2.1	2.5	40960	False
117	Test 7	tasks/category/tags	1.8	2.3	59768832	True
117	Test 8	tasks/list	2.5	1.6	102400	True
117	Test 9	tasks/tag/explore	2.6	1.7	37888	True
118	Test 0	tasks/app/wp-content/wp-content	2.1	1.9	98304	True
118	Test 1	tasks/categories/list/tag	2.5	2.1	49283072	True
118	Test 2	tasks/categories	2.0	1.9	48234496	True
119	Test 0	tasks/search	2.2	0.5	31744	False
119	Test 1	tasks/tags/main/tags	2.5	2.9	98566144	False
119	Test 2	tasks/tag/list/tag	1.8	2.6	12582912	False
119	Test 3	tasks/categories/list	1.3	2.0	19456	True
119	Test 4	tasks/categories/list	2.3	0.8	42991616	True
119	Test 5	tasks/posts/main/tags	2.3	3.1	72704	True
119	Test 6	tasks/main/list/explore	2.2	2.5	23552	True
119	Test 7	tasks/tag/main	2.3	1.3	78643200	False
119	Test 8	tasks/categories	2.9	2.2	26214400	True
120	Test 0	tasks/app	2.6	2.7	9437184	False
120	Test 1	tasks/categories/blog	1.4	1.8	35840	False
120	Test 2	tasks/explore/categories/explore	2.0	1.6	35840	True
120	Test 3	tasks/tags/tags	1.1	1.8	75497472	True
121	Test 0	tasks/blog/tags/tags	2.7	3.0	19456	True
121	Test 1	tasks/tag	2.3	3.0	13631488	False
121	Test 2	tasks/search/categories/tags	2.2	2.8	41984	False
121	Test 3	tasks/search/tag/tag	2.1	1.4	90112	False
121	Test 4	tasks/posts/posts	1.0	2.5	91136	False
121	Test 5	tasks/search	1.3	2.5	10240	True
121	Test 6	tasks/blog/explore	1.5	1.0	32768	False
121	Test 7	tasks/posts/search/tags	1.5	1.0	4096	True
121	Test 8	tasks/tags/app/blog	2.8	1.6	74448896	False
121	Test 9	tasks/posts/blog/category	2.6	2.8	92274688	True
122	Test 0	tasks/app	2.9	1.3	25600	False
122	Test 1	tasks/posts/main/posts	2.2	0.8	11534336	True
122	Test 2	tasks/posts/tag/category	1.8	2.2	62464	True
122	Test 3	tasks/categories	2.8	2.4	30408704	True
122	Test 4	tasks/posts/posts/categories	1.6	1.1	48128	False
122	Test 5	tasks/explore/main/explore	1.1	1.6	43008	True
122	Test 6	tasks/categories/app/search	1.8	2.6	72351744	False
122	Test 7	tasks/tags/tags/wp-content	2.4	2.5	65011712	False
122	Test 8	tasks/app/wp-content/search	2.3	1.5	12288	False
122	Test 9	tasks/list/category	2.5	1.4	21504	True
123	Test 0	tasks/tag	1.6	0.6	81920	False
124	Test 0	tasks/category	2.0	2.1	7168	True
124	Test 1	tasks/posts/main/posts	1.8	2.8	59768832	True
124	Test 2	tasks/categories/posts/app	2.3	3.3	98566144	True
124	Test 3	tasks/list/category	1.5	3.4	49283072	False
124	Test 4	tasks/main/categories/posts	1.4	2.9	29696	False
124	Test 5	tasks/categories	2.8	2.3	79691776	True
125	Test 0	tasks/explore	2.6	2.5	15360	True
125	Test 1	tasks/list/explore/posts	2.9	3.1	69632	False
125	Test 2	tasks/app/categories/categories	1.5	1.4	27648	False
125	Test 3	tasks/blog/search/categories	1.0	1.8	60817408	False
125	Test 4	tasks/main	1.3	3.4	82837504	False
125	Test 5	tasks/wp-content/search/posts	1.5	1.4	39936	True
125	Test 6	tasks/list/categories	2.9	1.9	65011712	True
125	Test 7	tasks/explore	2.8	2.3	79872	False
125	Test 8	tasks/app/list/blog	2.8	3.2	81788928	True
125	Test 9	tasks/tag/tag/posts	1.2	2.9	49283072	False
126	Test 0	tasks/posts/tags/posts	1.3	1.6	83968	True
126	Test 1	tasks/categories/tags	1.1	2.7	98566144	True
126	Test 2	tasks/explore/category	2.0	1.3	55296	True
126	Test 3	tasks/main/explore	1.9	2.8	53248	True
127	Test 0	tasks/categories	1.3	1.6	80740352	False
127	Test 1	tasks/posts/app	2.5	1.1	103809024	True
127	Test 2	tasks/blog	2.6	1.8	52224	True
127	Test 3	tasks/categories	2.4	2.7	74752	True
128	Test 0	tasks/tag	1.4	0.7	28672	True
128	Test 1	tasks/app	2.6	2.7	72351744	False
128	Test 2	tasks/search/main/explore	1.8	3.0	8192	False
129	Test 0	tasks/main	2.4	3.3	64512	True
129	Test 1	tasks/tag	2.7	1.3	25165824	False
129	Test 2	tasks/app/categories	2.2	2.2	37888	True
129	Test 3	tasks/posts/categories	2.2	1.8	37888	False
129	Test 4	tasks/search	1.4	0.6	31744	False
129	Test 5	tasks/categories/blog	1.1	3.1	8192	False
129	Test 6	tasks/posts	2.4	1.7	73728	False
129	Test 7	tasks/category/main/explore	2.9	2.6	29360128	False
130	Test 0	tasks/tag/tags/explore	2.1	2.5	89088	False
130	Test 1	tasks/list/category	1.1	2.0	61865984	True
130	Test 2	tasks/tag	2.0	0.8	45056	True
130	Test 3	tasks/list/app	2.6	3.4	100352	True
131	Test 0	tasks/categories/app	2.1	0.9	62914560	False
131	Test 1	tasks/blog/explore/wp-content	2.3	3.3	40960	True
131	Test 2	tasks/explore/tag	2.5	0.9	92274688	False
131	Test 3	tasks/blog	1.6	2.7	58368	False
131	Test 4	tasks/category/category	2.9	2.3	37748736	False
132	Test 0	tasks/blog/main	2.4	2.6	28672	False
132	Test 1	tasks/main/tag/search	2.1	0.5	57344	False
132	Test 2	tasks/search/list/tag	1.2	2.7	103809024	False
132	Test 3	tasks/categories/list	2.4	1.6	49152	False
132	Test 4	tasks/app/tag	2.7	2.5	37748736	False
132	Test 5	tasks/tag/tags	2.4	0.9	47104	True
132	Test 6	tasks/search/category	1.8	2.2	66560	False
133	Test 0	tasks/tags	1.3	1.9	86016	False
134	Test 0	tasks/search/list	2.1	2.2	93323264	True
134	Test 1	tasks/search	1.0	2.2	38797312	True
134	Test 2	tasks/blog/search	1.9	3.1	96256	True
134	Test 3	tasks/wp-content/app	2.2	2.3	14336	False
134	Test 4	tasks/categories/blog	2.8	3.0	84992	True
135	Test 0	tasks/main/tag	1.5	3.3	60817408	True
136	Test 0	tasks/tags/explore	1.4	0.9	36700160	False
136	Test 1	tasks/tags	2.8	1.6	70656	True
136	Test 2	tasks/tags/list/app	2.6	2.2	41943040	False
136	Test 3	tasks/wp-content	1.8	3.2	33792	True
136	Test 4	tasks/posts/search/posts	2.7	2.7	32768	True
136	Test 5	tasks/tag	1.8	2.2	31744	False
136	Test 6	tasks/app/category/app	2.7	2.5	63963136	False
136	Test 7	tasks/main	1.0	2.0	58720256	True
137	Test 0	tasks/app/tags	1.1	0.7	72351744	True
137	Test 1	tasks/main/blog	1.0	0.9	21504	False
137	Test 2	tasks/blog/main	2.6	1.0	52428800	True
137	Test 3	tasks/search/list/category	1.1	3.2	13312	False
137	Test 4	tasks/posts/main/tag	1.6	1.2	8192	False
137	Test 5	tasks/category/categories	1.7	1.5	98304	False
137	Test 6	tasks/tags/categories/explore	2.2	2.4	94208	True
137	Test 7	tasks/categories/app/category	1.7	2.9	98304	False
137	Test 8	tasks/category/wp-content/tags	2.4	1.4	58720256	True
138	Test 0	tasks/tags/app	2.8	2.2	62914560	True
138	Test 1	tasks/categories	2.3	1.1	59768832	False
138	Test 2	tasks/tag	2.2	1.6	45088768	False
138	Test 3	tasks/app/categories	2.1	0.7	66560	True
139	Test 0	tasks/search/categories/search	2.0	1.4	10485760	True
139	Test 1	tasks/posts/blog/wp-content	2.7	2.4	84934656	False
139	Test 2	tasks/search/wp-content	2.7	2.8	78848	True
139	Test 3	tasks/list	1.1	3.3	63488	True
139	Test 4	tasks/blog/blog/list	1.1	1.3	24576	False
139	Test 5	tasks/posts	1.7	1.9	25600	True
140	Test 0	tasks/wp-content	1.6	2.0	42991616	True
140	Test 1	tasks/search/categories/main	1.4	2.8	78848	False
140	Test 2	tasks/tags/tags	1.3	1.1	24576	True
140	Test 3	tasks/search	1.4	2.5	102760448	True
140	Test 4	tasks/explore	2.2	1.9	52428800	True
140	Test 5	tasks/categories	2.2	2.7	76546048	True
140	Test 6	tasks/tags	1.3	3.0	18432	False
140	Test 7	tasks/search/search	1.4	0.9	78643200	True
140	Test 8	tasks/main	1.4	2.7	22528	False
140	Test 9	tasks/search/blog	1.7	1.0	88064	False
141	Test 0	tasks/explore/explore	2.9	2.9	54525952	False
141	Test 1	tasks/categories	1.7	2.8	23068672	True
141	Test 2	tasks/search/main	2.1	0.9	67584	True
141	Test 3	tasks/wp-content/app	2.7	3.3	76546048	True
141	Test 4	tasks/category/tag	2.4	3.2	12582912	True
141	Test 5	tasks/main/search/tag	2.7	1.3	23068672	False
142	Test 0	tasks/categories/main	2.0	2.8	88080384	False
142	Test 1	tasks/main/app/categories	1.3	0.7	84992	False
143	Test 0	tasks/list	1.0	3.3	34603008	True
143	Test 1	tasks/wp-content/blog/tags	1.0	2.3	85983232	True
144	Test 0	tasks/blog/categories	2.1	1.0	16384	True
144	Test 1	tasks/posts/main	2.9	1.1	58368	False
144	Test 2	tasks/explore	2.5	3.3	35840	True
145	Test 0	tasks/posts	2.0	3.2	29360128	True
145	Test 1	tasks/main/posts/tag	1.2	1.7	76800	False
145	Test 2	tasks/tags/app	2.2	1.1	46080	True
145	Test 3	tasks/search/blog	1.8	2.9	3072	False
145	Test 4	tasks/search/wp-content/blog	1.3	1.4	63963136	False
145	Test 5	tasks/categories/tags	2.9	2.5	57671680	True
145	Test 6	tasks/search	1.4	1.3	29360128	False
146	Test 0	tasks/blog	1.1	0.9	84992	True
146	Test 1	tasks/search/app	2.2	1.7	88080384	False
146	Test 2	tasks/categories/category/wp-content	1.5	3.4	37748736	True
146	Test 3	tasks/search/posts/list	1.5	0.7	93323264	True
146	Test 4	tasks/tag	2.4	2.7	90112	False
146	Test 5	tasks/blog	1.8	2.2	76800	True
146	Test 6	tasks/blog/wp-content/main	2.3	2.2	61440	True
146	Test 7	tasks/category/search	1.5	2.1	8388608	True
146	Test 8	tasks/posts/main/blog	2.0	0.7	101711872	False
147	Test 0	tasks/categories/list/tag	1.5	0.8	6144	False
147	Test 1	tasks/search	1.4	0.9	102760448	True
147	Test 2	tasks/posts/wp-content	2.7	2.9	52428800	False
147	Test 3	tasks/blog/tag	2.3	3.1	52428800	True
147	Test 4	tasks/wp-content/main	2.3	2.7	89128960	False
147	Test 5	tasks/posts/wp-content/main	1.7	2.8	23552	True
147	Test 6	tasks/blog	1.4	2.8	11264	True
147	Test 7	tasks/category	1.4	2.0	20971520	True
148	Test 0	tasks/tags/tags	2.9	2.0	2048	True
148	Test 1	tasks/wp-content/list/wp-content	2.2	3.1	63963136	False
148	Test 2	tasks/wp-content	2.2	1.2	47185920	True
149	Test 0	tasks/app/tag	2.7	2.7	49152	False
149	Test 1	tasks/wp-content/wp-content/wp-content	2.0	0.8	66560	False
149	Test 2	tasks/search/tags	2.3	1.6	96468992	False
149	Test 3	tasks/list/search	2.7	2.9	1048576	False
150	Test 0	tasks/main/app	2.9	2.6	59392	True
150	Test 1	tasks/list/app/categories	2.8	0.6	6144	False
150	Test 2	tasks/list/category/main	1.4	2.2	49283072	False
150	Test 3	tasks/main	2.0	1.3	22020096	False
150	Test 4	tasks/categories	2.6	3.2	33554432	False
150	Test 5	tasks/category/wp-content/list	1.9	2.1	23552	False
150	Test 6	tasks/search	2.6	2.2	102400	False
150	Test 7	tasks/main/tags	2.1	0.5	46137344	False
150	Test 8	tasks/categories	2.9	1.1	8192	True
150	Test 9	tasks/tags	1.7	0.9	11534336	False
151	Test 0	tasks/categories/blog	1.6	2.9	4194304	False
151	Test 1	tasks/tags	1.6	3.2	11534336	True
151	Test 2	tasks/blog/list	1.8	0.8	8388608	False
151	Test 3	tasks/list	2.6	2.8	98304	False
151	Test 4	tasks/category	1.8	2.3	28672	True
151	Test 5	tasks/posts/posts/main	2.0	2.0	83886080	True
151	Test 6	tasks/posts/categories	2.1	3.0	74752	True
152	Test 0	tasks/category/wp-content	2.2	2.8	72704	False
152	Test 1	tasks/explore/blog	1.4	1.4	4194304	True
152	Test 2	tasks/category	1.9	1.5	14336	True
152	Test 3	tasks/categories/app/posts	1.5	0.7	31744	False
152	Test 4	tasks/category/app	1.6	1.0	31457280	False
153	Test 0	tasks/blog/wp-content	2.5	1.1	95420416	False
153	Test 1	tasks/category/main/explore	1.3	3.4	89128960	True
153	Test 2	tasks/explore/blog/tag	2.3	1.8	30720	False
153	Test 3	tasks/list/blog	2.9	2.7	36864	False
153	Test 4	tasks/blog/tags	2.2	2.1	17825792	True
153	Test 5	tasks/tag/search/posts	1.3	2.6	102400	False
153	Test 6	tasks/wp-content/main	2.8	2.0	89128960	True
153	Test 7	tasks/posts	2.0	3.4	35651584	True
154	Test 0	tasks/posts/search/posts	1.6	2.5	37748736	True
155	Test 0	tasks/list	1.7	1.9	55296	True
155	Test 1	tasks/search/category	2.2	1.5	100352	True
155	Test 2	tasks/tags	2.1	1.1	90112	True
155	Test 3	tasks/blog/tags/list	1.9	1.9	40960	True
156	Test 0	tasks/tags/search	1.9	0.8	15728640	False
156	Test 1	tasks/list/list	2.2	1.3	92274688	False
156	Test 2	tasks/wp-content	1.4	3.4	16777216	False
156	Test 3	tasks/category	1.2	2.6	69632	True
156	Test 4	tasks/blog/app/explore	1.0	2.9	55574528	False
156	Test 5	tasks/category/blog	1.3	0.7	25165824	True
156	Test 6	tasks/explore	1.0	1.1	78643200	True
157	Test 0	tasks/categories/blog	1.2	2.2	84934656	True
157	Test 1	tasks/category/main	1.1	1.7	33792	True
157	Test 2	tasks/explore/wp-content	1.8	2.4	94371840	True
157	Test 3	tasks/categories	2.0	2.3	10485760	False
157	Test 4	tasks/list/app	2.2	3.4	21504	False
157	Test 5	tasks/wp-content/tags/list	2.9	1.9	36864	False
158	Test 0	tasks/tag/app	2.9	1.6	45088768	True
158	Test 1	tasks/blog/blog	2.2	1.4	47185920	True
158	Test 2	tasks/search	2.9	2.0	76800	False
158	Test 3	tasks/wp-content/category	1.0	1.5	44032	True
158	Test 4	tasks/list/category	2.3	3.0	27648	True
158	Test 5	tasks/explore	2.9	3.0	8192	False
158	Test 6	tasks/blog/categories/explore	2.4	2.7	47185920	False
159	Test 0	tasks/explore	2.8	2.3	82837504	True
160	Test 0	tasks/blog	2.3	2.3	43008	False
160	Test 1	tasks/tags	2.9	2.0	56320	True
160	Test 2	tasks/tags	2.3	2.1	40894464	True
160	Test 3	tasks/category/tag/list	2.1	2.0	27648	True
160	Test 4	tasks/categories	2.5	1.3	1024	True
160	Test 5	tasks/app	2.6	2.7	91136	True
160	Test 6	tasks/explore/search	1.8	2.1	63963136	False
160	Test 7	tasks/tag/app	1.3	1.4	79691776	False
\.
COPY task_results (submit_id, task_id, status_id, points, summary, execution_time, used_memory) FROM STDIN;
14	481	4	0.5	\N	1.0	360448
186	779	3	0	\N	1.8	3319808
162	817	6	0	Again quality organization nearly less analysis score data.	2.0	5872640
68	649	7	0	\N	1.0	3765248
289	71	4	0.6	\N	1.6	6772736
24	809	4	2.3	\N	0.9	4178944
155	451	4	1.4	\N	0.6	6105088
89	598	4	1.5	\N	1.4	2242560
284	609	8	0	\N	1.9	7262208
175	522	4	2.0	\N	1.5	539648
238	608	4	2.9	Century example into.	1.7	2676736
282	413	4	2.3	\N	0.9	4850688
209	401	4	1.5	\N	1.4	6482944
169	348	4	1.8	Town born live TV up number list.	1.5	1027072
148	421	4	1.4	\N	0.8	7856128
237	27	4	1.5	\N	1.4	794624
39	200	1	0	Out learn close begin become.	0.7	2356224
126	11	5	0	\N	1.3	4852736
266	776	4	2.9	\N	0.8	4460544
287	141	4	2.3	\N	1.7	6340608
85	9	8	0	\N	1.8	5995520
299	402	3	0	Cut modern carry trial.	1.9	792576
9	37	4	1.1	\N	1.0	2264064
243	441	4	1.5	\N	1.7	564224
11	221	4	1.1	\N	1.7	3082240
140	376	1	0	Surface produce case firm beat specific.	1.3	5586944
72	671	6	0	\N	1.6	989184
95	356	4	2.7	Price certainly free rather.	0.6	3435520
196	283	4	2.3	Manager step brother interview character.	0.8	6073344
242	302	10	0	\N	1.7	519168
90	106	10	0	Beautiful how about start.	1.6	5172224
195	414	4	1.3	Turn test society watch treat.	0.9	1610752
225	714	4	2.4	Building boy recognize wind control easy car president.	1.3	1983488
289	59	6	0	Wait teacher lawyer job you. Responsibility personal issue program someone involve.	0.8	5666816
251	145	4	1.7	\N	1.6	514048
70	232	4	1.4	\N	1.0	5002240
115	99	4	1.4	\N	0.8	3809280
246	474	4	2.9	Remain born just mind.	1.5	1525760
36	194	7	0	Our bill ready seem attention detail he.	0.9	6974464
62	731	4	1.8	Common yet heavy different quality billion close.	0.9	5240832
278	682	3	0	Job leg point enjoy. Republican it program it mother.	0.9	1173504
149	426	4	1.8	Sea outside agency. Alone poor phone issue.	1.6	7981056
78	260	4	1.4	\N	1.3	3439616
287	150	4	2.8	\N	0.9	1230848
33	551	4	1.8	Single course onto strong eight partner fish.	0.6	4872192
196	291	4	0.3	Month method benefit company various should attack.	1.5	210944
221	469	4	1.4	Lose agency listen reason. Send hand drop right blood improve.	0.8	5494784
111	342	4	1.7	\N	1.2	300032
161	789	7	0	\N	1.0	2501632
121	709	9	0	\N	1.3	4558848
276	826	4	2.6	\N	1.0	7740416
214	218	9	0	\N	0.7	855040
72	666	8	0	\N	1.9	3424256
129	566	6	0	Film nearly operation owner deal book message. Together table head trouble.	1.8	7953408
186	770	4	2.2	Home bar end. Wife they same same.	1.7	7371776
12	224	4	2.3	Professor herself president sit base early one.	1.5	3015680
291	292	4	1.2	\N	1.9	224256
171	846	10	0	Institution relationship recent true today resource reveal.	1.1	4087808
45	9	4	2.0	\N	1.2	7411712
98	718	4	1.6	\N	1.6	592896
307	401	4	0.2	Piece five its onto.	1.0	7928832
137	470	4	1.0	\N	1.4	4274176
25	494	8	0	Key consider admit hit yourself.	1.5	5635072
64	206	4	2.9	Public modern three.	1.1	4085760
272	752	4	1.7	\N	1.4	4129792
288	838	4	0.2	\N	0.6	1815552
307	392	6	0	And produce gas social would cup mother.	0.9	8206336
305	687	1	0	Hot entire network model forward.	0.7	421888
70	216	4	1.8	World that produce point matter seat.	1.1	423936
264	135	4	1.0	Important suddenly way parent energy Republican line study.	0.7	7445504
282	404	4	1.6	Relate company approach control first.	1.4	8217600
10	638	8	0	\N	1.1	3270656
125	141	8	0	Her customer every adult especially.	1.6	4287488
211	839	4	1.9	Season discussion operation.	1.5	6018048
284	611	4	0.3	Figure employee knowledge control.	1.6	714752
160	184	6	0	\N	2.0	3168256
81	793	1	0	\N	1.5	6523904
162	836	4	2.1	Their create go first charge.	0.7	5203968
221	485	10	0	\N	0.9	7912448
262	660	4	2.7	Agree sort relate say difficult.	0.7	1059840
98	723	9	0	\N	1.3	5886976
134	142	3	0	Of few young contain.	1.3	3945472
31	302	7	0	Detail important song we.	0.5	2184192
258	323	4	1.3	\N	0.7	2521088
29	808	6	0	Area because onto tell capital. Positive card into then example plant whom always.	0.9	6981632
175	499	4	2.9	Student face attack action much food section. Situation sign group.	1.2	4623360
311	340	10	0	Through national certainly.	1.5	6108160
184	878	4	2.3	\N	1.7	2833408
299	393	10	0	\N	1.3	8005632
246	487	3	0	Name impact strong.	1.5	1202176
266	781	1	0	\N	0.9	3270656
274	78	10	0	Ago build well leave section. Away easy eye wish arm consumer.	1.0	7521280
170	368	4	1.6	Offer relationship community arm along consider movement.	0.7	6763520
283	27	4	1.5	Note eat moment yet rich.	0.6	2458624
283	17	4	0.5	\N	1.1	7515136
262	663	4	0.4	Hour simple treat in by. Grow occur onto movement major life.	1.6	4781056
19	300	1	0	\N	0.6	7249920
152	822	10	0	\N	1.7	2552832
64	208	4	1.1	\N	1.6	1939456
216	655	4	2.9	Bring school process various care institution wear. Time truth music indeed part else might.	2.0	1443840
252	274	4	2.8	American write case week away region wall soon.	0.9	5744640
3	93	4	1.8	\N	1.2	1084416
276	827	6	0	\N	0.9	1539072
196	285	4	1.2	\N	1.4	2155520
156	39	4	0.5	\N	1.9	7510016
217	272	7	0	\N	0.9	6311936
174	347	4	2.6	\N	0.9	5821440
128	120	3	0	Parent another son material carry citizen.	1.4	5885952
131	848	4	2.8	Me red so miss free.	1.5	850944
269	443	3	0	Worry these compare east future we everybody.	1.0	6035456
197	881	10	0	\N	1.9	1423360
208	553	5	0	\N	1.2	6242304
232	343	4	2.0	\N	1.5	2869248
91	680	4	1.6	Operation state of crime hit book much option.	1.6	3777536
106	147	4	2.7	Mean night drug.	1.1	1899520
294	448	4	2.8	Writer his key listen nature program manager.	0.9	5096448
61	745	1	0	\N	1.8	4913152
93	730	4	2.4	Will remain above rise book country.	1.3	3407872
248	658	1	0	\N	1.9	4122624
281	442	4	2.7	Voice boy power Mr. Possible rate discussion wonder walk lawyer day.	1.0	3936256
272	751	4	1.6	Note measure shoulder management none consider lose.	0.6	5472256
300	740	10	0	Different almost wear artist establish.	0.5	5783552
45	1	5	0	Teacher teacher stop source tonight.	1.1	4066304
185	789	4	2.0	Approach candidate expect I learn.	1.2	5948416
110	3	6	0	Pattern morning price window kid.	1.1	6515712
298	709	4	2.6	\N	0.5	2520064
274	84	8	0	Possible painting word however part why maintain. Now recent event commercial then rate tonight peace.	0.7	6943744
174	340	9	0	Win yeah street benefit imagine baby take act.	1.2	2598912
177	214	1	0	Understand white letter analysis agent involve all.	2.0	6720512
308	851	4	1.7	\N	1.1	315392
176	495	4	0.9	\N	2.0	3421184
192	738	8	0	\N	0.8	4950016
221	480	10	0	Option letter one section travel view.	1.2	1367040
195	411	1	0	Sister bed building page realize minute.	2.0	4592640
127	66	4	2.0	\N	1.6	4226048
15	626	3	0	Behavior west travel never order.	0.9	4726784
62	714	6	0	\N	0.9	5921792
255	82	4	1.2	\N	1.2	8216576
140	384	4	2.2	Total discussion table write subject yard always friend.	1.4	5158912
160	168	4	1.4	Low born between argue.	0.6	5595136
302	541	4	2.0	\N	2.0	517120
4	341	5	0	Type left speak. Section room drop practice less career.	1.8	5782528
60	347	7	0	\N	1.8	987136
92	708	4	2.4	\N	0.8	1863680
217	270	5	0	\N	0.5	1823744
80	258	8	0	\N	1.3	3572736
99	3	4	1.6	\N	1.7	6028288
216	647	4	1.4	\N	1.4	497664
73	406	4	1.4	Detail foot sing.	1.8	5836800
79	848	3	0	Realize challenge contain above chair morning.	1.1	7371776
193	520	7	0	Receive to response occur begin low data.	1.0	1906688
221	492	4	0.4	Last choose box foot.	1.6	1526784
305	701	4	1.3	\N	1.9	2888704
5	633	4	1.7	\N	1.3	6466560
301	340	4	1.7	Senior charge memory coach perhaps. Computer here attorney rule.	1.7	1321984
264	139	4	0.1	Service cup specific later eight bad.	0.8	357376
217	263	4	0.0	Research plant quality argue draw.	1.3	4645888
197	872	4	2.0	Though develop save say where. Situation education marriage career without economy work hope.	1.5	1609728
100	711	3	0	Five table rise condition second option.	0.6	2910208
176	496	1	0	\N	0.6	6208512
122	447	4	2.6	\N	1.8	3902464
91	676	4	1.8	Together number to may value.	1.1	3923968
106	149	9	0	Condition no popular exactly build so popular. Way expect enter this create.	2.0	8131584
175	503	4	1.8	\N	1.8	4652032
59	701	7	0	Truth challenge Mrs.	0.7	5541888
1	112	4	2.2	Rate trial past popular between. Skin everybody want major dog finish up.	2.0	1192960
291	283	10	0	Foot conference scene common attack every deep.	0.5	7365632
166	318	5	0	Miss year camera.	1.3	2514944
148	404	4	2.0	\N	1.6	6594560
193	519	4	2.6	\N	0.8	6504448
170	369	4	1.6	\N	0.7	4536320
89	591	7	0	\N	1.7	6159360
277	621	6	0	\N	1.2	6650880
106	145	6	0	Tax laugh probably well address.	0.5	3536896
195	427	9	0	\N	1.0	373760
301	344	7	0	Door war join.	1.5	5419008
176	497	7	0	\N	1.8	7545856
268	751	7	0	\N	0.7	5532672
45	5	4	1.0	Worker report shoulder strong author. Her bed conference adult notice.	1.3	880640
43	539	6	0	\N	0.7	1807360
2	347	10	0	Relate face candidate way take style. Charge wait bank manage right right.	1.1	194560
303	341	6	0	Around so apply adult become. Keep relate economic church become.	1.0	4187136
294	458	7	0	Car already bad star short.	1.4	2766848
248	678	4	2.3	\N	0.6	1798144
144	112	4	2.2	\N	1.2	7655424
286	178	4	1.1	Crime cell collection station hundred without pay.	1.7	2016256
262	659	10	0	Center member few.	0.6	3414016
75	102	4	2.6	Husband unit board trade past believe commercial.	1.2	5602304
254	841	4	0.0	\N	1.3	3206144
237	20	4	2.8	\N	1.0	1187840
230	680	5	0	\N	1.2	7919616
88	455	9	0	Learn reality move trouble say.	0.7	3594240
266	766	10	0	\N	1.5	3689472
186	772	4	1.3	\N	1.9	492544
147	302	3	0	\N	1.3	2466816
279	424	5	0	Media view author use television keep animal.	0.7	4706304
13	212	1	0	\N	0.9	3434496
121	710	4	2.2	Camera indeed begin particular play.	1.6	5742592
57	495	4	2.3	\N	0.6	4585472
216	637	3	0	\N	1.1	7138304
104	535	4	1.2	Nature prevent institution size perform month. World light second step light bit.	1.4	6210560
88	459	4	2.5	Might couple those would.	0.9	6331392
255	81	6	0	Friend condition hear moment particular hotel.	0.8	2212864
141	353	9	0	Cause may system need themselves involve east condition. Loss property character water memory authority.	0.6	1528832
282	423	4	1.9	\N	1.8	3863552
200	293	4	1.5	Together mind rule adult hair option marriage.	0.9	6422528
114	493	4	1.8	\N	0.7	1536000
213	567	7	0	Southern activity two mission visit trade.	1.5	4027392
259	852	4	0.9	\N	0.7	366592
10	647	1	0	\N	1.3	8078336
135	277	4	1.8	Family maintain option discuss per.	1.2	4252672
231	496	4	2.5	Catch ever agency ahead prevent team. Continue send small write member require around themselves.	0.6	7505920
161	786	4	2.1	Wish institution practice send me.	1.9	2683904
175	527	1	0	\N	1.9	7156736
179	637	3	0	\N	1.2	5983232
220	45	3	0	Itself news main relate party force military.	1.5	4596736
190	368	4	1.8	Enough whole message child his manager heavy. Gun physical direction development win.	1.4	4710400
104	530	10	0	Doctor candidate item there that something.	1.9	7506944
235	429	4	2.1	Compare avoid side week tend record news. Suddenly arrive serve but worker provide probably.	1.1	1266688
149	414	4	1.3	Including company fine lawyer.	1.8	5452800
74	463	3	0	Off people realize sit scene.	1.7	2918400
80	262	4	2.9	Idea above reduce safe.	1.6	8070144
220	41	4	2.6	\N	1.1	4185088
28	313	5	0	Play behind professional certainly. Public gun seat place.	0.8	5433344
151	117	4	2.8	Economy itself power add service suffer.	1.2	7618560
67	173	4	0.9	\N	2.0	6335488
80	274	4	2.8	Goal size role use. Boy campaign above matter range who.	1.4	2045952
215	508	4	2.7	Interest information well parent arrive capital month clear.	0.7	966656
55	853	4	1.4	\N	2.0	7281664
4	343	1	0	Oil especially wide event success. Political stay each say.	0.9	3720192
251	141	4	2.3	\N	1.6	2496512
293	337	4	2.6	\N	0.9	7990272
115	95	4	2.1	\N	0.6	2009088
131	851	10	0	Wife require none provide near.	0.6	1171456
68	634	4	1.0	\N	0.7	1260544
66	440	4	2.9	\N	1.7	6934528
254	831	8	0	Increase indicate natural tree thousand until.	1.5	1512448
263	434	4	1.8	Lawyer government raise trial opportunity economy whether.	0.9	1928192
228	687	4	2.6	\N	0.6	935936
220	47	7	0	\N	1.4	4267008
265	392	7	0	\N	1.0	2583552
307	395	10	0	Move him special bad close.	1.3	184320
227	659	6	0	\N	0.6	3867648
70	225	1	0	Media meeting reality law boy interest deep.	1.2	3785728
125	135	10	0	\N	0.8	4227072
115	98	4	1.7	Official score consider hope.	1.5	1353728
286	173	4	2.0	\N	1.4	697344
196	293	9	0	\N	0.5	759808
225	720	10	0	\N	1.5	6791168
184	855	5	0	Only health theory a writer glass outside.	0.7	743424
191	749	4	2.6	\N	1.6	3208192
114	492	4	2.0	\N	0.7	4427776
98	716	4	1.9	Only arrive activity over available subject instead.	1.8	1692672
153	89	4	2.9	\N	0.8	6170624
261	406	4	1.9	Her magazine be travel unit.	1.7	5526528
52	338	5	0	\N	1.1	2662400
67	176	4	1.1	\N	1.5	6769664
193	511	4	1.3	\N	1.3	825344
53	755	3	0	\N	0.7	7141376
8	201	4	1.0	\N	1.6	3310592
53	757	4	2.3	Might may to three.	1.2	4094976
138	259	1	0	Mention they himself task read area thing.	1.8	3257344
284	628	4	0.9	\N	1.9	1750016
165	299	4	2.9	Deal heart fish space.	1.1	7108608
215	527	4	0.9	Manager each under vote way.	1.5	7405568
246	489	4	2.8	Until specific wrong none heart everyone.	1.0	8130560
298	720	10	0	White look week enough. Recognize their research century hot would organization people.	0.6	3247104
132	19	4	1.4	Current would subject customer.	1.9	187392
174	342	6	0	\N	0.6	8114176
297	732	4	0.2	Economic deep name blue as probably strategy full.	1.2	3885056
195	426	4	1.8	Newspaper myself add imagine daughter step support.	1.6	1152000
184	873	4	1.8	\N	1.1	7770112
70	221	4	1.1	\N	2.0	7133184
187	216	4	1.8	\N	1.3	8170496
295	607	4	1.2	Federal loss might.	1.2	4615168
196	290	5	0	Local attack her act including thus thank. Size fire me.	1.3	6401024
134	139	4	1.2	Guess child thank their.	1.8	5037056
63	39	4	1.2	\N	1.7	2286592
219	80	4	1.8	Central foot trip collection new. Learn usually focus window phone list.	1.5	4919296
7	368	4	1.8	Certain charge way degree language meet. Foot pick option five capital own.	0.5	6065152
286	171	4	2.1	\N	0.7	5552128
34	786	9	0	\N	1.5	3835904
152	838	4	1.4	Social rise speak affect exactly who.	0.7	2100224
162	839	4	1.9	Strategy detail environmental business.	1.9	439296
144	96	4	2.4	\N	1.3	1217536
134	148	4	2.6	\N	1.5	7556096
137	480	9	0	Night identify design.	1.1	3136512
233	91	4	2.7	Finish show performance like arm. Agency prove particularly.	1.2	1680384
157	211	4	2.5	\N	1.4	3659776
248	669	3	0	Why dark interview. While true goal.	1.9	7046144
47	379	4	1.4	\N	1.1	3832832
182	233	5	0	Watch leg official star action dinner.	1.3	5562368
147	300	5	0	\N	0.9	2473984
143	100	9	0	Population thank tough.	0.7	4360192
193	499	8	0	\N	1.9	1165312
27	740	1	0	Office likely between range. Believe shake culture necessary through hand.	1.4	146432
96	675	4	1.1	\N	0.8	2427904
251	146	4	1.6	Music drive box stock.	1.7	1860608
160	164	4	0.5	\N	1.7	5583872
219	86	4	1.2	\N	0.8	7874560
151	116	4	2.7	Protect note reason bit color.	0.6	2276352
263	440	8	0	Word house season street remain set once.	1.6	4410368
297	724	9	0	\N	1.1	6011904
22	221	7	0	Involve effect yet market.	1.0	4396032
87	439	4	1.7	Actually every chance care part official.	0.5	6740992
282	426	4	1.8	\N	1.6	239616
109	702	3	0	\N	1.3	2408448
93	723	4	1.6	Society mention forget real see.	1.3	4272128
100	716	1	0	Sell head unit. Stop it food water major hot from source.	0.9	7427072
215	523	4	2.7	Nothing would interest over.	1.8	7275520
75	91	8	0	Visit class defense way production suffer price.	1.3	689152
92	715	4	2.9	Agreement successful forward these.	0.7	4518912
266	773	4	1.4	Provide audience way professional. His ground guy.	1.8	5195776
80	277	4	1.8	List between foreign phone such wear region.	1.0	5414912
186	782	8	0	\N	1.9	3083264
46	593	9	0	Look part write body ask nation key.	0.5	4477952
151	122	1	0	Fine minute fund level.	1.5	3941376
308	842	1	0	\N	1.3	7958528
237	15	4	2.5	\N	1.7	140288
310	564	3	0	\N	2.0	6133760
279	407	4	1.4	\N	1.8	419840
121	720	4	2.1	\N	0.7	6474752
287	152	6	0	Under ask big across site participant guy teacher. Image treatment operation machine system commercial threat.	0.7	5815296
7	390	10	0	According note power.	1.7	4615168
247	195	4	1.4	\N	2.0	4150272
55	847	7	0	\N	0.7	2656256
164	522	4	2.0	Plant consider together table Republican now.	1.3	4302848
24	805	1	0	\N	1.4	5877760
152	825	10	0	Food rather newspaper resource blue above or.	1.1	4981760
252	270	4	2.2	\N	0.5	2765824
245	378	4	0.9	Base eat capital yard fill less.	1.9	1057792
85	4	10	0	\N	1.3	8260608
146	558	10	0	\N	1.4	1648640
306	529	4	1.4	Quickly court difference himself use perform.	1.6	857088
141	364	7	0	\N	1.8	442368
151	121	4	1.1	Final choice enjoy night all.	1.6	3171328
168	315	4	1.4	\N	1.1	6198272
311	342	4	1.0	\N	0.7	7701504
54	405	4	2.6	Put system wear good statement dog energy.	0.7	1780736
17	196	3	0	\N	0.9	850944
140	369	9	0	\N	1.6	3665920
306	542	10	0	More government almost goal industry record main hope.	1.4	4133888
232	342	5	0	Give sort particularly ground pick station purpose. Spring board both worker area future.	0.8	7298048
49	789	10	0	Machine her event green story. Ground blood fill better chance.	1.5	6433792
287	143	4	1.0	\N	0.8	3951616
230	670	4	2.2	Computer former again himself who science.	0.9	3216384
109	681	7	0	Half morning star improve market. Democrat may mother song education.	0.7	5336064
172	843	10	0	\N	0.8	4928512
258	316	4	1.4	\N	1.7	8151040
22	218	6	0	Until few citizen effort behavior.	1.8	7144448
130	3	4	1.6	\N	1.6	2643968
112	372	4	2.0	\N	1.7	1929216
208	549	4	1.9	Size gun shake threat power agent where.	1.3	1639424
283	25	5	0	Cost partner always cost authority establish interview.	1.7	488448
68	651	8	0	\N	1.8	4024320
228	688	4	2.1	Record no raise hotel.	1.4	1313792
26	325	4	1.4	\N	1.6	2855936
166	306	4	2.9	\N	1.1	4090880
27	745	4	2.7	\N	1.7	6048768
44	70	4	2.5	Drug community many how.	1.4	2910208
295	604	4	2.7	\N	1.9	4049920
44	72	3	0	Role wife sister food stop voice clearly.	1.9	4135936
116	78	4	2.2	Expect blood here traditional.	0.9	4454400
118	456	4	1.3	Former better both collection. Base her she open knowledge.	1.7	4649984
288	839	7	0	\N	1.2	228352
202	446	4	1.1	Cost case trade then suffer knowledge.	1.0	7912448
252	255	4	0.8	Finally majority reduce floor.	1.9	2767872
78	280	8	0	\N	1.7	2689024
137	478	4	1.6	\N	1.8	5018624
164	500	4	2.3	Hour other three contain traditional.	2.0	2949120
308	853	4	2.1	\N	0.7	1417216
54	407	3	0	Mr value world financial will.	0.6	4851712
101	734	7	0	\N	0.9	2305024
72	659	4	1.1	Assume final range sure inside yard.	1.9	652288
30	675	4	1.0	Course administration agent her. Top avoid together likely build.	0.5	1178624
59	682	4	1.8	Subject power no real agent.	1.5	4471808
97	796	5	0	\N	1.5	5668864
22	229	4	2.0	\N	0.6	6705152
86	528	10	0	\N	1.6	7372800
206	395	4	2.3	History Congress charge current even perform.	1.3	5234688
70	220	6	0	\N	0.6	7099392
230	678	4	2.3	Response realize last power. Explain modern total relationship work magazine.	0.7	5583872
156	46	3	0	Heavy food must. Kid sea sell plant range.	1.3	5028864
30	668	4	1.2	\N	1.8	2010112
204	625	4	1.1	\N	0.7	2002944
75	90	4	1.8	Class part field concern among either camera. Consumer lay than high step sport team.	1.7	8209408
23	248	4	1.2	Customer keep address I street attorney up.	1.3	451584
34	792	4	0.5	\N	1.2	6078464
79	853	4	2.1	These national I customer address project.	1.6	3244032
245	367	4	2.4	\N	0.9	1336320
222	455	4	0.5	Job man him worry quite popular.	1.5	6487040
84	582	5	0	Financial born hear let. Like finish leg same feeling new.	1.7	7226368
160	189	4	1.0	\N	0.6	5158912
10	641	4	1.8	\N	1.2	3479552
135	261	4	2.1	Everyone several business economic.	1.3	7896064
237	31	9	0	Would agency side head. Prevent garden station feeling gun over myself material.	0.7	7821312
14	467	4	2.3	\N	1.4	274432
168	316	6	0	\N	0.9	6441984
278	704	9	0	\N	1.6	5415936
278	689	4	1.5	\N	1.4	6985728
67	185	6	0	\N	1.0	2460672
100	717	9	0	But news and research space approach radio as. System college land value word.	0.9	7172096
211	821	4	2.8	Mouth seem style huge avoid.	1.4	6421504
45	4	4	2.0	Analysis job determine government green.	1.8	8100864
175	518	4	0.6	Girl now down avoid improve.	1.7	3622912
133	773	4	1.4	Card quality although far prepare talk take skin.	1.9	7563264
294	456	9	0	To face smile page require.	1.1	3397632
228	702	4	2.5	Reduce president personal main song fly mission.	0.6	244736
193	501	10	0	Article great very work. High size executive budget long myself international.	0.8	4385792
15	623	4	2.5	Fill long sing song camera treat fine partner.	1.6	5708800
94	334	4	0.5	\N	1.4	3964928
41	193	4	0.7	\N	1.3	2291712
143	111	4	2.2	Test participant history artist hit.	1.8	6686720
100	723	4	1.6	Appear record nor bar. Similar list popular tonight laugh.	2.0	1384448
263	433	5	0	\N	1.6	4715520
119	337	7	0	\N	0.8	2835456
53	748	9	0	\N	1.9	3207168
116	80	4	1.8	\N	1.7	7810048
280	721	4	2.3	Partner such continue although natural.	1.6	5836800
104	536	10	0	\N	2.0	2130944
134	136	4	0.2	Fact reveal evening age by method sign now.	1.3	1684480
137	485	1	0	Door whether young price.	1.3	6847488
54	415	1	0	\N	1.3	7101440
156	38	4	2.2	\N	1.1	1932288
47	370	4	0.0	\N	1.3	807936
67	188	1	0	\N	0.8	4992000
114	472	4	1.7	\N	1.0	1187840
164	518	9	0	Their crime line check century.	1.6	137216
161	794	4	2.9	\N	0.7	2237440
227	674	3	0	House case become book.	0.5	6902784
253	805	1	0	\N	0.8	6695936
244	764	4	1.1	\N	0.8	2859008
23	244	10	0	Allow cost sit color tree else rise.	0.8	875520
53	751	3	0	\N	0.6	6223872
3	97	7	0	\N	1.1	5688320
170	367	4	2.4	\N	1.7	3345408
121	724	4	2.9	Amount fish dream Congress that trade. Power father skin this involve.	0.6	1496064
59	689	7	0	Partner check degree walk why.	0.6	147456
80	278	8	0	Five poor account wonder bank guess yard modern.	1.0	4639744
218	753	4	2.0	\N	1.7	7778304
130	4	4	2.0	Best hold himself win office threat small.	0.6	5047296
87	431	4	1.0	\N	1.5	7102464
224	38	4	2.2	\N	2.0	6506496
211	820	1	0	Site south try successful turn along. And newspaper those yourself much suddenly.	0.6	5015552
179	647	4	2.2	The country far send various strategy minute.	0.7	8101888
201	850	4	1.3	\N	2.0	6948864
61	746	6	0	\N	1.6	4354048
73	409	4	1.0	Let defense number too service evidence through. Although everybody trial bank form tax themselves.	1.4	788480
7	372	1	0	\N	1.5	6782976
59	686	4	2.8	\N	1.4	5477376
75	108	4	2.5	Race actually southern education.	0.7	181248
139	553	7	0	Debate value may care whom.	0.9	4443136
21	340	8	0	Good help first get decide smile parent line.	1.0	7157760
112	389	4	1.2	\N	1.0	6398976
268	753	10	0	\N	1.5	3921920
214	226	1	0	\N	1.7	819200
11	214	4	2.3	\N	0.7	5607424
214	228	4	1.7	View politics serve will smile save political down.	1.4	6074368
277	624	9	0	\N	1.9	711680
308	854	4	1.9	Day professional small research. Lay understand especially.	1.4	7573504
101	737	4	2.8	Everybody simple without it health provide suffer. Edge chance sing attorney amount travel sign upon.	0.8	3654656
22	215	4	2.1	Congress property maybe party explain.	1.1	787456
306	528	4	1.2	Arm old speak measure friend win crime rich.	1.1	7657472
69	795	9	0	Similar especially nearly.	0.9	5764096
73	405	4	2.0	\N	1.9	4199424
59	706	5	0	\N	0.8	3790848
103	190	7	0	Should next follow while political. Produce almost until onto site media pretty.	1.4	5324800
268	763	8	0	\N	1.6	5108736
253	798	4	1.5	Court suggest live each child growth.	0.9	545792
216	631	4	1.9	\N	1.0	5379072
245	387	6	0	\N	1.4	7704576
3	98	4	1.7	Administration way international mind think director never oil.	1.2	787456
283	23	8	0	\N	1.3	2743296
190	382	5	0	\N	1.9	7230464
91	678	1	0	\N	2.0	7012352
94	336	4	1.0	Success design from operation.	1.9	2024448
283	32	10	0	\N	1.7	3709952
210	460	4	2.2	\N	0.9	462848
122	444	4	2.4	Not pay ball.	1.0	2092032
64	198	4	2.1	\N	1.0	7393280
134	152	8	0	Man woman play land.	1.7	4468736
266	783	4	1.3	Almost fund push factor.	0.7	5122048
141	352	4	2.3	\N	1.3	5863424
162	813	4	2.9	\N	1.7	3174400
145	350	4	2.5	Concern present where administration hold spring.	1.3	7549952
233	93	4	1.8	\N	1.5	8051712
8	196	4	2.8	\N	1.1	2685952
112	390	7	0	\N	1.4	2434048
1	106	4	2.0	Themselves fear than.	2.0	670720
104	532	4	1.1	White case far rest a there perhaps.	1.6	4503552
156	54	4	2.7	\N	1.2	3907584
197	858	1	0	\N	1.7	1757184
125	138	4	0.5	Society back ability effect past.	1.1	7760896
32	594	4	0.7	\N	1.2	3574784
135	262	4	2.9	\N	1.3	611328
270	145	4	1.7	\N	1.3	8167424
46	594	4	2.0	Never coach account religious again mean trade suffer.	0.7	3274752
80	275	10	0	\N	1.4	1998848
162	826	4	2.6	\N	1.7	856064
96	663	4	2.1	\N	1.8	7333888
301	343	4	2.0	Law toward whatever among.	1.1	7703552
28	319	4	1.2	Avoid tonight although.	1.6	2421760
15	625	1	0	\N	1.5	3588096
200	286	4	2.3	\N	0.7	7917568
85	6	4	2.0	\N	0.7	1031168
54	420	4	1.9	Arm same interest spend American affect system.	1.5	164864
177	221	4	1.1	\N	1.2	2766848
300	736	4	0.3	\N	0.7	3052544
229	49	4	1.4	Treatment himself expect. See star building.	1.5	3008512
252	259	1	0	\N	1.5	4425728
6	700	10	0	\N	1.3	5223424
311	345	10	0	\N	0.7	3312640
90	111	4	2.2	\N	1.8	265216
150	417	4	2.4	\N	1.4	1805312
276	819	4	2.7	\N	0.7	1976320
269	440	7	0	\N	1.3	1989632
67	187	9	0	Bag add this than suffer energy program career.	1.6	887808
195	410	4	1.4	\N	0.7	2570240
97	808	4	2.3	Better your current ever work.	1.6	6798336
124	347	4	2.6	\N	2.0	4859904
118	459	4	2.5	Public person under day carry writer community off. Leg mouth general may reason personal bed.	1.1	4887552
309	387	7	0	\N	1.5	3139584
302	533	5	0	Card stock hotel small start foreign church.	1.1	2846720
287	142	6	0	\N	1.2	7729152
77	400	6	0	\N	1.0	355328
298	710	10	0	\N	1.3	5932032
170	372	7	0	Training public pick process.	0.8	4123648
298	727	4	1.2	\N	1.5	3740672
6	684	10	0	Who particular scientist.	1.8	2548736
166	322	4	0.1	\N	1.1	1685504
222	447	4	2.6	\N	1.4	1490944
116	75	4	2.5	\N	0.7	2993152
40	94	1	0	\N	1.8	7628800
229	38	1	0	\N	0.9	7048192
264	150	6	0	\N	1.4	3259392
133	776	4	0.6	\N	1.8	5101568
113	508	4	0.0	\N	1.0	3482624
89	590	3	0	\N	0.9	3979264
14	479	10	0	\N	0.6	5062656
160	165	9	0	\N	1.5	2436096
218	764	4	1.1	\N	0.9	3163136
198	850	5	0	\N	1.9	7173120
248	670	9	0	Upon even network wear arm. Less whether much customer.	1.0	7717888
167	847	5	0	Economic pull side network continue fight rather bar.	1.0	4194304
220	43	4	1.7	\N	1.5	7450624
227	665	10	0	Executive political room these born government. Season evidence explain concern talk individual current.	1.7	1594368
61	735	4	0.3	\N	1.2	7178240
138	265	4	2.3	Level work nature always. Investment stand fly.	1.1	7699456
224	49	3	0	\N	2.0	3380224
307	393	4	2.6	Treatment meeting play career write half.	1.0	5946368
221	488	1	0	If hair suggest act interview yeah citizen early.	1.6	1704960
146	572	10	0	\N	1.4	2085888
195	424	4	2.7	\N	1.8	6895616
193	510	4	1.4	Much fish effort meeting source effort benefit.	1.9	4466688
141	349	4	1.4	Gun early series how election remember. Base research since entire.	1.9	2894848
282	425	9	0	Smile my letter little care save require do. Charge they off notice authority religious.	1.3	6157312
179	645	4	1.3	Book day pass home help exactly.	1.4	4099072
259	846	4	2.2	Available enter with.	1.9	6078464
73	428	6	0	Kind it voice special. School away reach should suddenly newspaper fear.	1.9	7646208
173	275	7	0	Of very customer score far behind.	2.0	7732224
239	240	4	2.0	\N	1.0	1042432
227	672	4	1.8	\N	1.7	5977088
39	201	4	1.0	\N	0.7	6516736
142	544	4	2.8	Trouble share economy. Physical benefit start light far.	0.7	5659648
73	413	4	2.3	New thank degree human during recognize why.	1.3	4775936
33	544	4	2.8	\N	1.5	3099648
21	347	9	0	\N	1.4	611328
62	713	9	0	Approach nearly recently security begin. Remember gun Congress talk imagine.	0.6	6256640
56	532	4	2.3	Together join letter drive.	1.5	6154240
207	423	4	1.9	Situation meet recognize none.	0.7	2011136
193	498	9	0	\N	1.5	8254464
74	478	4	1.6	\N	1.5	3028992
152	816	7	0	Certain own throughout of.	0.5	7587840
197	866	1	0	Bank together agreement bar religious quite recent.	1.2	5100544
11	233	4	2.2	\N	0.5	820224
1	99	4	1.1	\N	1.6	4346880
164	508	8	0	\N	1.0	2599936
152	828	3	0	\N	1.2	911360
100	724	4	2.9	\N	2.0	1675264
295	605	4	1.2	\N	1.0	414720
27	737	4	1.1	Serious provide democratic contain only.	1.1	816128
40	105	4	1.7	Program government be public put truth. Memory city cost piece.	1.2	3638272
238	614	4	2.6	Suffer contain miss upon least line blue discuss.	1.9	5476352
248	676	5	0	Cause identify hope letter represent cut growth break.	1.9	4245504
116	83	4	2.6	\N	0.6	1515520
99	12	4	1.3	\N	0.8	5137408
286	182	6	0	Left nearly my century sea mission unit.	0.7	5056512
35	213	1	0	Cold clear yourself member maintain cultural while.	1.1	3465216
246	486	7	0	\N	1.3	2973696
59	705	4	1.4	Issue reason really can next.	1.9	3264512
257	292	3	0	\N	0.8	7102464
145	351	4	1.0	Position serious most address east movie understand. Subject attorney full many.	1.1	7785472
87	436	4	2.7	\N	1.0	7239680
115	104	10	0	\N	0.5	3795968
269	436	5	0	Lot why use health despite.	0.5	4779008
197	883	4	1.3	Me television high read.	1.4	7951360
12	232	7	0	Article black reduce spring sense though. Child a analysis rate radio system wall.	0.9	6459392
101	738	4	0.7	\N	1.1	4382720
193	500	7	0	Run firm son walk.	1.9	7147520
265	403	7	0	\N	1.6	6841344
120	593	4	0.2	\N	1.3	1206272
138	281	4	1.5	\N	0.8	6866944
54	417	4	0.5	Analysis consider tend sell.	0.7	5131264
293	336	5	0	Book certainly have what account.	1.2	5316608
197	882	1	0	\N	1.7	2076672
124	340	4	1.7	\N	1.3	7549952
73	424	7	0	Only while head during blue.	1.9	1203200
286	187	4	1.9	And can various green author.	1.9	7431168
130	7	4	1.4	\N	1.8	4000768
296	430	3	0	Best treat stage remember. Role most sort themselves could.	1.7	513024
262	662	4	2.2	\N	1.4	238592
224	54	4	2.7	\N	1.2	6693888
44	71	4	1.9	\N	1.8	449536
190	372	5	0	Pay sister style mention board prevent.	1.0	492544
204	628	4	1.2	\N	0.7	4438016
150	419	8	0	Past else growth buy on recognize rich that.	0.6	295936
127	72	4	2.6	\N	0.9	3365888
253	796	4	1.1	Tonight short language scene space.	1.1	4578304
153	88	6	0	Team interest future attorney. Do this final.	0.8	897024
209	397	4	0.2	Bar nothing provide risk inside process six.	1.8	3424256
9	23	6	0	Half maintain executive gas fight.	1.5	5419008
11	224	10	0	On history likely know voice finally cup.	0.6	5916672
287	134	4	2.0	\N	2.0	6159360
172	853	4	1.4	\N	1.7	5106688
32	593	4	1.4	Test many law draw treat thousand difference.	0.7	5170176
115	108	4	2.5	\N	0.8	4691968
50	236	1	0	\N	1.1	2434048
150	407	5	0	\N	2.0	6243328
125	139	8	0	\N	0.8	5200896
124	344	4	2.9	\N	0.7	5956608
276	817	4	2.0	Stage relationship bed owner.	1.6	1818624
173	265	4	2.2	\N	1.2	6838272
4	344	8	0	\N	1.7	3262464
130	8	3	0	\N	1.8	1853440
10	636	8	0	\N	0.8	5053440
217	264	7	0	\N	0.9	2322432
181	791	4	2.2	Yet security source price main natural.	0.7	5890048
175	502	4	2.4	\N	1.1	3819520
252	254	4	2.0	\N	1.4	3791872
207	410	4	1.4	Once far cultural one.	1.1	1676288
275	219	4	1.2	\N	0.5	5399552
79	849	4	2.0	Development visit amount. Various choice official movie.	1.0	4796416
186	778	4	1.2	Pull live other very.	1.7	2739200
45	7	4	1.4	\N	1.3	7725056
56	533	1	0	Commercial investment international where health finally its.	1.8	1260544
161	795	4	1.4	\N	1.2	2235392
91	667	4	0.0	Western quickly threat avoid behind turn character.	0.7	4652032
215	503	4	1.2	Heart parent question between responsibility another.	1.9	2908160
173	256	4	1.9	Onto big head American bank raise.	0.9	516096
217	256	5	0	\N	1.3	2185216
272	763	4	1.1	\N	1.4	1823744
72	673	3	0	\N	1.6	2749440
78	269	4	2.4	\N	1.9	5007360
86	535	8	0	\N	1.3	3838976
151	129	10	0	Onto material nearly himself experience. Choice from light concern.	1.3	1971200
222	458	4	0.7	\N	1.4	7027712
257	285	4	1.1	It trouble himself fight skill join help.	1.9	5671936
190	379	10	0	\N	1.3	7991296
72	680	7	0	Commercial line risk source modern suddenly herself.	0.7	4826112
163	300	5	0	\N	1.2	346112
245	368	8	0	\N	2.0	6787072
175	521	5	0	\N	1.4	4496384
187	225	9	0	Partner none inside outside friend some.	1.8	1118208
221	486	4	2.4	\N	1.4	7206912
267	743	4	2.7	His improve operation doctor through represent.	0.6	5557248
277	623	4	2.3	Level protect message brother she.	1.8	6903808
229	52	4	2.5	Though discover evening direction particularly break.	2.0	4963328
241	52	1	0	Out adult such discover sure style probably.	0.6	5441536
137	483	4	0.7	Task smile know type site.	0.6	6443008
168	331	9	0	Opportunity term between return local. In opportunity another term least pay land.	0.9	7030784
149	410	10	0	Time cup art speech east seem important.	1.6	908288
271	194	4	2.9	\N	1.8	3591168
71	38	5	0	What total too travel they.	0.8	6462464
290	399	4	2.2	\N	2.0	1648640
251	147	4	2.7	Personal power voice quite control fact continue.	1.1	6339584
121	717	5	0	Movement who buy main simple stuff most.	1.8	764928
200	287	4	2.8	Dream through child national.	1.4	906240
239	249	4	1.5	Audience maybe street arrive age.	0.7	681984
109	682	9	0	Impact practice surface author campaign.	1.7	6947840
299	395	10	0	Long cause conference. Recent happy late really seek space agent.	1.8	5655552
33	546	5	0	\N	1.7	5387264
14	487	4	1.5	Listen society least meet against join your. Special practice federal plant.	0.7	8152064
160	188	4	0.3	\N	1.1	3577856
106	150	4	2.8	\N	0.7	861184
15	614	5	0	Late condition job at. Shoulder design they member strong leader.	0.7	7461888
68	633	7	0	\N	1.6	4172800
3	102	8	0	\N	1.0	407552
93	725	6	0	By fast responsibility third including region much against.	1.6	5081088
202	451	8	0	For media fine toward during science bag.	1.4	8108032
288	831	8	0	Appear same speech until significant natural street. When main late once drive model nor.	0.7	7477248
300	735	4	1.9	Ready try movie go play the.	1.0	2172928
207	424	4	2.7	\N	1.3	5202944
73	418	7	0	\N	2.0	3748864
219	82	1	0	Address late today low trip air its. Identify day budget ahead response force.	1.6	5331968
265	391	4	2.7	\N	0.9	7693312
124	342	4	1.7	\N	0.7	2193408
136	211	4	2.5	Class two former them arm defense official.	0.8	7965696
284	623	1	0	Must admit sure near. History child the whom.	1.9	1490944
15	627	10	0	\N	1.8	997376
118	445	4	2.5	\N	0.7	314368
105	110	4	2.0	\N	1.5	1384448
205	288	7	0	\N	2.0	7171072
309	373	4	1.6	\N	0.7	1247232
16	429	4	2.0	Through offer long phone this reality pressure. Very wonder wonder product point.	1.0	8235008
133	772	8	0	\N	1.3	8225792
14	485	4	1.2	\N	0.9	1542144
148	424	1	0	\N	0.8	7133184
141	362	4	1.1	Goal plant politics collection sea response son.	1.4	1041408
17	208	4	1.3	Always then maybe dinner claim.	1.4	5774336
90	107	5	0	\N	0.8	5600256
105	111	4	2.2	\N	1.3	6223872
193	508	4	1.9	\N	0.9	4865024
304	552	9	0	Same seat rest direction oil moment him.	1.9	4797440
11	222	8	0	\N	1.8	7751680
155	455	6	0	\N	1.2	2240512
118	449	6	0	\N	1.5	7409664
160	173	7	0	Than share language talk money couple husband.	1.9	3650560
108	741	3	0	\N	1.4	1614848
179	651	4	1.6	Several kitchen both attention many activity similar.	0.6	4780032
54	414	4	0.2	\N	0.6	3793920
93	732	4	1.3	Late discuss wife minute professor.	1.5	3363840
173	270	3	0	Meeting across very call professor total raise drug.	1.0	2054144
217	250	8	0	Standard friend identify employee treat. Book building defense positive serious although when.	1.5	3596288
69	788	4	0.3	Economic red beat attack song. Fear service discuss lay dog take consumer.	1.8	3468288
1	93	5	0	Sell fire serve TV two. None Republican return mother section parent support.	1.3	4970496
212	334	4	1.6	True listen character cup nothing. Whom series watch network.	1.9	3209216
109	699	7	0	\N	0.6	5477376
161	792	10	0	Three common land those person including reflect.	2.0	6637568
270	138	1	0	Skin stuff brother customer.	0.7	8031232
157	212	10	0	\N	0.8	5851136
131	849	1	0	Anyone let build possible them. Practice add town blue join.	0.6	354304
217	268	4	2.9	Receive then likely.	1.7	2069504
263	432	4	1.7	Various store or relate fire music special.	1.1	971776
26	312	5	0	\N	1.2	3792896
181	793	6	0	Garden support with choice trial per.	1.2	5401600
189	621	4	2.8	\N	0.8	5700608
197	873	3	0	Pattern special rate your art through consider one.	0.7	3625984
27	744	4	1.8	Southern idea own nice political. Serious crime issue respond important.	1.0	5763072
288	829	9	0	Experience both bring walk. Because point player sometimes quite sort.	0.9	4237312
106	143	9	0	\N	0.5	2410496
201	843	7	0	\N	0.9	3025920
179	650	4	1.3	\N	1.8	364544
209	402	4	1.9	Assume than do recently see usually despite Congress. Citizen street manage father which hope.	2.0	2849792
166	315	4	1.4	Let material fill put garden look.	1.8	5685248
88	451	4	1.4	\N	1.4	7156736
65	210	4	1.4	\N	0.5	4740096
129	556	4	1.7	\N	0.5	5768192
274	89	10	0	\N	1.4	1178624
96	658	7	0	\N	0.8	3714048
146	566	4	1.0	\N	1.5	4182016
207	416	5	0	Authority debate bit community.	0.9	8137728
135	254	1	0	Line civil example parent. State value magazine executive population western.	0.7	7101440
35	210	4	1.4	\N	1.3	4705280
164	521	4	1.4	\N	1.2	7808000
245	372	4	2.0	Herself expect decade several language any goal age.	0.8	5568512
150	414	7	0	\N	1.7	5520384
274	82	3	0	\N	1.0	3696640
248	660	4	2.7	Teacher weight appear direction kitchen.	1.0	4736000
1	109	9	0	\N	1.5	2410496
46	599	4	0.4	\N	1.8	7231488
279	418	4	0.8	\N	0.7	1372160
238	610	4	2.8	\N	1.8	7257088
305	695	4	2.8	Two garden possible class.	1.1	1670144
134	134	4	0.9	Drive art break.	1.3	6808576
278	700	6	0	\N	0.8	2371584
50	239	4	1.4	\N	1.2	2849792
166	329	4	2.6	\N	1.4	6362112
244	757	4	2.3	\N	0.6	7617536
184	862	4	0.4	\N	1.0	4415488
88	454	4	0.8	\N	1.0	4738048
1	96	4	2.0	\N	1.5	1057792
85	14	4	1.9	\N	1.6	160768
61	734	5	0	\N	1.4	3072000
275	218	7	0	Throughout those mission production.	1.3	4200448
286	168	4	0.7	Safe decide adult smile do whether.	1.0	7870464
84	588	3	0	\N	1.2	6453248
49	791	8	0	\N	1.8	2740224
197	875	7	0	\N	0.6	7699456
214	232	4	1.4	Million color will assume wait.	1.6	6324224
108	734	4	1.0	\N	0.6	3454976
306	530	5	0	\N	1.1	8274944
96	669	4	2.6	\N	1.8	2604032
63	40	4	1.3	\N	0.9	3930112
69	790	4	1.2	Last do everybody prove pressure performance tree.	1.4	1555456
11	231	4	1.3	\N	1.7	2538496
55	846	4	2.2	\N	1.3	855040
262	667	4	1.5	\N	1.8	410624
123	770	4	2.2	\N	1.0	4635648
5	637	4	2.9	Thank explain keep him.	0.8	4747264
224	47	5	0	Congress individual little another land all poor lead.	1.9	6406144
43	537	10	0	\N	2.0	6234112
93	712	9	0	Space response team talk only on allow.	0.9	273408
109	704	4	2.4	\N	1.4	5927936
230	676	4	1.7	\N	1.6	7269376
59	683	8	0	\N	1.8	1576960
152	829	4	1.0	Civil by treatment point.	0.8	166912
28	305	4	1.7	On picture to than again pressure continue.	1.1	1800192
104	531	8	0	\N	0.7	3335168
287	146	4	1.6	\N	0.8	2430976
204	618	9	0	Want sea situation attorney movement write upon.	1.9	1785856
100	714	5	0	Congress task cause catch. Hold add relate.	0.9	631808
193	526	7	0	Structure year left. Whatever arrive order field even.	0.7	4871168
28	308	1	0	\N	1.8	4334592
179	654	7	0	\N	1.8	5619712
214	216	4	1.8	Hotel actually agreement far arm grow force.	1.5	7876608
20	346	4	1.3	Bit suggest above when want.	1.5	3960832
254	814	4	2.2	\N	1.3	4914176
184	881	4	2.6	Mother force within between.	0.6	7643136
67	160	7	0	Better score deep quality job.	0.7	5268480
197	863	4	1.1	\N	2.0	1793024
66	436	9	0	Any television yourself against mother Mr some.	1.5	6877184
95	350	6	0	\N	1.6	7821312
257	290	4	2.5	Identify draw accept drive.	2.0	3415040
187	221	8	0	\N	1.7	5355520
300	746	4	0.1	\N	0.9	7982080
6	685	9	0	Security play bank structure recognize. Respond age party check.	2.0	6644736
228	683	4	2.3	Nothing law successful room realize.	1.1	1130496
54	419	8	0	\N	1.0	6789120
97	798	4	1.5	Speak arm strong pattern brother land interview.	1.0	5132288
202	452	10	0	By wide people true. Over size heart price perhaps add.	1.8	3580928
310	556	8	0	Within generation office opportunity. Put test Mr themselves school near worry.	0.6	4055040
6	704	4	2.4	\N	1.8	3233792
252	262	4	2.9	Relationship three inside woman.	1.9	3712000
163	302	4	1.7	Nearly either myself become mention throughout.	1.0	4829184
291	293	4	1.5	\N	1.4	484352
168	303	4	2.4	\N	1.7	3396608
269	431	4	1.0	Tree order sister season care.	1.8	4999168
310	559	3	0	Why theory course never pass.	0.8	477184
208	548	4	1.9	\N	1.0	4167680
101	736	4	2.2	\N	1.2	5343232
63	48	8	0	Customer leg late loss range.	1.9	3510272
6	686	4	2.8	\N	1.4	5144576
207	426	4	1.8	From week sometimes beat some author summer machine.	1.9	7108608
258	324	4	2.2	Center poor long knowledge girl health agreement next.	1.2	935936
209	391	4	2.7	Her budget few when.	1.6	7405568
40	98	3	0	\N	1.6	5085184
30	664	3	0	\N	0.7	3068928
180	540	4	1.0	Resource range choice coach without letter machine discover. Building apply bad age responsibility contain.	1.3	6386688
110	8	4	1.2	\N	1.6	2912256
148	407	1	0	Relate admit animal current.	0.6	2397184
140	387	3	0	Even leave whom life sound.	1.0	2195456
252	252	4	2.4	Off where question. Traditional discover great road pass gas financial.	1.5	6610944
140	382	5	0	\N	1.4	8157184
62	719	6	0	Leave officer operation take party modern maybe.	1.9	3044352
190	390	4	0.8	\N	1.7	5704704
246	491	5	0	\N	1.8	665600
215	510	4	2.5	Employee safe effect reality all life.	1.8	4768768
56	530	4	0.7	Market decade Mrs put impact. Speech region probably win.	1.0	5350400
163	299	4	2.9	Through bag democratic pull news teach behavior.	2.0	8219648
27	742	4	1.8	Yes Democrat staff seem style.	1.7	6877184
166	330	6	0	\N	1.3	894976
26	323	5	0	\N	0.9	8135680
168	319	7	0	Go sea family sort buy three question. Third big question property writer job.	1.5	6563840
187	231	4	1.3	\N	0.7	185344
88	458	9	0	Beyond measure leader suddenly feeling increase second.	2.0	5648384
54	413	1	0	\N	0.6	5401600
44	69	4	1.5	House magazine image paper statement boy various.	1.8	4321280
118	460	4	0.1	Knowledge author consider write put low want.	1.3	5805056
177	231	4	1.3	Range run style practice response strategy.	2.0	2994176
257	283	8	0	\N	1.4	5101568
141	359	4	2.0	\N	1.6	3654656
232	345	4	2.6	\N	1.3	444416
29	800	4	2.4	\N	1.3	6967296
120	591	4	1.0	Form card win grow difference economy white.	1.4	4977664
170	375	4	1.9	Time rise three important truth whatever cell least. Spring break authority give become.	1.2	4930560
67	169	9	0	\N	1.0	6856704
80	281	4	1.5	\N	1.3	1682432
231	497	8	0	\N	1.7	763904
72	662	6	0	Free say measure then.	2.0	6885376
94	339	8	0	\N	1.4	1093632
256	300	4	1.3	Home system stage long. Part keep position issue.	1.8	603136
202	456	4	1.3	\N	0.7	5944320
9	28	4	0.3	\N	1.8	7665664
191	762	4	2.7	\N	1.4	3426304
306	535	10	0	\N	1.4	3340288
143	113	4	2.8	Stay price wrong huge night century baby.	1.1	3203072
144	101	4	2.6	\N	1.1	3845120
120	603	3	0	So note short rule.	1.3	2627584
143	112	5	0	Military side program time land common.	1.1	7690240
62	717	5	0	\N	1.7	3181568
113	520	8	0	Four have while best already.	1.9	2392064
196	296	8	0	Close difference interesting education policy matter do whatever.	1.2	1041408
25	495	4	2.3	\N	1.3	1583104
288	819	10	0	Management pressure health structure listen feeling. Church after simply party special.	0.7	7373824
90	96	8	0	\N	1.6	5652480
140	373	4	0.2	Represent arrive south.	1.5	1392640
182	222	5	0	Card senior with theory. Up apply never practice side four able.	1.5	3918848
255	75	4	2.8	Growth letter evening collection.	0.7	450560
237	21	7	0	\N	1.0	3964928
6	683	4	2.3	\N	1.0	1126400
87	432	10	0	Student particular support play. Recent great soon feel teach keep.	0.8	4446208
239	245	10	0	\N	1.4	3385344
190	378	3	0	Side western clear trade decade ground but.	1.6	1127424
228	681	4	2.0	Number girl continue.	1.9	4495360
196	284	4	2.8	\N	1.0	4262912
210	461	4	2.4	Situation care itself work while include best thing.	0.6	2989056
256	302	9	0	\N	1.4	2779136
233	101	5	0	\N	1.3	2693120
92	723	9	0	Upon meeting sister point child.	0.9	5780480
263	442	4	2.7	Quality every who type.	0.5	6896640
69	787	4	2.9	\N	1.2	2916352
6	695	4	2.8	Hear believe service tax rise skin. Question notice almost skill and tough civil.	1.7	1858560
87	430	4	1.3	\N	1.6	1747968
207	418	6	0	Dream fast piece pass her sure foot. Avoid drop people former individual.	2.0	6016000
228	696	5	0	Your call generation police surface.	1.7	925696
288	841	4	1.6	Wife federal avoid. College law somebody environment that never impact.	0.5	5056512
214	223	10	0	\N	0.9	1345536
284	616	9	0	She short music ahead whose ahead.	1.3	2023424
217	275	4	0.7	\N	0.5	3903488
175	513	10	0	They Congress land enough recognize than.	1.2	7013376
204	626	4	1.7	Better everybody experience rise become onto study.	1.3	7236608
144	93	4	0.5	Cold strong very writer book.	1.5	4446208
257	284	10	0	Majority sport style against.	0.7	708608
258	314	9	0	Authority box talk spend fact figure. Democrat available describe return entire set officer.	1.4	456704
252	282	4	1.0	\N	1.3	2612224
262	672	4	1.8	\N	1.2	557056
262	677	4	1.4	Less way onto kind person forward partner. Health chance exist Mrs artist value environmental.	0.5	5719040
114	487	4	1.5	\N	1.6	3890176
295	600	5	0	Through call top my citizen everyone result water.	0.9	1373184
42	496	4	2.5	\N	1.3	1947648
26	316	4	1.4	Nearly us similar certain special.	1.0	4243456
227	671	6	0	Firm place kid thus finally.	1.0	4509696
85	8	1	0	Fish town Mr quality own music responsibility politics.	1.6	3729408
266	767	4	1.4	\N	1.1	3257344
78	271	1	0	\N	1.9	8051712
246	467	4	2.3	Old relationship wide that stage get.	1.2	2057216
202	458	4	1.2	Chair detail mind can then line wide.	1.2	2862080
17	202	6	0	Fall some factor agree behavior doctor.	0.9	1547264
228	704	1	0	Cultural certainly trip stand strong election.	0.8	2427904
284	614	4	2.6	\N	1.4	4325376
93	716	4	2.1	\N	1.4	3476480
247	204	4	1.8	\N	1.1	4258816
51	206	4	0.7	Someone compare firm.	1.6	4244480
104	543	4	0.1	Fund economy science employee right might.	1.9	2333696
185	788	9	0	Or worker others particular budget before north. Thus require bill may choose.	1.8	1415168
132	15	4	2.0	\N	1.0	5137408
298	724	4	1.5	\N	1.0	1985536
288	824	7	0	Ability able foreign put market risk watch.	1.0	2604032
302	531	4	2.5	Certainly bring big set else.	1.5	7666688
309	367	1	0	Information Republican company analysis yes tax movie.	1.6	8226816
205	293	4	1.5	Summer others open them play.	1.1	4274176
73	417	1	0	Compare until the measure general once well specific.	0.6	6575104
89	592	8	0	Accept together easy blood product almost PM let.	1.9	2789376
192	733	4	2.1	\N	1.2	8261632
91	665	9	0	Exist career use court reality past.	1.5	6868992
193	514	4	2.7	\N	1.5	5785600
109	707	10	0	Long particularly only for remain worker.	0.6	8198144
68	647	6	0	Tell camera present like catch put south.	2.0	3107840
112	386	4	2.7	Sometimes kitchen possible century traditional religious she.	1.9	7205888
125	140	1	0	Talk policy control decade building mission experience. Writer such education author best doctor word.	1.9	4553728
32	604	4	2.7	First sense claim value ask event painting look.	0.8	928768
23	247	7	0	Successful cover war election hold shoulder debate player. Rest direction base wind stuff realize.	0.8	4203520
262	666	1	0	\N	0.6	2452480
309	379	4	1.4	Total save collection certain month. Color individual instead PM.	1.8	4685824
263	438	4	1.9	Listen if others describe feeling. There team all than mouth.	0.6	4096000
229	53	4	0.4	Present option describe art television.	1.7	4217856
246	493	9	0	\N	1.7	7958528
73	426	5	0	Those bring top.	1.8	4341760
105	92	4	1.3	Major admit less simple may should mention.	1.9	5863424
154	440	1	0	Dinner evidence themselves support of possible sit. Certain I reach require history approach.	0.9	7797760
44	58	7	0	Theory begin never dream thus when else.	1.7	4353024
248	679	8	0	\N	0.5	4465664
32	601	8	0	\N	1.4	3151872
244	754	10	0	\N	1.3	679936
308	850	3	0	\N	1.9	3337216
15	609	6	0	\N	1.4	5599232
283	33	7	0	\N	1.1	6519808
226	679	4	2.5	Move environmental authority represent.	0.6	3813376
156	51	8	0	\N	1.9	6849536
198	846	4	2.2	\N	2.0	5318656
258	305	4	1.7	Indeed size course cold appear grow group.	1.1	907264
226	675	4	1.1	Impact option arrive very white check job.	0.5	7669760
93	717	8	0	\N	1.4	7434240
241	39	6	0	\N	2.0	8016896
90	105	4	1.7	\N	1.1	6092800
59	696	4	1.2	Believe important economy focus others because almost.	1.5	1917952
89	594	4	0.2	Hot hotel bit first seem plan recognize.	1.4	5123072
286	172	6	0	Less serious writer mean back home significant thank. Toward unit truth fear.	0.7	5876736
226	658	4	2.0	Ability forget positive but green energy movement day. Not field lot side.	0.8	3142656
200	292	8	0	\N	1.9	6490112
211	814	4	2.2	Able material against message add cut remain.	1.7	3150848
216	654	8	0	Behavior impact senior successful there.	0.9	4468736
10	635	4	0.1	Hope really lay model charge six likely.	1.0	6447104
246	473	9	0	\N	1.3	6606848
199	562	4	2.3	\N	1.1	2210816
80	261	6	0	See high almost forward almost.	1.6	4359168
268	759	4	2.1	Next second notice thing.	0.5	4720640
263	437	10	0	Let build deep ready adult check. Before support can.	1.0	7369728
150	413	4	0.0	\N	1.2	2593792
113	505	4	2.8	Stop probably else race.	0.8	7649280
84	576	1	0	Respond spring important interest yes animal character.	1.9	4344832
189	626	9	0	Himself outside ability. Laugh evening on consumer.	0.6	6729728
159	428	4	2.0	From sometimes born let cup. Must break not.	1.1	4279296
20	347	4	1.8	Station although create ever husband.	0.8	3130368
71	48	4	2.1	Chance her service key.	1.4	967680
141	365	5	0	\N	0.8	6948864
267	741	4	2.6	\N	0.7	6789120
43	541	1	0	\N	0.9	7690240
135	251	4	1.9	\N	2.0	412672
185	794	4	2.9	\N	1.1	4715520
299	401	4	1.4	Test send through reveal speak so. Interesting pattern discuss kid.	1.8	1945600
257	294	7	0	\N	0.8	5964800
28	324	10	0	Design music really about finally meeting let.	1.9	4850688
125	145	6	0	\N	1.8	7695360
201	847	10	0	\N	1.1	1662976
198	852	6	0	Old knowledge PM night couple most.	1.9	1464320
240	81	8	0	\N	1.8	933888
150	424	4	2.7	\N	1.5	424960
291	297	6	0	Appear six left anyone wall.	1.4	4047872
267	735	8	0	Thus camera top modern.	1.4	2473984
308	846	4	2.2	\N	1.8	575488
207	406	4	1.9	\N	0.9	5950464
249	345	4	1.1	Become surface agreement believe at.	0.6	4314112
140	385	4	2.7	Contain home building physical site. Decide once without.	0.6	7675904
43	529	4	1.4	Expect team get no street stand age.	1.3	4980736
110	14	4	1.9	\N	0.6	7310336
244	748	4	1.0	Design central ball candidate old tree energy. No source sister eat study.	1.6	4916224
245	380	1	0	Why firm ball put enough serious western agency.	1.9	3132416
194	558	7	0	Truth policy building buy.	1.7	4979712
148	412	4	0.5	Something cut central painting like remember if.	1.9	3802112
197	859	8	0	Ok our here issue Republican from material.	0.9	5008384
262	665	6	0	\N	1.2	6079488
133	781	3	0	Poor total help floor ground.	2.0	5891072
253	799	4	0.3	Natural garden clearly such government. Sit itself level and stay them.	1.7	2438144
137	490	4	2.5	\N	1.1	7025664
170	389	4	1.2	Free fast song reality together treat eye. Around especially time free area.	1.2	2170880
10	652	4	2.3	\N	1.0	4851712
151	119	3	0	Ahead southern yourself draw fear pass.	2.0	6699008
180	538	9	0	Baby with another large. Town to fear people red national.	1.4	8137728
20	345	4	2.6	Miss water event poor father.	1.8	2012160
247	206	10	0	Or thousand here until.	1.8	1093632
67	186	7	0	Me wish in hair economic.	0.7	6638592
258	320	4	2.9	\N	0.6	4014080
215	520	8	0	\N	1.1	6635520
121	723	3	0	\N	0.5	5093376
11	230	6	0	\N	1.6	7673856
63	55	4	1.9	Other interesting current face partner.	1.7	2227200
182	219	4	2.4	Weight must check serve PM.	1.5	5992448
159	420	5	0	Doctor born tree program top week difficult.	1.5	1334272
151	133	3	0	Box stock skin admit.	1.5	6319104
210	462	10	0	Son everyone my remember item. Decade but want heavy space policy.	1.7	4958208
189	615	4	2.7	\N	1.4	5484544
300	734	4	0.1	\N	1.6	7378944
283	37	4	1.1	Particular new sense while much describe friend billion.	1.7	1771520
115	112	4	0.4	\N	1.9	6071296
299	400	7	0	Could relationship movement form.	1.6	4165632
261	408	4	0.6	Want beautiful something front discuss because century guess.	0.8	4662272
258	328	4	0.1	Billion music various fund message plant.	1.5	3298304
255	85	1	0	\N	1.0	6812672
11	218	4	1.2	\N	0.6	7652352
207	421	4	1.4	Up president follow authority one interest wall. Say high we.	1.2	1935360
262	661	1	0	\N	1.7	6597632
10	632	4	2.5	She of fire.	1.2	2548736
64	201	5	0	\N	1.3	7784448
310	557	10	0	\N	1.2	3820544
167	846	3	0	Young still follow long nature style suddenly.	2.0	5901312
70	223	4	2.4	\N	0.7	2638848
154	433	4	1.1	\N	1.8	3360768
96	674	4	1.6	\N	0.5	1656832
290	392	4	2.0	Across business around responsibility. Federal number offer Mr of plant.	0.8	2853888
268	764	4	0.3	Offer second this set theory.	1.0	3681280
4	340	4	1.7	Ground current thing well skin plan body environmental.	1.7	6446080
118	458	4	1.2	\N	1.3	303104
61	743	6	0	During thus she white minute effort. American national reality view card prove seek.	1.4	2471936
72	668	4	2.8	\N	1.8	1825792
168	317	1	0	\N	1.4	450560
197	876	4	2.3	Little wait meeting this analysis simple. Region word season generation.	1.7	5485568
210	455	4	0.4	\N	0.6	1847296
14	475	4	2.3	People pretty pretty meeting.	1.8	6489088
193	513	4	2.2	\N	2.0	7393280
70	229	4	2.0	\N	1.1	3491840
28	326	7	0	Notice third upon.	1.8	3229696
78	261	9	0	With class where sound hospital. Ground much order very our bed level live.	1.6	4817920
59	699	4	2.0	Half rather moment foot here capital. Us trade phone technology wear economic nature beyond.	1.9	5262336
250	299	4	2.9	Five people reveal others fish large represent information.	1.0	6673408
132	17	7	0	Play chance benefit full air. Spend go move thought.	1.2	3607552
190	377	4	2.0	Civil a data available put my difficult.	1.1	6406144
21	344	1	0	Live thought difficult film reflect generation bed.	1.5	5752832
45	13	5	0	\N	1.7	7164928
40	101	8	0	Quite laugh nature anything physical food include.	2.0	5283840
258	310	4	1.4	\N	1.2	2174976
254	830	6	0	\N	1.2	5689344
112	368	7	0	Fall surface responsibility discuss ten southern choice.	1.7	1755136
177	227	4	2.6	\N	1.8	6499328
135	268	4	2.9	Walk top movement control.	1.8	1373184
297	720	4	2.1	Sing production notice long point mind lot.	1.0	1351680
245	371	4	2.9	Beautiful form area. Challenge arrive home field.	1.1	3976192
6	681	4	2.0	System military important offer me fill always.	1.2	6365184
75	105	7	0	Speak party bag eight recently see.	0.6	4186112
143	107	4	1.2	\N	1.6	463872
218	749	6	0	Challenge industry another open.	1.6	1724416
59	681	4	0.6	New when agree life carry. Office true sound themselves we drop tend bill.	0.6	5520384
26	332	4	2.5	Great win up some.	2.0	695296
100	713	1	0	Century third window two involve wife citizen will.	1.4	425984
192	742	3	0	Help thought city dinner power discover foreign.	1.9	5202944
56	539	10	0	Any world expect attention.	1.0	4412416
90	110	4	2.0	\N	1.5	711680
170	378	4	1.2	\N	1.5	3960832
216	630	4	2.3	According move option environment after among nearly much.	0.8	7433216
182	216	8	0	Audience six necessary shake mean spend.	1.2	5415936
187	215	4	2.1	Contain attack type play.	1.3	7441408
22	216	4	1.8	\N	1.0	3427328
59	707	4	1.8	Notice because to new always picture visit amount.	0.9	887808
160	179	4	2.7	\N	0.9	3633152
233	113	5	0	\N	1.4	361472
241	56	8	0	Performance on with authority behind show popular read. Allow apply sometimes likely child individual.	1.8	6904832
11	225	3	0	Woman mention citizen.	1.5	4695040
172	849	4	2.0	\N	1.4	6391808
245	373	4	0.4	\N	1.3	3375104
92	714	4	2.4	\N	1.4	5756928
90	95	4	2.1	Something treatment history page thousand fact reason officer.	0.7	1943552
44	63	6	0	\N	1.4	3274752
47	390	7	0	The international determine western fall bit. Sense or discover rock.	0.9	6625280
270	143	4	1.0	Tonight bill usually commercial themselves.	0.9	6689792
184	864	4	1.2	\N	0.7	5535744
162	815	4	1.3	Though wear treatment which north and.	1.9	7996416
117	337	4	1.3	Form bring hand stock condition.	2.0	5259264
221	479	4	1.3	More major strategy political.	1.7	2742272
86	537	1	0	Investment serve hear amount term national this.	1.2	3087360
123	769	7	0	\N	1.5	7104512
264	140	6	0	Blood staff usually since.	1.3	2739200
297	712	4	1.4	\N	1.4	5993472
73	412	10	0	\N	1.1	5656576
194	563	9	0	\N	0.7	730112
20	340	3	0	Too word along economic shoulder cell music.	1.0	3566592
245	374	8	0	\N	1.4	7369728
43	530	8	0	\N	1.2	5361664
279	427	1	0	\N	1.3	3140608
30	665	4	1.3	Many father my interesting foot wait class across.	1.3	4380672
297	725	4	2.4	\N	1.1	6508544
261	412	7	0	\N	1.6	3771392
125	150	1	0	Responsibility catch care media note board personal.	0.8	6381568
275	216	4	0.5	Leg and find cold red own particular finish. Join yard world society perform.	0.7	5108736
170	376	4	1.8	Behind body fear try attack book.	1.0	1456128
261	410	10	0	\N	1.5	914432
200	294	8	0	\N	1.5	7887872
229	44	4	0.1	When old long research face.	1.0	4989952
62	708	4	2.4	\N	1.0	1306624
118	462	4	1.0	\N	0.9	2300928
200	290	4	2.5	\N	0.6	407552
182	230	4	0.5	\N	1.2	1514496
141	351	6	0	Material fly admit generation pick.	1.2	1715200
173	272	10	0	Reality suggest tax change leader while.	0.9	6486016
12	228	4	1.7	\N	1.5	2525184
45	14	7	0	Along big later four.	1.9	6793216
114	491	4	1.5	Debate man agency ask mouth understand program record. You how second pick able.	0.5	8273920
147	299	4	2.9	\N	0.5	7360512
202	445	4	0.8	Any five single sometimes medical face.	1.8	3935232
276	832	4	1.8	\N	1.1	1272832
229	47	4	2.8	\N	0.7	4359168
1	92	4	1.3	Not including student new.	1.8	7748608
221	471	1	0	\N	1.7	6639616
173	252	4	0.0	\N	1.0	4408320
218	765	5	0	He interview onto author view.	0.7	7739392
139	552	6	0	\N	1.0	4193280
113	507	7	0	\N	1.9	2922496
135	281	4	1.0	Own yes minute.	1.2	7273472
104	539	3	0	\N	1.1	3800064
248	666	7	0	Yeah far employee pull become.	1.8	1027072
112	378	9	0	\N	1.8	6765568
26	309	4	0.3	Smile over administration throughout debate against.	1.3	5486592
57	497	4	2.4	\N	1.3	8109056
294	447	10	0	Bad company interest run. Affect something behavior indicate service increase scene remain.	1.2	4661248
230	674	1	0	\N	1.9	4502528
69	793	4	0.2	Force social six its people feel those.	1.6	8117248
285	495	4	2.3	Treatment wind enough all bill.	0.9	5323776
63	56	4	2.9	\N	1.5	5360640
77	396	3	0	\N	1.1	2672640
304	544	1	0	Ready kitchen financial about.	1.4	5626880
168	325	4	1.4	Reach figure young matter behind sport operation. Government listen decade thing develop new rather service.	0.8	5809152
48	341	4	1.5	\N	1.4	5422080
60	346	4	1.3	\N	1.5	6652928
310	561	4	0.5	\N	1.1	7323648
305	693	5	0	Force feel black everyone small.	0.7	7133184
178	212	4	0.9	\N	1.8	1710080
40	99	10	0	\N	0.7	5042176
246	468	3	0	\N	1.8	6972416
146	570	5	0	\N	1.3	2924544
167	850	4	1.6	\N	1.9	7209984
203	788	4	2.5	Message available big.	0.5	5360640
309	390	4	1.3	\N	2.0	1924096
276	825	6	0	\N	1.1	8031232
9	16	4	2.5	\N	1.0	102400
181	789	4	2.0	Price skill lose name build that simply best. Month data wish.	1.6	4097024
98	720	4	2.1	Do measure get anyone break situation.	1.9	3872768
127	62	4	0.7	Later author letter medical if throughout receive.	1.1	8071168
63	43	8	0	Lawyer piece star.	1.8	2905088
237	25	4	0.1	\N	0.7	2191360
97	799	4	1.5	Alone if late year old idea.	1.6	5095424
89	599	4	1.3	\N	1.2	7061504
146	554	4	2.6	Find score personal network today only dinner.	0.8	441344
210	454	5	0	Himself source air many heart.	1.1	1714176
17	198	4	2.1	Technology community performance professional.	1.6	1570816
285	494	6	0	What foreign husband teach next tree effort.	0.6	2532352
290	397	10	0	\N	1.6	1716224
34	791	6	0	\N	1.6	4100096
44	59	1	0	Reduce wish until fish.	1.7	620544
80	282	4	0.5	\N	1.1	2470912
211	828	4	2.9	\N	1.7	4024320
50	245	4	2.1	\N	2.0	8096768
141	356	4	2.7	\N	0.7	5448704
144	103	4	0.7	Daughter relationship education hit tend on.	1.0	2297856
77	397	4	0.2	\N	0.6	8153088
280	709	4	2.7	\N	0.7	3587072
298	723	7	0	\N	1.6	1002496
175	520	1	0	Model apply life second pay open he. Book determine work top hundred rise.	1.1	5620736
129	571	4	1.4	Oil owner report they evidence.	0.8	691200
199	555	1	0	\N	0.6	7843840
221	466	10	0	\N	0.9	5024768
26	322	6	0	\N	1.7	6249472
86	533	4	1.7	\N	1.1	1210368
134	151	4	1.3	On house around strategy leader reach.	0.5	3961856
221	468	4	2.8	Similar certain enjoy range anyone kitchen. President collection poor include win.	0.9	4938752
90	112	10	0	Hospital within soon many performance want.	1.0	6659072
286	186	6	0	Affect job great employee section.	0.7	6592512
229	43	4	0.4	\N	1.8	2885632
79	844	4	2.3	\N	1.0	3473408
72	675	9	0	Statement whom different give method town sit.	1.0	6476800
60	345	9	0	\N	0.6	339968
207	422	10	0	\N	1.1	5102592
122	446	7	0	\N	1.4	1829888
26	315	4	1.4	\N	1.2	3718144
109	685	4	1.4	\N	0.8	604160
268	752	10	0	Audience able left near both today attorney.	1.8	4467712
70	218	4	1.2	Account particularly world.	1.5	6403072
166	314	4	1.0	Management recognize nature reality. Position cause five vote.	1.2	1060864
15	621	4	2.8	\N	1.0	8266752
270	152	9	0	Sea something certain peace pattern. Ok that but state.	0.9	3106816
121	727	4	1.2	\N	1.8	4029440
241	40	4	1.3	\N	1.1	6502400
272	758	10	0	Water son and major tree.	1.3	1418240
172	846	4	2.2	\N	1.0	2195456
15	608	4	2.9	\N	1.2	204800
197	865	4	2.0	\N	1.6	2844672
272	760	4	2.0	\N	0.7	4708352
97	806	4	0.1	\N	0.8	6857728
149	428	6	0	\N	1.6	4301824
80	266	4	2.1	Test bill tonight finish chance cold.	0.7	4756480
162	823	4	2.0	\N	0.9	7589888
246	476	4	2.6	Stand order table yes view something. Religious sit until including sure author.	1.9	3573760
140	370	8	0	\N	0.6	5628928
290	402	9	0	Gun simply yet arrive already seven morning.	0.9	4898816
288	821	4	2.8	\N	0.8	4150272
252	256	4	1.9	Machine or some.	1.0	6317056
158	211	7	0	Body series finally us say administration show.	1.1	3172352
230	661	4	2.3	Social car let. With relate final way upon story.	1.3	1285120
186	769	4	1.3	\N	1.7	571392
140	380	4	1.0	Land attack team common skill form wind. Home suggest peace fight less.	1.5	6982656
168	308	4	2.7	Traditional unit pull threat. Matter really kid better floor give small.	1.6	5262336
278	692	4	1.2	\N	0.8	3450880
84	587	1	0	Nearly game know child size toward.	0.5	5977088
10	648	4	2.0	Project impact oil both them despite. About cultural whatever consider particular different wrong too.	1.8	3176448
195	412	4	1.6	Color marriage care visit she doctor.	1.5	2151424
32	600	9	0	Finish way design western suggest. Risk relationship through music Congress.	0.8	3550208
207	407	4	1.4	Ball organization scientist relate. Around third star recognize participant color.	1.9	663552
160	154	5	0	\N	1.9	1374208
289	58	4	0.6	\N	1.1	3039232
175	498	10	0	Energy but if fire reflect woman want short.	1.3	2785280
223	429	4	2.1	\N	1.7	7265280
29	796	4	1.1	Adult author when practice room reflect down. Lawyer car recently trial despite suffer exactly.	1.1	684032
92	713	4	1.1	Eight research try travel admit use edge.	1.0	3148800
114	465	6	0	\N	1.9	5698560
9	33	4	1.3	\N	1.7	5806080
31	299	3	0	Level dream order his. Tend mean catch image majority board.	0.9	7473152
277	627	9	0	Spring truth interest.	1.0	2036736
32	591	1	0	Goal camera cultural goal crime design.	0.7	4203520
265	400	7	0	\N	1.2	2370560
134	143	4	1.0	\N	0.9	7512064
253	811	4	0.1	\N	1.5	854016
74	470	1	0	\N	1.1	513024
62	722	9	0	When strategy they great.	2.0	5203968
309	377	4	0.3	\N	0.8	2679808
184	875	3	0	\N	1.3	8005632
288	820	6	0	She government another model.	0.6	245760
282	415	5	0	\N	0.9	3476480
10	640	7	0	\N	0.6	617472
194	559	4	2.3	Into stock thing always any.	1.8	7430144
268	755	8	0	Down air word source. Cultural have item east training loss.	1.8	6548480
210	444	4	2.4	Amount ahead over later add leg. Number magazine sound.	1.5	585728
229	50	4	1.4	Sea too our artist girl itself almost.	1.9	3979264
159	424	4	2.7	\N	0.9	7056384
105	90	4	0.5	Maybe couple maintain site science contain paper.	1.7	2713600
85	7	3	0	You better none police star.	0.5	5106688
121	712	4	1.4	Drug save along.	1.7	2934784
138	276	4	2.2	\N	1.3	7497728
120	605	4	2.8	\N	0.6	2128896
211	840	9	0	Stop notice decision threat community my southern.	1.7	4927488
98	727	4	1.2	\N	1.9	8152064
143	93	4	1.6	\N	1.9	5345280
67	166	4	0.4	\N	2.0	952320
240	80	4	1.8	\N	2.0	2021376
262	676	9	0	\N	1.0	7143424
267	734	4	1.0	Science new two guess challenge off.	1.6	798720
58	496	5	0	\N	0.7	7045120
78	259	6	0	Teacher maybe item piece free six cause. Yourself whole guess stage next dream.	1.1	575488
153	77	10	0	\N	1.6	1169408
255	87	7	0	\N	1.3	2674688
276	814	4	2.2	\N	0.7	1114112
234	429	4	2.1	\N	1.1	333824
237	23	6	0	\N	1.0	1846272
189	622	4	2.4	\N	1.2	7182336
149	421	4	0.4	\N	1.5	5466112
201	852	6	0	\N	1.3	4299776
299	399	6	0	Must feel rather fight attack.	1.0	2384896
41	191	4	0.8	Reduce conference anything campaign executive so.	0.9	1212416
71	51	7	0	\N	1.0	6217728
130	1	4	1.8	Among standard another memory.	0.9	735232
182	221	9	0	Know much purpose language also western south ground.	1.6	4460544
198	854	4	0.7	\N	0.6	2299904
201	854	4	1.9	Line determine training several.	0.7	3994624
250	302	4	1.7	Various top television what member part.	1.4	391168
304	551	4	1.8	\N	1.6	3167232
59	688	4	2.9	\N	1.6	4939776
297	717	9	0	Make plan pass first same. Audience price other cause trial movement about.	0.8	7891968
205	295	1	0	American professional responsibility easy. Number fact job shake PM.	0.6	4445184
2	344	4	2.9	To property skill threat important listen parent.	1.7	3584000
80	279	3	0	\N	0.9	2728960
95	353	10	0	Sport leg until hope risk paper.	1.9	1848320
204	611	4	1.6	\N	0.9	312320
259	854	9	0	\N	1.0	8082432
106	137	4	1.8	Such per production choice garden there difference writer.	1.4	7769088
162	827	4	2.1	\N	0.8	2256896
8	205	10	0	\N	0.9	670720
156	47	4	2.8	\N	1.3	7311360
261	418	3	0	Start unit matter set. Organization site conference central friend present.	1.5	5626880
211	817	4	2.0	Say dinner forget painting political. Never maybe Republican scene begin simple.	1.2	3435520
226	667	4	1.2	Statement common here each increase week.	1.0	3005440
115	100	4	2.7	\N	0.6	4481024
227	676	6	0	Off conference image present task wife.	0.8	8097792
5	635	6	0	\N	1.4	3969024
74	467	4	2.3	Standard prove exist my share move.	1.2	1042432
128	131	10	0	\N	1.8	7274496
74	487	4	1.5	\N	0.5	8091648
135	274	4	2.8	Language conference everything person three under another future.	1.4	2189312
173	251	9	0	Own population think interest defense personal sign. Support either Democrat best.	1.7	8020992
233	106	6	0	Choose participant appear determine mouth exist tree girl.	0.9	147456
270	147	3	0	Question fine want watch dinner still. Time somebody out manager kitchen today hundred.	0.6	2750464
120	595	4	1.0	Six born sell main first onto.	1.1	468992
47	367	4	2.4	Knowledge early its stay word quickly power answer.	1.0	6749184
6	690	4	1.0	Reason item all bed what foot. Image data add lawyer.	1.5	2403328
135	256	3	0	\N	0.8	3404800
288	834	1	0	Buy treat institution whom carry.	1.9	4035584
159	406	8	0	\N	0.9	6797312
205	297	10	0	\N	0.7	4001792
15	616	3	0	Candidate long sometimes bring crime lead quickly. Address lay trouble law play guy rest.	0.5	5480448
28	323	7	0	Age see however group.	1.5	5146624
297	722	4	2.5	\N	1.4	4436992
237	19	4	0.7	\N	0.6	6529024
29	798	4	1.5	New where say tough carry.	1.3	7016448
62	718	1	0	\N	1.5	7580672
142	547	8	0	\N	0.7	6564864
308	847	4	1.3	\N	0.6	6201344
229	42	4	2.8	\N	0.8	8117248
150	425	4	2.6	Top too themselves perhaps. Industry player what sign old manage western.	1.1	7636992
257	297	4	1.0	\N	1.6	6608896
282	416	4	2.1	\N	1.5	7495680
221	473	4	2.3	Medical center reduce evidence.	1.4	4312064
193	515	4	1.5	Add under up.	0.9	6810624
196	297	4	2.5	\N	1.8	6418432
209	395	7	0	\N	0.8	6505472
134	153	6	0	\N	1.2	5169152
217	253	4	1.2	Scientist soldier million child indicate center pretty. Old within increase put miss.	1.3	2278400
233	97	1	0	\N	1.0	2459648
106	139	4	0.5	\N	1.3	4286464
208	545	5	0	Suggest deep church all large need kid. On different industry seem source these make.	0.5	3149824
59	695	4	2.8	\N	1.3	272384
205	294	4	2.8	\N	1.4	7596032
205	289	4	2.4	Yard surface smile what set issue couple. Discuss source political pressure machine consumer.	1.7	5327872
219	84	6	0	Large certainly training effort election success civil. Tree Mr deal there region behavior stage foot.	0.8	1787904
226	666	4	0.7	Other your week out.	2.0	5149696
182	231	1	0	Change hour color science during note care.	1.7	8087552
103	192	7	0	Adult seat consider foot.	1.4	6955008
85	3	4	0.5	\N	0.9	4125696
53	758	8	0	\N	1.1	498688
14	489	10	0	Bed weight floor.	1.5	7571456
39	197	4	2.5	Travel carry actually card out camera represent.	1.6	1913856
252	266	9	0	Population run meeting.	1.3	4649984
43	538	4	2.0	\N	1.1	2199552
309	369	8	0	Capital author claim hotel.	1.0	3647488
118	455	10	0	\N	1.0	2322432
126	14	4	1.9	Eight TV report police. Fast stop need seek you.	2.0	6557696
96	670	4	0.9	\N	1.8	3399680
80	280	4	2.4	\N	1.5	6076416
30	660	9	0	\N	1.9	8033280
248	672	9	0	Artist rock get mission explain name.	1.6	3536896
303	346	4	1.3	Soldier little might effect toward instead.	0.5	2342912
254	828	4	2.9	\N	1.1	6858752
151	123	1	0	Performance last who can career child.	0.9	4191232
59	694	4	0.5	Since to involve use set likely.	1.7	3106816
225	712	4	1.4	\N	1.6	5050368
81	788	3	0	Give several early project police give example. Teach challenge she final alone.	0.9	7224320
227	667	4	1.2	Quickly movement capital field. So work say young fly part friend fund.	1.3	5504000
303	344	3	0	Practice assume chair.	1.6	5090304
129	573	1	0	\N	1.1	8025088
146	569	4	2.6	Like address enter.	2.0	5475328
194	570	3	0	\N	0.9	2123776
8	209	1	0	\N	1.7	6341632
207	414	8	0	Program each will charge property poor ahead.	1.7	6351872
238	629	4	2.8	\N	1.7	6168576
286	169	4	1.4	Mission relationship road hotel full hold later. Large election such stay.	1.1	6517760
7	377	4	1.8	Report professor subject try fish. Anyone degree final discover.	0.9	7778304
110	10	4	1.2	Physical than stage heart something build suddenly. Apply enough lay bag part near why.	1.5	5767168
94	337	4	1.1	Sort garden garden bar often oil off window.	0.7	8226816
123	780	4	2.4	Person however amount interview.	1.7	1449984
123	767	1	0	\N	1.0	4458496
102	794	4	2.9	Paper share we ask scene degree.	1.7	587776
270	153	9	0	\N	1.7	199680
253	804	4	2.0	Statement thank explain friend represent day leader.	1.1	714752
173	268	4	2.9	\N	1.2	3461120
164	516	4	1.2	\N	1.0	4442112
125	148	1	0	\N	2.0	7899136
220	46	4	2.9	\N	1.3	8209408
295	592	10	0	\N	0.7	5351424
14	464	4	1.7	Officer machine without wife person.	0.7	3430400
39	203	4	1.2	Condition society center car.	1.5	2205696
12	231	4	1.3	Story now significant. Authority age environmental court what tax wind.	0.8	5637120
62	716	4	2.1	\N	1.6	3290112
262	674	4	0.9	\N	0.9	7097344
278	707	4	1.8	\N	1.0	5378048
146	565	1	0	Town article identify.	0.8	4013056
113	506	4	1.5	\N	1.8	5952512
122	451	4	1.4	Involve get civil provide make man near.	1.6	5311488
5	641	4	1.8	Car book certainly sort memory policy money.	1.0	4113408
272	762	4	2.7	Door amount sit field building population. Cause better black family.	1.2	538624
297	708	4	2.4	\N	0.6	1426432
126	12	8	0	\N	1.3	3730432
202	459	9	0	Environment fear environment share sister window voice.	1.2	4909056
140	383	10	0	Both back happen foot true husband seat.	1.0	4978688
10	644	10	0	Almost opportunity recent fly factor join. Gun benefit hot eight Mrs.	1.8	3891200
302	528	4	1.1	\N	1.6	3892224
33	548	7	0	Surface exist I much.	1.7	6330368
166	326	4	2.2	Look window reach hospital first. Issue meet red require want be.	0.5	1604608
70	224	8	0	\N	1.5	1867776
97	801	4	1.8	\N	1.6	2325504
144	105	4	1.7	Rich note or Mrs hard traditional almost.	0.7	7042048
186	766	10	0	\N	0.6	8179712
258	304	4	1.1	\N	1.4	8071168
243	431	4	1.0	Away people including him customer his. This put boy skill discover smile.	1.0	1600512
199	559	4	2.3	\N	1.0	2006016
261	413	4	2.3	\N	1.6	1390592
275	220	4	0.7	\N	0.9	6310912
166	313	8	0	\N	1.6	1832960
134	138	4	1.3	\N	1.4	2149376
151	125	3	0	\N	1.5	419840
155	457	4	1.7	\N	1.4	5742592
251	136	4	1.5	\N	1.3	7152640
287	149	4	2.9	\N	1.6	960512
168	309	4	0.2	Able decide sometimes she research.	1.4	6606848
155	449	4	1.6	Two need ahead herself official.	1.1	1058816
135	269	6	0	Run over into seem investment anything beyond. While help market several enough billion member.	1.4	3944448
280	718	8	0	Debate pay its factor about. Mission agency color information economic agree stop environmental.	1.4	594944
132	35	3	0	My training energy student itself politics.	0.7	5336064
252	257	4	1.4	Begin take summer become success drug. Activity woman design practice capital central.	1.7	7388160
44	65	7	0	However before garden marriage.	1.6	4788224
66	439	6	0	Dog style my her reduce. Partner fish position oil.	1.3	1984512
115	106	4	2.0	Reduce indeed walk floor.	2.0	7898112
3	101	9	0	Effect system impact guess. Theory wide student color material boy.	1.3	1915904
199	570	3	0	Social case effect.	1.3	4575232
178	213	4	0.4	\N	1.4	7310336
146	571	4	1.4	\N	1.5	3203072
3	92	6	0	Sing author board next wide happen. Idea know candidate science.	0.8	3757056
134	146	6	0	\N	0.6	1479680
244	763	4	0.2	\N	0.6	999424
86	534	4	2.6	Real town white despite thousand morning relate choose.	1.7	7259136
92	724	4	2.9	\N	1.8	5897216
106	134	4	2.0	Enter term baby little many.	0.9	1901568
305	694	4	2.8	\N	1.0	794624
138	257	6	0	Opportunity note wife.	1.9	7686144
264	142	7	0	\N	1.7	5206016
169	350	4	2.5	Father size technology hold.	1.8	3009536
225	730	4	2.4	School remember help from impact fast. Reduce bill size east seven could.	1.0	6199296
12	226	10	0	Everyone per development end.	1.8	6537216
179	630	7	0	\N	0.9	474112
180	537	4	0.3	Husband most woman.	0.9	5676032
287	139	8	0	Quite room everybody break. Ready garden recognize front organization.	1.2	259072
69	786	4	2.0	Own pick fund full.	1.3	5682176
170	386	4	2.7	\N	2.0	2142208
2	340	6	0	Relationship same may doctor election enough. Garden reach we seek value who.	1.5	5342208
160	181	4	2.6	However answer local notice star body answer.	1.1	946176
151	132	4	1.7	Indeed stay somebody political sell leave type. Financial key also her very significant subject which.	1.6	5074944
140	378	8	0	Collection little majority suddenly threat base discuss.	1.0	2273280
278	702	4	2.5	\N	0.6	6232064
137	489	4	2.8	Picture human radio anyone.	1.0	5794816
63	44	4	1.2	Final model reason possible administration perform help. Sure method beyond wait article act.	1.9	1764352
67	162	4	1.4	Suddenly save kind thank west give test.	0.8	2099200
214	227	1	0	\N	0.8	3788800
262	669	3	0	\N	1.0	1166336
195	407	7	0	Network even detail morning need personal course true.	1.7	2787328
297	728	4	2.4	Who available may themselves clear particular third office.	2.0	7166976
166	323	4	2.8	Energy network onto commercial operation.	1.5	6289408
39	199	4	0.7	Fight appear or almost send.	1.4	7882752
12	223	8	0	Accept compare officer house interview stage.	0.6	2367488
277	608	5	0	Read identify adult explain prove gas pull.	1.2	2752512
204	620	6	0	Practice seek because series white medical.	1.2	2232320
91	661	4	2.3	\N	1.4	4829184
81	790	4	0.0	\N	0.7	2680832
141	350	4	2.3	Economy successful detail team section. Church visit remain student well parent.	1.0	2209792
208	550	4	1.3	\N	1.8	5525504
215	515	4	1.5	\N	1.5	6030336
210	456	4	1.3	\N	0.9	3040256
247	207	4	1.0	\N	1.8	1891328
98	732	4	1.3	Apply along political message run yes second.	1.4	3435520
30	669	4	2.6	For age story current.	1.1	7375872
225	722	4	1.4	\N	1.7	1542144
50	240	4	2.0	They next official thought.	0.7	6522880
127	61	3	0	Area citizen wrong push.	0.7	6897664
206	397	4	1.1	\N	1.2	522240
237	36	1	0	Special keep value yet dinner. Leg age trouble trouble newspaper home.	1.2	7762944
305	682	4	1.8	\N	1.7	1763328
164	499	8	0	Focus partner eye.	0.7	4245504
71	44	4	1.2	Woman knowledge measure amount tell no them.	1.9	3042304
221	467	4	1.5	\N	1.4	7319552
219	79	4	2.1	Read painting decide represent skill.	1.0	5332992
67	168	4	1.4	Seat dinner should.	2.0	4936704
74	488	4	1.8	\N	0.8	1115136
138	280	4	2.8	\N	1.3	1587200
215	524	8	0	Make election character director who. Whose life son better thing business.	0.5	1948672
283	22	4	0.9	\N	0.9	728064
233	105	4	1.7	\N	1.8	5979136
87	437	4	1.6	Officer still rise court.	0.9	4331520
105	98	4	1.7	Sing plan stay less grow vote history.	1.8	4674560
60	344	1	0	Should thus away nation wish.	1.3	5784576
93	710	4	2.2	\N	1.6	7782400
47	369	4	1.4	\N	1.7	6631424
295	597	4	1.3	Positive little actually against exactly growth industry.	1.3	3369984
131	845	4	2.9	\N	1.6	1042432
97	800	3	0	Suffer another American finally describe teach.	1.7	7617536
123	785	4	1.0	\N	1.9	4356096
102	789	8	0	Improve if everyone cut off.	0.9	1711104
73	415	1	0	Name project lawyer manager fire money forget news.	1.6	3892224
156	48	6	0	Wear wait language control help.	0.6	7752704
90	92	3	0	\N	0.9	4074496
91	672	4	1.8	Trouble debate be inside note end must.	0.8	2054144
305	704	5	0	\N	1.4	313344
108	746	4	1.0	Box yeah also office.	0.6	2519040
125	137	6	0	Door themselves beyond me feeling available high.	1.8	7113728
84	585	9	0	\N	0.5	2969600
23	249	4	1.5	\N	1.7	150528
173	273	4	2.8	\N	1.7	7450624
230	667	9	0	Staff carry it business business point. Able expect act.	1.0	166912
133	777	8	0	\N	0.5	4593664
129	554	4	0.5	View writer job memory hope while environmental. Professor several especially available outside.	1.6	3971072
251	153	4	2.9	\N	0.8	6714368
259	850	10	0	Cup with already price employee difficult.	1.8	6367232
170	380	4	1.0	\N	0.6	3747840
10	630	3	0	Among quite half peace move under law.	1.0	6323200
179	642	1	0	Senior nothing two structure occur article.	1.3	4993024
269	434	1	0	Tv practice almost maintain car look crime.	1.2	7419904
288	830	8	0	\N	1.0	684032
218	747	4	0.0	Party thank agency election thing individual up. Condition more drive others mouth manage happy gun.	1.2	3447808
68	638	3	0	\N	1.6	7803904
184	871	6	0	Sort class according least home.	1.5	5988352
67	181	4	2.6	\N	1.6	6369280
143	99	7	0	Here off wind political law possible ever.	0.6	4528128
91	656	8	0	\N	1.6	7278592
18	302	4	2.7	Fill song summer plan.	1.9	765952
154	431	1	0	\N	1.8	7520256
175	523	4	1.1	Particular short blood member month they accept. Mrs support continue debate coach.	1.1	6159360
31	300	4	1.5	Season across common call eat health job.	0.6	4684800
96	671	4	2.2	Big rule bar yes artist the.	1.9	6713344
179	634	4	0.9	\N	0.6	4586496
160	166	9	0	According health social ahead great.	1.0	3800064
227	661	9	0	Beyond summer college beat. Coach campaign compare current better per science.	1.2	589824
66	442	4	2.7	\N	0.5	3818496
146	555	4	1.8	Back style fall center discussion instead make.	1.0	7776256
6	706	4	2.6	Agent garden skill our measure care. Gas leader push rock place can.	1.1	7194624
133	780	4	0.7	Happen budget from occur away development however she. Treatment feeling rise bank see.	1.1	4213760
238	609	8	0	\N	0.9	3727360
78	279	4	0.0	\N	1.8	2069504
76	344	5	0	\N	1.4	7453696
226	674	4	0.7	Left seem look itself number game.	1.3	3469312
125	151	4	1.6	Be food power page red red.	1.0	7198720
227	660	4	2.7	Our now rock generation.	0.9	549888
246	481	4	2.3	Piece small themselves relationship method.	1.4	4288512
84	586	5	0	Moment team better by deal pass hand.	1.4	7750656
84	577	4	1.6	For also cover particularly father another meeting fire.	2.0	5954560
161	788	4	2.1	\N	0.8	694272
121	725	4	1.7	\N	1.6	1161216
246	480	8	0	The interest effect not.	1.1	563200
56	536	10	0	Option senior feel onto worker worker.	1.6	7090176
209	399	4	1.6	\N	0.9	3555328
67	177	4	1.9	Position rise agree better concern maybe make.	1.2	728064
71	47	4	2.8	Beyond by help nature.	1.8	8205312
190	371	5	0	\N	1.3	3296256
60	343	9	0	\N	1.2	5340160
210	446	9	0	\N	1.0	5580800
309	389	6	0	Too plan rich.	1.7	919552
46	590	4	2.2	\N	1.1	806912
193	521	4	1.4	Above quite source. Out example free though.	1.4	5597184
116	84	4	0.7	\N	0.9	4102144
12	227	4	2.6	\N	1.9	5526528
230	669	4	2.6	Shoulder live us image air.	0.5	2223104
203	795	4	1.4	Vote sense generation or no PM check.	0.8	7116800
162	838	4	1.4	Future ready career color.	1.2	704512
210	445	6	0	\N	1.2	312320
258	306	4	2.9	\N	1.6	1915904
278	693	4	2.9	Campaign laugh test discover. Responsibility sort cultural office professor.	1.5	1612800
94	333	8	0	\N	0.6	652288
213	570	4	1.6	\N	0.5	2334720
177	220	4	1.2	Who hair stay unit require.	1.9	4397056
133	782	6	0	See with it character current enter.	1.5	3777536
294	445	4	2.5	\N	1.2	3658752
149	404	4	2.0	Mother word just magazine. Bank owner movie skill tree foreign add.	1.2	3943424
220	38	4	2.2	\N	0.7	465920
87	438	8	0	Prove where professor think fast. Realize eat yard often back.	1.3	3623936
158	210	4	1.4	Carry forget return record half because page. Relate certain herself daughter little test again.	1.0	841728
225	709	7	0	\N	0.8	1581056
137	486	4	1.0	Care admit sign leave area.	1.1	5357568
119	333	4	1.9	Travel bit dark send material crime.	0.9	3313664
218	750	4	0.8	\N	1.9	6096896
6	691	1	0	Rest ability send writer moment suffer street.	1.9	6065152
30	656	4	2.6	\N	1.2	7366656
93	721	4	1.6	Tend show debate edge any.	0.8	4827136
109	692	4	1.5	\N	1.9	7789568
287	145	6	0	Must never report glass follow our security piece.	0.7	2599936
284	618	4	1.7	Into together turn decide social across.	1.4	7645184
243	436	4	2.7	\N	0.6	2140160
114	482	4	1.9	\N	0.9	1504256
204	623	10	0	Democratic gas may well information him detail.	1.1	5591040
135	272	1	0	Strategy different buy.	0.8	4323328
191	763	9	0	Pressure daughter his training true major.	0.9	2098176
150	418	4	2.5	Indicate east including despite spring financial hundred.	0.5	4706304
100	730	7	0	Page modern such over value me.	0.9	2088960
150	428	5	0	Environmental thus camera sometimes lawyer.	1.2	1206272
193	523	4	1.1	\N	1.8	3900416
76	340	4	1.4	Assume cup true born.	1.7	4264960
282	412	4	2.2	\N	0.5	4183040
164	498	10	0	\N	0.7	5426176
22	225	10	0	Attorney parent tough per for east. Student table same middle weight investment player.	1.7	3463168
116	82	9	0	\N	0.8	1284096
211	837	4	2.2	\N	0.9	2942976
8	200	4	1.0	\N	1.8	1998848
199	560	4	1.1	Matter third result really natural. Else light receive word response during fine total.	0.7	8062976
74	477	4	1.6	\N	1.3	7632896
78	265	4	2.3	Fear similar sometimes out peace.	0.8	6484992
41	190	3	0	\N	1.1	3023872
46	607	4	2.0	\N	1.5	5890048
310	573	9	0	\N	1.8	654336
78	266	4	2.1	\N	0.8	7611392
297	718	4	1.4	Everybody player follow TV institution quality father. Floor light position player.	1.9	5104640
52	334	1	0	Show individual indicate eye each enjoy difficult.	0.5	5309440
141	348	7	0	\N	0.9	2733056
123	766	4	1.6	Teach air section try father behavior mother.	1.5	4515840
84	578	3	0	\N	0.8	4269056
155	453	8	0	Wife without worker benefit green. Animal investment decade it clear account.	1.7	7367680
190	367	4	1.0	\N	1.8	632832
265	402	4	1.9	\N	1.0	5129216
279	420	4	0.7	Nation girl rock similar more big.	1.7	2646016
91	675	4	1.1	Job call year TV six president his.	0.6	7496704
179	635	4	2.2	\N	1.7	4707328
171	849	5	0	\N	2.0	553984
143	97	3	0	\N	1.2	4024320
10	651	3	0	\N	0.7	4803584
3	91	4	2.7	Goal tonight to really.	1.4	1158144
156	40	1	0	World democratic dream arrive tree all for arrive.	1.1	6781952
67	159	3	0	\N	1.6	7483392
160	159	4	2.8	\N	1.8	2664448
189	610	4	1.0	\N	0.9	3378176
252	267	7	0	Improve citizen this clearly region system.	0.7	6634496
266	775	6	0	\N	1.7	8286208
134	135	4	1.0	Outside which decide history. Phone Congress gas present sit.	0.9	7414784
261	407	8	0	\N	0.9	6467584
159	413	4	2.3	\N	1.8	7392256
105	109	5	0	\N	1.5	7698432
203	786	4	2.1	\N	1.7	5497856
26	319	4	1.2	\N	0.5	5729280
144	91	9	0	Carry issue analysis attack look series common.	2.0	866304
187	228	4	1.7	Draw production heart relate them walk water. Myself eight forget government actually avoid election.	1.0	4798464
6	688	4	1.0	Sense loss go spend authority let.	1.2	1290240
22	220	4	1.2	\N	1.7	650240
283	26	4	1.6	Particularly energy movement six national read. Building society head service.	1.6	7119872
76	347	4	2.3	Mouth wrong artist scientist they interest yard. Mother wrong board.	1.6	7425024
224	51	6	0	Test leave miss early father exactly.	1.7	6281216
276	813	4	2.9	Effect training me usually.	1.9	193536
298	714	3	0	Best red can force.	1.4	1010688
307	400	1	0	\N	0.5	8007680
97	810	4	0.9	\N	0.5	7900160
177	233	4	2.2	\N	0.7	3260416
281	434	4	1.8	\N	2.0	2543616
102	786	5	0	\N	1.5	1937408
143	96	7	0	Stock card respond tough simply response.	1.4	4050944
168	332	1	0	Community couple according my within.	1.5	2165760
162	818	4	2.3	Impact great firm sometimes idea step culture. Recent itself wrong major kid.	1.7	5828608
175	501	4	1.0	List performance particularly night find many.	1.1	7133184
136	213	4	1.2	\N	1.5	6185984
259	842	1	0	\N	0.6	930816
215	517	4	2.7	\N	0.9	994304
36	191	6	0	Around sit away law.	0.6	3348480
113	527	6	0	\N	1.3	3938304
207	408	4	1.8	\N	1.3	4891648
104	542	4	2.5	\N	0.6	2027520
230	666	6	0	Fill guess establish rich response list future evening.	1.0	7002112
78	255	10	0	\N	0.5	6881280
29	801	4	1.8	Perform spring lose exactly industry.	1.2	2223104
54	424	6	0	\N	0.5	2315264
191	752	4	1.7	\N	0.6	4509696
5	644	4	2.1	\N	1.4	2630656
287	151	5	0	Pattern store pass fine traditional skin involve strategy.	0.6	996352
175	524	5	0	Friend study result image win season right.	1.5	1192960
170	388	3	0	Budget nature sea on general they TV defense.	0.9	7564288
288	823	4	2.0	\N	1.6	7971840
10	633	4	1.7	Goal fall admit heavy at challenge stock. Majority agree indicate hot analysis.	1.8	2157568
252	281	6	0	\N	1.8	5335040
276	816	8	0	\N	1.0	7674880
277	629	5	0	Me can control fight president white night.	1.8	1152000
143	108	4	2.5	Feeling player represent parent skill.	1.3	1114112
213	573	4	2.5	Room audience language writer spend something quickly. Red doctor perform such.	1.6	5307392
9	35	6	0	Soon including capital fill discuss truth.	0.7	6347776
55	848	4	0.4	\N	1.8	1689600
14	473	4	2.3	Camera suggest price five until machine national per.	0.5	2724864
88	452	10	0	Hour fall thousand serve street management.	1.5	5002240
160	170	8	0	\N	0.7	177152
14	480	4	1.4	\N	0.5	5380096
173	264	1	0	Think spring force such along Mr war. Would possible heart.	1.2	6243328
263	430	6	0	\N	0.7	2970624
113	525	10	0	Never reflect hit shake only determine protect.	1.1	1598464
211	819	4	2.7	\N	1.2	3786752
261	414	7	0	\N	1.8	3081216
24	799	4	1.5	\N	1.4	3929088
108	743	4	1.5	Wish development well simple probably end yourself politics.	1.8	1610752
125	134	4	0.5	Experience simply against author.	1.1	374784
288	814	5	0	Might risk boy sell share.	1.6	7390208
22	232	4	1.4	Upon activity collection success other.	1.7	5414912
44	67	4	2.1	\N	1.8	7694336
197	856	4	2.2	\N	0.7	302080
257	286	5	0	\N	1.8	1121280
195	420	4	1.9	Method list upon long also trouble remain main.	0.9	7705600
114	490	4	2.6	Case left ready.	1.0	929792
226	665	1	0	\N	2.0	3858432
274	83	4	2.6	\N	0.5	3112960
288	815	9	0	Race energy deep similar appear medical.	0.6	1070080
203	790	6	0	\N	1.0	265216
220	56	5	0	\N	1.6	7488512
72	679	6	0	List unit sing.	1.1	4122624
11	232	4	1.4	Change keep can hair line safe.	0.7	4810752
114	473	4	2.3	Last necessary himself American social.	1.1	2649088
269	441	4	1.5	Evidence fast another.	0.9	3284992
300	739	4	1.4	\N	1.0	6736896
160	172	4	2.3	Trouble life choice who arm gas. Listen teacher sense series watch decide.	1.9	7916544
85	5	9	0	Oil dinner pattern she general news. Result television anything physical mean policy account.	1.2	2983936
303	345	10	0	\N	1.1	799744
127	68	4	2.4	\N	1.9	6759424
3	107	4	0.3	\N	0.5	2932736
286	155	5	0	\N	1.9	7289856
99	14	4	1.4	Health dark early radio. Act movement college oil.	1.2	5087232
34	790	10	0	Collection opportunity want improve beat nature my people.	0.6	4122624
109	698	4	1.1	\N	1.6	6887424
246	470	4	1.0	\N	1.7	1239040
220	39	6	0	Service join bring because brother already.	1.5	2451456
150	405	10	0	Material reveal show public.	1.8	2733056
93	722	10	0	Blue by avoid later describe table story.	1.6	7097344
251	151	5	0	\N	1.7	685056
246	488	7	0	\N	1.5	6960128
240	85	4	1.5	Could drug street believe even long someone.	1.6	6621184
296	437	4	1.6	Together through fight agency during.	2.0	4534272
254	816	4	2.6	\N	1.1	3747840
14	466	1	0	Here reality model success yet despite. May best low.	0.6	3314688
170	384	8	0	\N	1.9	176128
274	80	6	0	Others owner investment admit throw.	1.3	1457152
151	127	4	0.2	Item party stock court trial.	0.5	5421056
149	425	4	2.6	New out create themselves pressure.	1.6	1035264
6	707	4	1.8	\N	0.9	5423104
211	827	4	2.1	Woman need give piece check include director. Next relate close in its free very.	1.7	5656576
109	697	3	0	When gun watch action figure or girl.	0.6	2224128
280	716	4	0.1	\N	0.7	759808
7	367	4	0.5	These hot particular around safe usually avoid.	1.4	5575680
109	696	4	1.2	\N	1.7	934912
283	36	4	1.9	\N	1.7	1694720
277	613	4	2.9	\N	1.7	7851008
170	387	4	2.5	\N	0.7	5047296
155	459	10	0	\N	1.6	4733952
271	193	4	0.6	Pick season wish try serious carry wish card.	1.3	139264
168	305	4	1.7	\N	1.5	6891520
191	753	10	0	\N	1.7	6130688
211	833	10	0	Brother and report couple.	0.6	2134016
120	597	7	0	\N	1.3	3915776
126	9	8	0	Even what before on.	1.0	7579648
169	363	4	1.0	Purpose culture compare city. Because price result realize present official southern.	1.0	4048896
288	822	8	0	War small hospital general why show. President since far.	1.8	1797120
278	688	9	0	Imagine any professional issue. Something whether catch traditional first glass.	1.1	2220032
40	113	4	2.8	\N	1.6	6120448
93	713	10	0	Particularly stop white attorney.	1.3	7180288
218	752	4	1.7	\N	1.5	4582400
212	337	9	0	\N	1.8	1013760
6	694	5	0	\N	0.6	7332864
68	643	4	2.6	\N	1.4	6342656
243	438	9	0	\N	1.6	2241536
43	542	6	0	Thing one employee. Leave ask nice send interesting.	1.0	742400
74	483	4	1.8	Compare wear eye fact listen. Economic product phone front responsibility.	1.5	1622016
113	500	4	2.3	\N	1.6	7398400
88	449	8	0	Arrive knowledge close memory phone first.	1.1	6307840
221	470	4	1.0	Brother movement expert clearly that. Leg discover easy marriage.	0.7	5772288
150	426	5	0	Small town until month attention.	1.1	6883328
63	38	4	2.2	Cause write picture create choose maybe lot cause. Seek laugh yard computer baby interview.	0.5	7921664
197	864	4	1.8	Investment win quality himself buy daughter growth brother.	0.5	1189888
129	567	4	1.4	\N	1.4	498688
238	627	5	0	\N	1.4	376832
9	27	1	0	Decide stay product. All everyone fire investment.	1.5	4653056
262	670	8	0	\N	1.0	7802880
119	334	7	0	Reflect the record various.	1.7	3758080
52	336	4	1.0	\N	1.9	3549184
190	369	1	0	Everybody budget other right music.	1.9	4542464
30	678	4	2.3	As number whether mouth sense.	0.9	3758080
68	650	4	1.3	\N	1.7	4744192
53	752	1	0	Focus much base guy focus right couple. Sometimes town war still oil seven.	1.7	8213504
195	428	10	0	Doctor kid toward off nice husband. Line strong television quickly just fall.	1.9	747520
167	852	8	0	Option kid week chair with final effect. Act color you set poor relate number.	0.9	4239360
138	262	4	0.1	Actually box cup father.	1.0	2868224
212	335	4	1.3	Well case degree rise.	1.5	1603584
228	698	4	1.1	\N	0.5	4388864
255	86	4	1.2	\N	1.9	8160256
15	628	1	0	\N	0.7	4467712
77	401	3	0	\N	1.6	2991104
159	417	10	0	\N	1.0	6154240
254	813	1	0	\N	0.5	3897344
130	10	1	0	Hear seem boy enough hospital garden.	0.9	271360
145	357	4	2.2	\N	1.8	3426304
7	382	4	1.1	Girl manage read painting sing.	1.7	5484544
272	764	4	1.1	\N	1.3	2439168
39	202	1	0	\N	1.7	7587840
78	278	10	0	Serve image carry explain receive law.	1.7	7516160
206	400	4	2.6	\N	1.0	6110208
222	446	10	0	Candidate us impact store reveal. Travel thousand figure fine despite.	0.9	7337984
282	414	4	1.1	Add financial other bar sign letter. Popular hair home security behind.	1.0	713728
243	433	1	0	Property southern student.	0.6	743424
164	525	4	2.0	\N	1.0	736256
50	242	4	0.5	Tend stay instead body.	1.3	7880704
79	847	4	1.1	Require law imagine easy apply training. Expert modern read thank animal.	0.6	8270848
257	295	4	1.0	Kind hair participant page left. Yourself find rise let.	0.9	1622016
269	437	9	0	\N	1.0	1049600
133	767	4	1.4	\N	1.7	4519936
291	284	4	2.8	Adult many about camera certain success loss.	1.9	6626304
282	421	3	0	Mission air technology million.	0.7	2987008
7	370	8	0	\N	0.6	8112128
228	689	5	0	\N	0.8	1063936
304	547	10	0	\N	1.9	2147328
130	5	4	1.2	Who music ahead recently will between discussion. Benefit stay give information.	1.1	5102592
241	51	4	2.9	Law not fly between model same operation.	1.6	6052864
4	345	4	2.6	\N	1.5	6556672
262	673	4	2.8	Above local enter his grow. Ask still situation last rule itself.	1.2	7894016
210	447	4	2.6	Friend participant argue with read ask evidence. International sell shake people they daughter fill.	1.6	5265408
240	84	1	0	\N	1.7	2262016
129	562	4	2.1	\N	1.3	1271808
194	565	4	1.6	\N	1.2	8150016
209	392	10	0	\N	1.8	102400
166	312	4	2.4	Add thus car do method ready guy simply. Not expert the image.	0.6	7133184
280	711	7	0	Property war agree hold adult have. Middle only rise.	1.4	968704
225	715	4	2.9	Step many travel onto civil. Its investment painting.	0.8	4449280
269	435	4	2.9	Example of imagine authority.	0.6	5359616
86	543	4	1.3	\N	1.5	2167808
90	90	8	0	\N	0.9	4675584
62	720	4	2.0	Resource blue himself place himself.	1.7	6473728
222	457	4	0.8	Green turn style whether than recognize pretty them.	0.7	3342336
266	772	4	0.4	\N	1.9	800768
126	1	4	1.8	Work work idea.	1.2	2610176
127	71	4	1.9	By leader black eight. Drive offer federal mother.	1.0	6812672
3	111	7	0	\N	1.5	775168
5	654	4	1.8	\N	1.4	8027136
288	818	4	2.3	\N	1.5	5307392
29	812	4	1.4	Sometimes sort have follow in.	1.8	4142080
59	702	4	2.5	Approach tonight pretty she manager.	1.7	8250368
227	657	4	0.2	Nation though respond organization he senior.	1.1	5325824
227	668	7	0	\N	1.0	1284096
113	515	4	1.5	\N	1.5	1356800
192	743	5	0	As fire outside strategy.	1.5	7663616
192	736	10	0	\N	1.6	2926592
44	57	6	0	\N	0.9	6678528
174	345	4	2.6	Dinner party themselves significant including born least. Including act treatment doctor born big city.	1.8	2916352
67	171	4	2.1	\N	1.7	4282368
156	44	4	1.4	\N	1.4	5086208
125	136	10	0	\N	1.7	753664
133	784	4	1.0	Conference successful place source.	0.7	4761600
116	77	4	1.7	Serve ok party hour defense laugh edge.	0.6	6012928
261	421	4	1.4	\N	1.9	3712000
26	320	3	0	Attack seat quality theory evening some.	1.7	2209792
164	515	4	1.5	Individual identify but.	0.9	7871488
114	484	4	1.4	Laugh vote Democrat though. Summer culture receive wide.	1.0	4090880
22	230	4	2.0	Research he animal degree various upon it. Stock major memory financial.	0.6	1158144
277	617	4	1.6	\N	1.7	6149120
90	99	7	0	\N	1.3	2643968
265	396	4	1.6	Whatever person a full ok discuss character.	1.3	7430144
64	203	4	1.2	Bar there those consider voice.	0.7	3840000
179	638	6	0	\N	1.3	4589568
41	192	3	0	Imagine course fund partner few heavy.	0.7	437248
309	376	10	0	\N	1.9	6623232
173	271	10	0	Believe news never sort above serious.	2.0	7179264
270	139	9	0	Just cultural heart including knowledge.	1.4	4817920
62	732	4	1.3	Nation change else or.	1.5	691200
278	683	9	0	\N	1.3	514048
272	761	4	2.7	\N	1.2	7068672
21	345	4	2.6	Small science talk live with.	1.3	1546240
245	381	5	0	\N	1.2	2231296
189	614	4	0.6	\N	0.8	873472
220	52	4	1.3	Major after machine source or various participant.	1.6	3322880
215	522	4	1.0	\N	0.8	3639296
213	556	1	0	\N	0.8	2384896
286	174	4	1.1	Little impact admit.	1.4	4978688
116	76	8	0	Government thing morning low.	1.2	2635776
302	538	4	2.0	Economic security model authority there agent we. Trouble loss continue important player shoulder upon.	1.5	4246528
175	525	6	0	\N	1.7	5135360
311	343	1	0	\N	1.2	6151168
246	472	1	0	Floor impact accept view order anything. Modern section film affect wall structure standard.	1.4	3924992
43	536	7	0	Task myself man newspaper same against.	1.0	957440
187	222	4	0.9	\N	1.1	2522112
283	19	5	0	Thing front other manage current source sense. Crime mean possible beautiful at sister.	1.6	6489088
230	663	8	0	\N	1.3	4078592
141	354	4	1.4	Organization already help draw recent. Tv size usually issue pressure.	1.6	1019904
264	153	9	0	\N	0.8	1581056
182	226	6	0	\N	0.8	1015808
280	720	3	0	Under long between hot. Term later wife.	1.2	1769472
151	131	4	0.9	Career agent decide suggest.	0.9	4638720
119	339	1	0	\N	0.7	4075520
95	358	8	0	Drug source environment reach.	1.7	2941952
168	328	4	1.9	Pull year skill beautiful machine policy energy.	0.9	1397760
230	659	4	1.1	\N	1.9	3227648
21	342	10	0	Pattern office ahead less nor woman sell.	2.0	270336
278	703	5	0	\N	0.6	5429248
284	620	5	0	\N	0.8	3123200
248	674	4	1.6	Bed clear prove cultural wait.	0.6	8241152
55	844	4	0.2	Perhaps close plant situation. Authority type sister choice record.	1.5	2579456
258	327	4	0.8	\N	1.8	6519808
67	155	4	1.7	Suggest project rich ago deep level.	1.8	977920
263	431	1	0	Receive something sing with million if. Sit thousand figure their we check month.	0.6	823296
261	425	1	0	\N	1.1	4443136
80	264	7	0	\N	1.6	1538048
84	589	4	2.4	Green action specific middle tree build box. Administration into teach.	1.1	8260608
175	509	7	0	\N	1.0	1668096
204	613	10	0	\N	1.5	6722560
283	24	4	0.3	Up building line month stay foreign.	0.8	1052672
214	224	4	2.2	Fish apply effect seven represent reduce town door.	1.6	566272
298	718	4	2.0	Interesting Mrs enter.	1.3	1311744
286	166	4	1.3	\N	1.1	6575104
200	298	4	2.4	\N	0.5	962560
262	658	4	2.0	Citizen together lay probably.	0.7	7299072
222	459	4	2.5	\N	1.7	946176
120	606	8	0	Republican lawyer development.	1.3	7306240
92	718	4	2.0	\N	0.7	1369088
213	574	4	0.1	\N	0.7	5593088
225	711	9	0	\N	1.5	1530880
62	729	4	2.7	Actually sure guy fall. Too within discuss question.	0.7	1015808
49	795	6	0	Effect even poor culture image develop approach create.	1.9	2410496
113	514	4	2.7	Information answer few.	1.1	7771136
47	366	4	1.5	\N	0.7	2153472
9	26	4	2.7	Travel everybody power value during.	0.5	6383616
145	361	3	0	Different race eight establish voice event.	1.4	6809600
278	696	4	0.5	Change anyone couple moment company value near.	1.7	349184
249	344	4	2.9	Most weight marriage rate study.	1.4	2691072
280	719	10	0	Idea natural always offer late.	1.7	4191232
159	422	4	1.4	Soldier laugh week rest American. Fine act they term among soon.	1.0	5756928
30	680	4	1.6	With here serious purpose stay arrive entire source.	1.0	4242432
228	694	9	0	Set hospital key laugh front week.	1.5	664576
54	418	3	0	Finish tend form read.	1.4	5528576
214	217	4	1.0	\N	1.8	7064576
289	57	7	0	\N	1.3	7769088
213	566	7	0	Reality issue him. Soldier good final drug however let.	1.8	6766592
92	717	10	0	He matter certainly anyone. Low item collection white organization central.	0.9	3086336
216	641	4	1.8	Project woman amount one here. Quality not energy.	1.4	1475584
143	109	4	2.5	\N	1.0	1418240
7	371	4	0.9	Senior morning scene cut.	1.8	3953664
93	724	4	2.9	\N	1.4	6283264
70	230	4	1.7	\N	1.7	1154048
220	42	8	0	\N	1.5	6790144
64	205	4	2.8	\N	1.5	7788544
125	144	7	0	\N	1.2	3360768
244	760	4	0.0	At fast over.	1.0	6628352
24	804	1	0	Traditional special space eight start.	1.8	3604480
160	160	4	2.6	\N	1.7	6157312
97	797	5	0	\N	1.2	7808000
206	394	4	1.8	\N	0.5	7346176
138	274	5	0	Leave sort daughter whom.	0.8	4755456
260	192	9	0	\N	1.3	7200768
274	88	4	2.7	Firm least message way nor us involve. Send evidence reach community rather amount.	0.8	2083840
228	697	4	0.2	\N	1.5	7729152
113	522	4	1.5	\N	1.3	3540992
129	561	10	0	Explain quality week perhaps eye billion.	1.5	4789248
241	55	4	1.9	\N	1.8	7014400
129	568	7	0	Figure energy maybe either civil hour. Pass probably body reality.	1.3	598016
113	521	3	0	Always full task level both worker.	1.0	7862272
226	662	4	2.2	\N	0.7	6443008
80	254	4	2.0	\N	1.2	7513088
309	381	4	2.6	\N	1.0	2048000
159	404	4	2.0	\N	0.7	2828288
190	387	4	2.9	\N	1.2	1684480
257	288	3	0	Present decide affect factor cold leg edge.	1.8	1937408
254	818	6	0	Behind base success owner later.	1.1	2364416
62	726	4	2.1	\N	1.1	4259840
275	222	7	0	\N	1.7	4599808
121	730	4	0.2	Gun another everyone add million career. Nice leader effect movement success today.	1.3	1646592
173	269	3	0	None student military seek until.	0.9	4363264
30	674	4	1.6	Rich health imagine western race old.	1.7	2966528
265	395	4	2.3	\N	1.8	2255872
98	722	4	2.5	\N	1.1	3909632
296	433	4	1.1	First several cause herself shake.	1.2	675840
262	657	4	0.3	\N	1.4	114688
130	11	7	0	Indeed represent draw table everything.	0.8	5645312
127	58	4	1.4	\N	0.5	3597312
59	697	1	0	\N	0.9	5513216
153	84	4	1.7	Back item loss involve strategy.	1.0	6936576
93	726	4	2.1	Year every against pattern. Kind very film include wonder choice now against.	1.3	1788928
160	163	7	0	South clearly stage get. Arm represent son drive hour out single.	1.1	869376
70	233	4	2.2	Visit bank popular wear. Cost side us message customer last.	0.8	1702912
290	398	4	2.6	National long over food.	0.5	2548736
302	543	8	0	\N	1.1	6265856
152	839	4	1.9	Inside majority point action far. Old foot herself feeling.	1.5	4993024
244	747	1	0	\N	1.3	4375552
75	106	1	0	Be network mean hand change. Whole anyone star door.	1.7	5106688
282	410	3	0	Section interesting check discussion see city.	0.6	781312
208	546	4	0.7	Different require common peace event be her. Many short figure list so central most.	1.2	5072896
278	699	8	0	\N	1.8	6310912
93	714	4	2.4	\N	1.5	3806208
112	371	8	0	Teach high parent.	1.5	6892544
217	267	10	0	Beautiful difference four investment indeed.	1.9	4096000
214	233	9	0	Scientist instead including parent reason if.	1.6	5234688
212	339	4	2.9	Show very almost single imagine. Customer stage analysis about almost firm central.	1.2	3297280
280	732	6	0	\N	0.8	782336
3	112	4	1.5	Consumer public see find artist.	1.8	6339584
189	623	4	2.5	\N	2.0	4477952
6	682	4	1.8	Democratic community tonight movement recent marriage option throughout.	0.6	5666816
135	258	4	1.9	Car week especially since rest worry issue.	1.5	5125120
232	346	7	0	Tell boy then.	1.4	4302848
252	260	4	1.4	Why success record least.	1.3	6849536
47	375	6	0	Market might beyond hair bed.	1.3	1557504
284	613	4	2.9	\N	0.5	1138688
267	746	4	1.0	Conference police bad attention me laugh.	1.7	3645440
216	646	5	0	National assume fall about.	1.2	4858880
4	346	5	0	Drug beat fear last stock religious something. West challenge speech operation serious drive effect.	1.5	5892096
195	409	4	1.0	\N	1.4	2950144
286	183	4	1.4	Ago store civil ball much court.	0.9	5348352
69	789	4	2.0	\N	0.8	2206720
160	180	4	2.3	\N	1.3	4476928
286	179	4	2.7	\N	1.7	1266688
281	441	6	0	Bad talk decide beautiful particular across.	1.1	6852608
179	648	3	0	\N	1.3	7432192
241	41	8	0	Save decade hundred such lose least design.	1.7	7654400
269	432	4	2.6	\N	1.8	7270400
2	343	9	0	Different require major world political as.	1.0	4806656
75	104	4	2.6	Media believe include dog save space dog.	0.7	3605504
67	183	4	1.7	\N	0.9	7796736
67	175	4	1.5	\N	1.8	8114176
100	719	1	0	\N	0.5	2849792
162	820	4	2.9	\N	1.6	2255872
170	390	9	0	\N	1.8	3943424
73	427	1	0	Win community religious whole public movement reach.	1.3	1453056
85	13	3	0	Happen friend including off believe official various. Determine heavy lead message wife.	0.9	5968896
162	814	4	2.2	Report doctor final.	1.6	4599808
79	851	3	0	Candidate either whatever next control third argue.	1.0	205824
268	765	8	0	Want better address movement employee.	0.6	4441088
201	853	4	2.1	\N	1.9	3121152
98	713	4	0.1	Hope near media report focus they.	0.9	4686848
8	202	6	0	\N	1.5	2336768
275	227	4	2.6	\N	0.9	5727232
85	12	4	1.3	\N	1.7	1997824
189	618	4	1.2	\N	1.8	737280
54	410	10	0	Him soon second them everybody picture. Event several set region.	1.4	1013760
303	340	4	1.7	Either movement relationship their impact daughter player dark.	1.4	3238912
56	529	1	0	\N	0.9	1216512
216	650	4	1.3	\N	1.1	1577984
287	138	4	1.3	\N	1.8	1732608
300	738	4	1.1	\N	1.0	1647616
201	849	4	2.0	\N	1.9	4926464
225	731	10	0	\N	1.4	762880
121	708	8	0	\N	1.2	953344
229	48	7	0	\N	0.8	4291584
91	674	1	0	\N	0.7	4006912
229	40	4	1.3	\N	1.7	5297152
5	651	3	0	Education simply surface interesting choose organization discussion begin.	0.7	4194304
207	404	3	0	\N	1.7	6177792
302	530	4	1.2	\N	1.9	7582720
277	614	4	2.6	Former letter side response program green real.	1.3	4409344
95	362	3	0	\N	1.3	5477376
241	43	4	1.7	Look watch gas role.	0.8	1161216
193	512	7	0	West whole ability woman society report loss.	1.4	2429952
198	851	4	1.7	Business decide leg should else economic their.	1.2	362496
311	347	6	0	Than position little forget speak check rise.	0.9	2991104
148	408	5	0	Keep national play discuss officer network. The assume dream.	1.6	4396032
47	372	4	2.0	\N	1.7	8011776
121	719	4	0.9	Woman research son he firm.	0.9	5266432
296	434	10	0	Each environment wall success serious. Wind head majority decade meeting recent painting.	1.8	7641088
101	744	4	1.8	Wind can consumer middle husband.	1.9	4268032
225	717	9	0	Kid pressure stuff small social.	1.9	6525952
5	645	4	1.9	\N	1.5	4069376
89	603	4	1.4	\N	1.5	3237888
56	528	4	1.2	\N	1.5	7686144
87	443	4	2.9	Whatever reason lot laugh part want. Purpose realize group another weight himself difference everybody.	1.3	4466688
310	574	4	1.1	Want goal education party.	1.6	3202048
113	519	4	2.6	\N	1.8	4368384
72	674	4	1.6	Goal machine know effect industry.	1.1	4420608
146	573	8	0	Remain situation letter.	0.8	6305792
213	561	4	1.1	\N	0.7	3761152
174	341	4	1.5	\N	0.6	1312768
175	507	4	1.8	\N	0.7	7445504
199	571	4	1.4	Drive leader tend common price sense place picture.	1.4	206848
14	477	4	2.5	\N	1.7	8185856
248	656	3	0	\N	1.6	412672
114	486	4	2.4	\N	0.8	6479872
258	315	6	0	\N	0.6	961536
73	423	9	0	\N	0.7	4996096
17	200	1	0	Those enter if film.	0.9	7200768
156	42	6	0	Window half letter move raise some.	0.8	6808576
12	221	4	1.1	\N	0.9	5529600
247	209	6	0	\N	0.9	1215488
279	409	10	0	\N	0.5	770048
151	128	5	0	Control customer agreement purpose great their fight. Professional bring respond paper culture try play.	1.2	7097344
95	351	4	1.0	Word crime well magazine sport truth. Someone represent prepare kitchen.	0.9	2881536
289	64	8	0	\N	2.0	2715648
187	224	10	0	\N	1.9	7922688
185	792	4	1.8	Push skin citizen bank throw century.	1.7	4879360
27	743	9	0	\N	1.0	754688
33	547	4	0.4	\N	0.9	2678784
8	206	8	0	\N	0.6	1750016
122	449	4	0.2	\N	0.9	4367360
251	135	7	0	\N	0.8	7249920
129	557	4	0.1	Suffer across collection staff.	1.6	1205248
246	478	1	0	\N	1.1	4458496
214	231	4	1.3	Office task sell off require key.	1.4	4200448
215	513	4	2.2	Thousand heart around item.	0.8	2809856
133	775	4	1.7	\N	0.7	7555072
222	448	4	2.8	\N	1.4	3778560
154	443	1	0	\N	0.9	7516160
287	136	4	0.2	Task that top baby financial at everybody.	0.6	3226624
10	650	4	1.3	Policy hundred though campaign.	0.9	553984
252	261	3	0	\N	1.0	6453248
78	276	10	0	\N	0.7	709632
244	752	4	1.7	Whom interesting paper smile such.	1.9	1652736
123	771	3	0	Anyone sell any protect level cell stock example.	1.6	2649088
152	818	3	0	\N	1.0	3443712
156	45	4	2.0	Top yard break large.	1.3	2729984
211	835	4	2.0	\N	0.7	2853888
246	483	9	0	View commercial issue relate speak she.	1.4	7343104
59	692	9	0	\N	1.6	6454272
184	882	9	0	\N	0.7	5338112
126	13	4	2.9	Trial trouble their need mention.	0.6	1965056
190	388	4	1.2	\N	1.8	8229888
194	556	1	0	\N	1.6	461824
182	232	3	0	Rest name happy popular.	1.7	1100800
14	463	7	0	Also water part tree between.	1.2	115712
115	93	4	1.8	Least chair it through order.	1.8	3447808
4	347	4	1.7	Fly school result.	1.0	6148096
99	2	4	2.4	\N	2.0	1937408
143	94	4	1.1	\N	0.9	3474432
26	324	4	0.4	\N	0.8	5577728
168	307	6	0	More too south since statement method writer.	1.0	8110080
187	217	4	1.0	\N	0.9	2042880
241	45	4	2.0	\N	0.6	1059840
176	494	9	0	Purpose trade senior under.	1.5	2234368
11	217	4	1.0	\N	1.7	2561024
219	81	4	2.9	Occur involve political assume wall game live. Wide participant happy college contain our consider.	1.4	5848064
130	14	4	1.9	\N	1.9	6337536
307	398	4	2.1	\N	0.8	2311168
26	329	4	0.1	Defense grow whatever indicate magazine compare husband. Short others born bill.	1.5	5783552
27	735	4	0.3	\N	1.9	6419456
230	664	5	0	Positive sing participant thing individual.	0.9	3606528
215	516	9	0	System language improve deal technology animal.	1.8	6694912
308	844	3	0	\N	0.9	3987456
164	527	4	1.0	Moment attack information floor common.	1.0	4204544
266	782	7	0	Individual economic friend.	0.9	1911808
230	677	5	0	Mention improve entire. Artist not nation state movie.	0.7	7006208
118	457	6	0	\N	0.8	2325504
270	140	10	0	\N	1.1	4104192
152	830	4	1.6	Religious population present news test. Risk artist analysis often.	1.4	6518784
144	113	3	0	\N	0.8	1224704
217	277	5	0	\N	0.9	7823360
277	626	4	1.9	Form police its live next also.	1.5	3755008
276	830	9	0	White sure skin agreement whose great.	1.2	4220928
74	474	9	0	Step fund simple happy student wind well. This we system understand.	1.5	456704
225	729	4	2.7	\N	1.2	1044480
10	649	6	0	Serve daughter water pretty. Many high eight us your.	1.6	697344
159	415	6	0	Way significant generation president anything.	1.9	7836672
14	476	4	2.2	Kid either must take lead rate modern husband.	0.9	2744320
117	335	5	0	\N	1.2	182272
217	259	8	0	Usually key case professional man.	1.9	1001472
148	416	9	0	Chance choose concern significant picture media leave. Rock set democratic gas color pressure.	1.9	5043200
309	375	6	0	\N	1.5	878592
115	103	8	0	Especially education leave church civil Democrat child. Speech state teach plant.	0.7	877568
129	559	4	2.3	\N	1.8	3271680
257	289	9	0	\N	1.3	4779008
219	88	4	1.4	\N	0.7	1675264
303	347	1	0	\N	1.7	2849792
244	749	4	2.6	Attention face arm lay organization.	0.8	7840768
217	274	10	0	Ever quality south side worry member. Black hard Democrat education people rate rich analysis.	1.1	6539264
162	825	4	1.9	\N	1.3	6176768
221	476	4	2.6	\N	0.9	633856
148	415	4	2.1	Deal community main.	1.7	5653504
34	794	4	2.0	\N	1.4	2243584
142	549	6	0	Pass return window economy maybe election. Myself each me people save recognize end.	1.7	1125376
150	406	3	0	As dream report. Grow word decade word.	1.4	3382272
72	665	4	1.3	Increase smile charge accept case.	1.7	1382400
97	805	9	0	\N	0.8	2613248
289	61	4	2.3	His between positive something.	0.6	5329920
248	659	4	0.0	Media election board person account still. Top American activity record woman hard employee.	1.8	1171456
148	414	9	0	Event mean with suddenly.	0.8	6672384
50	234	3	0	\N	1.9	3488768
75	112	7	0	\N	1.8	7838720
238	612	4	0.9	Memory indeed TV media couple summer produce. Season evening cost Mr laugh.	0.6	4986880
283	20	9	0	American leg western character show.	0.6	4562944
289	72	4	2.6	\N	0.8	4834304
122	456	4	1.3	\N	0.6	6228992
75	100	4	0.0	\N	1.0	6172672
112	376	6	0	During question writer base.	2.0	3186688
143	104	5	0	\N	1.7	6717440
264	146	4	1.4	Administration population enough campaign enough although.	1.7	3534848
74	493	5	0	\N	1.2	3186688
49	793	7	0	\N	0.5	6607872
170	366	4	1.5	Happen or difference director will strong recognize.	1.0	6650880
212	338	8	0	Risk finish later night usually population throughout.	1.8	3269632
127	59	10	0	Society player toward fill.	1.0	1497088
80	253	4	2.0	\N	2.0	6916096
137	474	9	0	You executive thank mind.	1.3	6050816
116	88	4	2.7	Wait drug across hundred contain travel sense.	1.1	6028288
257	298	3	0	\N	1.9	4614144
113	498	4	1.0	\N	1.7	3273728
115	97	1	0	\N	0.7	5099520
309	388	1	0	Fast employee study hand available job behind.	0.5	6203392
276	841	4	1.6	Week what their head term capital research.	1.7	3883008
129	563	4	1.4	Any social score order first through. Cell television truth feeling.	1.6	4615168
102	793	4	0.3	Tree life wide unit billion yeah data.	0.8	6035456
91	659	5	0	Peace big region daughter. Tend successful enough maintain shoulder.	0.9	2355200
207	405	3	0	Television commercial two official seem book culture.	1.4	5275648
220	53	3	0	Thousand hair so since almost prepare.	1.1	3640320
280	722	9	0	\N	1.7	1674240
190	366	9	0	Very election kitchen. Compare nation street then appear organization vote cold.	2.0	1509376
101	746	4	1.0	Room themselves man college degree. Medical despite prevent enjoy agency.	1.8	7401472
9	22	4	1.4	Hard inside improve country.	0.8	922624
91	669	5	0	Sign last history action wife near.	1.1	7189504
67	167	4	1.3	Center recognize network space all guy.	1.9	1600512
269	442	4	2.7	\N	0.9	6455296
15	612	4	2.7	Interview attorney realize. Food partner allow woman foot risk.	1.4	4498432
160	183	9	0	\N	0.7	7497728
300	737	7	0	\N	1.0	5481472
152	823	9	0	See including few.	1.8	2779136
251	142	4	2.2	\N	1.0	8217600
258	332	4	2.5	\N	0.7	8148992
191	758	5	0	Again popular rise thousand.	1.1	1835008
122	448	4	2.8	Case reveal floor way issue seven statement.	1.2	1409024
156	55	4	1.9	\N	0.6	5078016
286	157	4	2.2	\N	1.1	3038208
91	668	4	2.8	Single measure interest concern they new.	1.7	4690944
196	286	4	2.3	Total region several window material.	1.3	3987456
152	814	4	2.0	Without adult up speech word bad.	1.8	1509376
228	692	6	0	\N	1.7	6303744
154	435	5	0	\N	1.1	5986304
50	248	8	0	Parent although author blue process throughout. Report charge cell agency.	0.7	1983488
133	774	7	0	Difficult play consumer poor bed first.	1.4	5596160
102	790	4	1.2	Second above southern evidence.	1.1	2876416
114	479	4	1.3	Age best pass to white you reason.	1.8	5972992
32	597	4	1.3	\N	1.0	3519488
124	345	8	0	\N	1.6	6504448
47	386	4	2.7	Team old participant price.	1.3	2968576
91	677	4	1.6	\N	0.6	5069824
67	163	4	1.5	Start call street good word.	0.7	6466560
15	610	8	0	Grow yes manager eight.	1.4	5792768
128	117	3	0	\N	1.9	3380224
3	113	4	2.8	\N	1.3	4294656
39	196	4	1.8	\N	0.9	3818496
115	91	3	0	\N	1.7	2755584
229	54	4	1.7	Other who over series relationship.	0.6	5941248
85	2	4	2.4	It month pass.	1.9	1357824
109	690	7	0	\N	1.3	7680000
153	76	4	0.1	Never home memory cultural town that.	1.0	1283072
137	493	3	0	Develop lose rest place it.	2.0	3991552
169	364	1	0	\N	1.0	4354048
190	386	10	0	\N	0.7	6289408
290	394	5	0	\N	1.1	7249920
263	436	5	0	That both Congress strategy.	1.2	5059584
76	342	4	1.7	\N	1.4	4046848
255	78	9	0	\N	0.6	6391808
108	738	4	1.5	\N	1.5	7790592
309	386	4	1.2	\N	0.7	3784704
46	602	4	0.6	\N	1.2	3804160
155	458	10	0	Mission what serve article enter in before.	0.9	1001472
288	835	6	0	Involve mother language audience around hundred art.	1.3	555008
135	259	4	2.4	Three property theory cell guess low.	0.7	3632128
56	534	1	0	\N	0.6	1771520
252	275	4	1.0	Fast charge type carry.	1.0	6687744
259	848	4	2.4	\N	0.8	4903936
215	504	4	0.3	\N	1.8	6394880
233	100	10	0	\N	1.7	347136
56	543	3	0	\N	1.9	1327104
109	684	4	1.0	\N	1.9	4233216
90	98	8	0	Traditional reveal soldier.	0.6	2234368
49	794	4	2.9	Learn charge strong area cup model like.	1.9	1082368
103	194	6	0	\N	0.9	1004544
160	167	4	1.3	Choose police enjoy ask present enough.	1.4	5159936
50	244	4	1.5	\N	0.7	294912
199	561	4	1.1	Decade chair level any.	1.8	148480
297	727	4	1.2	Learn there station chair more mean town.	1.5	4591616
192	735	4	0.8	Should decide away brother oil.	1.7	7956480
78	270	9	0	\N	1.3	3179520
206	391	6	0	\N	0.5	8253440
229	56	1	0	\N	0.5	2746368
114	468	1	0	Tend between under unit. Police make threat measure use listen.	1.1	2374656
121	721	4	0.2	Impact fund case fire teacher person think. Food knowledge include world individual seek.	1.8	2327552
217	273	3	0	Professional end pass discussion half every nature see.	0.8	8022016
72	661	3	0	Worker realize low hospital wife thousand tend.	1.1	4774912
187	230	6	0	General go go stay.	1.3	6045696
50	238	9	0	Avoid modern pull interview ten film.	0.7	4436992
233	96	6	0	\N	1.8	4613120
159	412	4	1.0	\N	1.0	4376576
15	615	8	0	Not either go last center true maintain.	1.4	3190784
283	31	5	0	\N	1.9	7906304
249	342	3	0	\N	1.9	4408320
291	291	4	1.4	\N	1.6	774144
138	266	4	2.1	\N	0.5	499712
166	332	6	0	\N	0.6	4253696
239	242	9	0	\N	1.3	1284096
227	669	4	2.6	\N	1.3	3281920
192	741	4	1.9	Tough over example bag stand process role.	0.6	7754752
76	343	4	2.0	Bit few food what.	1.3	8220672
278	705	4	0.4	\N	1.3	5019648
190	383	1	0	\N	1.7	5731328
120	594	4	2.0	\N	1.2	8180736
211	815	9	0	Democrat sign walk miss. Its of bed have.	0.8	743424
24	798	5	0	Join picture cell resource scientist center organization.	1.9	2341888
211	836	4	2.1	Reach clear cost yet. Again answer out almost establish coach.	1.7	6141952
191	750	4	1.1	Experience best source let condition thought.	1.6	5493760
283	21	4	0.6	Interesting including state activity especially total important. Ability feel fine stay.	1.5	1381376
298	722	7	0	Not year newspaper forget down glass better floor.	0.8	1942528
26	307	4	2.4	Analysis much outside right expert art fear.	0.6	5909504
265	393	3	0	Per specific cost set difference discussion gas realize. Style world officer painting prepare last.	1.8	5037056
241	47	8	0	\N	1.7	6879232
237	18	9	0	Likely record song interest although box difficult. Wish social image across account commercial analysis.	1.8	1805312
297	709	6	0	Real car property paper trial step.	0.7	5867520
106	141	3	0	\N	1.9	2593792
1	97	4	1.1	Human gas war perform PM. Fact southern administration former according.	0.8	1713152
277	628	4	1.2	Commercial pass car grow listen car push. Black major begin technology would.	1.5	2742272
164	510	4	2.5	Interest there seven.	1.7	5059584
177	216	4	1.8	Able develop wish Mrs sister bring commercial.	1.9	2354176
191	751	10	0	\N	0.6	2818048
305	697	8	0	\N	1.0	5748736
198	845	4	2.9	\N	1.8	7400448
197	870	4	2.9	Nation young financial trip worker spring. Fine start here hit.	0.6	378880
202	450	4	2.3	\N	1.2	2626560
159	419	8	0	Situation our north impact lay significant rather.	1.1	3442688
139	549	4	1.9	Local black us family decision.	1.1	6316032
154	439	8	0	Not knowledge actually create raise. Media top could wait first order.	1.9	3089408
123	781	4	2.7	\N	1.5	4564992
265	401	4	1.5	\N	2.0	772096
23	236	4	2.0	\N	1.8	6822912
202	448	4	2.8	\N	0.8	2603008
14	492	4	2.0	\N	1.3	731136
79	846	9	0	\N	1.3	820224
152	820	4	2.9	\N	1.5	3683328
26	328	4	1.8	Service move people.	1.4	3205120
30	662	5	0	Effect list energy way professional join firm meeting. Itself appear PM enjoy there east candidate.	2.0	4672512
172	850	7	0	\N	1.9	7878656
68	636	9	0	Want what build recently eight.	0.8	7502848
287	148	1	0	Difficult begin popular may.	1.8	5555200
125	149	4	2.9	\N	1.1	4429824
199	563	4	0.6	Letter fine happy employee morning agree paper. Set young such these.	1.2	7142400
240	83	4	2.6	\N	0.6	6486016
306	536	4	2.2	Buy fill would mission accept man yourself. Rock meet after him drop eight first.	1.2	941056
158	213	7	0	Thing hotel ability language live deep.	1.5	2266112
6	693	4	2.9	\N	1.0	658432
286	160	10	0	Long also individual stuff gun security vote center.	1.8	5820416
275	223	5	0	\N	1.8	6729728
177	224	6	0	True thought growth push direction lot.	0.8	8251392
182	214	4	2.3	Reflect others when.	1.6	5545984
224	44	4	1.4	Large increase allow effort stage.	0.5	1536000
114	477	5	0	Surface there know rise why help watch pretty. Choice begin their agency medical seat pass.	1.2	1801216
214	230	4	2.0	\N	1.1	7347200
7	389	5	0	\N	1.3	6261760
95	364	4	2.1	\N	1.1	1756160
183	191	4	2.5	He like eight.	1.6	536576
106	148	1	0	Certainly letter threat black.	1.7	6671360
113	501	4	1.0	\N	1.9	2467840
146	568	4	1.4	\N	1.8	6392832
199	557	4	1.3	Situation able someone story.	1.2	6155264
105	107	4	1.2	Protect series grow inside mission. Serve group fly first beat.	2.0	7188480
24	808	4	2.3	\N	0.6	327680
218	754	4	1.7	\N	1.7	2631680
64	197	7	0	\N	0.8	510976
199	574	4	1.1	Media culture lot class operation. International example less cultural.	0.8	3795968
101	745	4	0.3	\N	1.6	7415808
54	421	7	0	\N	1.2	2603008
138	251	6	0	Event star investment hear every remember.	0.9	6280192
112	380	5	0	Tough else less southern think but science.	1.5	1281024
254	823	4	2.0	\N	1.5	1770496
77	391	5	0	\N	1.3	5085184
3	100	4	2.7	\N	0.6	1475584
78	277	4	0.7	\N	1.9	8148992
255	89	10	0	\N	1.4	7054336
113	526	1	0	\N	1.8	4960256
134	149	7	0	\N	0.8	5847040
134	150	4	2.8	\N	0.9	133120
105	100	4	2.7	\N	0.7	6239232
128	118	4	0.7	\N	0.5	828416
100	710	6	0	\N	1.3	7007232
12	220	4	1.2	Spend plan represent Republican huge serve charge.	0.8	7835648
206	403	4	2.5	End including final hope move name sure.	1.4	6612992
251	134	4	0.3	\N	1.7	5091328
197	880	4	2.5	Authority new nature any.	1.0	4748288
248	673	4	1.0	\N	1.7	7819264
172	851	3	0	Discuss more north land.	0.8	3263488
29	799	4	1.5	\N	0.6	7873536
202	457	4	0.8	Project prevent focus mother actually great.	1.8	5035008
252	272	4	1.3	Leg human energy design southern better night.	1.5	2772992
301	345	9	0	Interest structure their feel bad nor.	1.1	1418240
274	85	10	0	\N	0.5	5736448
204	610	9	0	International generation spring test left new.	1.1	2658304
158	212	4	1.2	Study short kid oil.	2.0	7780352
298	726	4	2.1	\N	1.2	2036736
252	277	5	0	Some carry teach include write suffer.	1.3	5113856
244	755	4	2.4	\N	2.0	1275904
53	760	1	0	\N	1.6	5787648
214	219	4	2.4	Difference affect PM worker.	1.6	754688
304	550	4	0.6	\N	1.3	7818240
30	661	4	2.3	Idea sit detail. Apply which western may professional meet talk.	1.2	5626880
197	877	4	2.9	\N	0.9	4727808
159	411	4	2.8	\N	1.2	4186112
284	624	4	2.4	Argue provide ten place.	1.9	192512
278	686	8	0	\N	1.2	3196928
166	310	8	0	Evening present memory.	1.0	7043072
96	659	4	1.1	Visit edge early strong. Beautiful word tonight realize.	1.9	3636224
51	200	8	0	Develop even raise dog peace.	1.4	6928384
225	719	4	2.6	Air food spring management.	1.4	5750784
162	816	4	2.7	\N	1.6	4050944
119	335	9	0	\N	0.7	584704
195	423	9	0	At indeed beat each thus road official analysis. Meet leave front my close space.	1.5	2092032
61	738	9	0	Teacher next difference girl attention military. Republican news us station material couple.	1.8	3486720
287	153	4	2.9	\N	1.8	1358848
71	41	4	2.6	\N	1.3	3500032
270	148	4	0.4	\N	1.8	1832960
233	95	9	0	\N	1.1	1170432
227	658	4	2.0	\N	1.2	8071168
67	179	4	2.7	\N	1.8	507904
71	52	4	0.2	\N	1.8	4542464
195	416	4	2.1	Tend college music at war various.	0.5	3194880
184	867	6	0	\N	1.9	5798912
137	476	8	0	\N	1.3	2258944
17	207	4	1.0	\N	0.7	851968
184	879	10	0	\N	1.0	3598336
211	838	1	0	Career ball pull about training. Position entire represent.	0.9	2239488
161	790	4	1.2	\N	1.9	700416
216	643	9	0	Clearly sing plan learn material exist.	0.7	6694912
67	164	4	1.1	\N	2.0	5813248
247	202	4	1.7	Fast blue back we. Feel instead ask same.	1.2	7586816
80	273	3	0	Painting interview beyond station oil cup business.	1.1	8283136
106	138	4	1.3	Care among five ground begin somebody story.	1.3	2160640
199	569	4	2.6	Feeling receive girl owner forward throw audience sign.	1.0	1290240
179	640	4	2.1	Husband notice just edge prevent.	1.2	7506944
115	107	4	1.2	Now sometimes everybody.	0.9	3211264
17	203	4	0.4	\N	0.9	1224704
1	98	4	1.7	Adult yeah language century attorney responsibility performance.	1.2	5063680
253	812	4	1.4	Couple baby against ok. Technology still thus across.	1.4	4409344
184	856	8	0	Pressure show amount food.	0.6	4999168
298	732	4	1.3	\N	1.5	6247424
64	199	4	1.3	Develop federal blood manager military difficult. Reach too account involve travel.	0.5	2963456
62	723	4	1.1	\N	1.0	4160512
211	818	4	2.3	Big north leg Mrs.	1.1	6108160
276	836	7	0	Tend head glass use lose care. Occur any management information attention could.	1.5	878592
43	543	4	1.3	Us success enough note.	1.0	913408
282	405	10	0	Anything reason fire somebody as network exist.	1.9	5553152
80	267	3	0	Arm break sister country do standard feeling. Leader continue begin why.	1.0	5928960
137	465	4	2.7	Manager style president early according very or machine.	1.6	5143552
289	60	4	2.9	Director have follow close.	1.9	2305024
261	422	7	0	\N	1.1	7729152
5	646	4	0.6	\N	1.5	1786880
300	741	3	0	\N	0.7	6455296
53	764	1	0	Surface rule near second mention yes. How nor wait stay throughout half.	1.9	2360320
61	742	4	1.8	War might wall past discussion kind tonight.	1.0	7706624
261	404	4	2.0	Born study particular lay occur if. Up manage couple arrive team.	1.8	2520064
47	376	3	0	After instead trade before politics. Worker memory up raise again.	1.4	1824768
279	417	9	0	Already difficult no sell budget example gun most.	1.2	1514496
109	694	8	0	\N	2.0	3630080
277	609	4	2.1	\N	1.9	7152640
1	101	9	0	One of source movement. Marriage despite probably put.	0.8	651264
164	517	4	2.7	Deal she small cup hair.	1.2	2576384
24	801	7	0	\N	1.7	436224
81	792	4	1.8	Some government include may.	0.8	3790848
64	200	4	1.0	\N	1.4	7898112
208	552	6	0	Feel sea seek lose face down TV.	1.3	928768
229	41	8	0	Themselves ten cultural federal including. Add laugh upon around.	1.0	1181696
102	791	4	2.2	\N	0.9	8253440
245	385	8	0	Benefit whose reduce if wall. Risk why southern produce husband.	1.5	1562624
47	368	7	0	\N	1.8	476160
224	41	4	2.6	\N	1.1	3771392
246	479	4	1.2	Teach answer daughter ahead development history experience.	0.6	6829056
114	471	4	1.2	\N	1.7	1915904
40	92	4	1.3	Get until cause maintain Mr process note church.	1.6	6683648
119	336	4	1.0	\N	0.7	4173824
66	437	5	0	\N	1.4	4268032
132	29	1	0	\N	1.6	8127488
175	526	4	1.5	\N	0.7	4614144
128	121	1	0	Citizen school just maybe hair.	0.7	7156736
211	822	10	0	\N	1.1	5963776
266	771	5	0	Before control close laugh main into.	1.2	7790592
232	344	4	2.3	\N	0.8	4473856
114	488	4	0.3	Gun foreign agree.	2.0	7095296
283	35	4	1.1	Far red everyone.	1.3	4694016
80	252	4	0.6	\N	0.9	7713792
217	262	4	2.9	Such suffer course against tell radio nothing stop.	1.9	2612224
87	433	4	2.2	\N	1.9	5696512
274	75	9	0	Easy partner agent huge ground.	0.9	762880
144	107	6	0	\N	0.7	163840
129	555	4	1.8	He also understand standard case.	0.6	8208384
267	742	4	1.1	Line look outside nice. Method hot end popular half improve remember.	2.0	7924736
14	474	1	0	\N	1.8	5064704
69	794	5	0	Course draw that front indicate yeah back. Book seem determine hotel.	1.7	8028160
68	639	4	1.7	Moment president fight measure soldier base. Most military until art lose although suggest.	1.5	5099520
179	632	3	0	Technology art contain similar.	1.5	2534400
197	867	1	0	\N	1.4	7984128
183	194	1	0	Environmental with weight poor front before television religious. Send population cold nature game focus city.	1.9	7226368
96	679	4	2.4	Particular population feel available performance maybe in.	1.6	4825088
189	608	3	0	\N	1.1	2872320
13	213	4	1.2	Term middle wear.	0.6	8151040
225	708	1	0	\N	1.3	2282496
270	137	5	0	\N	1.9	1563648
99	10	4	1.2	\N	0.7	7851008
272	759	4	2.1	\N	0.9	5614592
33	553	4	2.1	Leader stage minute doctor.	1.2	6898688
308	845	3	0	\N	1.4	2876416
179	644	4	2.1	\N	1.9	5061632
179	633	3	0	\N	0.7	3846144
170	371	4	2.9	\N	1.4	6322176
296	439	10	0	\N	0.8	7361536
225	721	4	1.9	\N	1.3	265216
33	549	4	1.9	\N	1.3	4682752
74	480	9	0	Reduce choice rich.	0.7	2541568
101	741	4	2.6	Level any city city weight million still scientist.	1.5	7634944
127	74	6	0	\N	0.6	603136
217	276	4	1.7	Compare after ability. Set various nice a young.	1.4	2202624
217	255	7	0	\N	1.5	3274752
111	344	4	2.9	Six strong business office where.	1.1	3347456
211	825	4	1.9	\N	0.7	4507648
298	728	4	2.4	\N	1.7	4197376
306	539	4	2.5	\N	1.4	374784
149	411	4	2.8	\N	1.4	1494016
114	480	4	1.5	\N	2.0	4369408
68	654	9	0	Another Democrat town whatever development something.	0.5	5649408
40	96	1	0	Under front significant thought environment weight.	1.7	3939328
44	64	8	0	\N	1.7	5838848
56	531	4	2.5	\N	0.7	3757056
184	869	1	0	\N	0.5	950272
167	854	4	1.9	Surface strategy above reflect positive develop tough.	2.0	3893248
88	444	4	2.4	\N	1.7	6576128
75	92	4	1.3	Now south magazine fact show born.	0.8	1521664
166	321	4	2.2	Already theory tell court by point.	0.8	1306624
67	158	4	1.9	Drive more during these material knowledge begin.	1.8	6145024
215	505	4	0.0	Activity drive bar.	1.8	7386112
291	294	4	2.8	Nor pull something determine tax. Admit special between night term.	1.3	3742720
123	778	4	2.1	Recent too goal state since network in.	1.5	1661952
280	730	4	2.4	Whether consider full box.	0.6	4120576
131	847	1	0	\N	1.5	2227200
247	208	4	0.8	Sing share woman resource successful.	1.5	6182912
155	450	4	2.3	\N	1.3	2490368
21	341	6	0	Marriage father assume. Really me kind arm class certain.	1.2	4868096
122	453	5	0	Door religious all.	1.3	3062784
116	86	4	1.2	Also shoulder line happy old.	0.7	2972672
222	462	4	1.0	\N	1.0	1815552
23	240	4	1.3	\N	1.1	208896
302	537	4	1.8	\N	1.9	2802688
195	408	4	1.8	Foot drop describe into cell tax tax choice.	0.7	5427200
175	505	4	2.1	\N	0.9	3207168
305	683	4	2.3	\N	1.4	699392
7	374	9	0	Dark order pass.	1.3	4152320
155	456	10	0	\N	0.6	7416832
283	34	8	0	Road half trade maintain account back.	1.3	7077888
156	50	9	0	Finish politics discuss team themselves yeah name.	0.5	5868544
217	282	4	1.0	Miss no low officer may trial six.	1.9	3375104
112	388	7	0	\N	1.1	1171456
72	657	4	1.4	\N	1.0	4264960
124	343	4	2.0	Street box whatever. Kitchen news actually security attention feel beautiful employee.	1.6	5325824
220	44	4	1.4	\N	0.6	1641472
242	301	6	0	Agency risk chair.	0.8	2116608
155	447	4	1.2	Use billion be song writer show. Forget big shoulder ground support remain field certainly.	1.9	6645760
216	651	10	0	\N	0.9	2305024
291	286	4	2.3	Question above knowledge argue story form herself. Spring significant I two send page go course.	1.9	7634944
218	759	8	0	Above star throw. Let future available smile home.	0.9	7918592
152	824	7	0	Always reflect entire baby exactly together. Person enjoy common material man rich.	1.9	1586176
162	831	4	0.6	\N	1.3	699392
261	423	7	0	\N	1.0	2961408
102	787	10	0	\N	1.1	7223296
116	79	6	0	\N	1.5	4591616
51	196	4	2.8	Else before cost form future find another.	0.7	6493184
101	739	4	1.4	Morning yard money everybody serious blood.	0.9	898048
184	883	3	0	Old suddenly industry talk sort.	1.3	742400
201	842	4	1.8	\N	0.6	4696064
255	80	4	1.8	Finish do indeed. Interview never five here thus.	1.0	1580032
218	761	4	2.4	Read hear bag cut away close policy high.	1.8	5159936
159	418	9	0	Back thousand positive form successful everyone.	1.4	161792
113	512	4	1.1	\N	1.1	2025472
258	313	7	0	Perhaps increase today ready whether. Sea participant adult thing right yourself.	1.3	371712
268	750	4	1.1	Better can pattern trade mind return form high.	1.4	7016448
108	744	4	1.8	\N	1.3	4356096
173	257	4	1.4	Bed relationship goal open.	1.4	1821696
11	215	9	0	Natural marriage style eight arm both.	1.5	2759680
133	771	4	2.2	\N	1.7	3604480
213	555	9	0	Thousand factor manager almost.	1.2	4012032
237	32	4	0.4	Section season inside training.	1.5	8112128
166	303	4	2.4	\N	1.2	1441792
266	784	4	1.0	\N	1.0	5702656
219	87	6	0	Agency maybe dog policy decide though rather.	1.0	5549056
272	754	6	0	Hard anyone experience fly provide.	1.1	1979392
67	156	4	1.7	\N	1.5	4552704
286	158	3	0	\N	1.8	8066048
4	342	4	1.7	Method guy short. Listen meet under standard human enough.	1.5	6547456
146	559	4	2.3	Cost huge statement sort.	1.5	352256
177	230	9	0	\N	0.6	5089280
22	226	4	0.7	\N	1.5	5806080
301	341	4	0.6	Play house benefit real through.	0.7	1179648
280	714	4	2.4	\N	1.5	580608
169	353	4	2.1	\N	1.5	3179520
181	786	4	2.1	\N	1.0	5350400
106	152	9	0	She church dream speak position good serve herself. Animal fill break design process cup tax.	1.8	5270528
71	49	4	1.4	\N	0.6	1372160
146	556	7	0	\N	1.2	2902016
294	461	5	0	\N	0.7	4104192
166	307	5	0	\N	1.8	1037312
278	687	4	2.6	\N	1.0	2920448
92	732	4	1.3	Almost respond bag in. Notice term specific.	1.8	8184832
286	180	4	2.5	\N	0.8	6801408
61	741	4	2.6	\N	1.5	5545984
105	106	4	2.0	Me save deal. Foreign Republican stuff ever way.	1.2	1084416
138	261	6	0	\N	1.9	5487616
165	302	4	2.0	Low nature difficult between understand meeting.	1.9	5703680
254	822	3	0	\N	1.8	7658496
125	142	5	0	Final care race message front. Newspaper interview tell store city stock know finally.	0.6	5706752
164	514	4	2.7	Science seat your less own week bill edge.	2.0	2883584
7	386	9	0	Deal director late you agree machine six.	1.6	3511296
270	142	4	2.2	\N	0.8	2080768
280	708	4	2.4	\N	1.7	2539520
11	216	8	0	Page let street be fight main.	1.7	7906304
203	787	4	2.9	Movement wide dog among dark decade article blood. Series former resource herself trip administration create.	0.8	6967296
281	439	4	1.7	Section speak arrive agent fight shake plan. Change peace because visit.	1.4	7839744
177	223	5	0	Detail material husband hope.	1.2	6092800
13	211	7	0	Suffer grow situation end defense benefit community low. What get court possible bring teach only drop.	1.8	1965056
206	398	4	1.4	Mission myself ever level yourself. Offer interest foot while early.	1.9	1239040
253	803	4	1.0	Idea pass American soldier knowledge view he.	0.7	7783424
291	285	10	0	Message head rather join find return.	1.7	6839296
28	321	4	2.2	\N	1.7	780288
287	137	4	1.6	Car environmental nice TV. Rich large condition very measure decade radio carry.	1.5	4549632
105	94	4	1.1	\N	0.6	3103744
262	680	4	1.6	Debate environmental live picture control.	1.1	4656128
132	30	4	0.1	Far open strong law decide.	1.5	2170880
173	266	4	2.1	Walk there feel none nature wall.	1.4	4924416
200	295	4	1.0	\N	1.1	4302848
305	702	4	2.5	While send program allow.	1.9	6693888
101	735	4	1.9	\N	1.6	3238912
3	109	4	2.5	Establish admit tend international wait throughout.	0.9	1672192
104	534	7	0	Person someone strong movie alone common. Stop doctor money nice.	1.2	6622208
112	383	8	0	\N	1.1	4969472
297	710	5	0	\N	1.6	1805312
268	758	4	2.2	\N	0.7	1325056
74	476	4	2.6	\N	1.2	963584
214	221	4	1.0	\N	0.7	6776832
19	301	5	0	\N	0.8	7357440
245	376	1	0	Arm room value list act me address today.	1.8	871424
159	427	10	0	Worry true every social.	1.9	7050240
198	848	6	0	\N	1.5	8136704
20	341	4	1.5	\N	0.6	2397184
100	729	3	0	Step until white course.	1.5	2766848
222	456	5	0	Respond social test however amount house. Some course business near every tonight tend.	1.0	6173696
91	666	4	1.4	\N	0.9	5018624
280	728	4	2.4	Suddenly decade candidate true why.	1.1	2301952
181	787	10	0	Center sound who card popular.	1.4	788480
217	281	3	0	\N	0.7	7298048
192	746	8	0	\N	1.0	5204992
215	514	8	0	Necessary seem mind for identify.	1.3	7283712
89	600	4	2.2	Here need hold speak myself.	1.8	5193728
137	479	1	0	\N	1.9	3362816
167	851	4	1.7	Similar leader process avoid.	1.2	7497728
270	134	3	0	\N	1.7	2300928
177	218	9	0	\N	1.3	2928640
24	797	4	2.2	\N	0.5	7614464
154	432	7	0	Real same poor garden attorney choose contain organization.	1.0	5429248
1	94	1	0	\N	1.4	465920
2	342	4	1.7	\N	1.9	2409472
24	806	8	0	Television create wonder begin quality. Article test something them all.	1.0	1849344
121	713	5	0	\N	1.9	2791424
85	10	5	0	\N	1.7	782336
112	375	1	0	And shoulder option behind include none.	1.1	7302144
15	611	7	0	Experience southern notice itself try experience yeah right.	0.8	7250944
53	759	3	0	\N	1.6	3604480
243	432	6	0	Upon even but executive civil glass home. Education effect yet pretty buy despite attack.	1.7	346112
196	288	9	0	\N	1.0	5149696
254	829	4	1.7	\N	0.9	7882752
75	110	9	0	Audience direction education represent.	1.3	7329792
281	440	10	0	Whether vote leader religious simply current. Somebody keep deal almost action table.	1.3	1912832
204	622	4	2.4	\N	1.5	601088
93	728	4	2.4	\N	0.9	5139456
77	394	7	0	Perform attorney particular they they power security other.	1.6	4606976
8	199	5	0	\N	1.9	7552000
264	141	7	0	Not safe unit approach source evidence society.	1.7	4751360
246	485	4	0.0	\N	1.9	829440
265	394	7	0	Board high without probably president wonder election technology.	1.4	598016
264	134	4	2.0	Sure share big when serve Democrat.	1.1	7682048
214	220	9	0	\N	1.0	7485440
177	215	9	0	\N	1.4	6652928
151	124	5	0	\N	1.0	5922816
309	384	4	2.2	\N	2.0	6936576
150	412	6	0	\N	1.5	586752
40	97	4	1.1	\N	0.6	5769216
31	301	4	1.9	\N	1.3	2463744
148	425	1	0	\N	1.2	2772992
78	258	4	1.9	\N	0.7	7084032
138	275	4	1.0	Somebody animal house hour south situation.	1.6	1296384
77	392	4	2.0	Than wish here particular lot.	0.9	851968
180	543	5	0	\N	1.5	1348608
284	610	3	0	Social course away magazine if world upon.	1.7	2975744
90	101	10	0	\N	0.5	3844096
290	403	4	2.5	\N	1.8	332800
112	374	5	0	\N	1.5	5516288
139	545	6	0	\N	0.6	1148928
257	296	4	1.0	Increase church but positive become matter. Guess few glass else win strategy whatever project.	1.3	4022272
209	394	6	0	Drug audience ok short talk. Add front fall.	1.1	1538048
282	411	7	0	Voice go speak candidate reduce anything goal.	0.9	6752256
205	286	4	1.9	\N	1.9	6963200
191	756	9	0	\N	2.0	273408
27	738	8	0	\N	0.5	6065152
262	668	8	0	\N	1.5	188416
306	531	4	2.5	\N	1.2	3381248
132	36	4	1.9	\N	0.9	4379648
304	548	4	0.2	\N	0.7	8181760
266	780	1	0	\N	2.0	1840128
99	8	4	0.8	Heart former this interest. Then as management mother family rest story painting.	0.6	4312064
254	836	4	2.1	\N	0.8	3567616
74	469	4	1.4	Friend cold court significant also during.	1.8	3511296
133	778	7	0	\N	1.1	5001216
80	257	4	1.4	\N	1.8	1764352
96	662	4	1.7	\N	2.0	7372800
121	728	4	1.7	Society day back amount heart blood old.	0.6	5276672
140	374	1	0	\N	1.9	112640
175	510	1	0	Better husband someone take late report. How popular some sing.	1.1	171008
53	747	4	1.1	\N	0.6	7996416
286	164	4	1.4	Beyond improve especially.	0.9	2940928
126	5	4	1.2	\N	0.6	2282496
93	711	4	0.6	Religious when character.	1.7	7760896
142	545	4	1.5	From nearly fear shake I actually country.	0.8	2784256
114	476	4	2.6	Not through act relate. Country drop sort level room various.	0.7	4929536
218	760	4	2.0	\N	1.2	1342464
225	732	4	1.3	Carry line amount series first industry. Heavy place responsibility pay send lawyer.	1.0	7581696
143	106	4	2.0	Country discuss quite several have exactly.	0.8	7800832
58	494	4	2.8	\N	0.6	5687296
279	413	4	1.4	\N	1.7	6923264
284	626	1	0	\N	1.5	186368
78	250	10	0	\N	0.6	3929088
252	273	4	1.2	Seven newspaper morning them. Relate of capital party on.	1.9	8220672
28	332	4	2.5	\N	0.8	5250048
177	225	4	2.1	\N	1.6	2457600
134	140	3	0	\N	1.5	7394304
92	727	4	0.9	\N	0.6	1296384
105	104	4	2.6	\N	1.9	6471680
39	198	4	2.1	\N	0.9	2446336
267	745	4	2.5	\N	1.8	4644864
166	311	8	0	\N	0.7	1857536
131	850	4	1.6	\N	0.9	2244608
310	565	5	0	\N	1.4	4227072
3	96	4	2.9	Cell hit question gun action effort space.	0.6	449536
91	662	4	2.2	\N	1.3	5606400
309	370	4	1.2	Evidence condition feeling ok. Because present know five public science six.	0.9	6333440
54	409	6	0	\N	1.5	2906112
148	420	4	1.9	These once outside live often available.	0.6	3228672
219	77	4	1.7	Its kid stuff role across point first. Everything year avoid American specific.	1.3	4752384
132	31	4	1.4	\N	0.9	7015424
305	706	1	0	Pass mother industry thank soldier.	1.5	1549312
51	204	4	1.8	Make television whether way member member wall.	0.9	7282688
167	849	8	0	\N	0.9	5711872
66	433	5	0	Audience almost church tonight.	1.3	5111808
159	426	1	0	Attack apply here than history. Crime control show property purpose believe door.	1.3	7123968
199	565	10	0	Perform bad different drive charge just name. All beyond carry TV government various baby.	1.2	3968000
152	840	4	1.5	Final population while decade focus or.	0.7	7617536
146	564	4	1.4	\N	1.5	2560000
211	841	10	0	\N	2.0	4039680
93	718	4	2.0	\N	1.5	700416
244	762	6	0	\N	1.0	7406592
26	304	7	0	Movie answer issue economy worker task along.	1.2	7990272
46	601	6	0	\N	0.7	4088832
43	532	3	0	\N	1.2	7611392
156	43	4	1.7	\N	1.9	4155392
277	625	9	0	\N	2.0	3988480
47	373	1	0	\N	1.9	779264
254	825	4	1.9	\N	1.7	4896768
225	716	4	2.1	\N	1.5	3772416
200	285	1	0	\N	1.2	3312640
162	837	7	0	Design answer two minute.	1.6	4651008
91	664	4	0.2	Right foreign world pattern inside certainly.	1.1	7712768
137	491	4	1.5	\N	1.1	6069248
210	457	4	1.7	\N	1.0	2429952
227	678	4	2.3	\N	1.4	4882432
162	822	4	1.4	\N	1.6	6375424
191	760	4	2.0	\N	1.1	5288960
26	326	4	2.9	Three black there mother interesting could.	1.1	6620160
270	150	5	0	Win task common talk want professor probably American.	1.1	5794816
195	413	6	0	\N	0.7	2442240
213	572	4	2.7	\N	1.0	3150848
78	251	4	1.9	\N	1.6	4980736
105	91	9	0	Four society leave walk.	0.9	6969344
100	708	10	0	Born personal nice general example little some yourself.	2.0	5405696
222	452	4	2.7	\N	2.0	2062336
254	815	5	0	Nice how moment no practice.	1.2	6203392
32	598	1	0	Amount president visit buy.	1.6	7508992
127	67	4	2.1	Provide but remain about again.	1.2	2335744
115	102	4	2.6	\N	0.7	556032
295	596	5	0	Face strong local out. Teacher street beautiful local mean.	1.9	1642496
149	409	6	0	Really responsibility painting ahead.	1.2	7800832
212	333	7	0	\N	1.9	120832
54	412	9	0	\N	1.4	8273920
96	660	5	0	Option seem sign four pull pressure so.	2.0	4067328
308	848	4	0.7	Develop message law explain record democratic treat.	1.8	7022592
68	646	4	1.7	Price understand traditional just war.	1.7	1038336
99	6	4	2.0	\N	1.6	1308672
209	400	4	2.6	Hand walk build. Development place arm back strategy party budget.	1.4	4199424
75	95	4	0.7	Treat remain there recognize occur go room.	0.6	1904640
169	362	7	0	About share year new end fear peace team.	0.6	8184832
51	198	6	0	Front remain go consumer. Discover this form form moment past.	1.0	3594240
167	848	4	2.8	\N	1.3	2581504
149	424	4	2.7	Long answer knowledge provide prevent behind budget. Floor receive watch camera which.	1.2	6815744
162	840	4	1.2	Question parent politics through hit style current. Box probably window east discussion anything approach write.	0.8	5956608
74	490	6	0	May culture bank check TV.	1.0	573440
295	598	4	1.5	Effect level leader bed choose hot staff.	0.6	1421312
299	394	4	1.7	\N	1.8	5289984
241	53	9	0	Half student official statement national.	0.6	5614592
168	321	4	2.2	\N	1.4	2209792
116	81	4	2.7	World middle especially describe human set place. American window different act grow reduce perform.	1.9	6565888
282	419	4	2.1	Certain fine all other. Happy area piece adult.	1.1	2306048
160	158	4	1.9	\N	1.4	1449984
96	680	4	1.6	Back training future personal though. Other role sell total condition purpose reveal.	0.6	6006784
246	492	1	0	Street travel suggest he hear.	1.4	154624
206	396	4	1.6	\N	1.2	2758656
311	344	10	0	Scientist arm move hold suddenly test. Couple name writer somebody defense.	0.7	2063360
30	676	4	1.8	\N	1.9	1823744
87	441	4	1.5	Environmental season suggest will include direction writer. Old amount husband already research region put middle.	1.2	6289408
258	307	4	2.7	Police ball state she my.	1.9	3200000
139	548	4	1.9	Rise gun where particular. Trouble hope once vote.	1.7	1926144
230	668	4	2.8	Skill force should his all.	1.1	4649984
89	607	4	2.0	\N	1.5	6311936
14	465	9	0	Matter should girl simple range any spend.	0.8	6242304
169	360	9	0	Place group morning always. Leg car type movie Democrat section project top.	1.8	5876736
155	454	4	1.1	\N	1.8	4129792
145	355	1	0	\N	1.7	6571008
63	49	8	0	\N	0.9	6073344
236	299	8	0	Body production great also food admit.	0.6	2838528
305	684	4	1.5	Middle clear say finish anything. Year administration accept do when land.	1.7	2166784
241	42	4	2.8	\N	1.6	935936
24	812	4	1.0	Voice share relate young call.	1.7	6690816
191	764	3	0	\N	1.5	7732224
233	103	4	2.8	\N	1.3	2162688
140	366	7	0	\N	0.6	6391808
48	340	8	0	Sort catch politics specific full.	0.6	7017472
125	153	4	2.9	\N	0.9	7095296
72	672	1	0	\N	0.8	1329152
135	260	4	1.4	Responsibility know military.	1.2	8091648
272	750	8	0	Them night task year half.	1.9	3027968
143	91	6	0	\N	0.6	6547456
54	427	4	2.8	\N	0.6	2380800
95	363	10	0	Very certain prepare.	0.7	7574528
28	307	4	2.7	\N	1.2	6330368
113	499	4	2.9	\N	0.5	4608000
215	507	4	1.8	Thing worker rich cause.	1.6	4914176
104	538	4	2.0	\N	1.2	5786624
45	8	4	1.2	\N	0.9	7588864
150	404	4	0.5	\N	0.6	6639616
196	287	7	0	Agree provide smile mind answer.	0.7	6242304
160	177	4	1.9	\N	1.7	7980032
290	393	4	2.6	Special smile treat spend his. Hand born before city explain.	1.1	6443008
135	264	4	2.4	\N	1.5	5122048
224	55	5	0	Discuss course town. Line on structure traditional.	1.2	1356800
251	148	1	0	Question season I. Strategy truth attention big.	1.7	2054144
82	429	4	2.1	\N	0.5	1603584
309	380	4	1.0	Democrat apply pretty live perhaps. Toward bed matter before board.	1.9	5004288
51	209	4	1.2	\N	1.3	695296
264	151	1	0	\N	1.1	779264
44	74	4	1.1	\N	2.0	3335168
164	524	10	0	Edge someone indicate owner rate end coach and.	1.3	7300096
248	664	4	1.0	Attorney travel law individual. Mission machine way.	1.0	3259392
132	16	8	0	\N	1.9	2769920
47	388	4	1.2	\N	1.6	5165056
302	529	7	0	Despite evening able record growth whole across.	0.6	7892992
194	562	9	0	\N	0.9	5029888
153	85	7	0	Office audience Congress customer increase.	0.9	4524032
63	47	9	0	Woman second pull operation focus full prevent.	1.1	7708672
36	193	4	1.6	Wide task perhaps hundred system.	0.9	5636096
263	435	4	2.4	Kitchen hundred around training expect send. Win role only health address.	1.6	421888
95	354	4	1.4	\N	0.7	7784448
95	365	8	0	Shake management out reach which make I.	1.2	2194432
135	276	8	0	Nearly cut later character smile question care.	1.8	1798144
40	100	4	2.7	Whose for head produce impact along perform town. Station enjoy eat executive.	1.3	655360
205	292	10	0	Onto around surface near population hit operation institution.	1.5	6100992
192	739	4	1.4	Foot break also green player artist practice.	1.9	579584
216	642	1	0	Issue than apply name time spend participant.	1.7	5271552
14	478	4	1.6	Difficult brother over attorney whether even. Town reality fear lose food.	1.6	5620736
113	509	6	0	\N	0.8	4551680
295	606	7	0	Animal writer stand cultural throw.	1.2	3893248
224	45	4	2.0	Dinner key writer well while. Likely despite source fact really visit too.	0.7	3403776
73	419	3	0	Out answer guy five shake general.	0.8	8047616
217	280	10	0	\N	1.8	7569408
6	703	3	0	\N	0.8	7698432
193	505	4	2.8	President accept catch.	0.6	4003840
301	346	4	1.3	\N	1.1	7891968
159	408	4	0.9	\N	1.0	1290240
261	426	4	1.8	Join mother pressure.	1.8	3521536
74	486	7	0	\N	0.6	3438592
279	408	4	1.8	\N	1.7	7332864
32	590	4	2.2	Use authority win onto hour goal campaign. Summer close still soldier surface beat from.	1.2	3702784
145	359	4	2.0	\N	1.6	2070528
187	227	8	0	\N	1.4	2624512
22	214	4	2.3	\N	1.6	1284096
98	730	4	2.4	\N	0.8	664576
81	789	8	0	International popular take research image song.	1.0	5458944
62	727	4	1.2	Find ago feel.	1.3	3187712
40	110	4	0.9	\N	0.5	3134464
282	418	4	1.8	\N	1.4	4364288
185	793	4	1.3	Take measure grow several gun read apply.	1.8	2918400
109	686	8	0	Break maintain smile use address. Rule computer technology.	1.7	6960128
27	746	10	0	\N	1.7	314368
39	206	4	2.7	Anyone area write.	1.7	3038208
264	149	10	0	Song business particular discover road.	1.2	2691072
282	408	1	0	Investment would tax month.	1.3	4183040
138	269	4	2.1	\N	1.2	7810048
28	312	4	2.4	\N	1.2	7079936
34	789	4	2.0	Professional system last less.	1.7	4204544
268	762	9	0	Stop politics staff our wind discover shoulder. Talk black memory purpose way lot.	1.9	6057984
95	355	4	1.2	\N	1.3	7150592
182	224	1	0	South final still sister. Serve yes approach likely station.	0.8	1810432
70	219	4	0.9	\N	1.3	5306368
152	821	4	2.8	\N	1.8	8015872
108	736	4	0.1	\N	1.4	6822912
172	844	4	2.3	Myself newspaper director father throughout itself.	1.5	1492992
113	516	4	1.2	\N	1.6	2776064
105	95	3	0	Federal structure majority. Bit clearly small until natural all raise.	0.5	5422080
226	678	3	0	Particular live by not five analysis.	0.9	4470784
249	341	4	1.5	\N	0.7	3058688
240	82	9	0	Society long analysis.	1.6	3475456
169	356	4	2.7	Window song professor six one notice.	0.6	2131968
202	453	6	0	\N	1.2	4573184
180	534	3	0	Region recently already.	1.2	5185536
74	491	4	1.5	\N	0.9	236544
1	104	4	2.6	\N	1.3	4020224
26	310	4	1.3	Give reason produce us officer.	1.4	7117824
118	444	4	2.4	\N	1.3	1150976
85	1	4	1.8	Blue already friend explain purpose.	0.5	3107840
216	634	4	0.7	Finish population of you show organization hair.	0.6	6213632
143	95	4	0.8	Color least house animal whether pass.	1.6	3137536
90	108	4	2.5	So these pass site him available inside.	1.3	8268800
238	615	4	2.2	Condition just maintain continue the nature language how. Boy trouble present least college tonight.	1.6	7297024
5	634	4	1.0	\N	1.1	4020224
168	330	3	0	\N	1.1	5279744
44	62	4	1.0	Imagine run including customer act wrong join. Break item heavy hard.	0.6	5754880
202	461	9	0	\N	0.6	3245056
186	784	3	0	\N	1.8	6005760
155	445	6	0	\N	1.0	2136064
192	744	10	0	Mrs difference school him.	1.6	5035008
295	594	6	0	\N	0.7	5174272
97	807	8	0	\N	0.6	6876160
225	727	4	1.2	\N	1.6	1137664
106	151	6	0	Surface station human blue industry prepare and. Also nothing heavy region artist much himself.	1.5	1209344
227	680	4	1.6	None chair development degree southern.	1.5	5426176
261	424	4	2.7	\N	0.9	4842496
74	465	4	2.7	Financial recognize audience computer produce end.	1.9	1053696
122	452	4	2.7	Least student Mrs because heart. When last hundred leader fine reflect.	1.9	4812800
263	441	3	0	Sense something eight forget upon.	1.7	2755584
168	313	6	0	\N	1.0	3037184
213	575	4	0.9	\N	1.0	3779584
194	564	4	1.4	\N	0.6	1809408
152	827	4	2.1	\N	0.6	4683776
87	440	4	2.9	\N	2.0	6344704
218	756	7	0	\N	1.5	2287616
261	415	4	0.2	\N	0.9	6779904
282	417	4	2.4	\N	1.3	8197120
77	403	1	0	President fear series understand anyone why. Choice friend under.	0.6	5744640
111	341	8	0	\N	1.7	6428672
247	199	8	0	Nation model number doctor sense actually best.	2.0	675840
255	83	6	0	\N	0.8	6789120
309	382	9	0	\N	0.7	8280064
97	803	4	1.5	\N	1.4	6965248
47	389	4	1.2	\N	0.7	1634304
97	804	7	0	Teach produce four western physical.	0.7	5413888
240	77	4	1.7	Sort subject lawyer.	1.2	6944768
277	619	10	0	\N	1.1	3546112
81	787	4	2.9	Expect relate finally white leader.	0.5	4904960
135	278	4	2.1	\N	1.1	368640
49	786	3	0	Your better race material threat fast organization.	1.4	3270656
267	739	6	0	\N	1.7	4382720
154	438	4	1.9	Cell natural lay.	0.9	1997824
150	411	5	0	System ability allow without mouth entire.	1.0	5519360
131	846	3	0	\N	1.6	3091456
300	742	3	0	\N	1.0	2843648
258	325	4	1.4	Best name agency until make become later.	0.8	1866752
12	217	3	0	Movie indeed significant police.	0.8	4023296
232	347	4	2.6	Wonder describe improve member record listen.	2.0	4234240
140	389	4	0.3	Detail right its stock. Offer evening difference goal significant writer.	0.6	4282368
238	620	10	0	Often scientist college late improve. Girl measure lot home.	2.0	832512
137	487	7	0	Those street memory.	0.7	7310336
138	277	4	1.8	Whom list show agency probably action southern.	0.5	362496
209	396	10	0	\N	0.7	907264
153	87	4	2.3	History growth require per.	0.6	5889024
207	409	8	0	Hot power charge candidate discover.	1.9	2577408
96	665	7	0	\N	2.0	1280000
60	340	5	0	Between which opportunity sure although very.	1.3	450560
278	685	5	0	\N	0.7	3030016
295	593	5	0	Admit west oil of chair eat time.	0.6	3024896
12	225	7	0	\N	0.9	4732928
243	443	10	0	\N	1.5	3905536
100	728	4	1.9	\N	0.6	3900416
206	393	8	0	\N	0.5	7757824
237	26	4	2.7	\N	1.9	6106112
259	847	4	1.3	Laugh campaign store large.	1.2	438272
243	430	7	0	\N	0.7	2137088
142	550	4	1.3	Just trade process model car court.	1.0	980992
144	99	7	0	\N	1.4	7712768
129	574	4	1.1	Interesting pressure be affect different.	1.3	5434368
50	243	4	0.6	\N	0.9	5158912
184	865	8	0	\N	1.8	2488320
11	220	4	1.2	Dinner prove wife door involve collection.	1.1	8224768
39	209	3	0	Current peace hour energy.	1.7	5640192
112	385	5	0	\N	1.6	156672
302	542	8	0	Question themselves build care alone. North agent yes art sister cold himself.	1.6	3636224
113	523	4	2.7	\N	1.2	1726464
86	536	4	2.2	Small road audience civil event bit push.	1.3	809984
289	68	4	2.0	Capital physical around by.	0.5	5101568
205	285	6	0	Off wind measure loss guess fast. Star citizen off newspaper serve.	1.8	545792
248	662	10	0	South technology sea score. Fast power or mean sometimes his trouble.	1.8	187392
144	100	6	0	\N	0.6	3350528
55	849	4	2.0	Strong standard itself design mother risk media. Worker girl war take cause.	1.7	7197696
118	461	4	2.4	Us Republican design maybe. Know prepare student it ball view now.	1.6	4782080
283	18	6	0	\N	0.8	7417856
164	520	3	0	Develop despite theory when dark trouble store.	1.2	4896768
18	300	5	0	\N	2.0	7505920
67	161	6	0	\N	1.6	4133888
15	617	4	1.6	Quality write case decision hotel.	1.5	7227392
219	76	4	1.5	\N	1.2	291840
248	671	4	2.2	\N	2.0	4985856
96	661	4	2.3	\N	1.0	8077312
137	464	6	0	Bank decade rise weight fly.	1.1	4044800
3	94	4	1.1	Land create common build because.	1.7	8243200
191	759	4	2.1	\N	0.6	396288
239	247	8	0	\N	0.8	7231488
112	379	9	0	\N	1.9	6213632
50	241	1	0	Understand show particularly board court these. Young chance one big medical.	1.7	4606976
22	217	4	0.5	Allow matter forget painting.	0.7	4902912
291	296	9	0	Meet ready detail begin somebody pass camera.	0.7	3877888
195	415	9	0	By city might mother space realize someone project.	1.3	3416064
222	461	6	0	Guy agreement hand whether any. Occur hospital range various today.	1.0	5089280
121	711	4	2.2	Practice all church think north green break though.	1.7	6020096
27	739	7	0	Might huge space ball note around.	0.9	1363968
204	608	4	2.9	\N	1.6	5341184
128	127	4	1.8	Four including before Mr. Everybody rule movement mean sound ball memory.	0.6	4752384
99	13	9	0	\N	1.7	7483392
111	343	4	2.0	Would glass course development world.	1.2	6549504
78	268	4	0.7	Read scene his fact. Have purpose learn language at.	1.8	7472128
288	840	8	0	\N	1.7	4934656
40	111	3	0	Garden tell step would outside dream grow. My well picture prove win although.	1.1	2231296
105	97	4	1.1	\N	1.1	3850240
35	211	4	0.0	\N	1.1	3636224
290	396	6	0	\N	1.4	1541120
201	848	4	2.8	\N	1.4	8194048
74	479	4	1.3	\N	0.6	6249472
215	498	3	0	House security eight police then often travel.	0.8	4148224
305	689	7	0	\N	0.8	1537024
10	646	5	0	Goal kitchen how name court.	0.8	3651584
218	751	1	0	\N	1.5	1568768
36	190	5	0	\N	1.7	5911552
40	93	4	1.8	\N	1.8	2493440
267	737	8	0	\N	1.3	4944896
168	329	4	2.6	\N	1.6	389120
194	557	7	0	\N	0.6	2979840
277	610	9	0	During almost site sort each safe would keep.	1.4	6232064
121	715	4	2.9	\N	0.9	580608
144	92	4	0.9	\N	1.9	7474176
178	210	4	1.4	Low speech rather book save bill.	0.7	1304576
15	624	10	0	Out politics center participant.	0.7	6246400
170	385	4	2.7	\N	1.8	5533696
232	340	4	0.3	\N	1.1	2370560
54	428	4	2.0	Care environmental while all.	2.0	2942976
145	349	4	1.4	Special decade store training.	1.8	6408192
28	309	4	2.5	Perform writer number early. Today professor name former beautiful peace produce.	0.8	6311936
73	420	9	0	Operation spend describe tell strong figure money black.	0.8	2027520
99	4	6	0	See land agency son discuss. Very gas imagine various sort try let.	1.4	1055744
311	341	4	1.5	Money value long personal.	1.5	7814144
132	27	9	0	Number reason soldier seven almost event.	0.7	393216
215	511	5	0	Receive citizen respond tree. Thus throughout send beautiful phone collection myself.	1.0	4205568
165	301	4	1.9	Floor serve material size sign. It social white alone first.	1.4	7207936
264	136	4	1.5	Five find international enter. Bad color sing.	1.3	1037312
207	415	4	2.1	\N	1.3	3989504
151	130	5	0	Manage our special.	0.7	6542336
50	237	1	0	\N	1.5	1321984
15	618	4	1.6	Pass line finish contain thousand arm international. Play tree feel player.	1.2	1421312
268	757	4	2.3	\N	1.6	4033536
21	346	4	1.3	Actually degree tax lot about attorney current note.	1.4	1622016
52	335	7	0	\N	1.6	4056064
68	648	4	1.8	Cultural same special serious lot.	1.3	4117504
29	803	6	0	\N	1.9	7508992
304	546	9	0	\N	1.6	1873920
63	42	7	0	\N	1.8	2209792
215	502	5	0	Seem gun window hour special your walk.	0.9	2855936
282	407	4	1.2	Bring success day training suddenly.	1.7	5795840
138	278	4	2.1	It contain majority laugh play.	1.5	214016
10	639	1	0	Their surface decide sign attention notice.	0.5	2809856
251	138	4	1.3	\N	0.9	710656
237	17	4	2.5	Get window executive important player range.	1.3	3402752
253	802	4	2.3	\N	2.0	7666688
108	739	4	1.4	\N	1.4	3121152
182	228	4	1.7	Analysis number three.	1.3	8274944
86	540	4	2.2	\N	1.4	6551552
71	39	4	1.2	\N	1.9	1542144
79	845	4	2.9	Shake rule company situation indeed. Argue some environment sport level.	1.2	3278848
93	731	1	0	\N	1.1	205824
203	793	4	1.3	Able improve admit.	0.9	2259968
239	248	4	1.2	\N	1.9	7628800
182	225	4	2.1	Summer them worker would yard.	0.7	5055488
84	579	4	2.6	Beyond religious second realize detail mouth success. Boy turn way.	0.9	391168
129	575	3	0	Since during check office color suffer.	1.8	7721984
194	572	4	2.7	\N	2.0	7952384
213	569	4	1.6	Black affect guess serve.	1.8	1779712
248	668	9	0	\N	0.9	2404352
164	523	4	2.7	Off author worker here fall.	1.3	3203072
196	289	4	2.4	Fall lay doctor down.	1.8	6526976
78	272	10	0	\N	0.9	3825664
6	698	4	1.1	\N	0.9	1775616
105	96	4	2.9	\N	1.9	1138688
137	467	5	0	Special since son and life matter party.	1.7	4079616
150	409	7	0	\N	1.0	2893824
78	257	4	1.4	\N	1.1	3239936
194	566	4	1.0	Tonight chair happy product thing employee.	1.7	1208320
152	833	4	2.6	Enough fly task others.	1.1	7371776
140	368	1	0	Environment that lawyer level.	1.4	1417216
77	395	5	0	\N	0.8	3558400
254	821	5	0	\N	1.7	4622336
86	531	4	1.4	Finish grow similar security.	0.8	870400
46	606	1	0	\N	1.0	603136
56	537	3	0	\N	0.9	3367936
181	788	4	0.9	Stand same walk plan change.	1.2	3641344
72	669	4	2.6	Region security design big.	1.1	1068032
135	273	4	0.3	\N	1.8	850944
279	425	4	0.4	\N	1.2	6884352
276	818	8	0	Study garden behind wife nation.	1.5	3718144
12	219	3	0	\N	1.2	4773888
114	466	3	0	\N	0.6	1587200
203	789	4	2.0	Year knowledge car summer language maintain attention. Behavior just course world score where place.	1.7	4684800
297	713	4	1.1	\N	0.9	1848320
154	434	1	0	\N	0.9	8209408
238	626	4	1.9	East of less keep more skill impact benefit.	1.4	1067008
93	719	5	0	\N	1.6	6146048
87	434	1	0	\N	1.3	8129536
160	185	4	1.8	Tax trouble expect actually well operation behavior.	1.5	6205440
309	371	4	2.9	Save left admit resource whole remember live.	1.0	6532096
123	772	3	0	Prepare around ok growth.	1.6	1353728
143	103	4	2.8	Beat live food hour property together. Bag move strategy develop answer.	1.8	5502976
144	97	6	0	\N	1.3	3160064
262	675	1	0	Exist reflect establish surface sound. Create house have record.	1.3	3713024
78	262	4	2.9	\N	1.7	3923968
245	366	6	0	Debate maintain guy state similar.	0.6	6763520
189	628	3	0	\N	1.4	3382272
194	560	4	0.9	Military add campaign unit of reveal individual.	0.5	2806784
195	425	4	2.6	Whatever structure very your stand season stuff.	1.9	289792
217	252	4	2.4	Section it hear least someone dinner power charge. Case forward health tree.	1.1	7511040
297	711	6	0	\N	1.9	6416384
204	612	5	0	\N	0.7	7385088
1	95	4	2.1	Truth design measure true.	1.7	2667520
144	111	10	0	\N	1.5	5807104
307	391	4	2.7	\N	1.8	6675456
73	407	4	1.4	Realize himself sort much politics.	1.2	6009856
233	90	4	1.0	\N	1.9	7879680
90	113	4	2.8	Traditional live conference these fill skill several.	0.9	2519040
238	618	4	2.0	Research over outside often brother bring thus.	1.6	2217984
195	404	4	0.7	\N	0.9	1169408
139	547	7	0	Mind result message she myself.	0.7	5484544
30	673	4	2.8	\N	0.7	7081984
54	416	4	2.1	\N	0.8	1212416
310	572	4	2.7	Professional director out open poor purpose behind station.	1.6	4606976
110	5	8	0	Tough very glass major generation blood.	1.5	5011456
187	229	6	0	\N	1.0	4586496
7	388	3	0	\N	1.3	5450752
194	573	3	0	North window process article sell morning church civil.	0.6	3982336
249	340	4	1.7	Heavy nearly already make imagine stock ten require.	1.1	5036032
106	146	6	0	\N	0.6	6849536
55	843	4	1.3	\N	1.7	4774912
280	724	9	0	No parent especially but yard other quite only.	1.3	1426432
49	788	7	0	\N	1.4	7739392
138	279	4	1.1	Year office down million simply hour crime. Care different above successful.	1.3	2534400
297	726	4	2.1	Job star behind number right.	1.7	1419264
169	359	4	1.5	Teach young miss never management. Social seem four far nation down.	1.5	1634304
130	12	4	1.3	\N	1.6	3878912
35	212	4	1.2	Certainly buy southern local.	0.6	6491136
160	178	4	1.1	\N	1.6	2409472
46	591	4	0.1	Think radio political seat television reduce.	0.9	4101120
111	340	8	0	\N	1.1	2343936
169	355	5	0	Able force guy all fall.	1.0	4888576
279	426	3	0	Level without drop official many rate speak. Cold executive experience brother.	1.8	6566912
100	731	4	1.8	Better personal nor approach through instead picture.	1.3	7879680
100	718	4	2.0	\N	1.2	1102848
187	218	4	1.2	\N	1.6	2069504
72	677	4	2.4	\N	1.6	5560320
258	312	4	2.4	Name religious collection seek sea. Positive director why realize room.	1.3	305152
215	500	7	0	Senior century who thing away thus reason.	1.7	1914880
50	247	4	1.5	\N	1.3	393216
221	464	4	1.7	\N	1.2	7881728
132	24	4	0.1	Ago mother debate government Mrs range safe security.	1.3	7995392
166	317	4	1.0	Woman threat between activity end not.	1.9	731136
91	673	4	2.2	\N	1.5	730112
276	822	4	1.4	\N	1.1	2518016
230	672	4	1.8	Same force member position agree board accept wall.	1.6	2375680
277	620	8	0	\N	1.8	885760
252	264	4	2.4	\N	1.5	323584
117	336	10	0	\N	1.2	5029888
275	225	4	2.1	\N	2.0	4385792
61	740	6	0	Note start director final one drive run Mr. Create even skill.	1.8	2817024
72	670	1	0	Later owner can who eye mission left.	0.9	6639616
186	785	4	1.0	Rich enough father.	1.7	1122304
55	852	8	0	\N	1.0	8007680
67	184	8	0	Yard national you president control offer power.	0.5	4361216
227	663	4	2.1	\N	0.7	1770496
264	137	4	1.8	\N	0.5	4099072
78	264	5	0	\N	0.5	7386112
164	506	9	0	Company small fly sing out face. Western save them paper action wall case role.	1.6	5295104
296	441	4	1.5	Audience here who.	1.6	536576
230	673	4	2.8	\N	1.2	3553280
137	469	4	1.4	Need share task suffer believe piece. Really be tree know.	0.8	1043456
96	666	4	1.5	Certain nice capital off off next wind set.	1.4	5691392
204	621	1	0	Word about know structure whatever career. Memory production two perform write white give system.	1.3	3354624
159	423	4	1.6	Again few president card positive.	1.5	2959360
177	229	9	0	\N	0.5	5608448
50	249	4	1.5	Color none although.	1.6	6478848
12	233	4	0.1	If pay long research example base method.	2.0	7950336
109	683	4	2.1	Party provide sound show enter into two decade. Actually sense end true.	1.7	3304448
28	306	4	1.5	\N	1.9	7826432
40	106	4	2.0	\N	1.7	7635968
182	218	10	0	\N	1.6	7365632
64	195	3	0	Base agreement consumer officer summer under. Recently group figure director else very.	1.8	8107008
194	561	4	1.1	Authority lot certainly writer.	0.9	1497088
227	679	4	2.3	Story behavior save reach loss well. Market physical away medical end.	0.6	7318528
59	700	4	1.9	\N	1.6	1333248
221	483	4	1.8	\N	1.7	5549056
199	572	10	0	\N	1.7	2507776
89	597	10	0	Forward ball create.	1.8	3591168
140	379	4	1.1	Become piece tend half keep gas.	1.2	2569216
227	664	4	1.0	\N	1.0	4352000
160	162	7	0	\N	0.5	5048320
120	598	4	0.8	\N	0.6	2585600
75	103	4	2.8	\N	1.5	4808704
12	222	4	1.8	\N	0.8	1530880
5	631	5	0	Bar go skill certainly boy nice floor.	1.3	8079360
6	701	4	1.3	Film newspaper five movie fine change decide.	1.7	4715520
62	730	4	2.4	\N	0.9	4502528
101	733	4	2.1	Local safe responsibility firm.	1.4	1358848
252	265	4	2.3	Trial several little summer early real apply.	1.3	8076288
89	596	4	1.4	Plant good speak morning. Less age difference season treat face.	0.9	153600
237	33	4	1.3	\N	1.6	3703808
140	371	5	0	\N	1.4	624640
22	227	9	0	These beyond myself believe money great.	0.9	5901312
226	660	4	2.7	Series class sort star buy easy focus movement.	1.3	4285440
290	401	4	1.5	World card by day myself.	1.6	2396160
304	553	4	2.1	Fast pay tonight. Per base free cost health green would.	0.8	3784704
129	564	5	0	\N	1.9	5792768
10	645	4	2.5	\N	1.1	515072
175	504	9	0	\N	0.8	784384
224	43	5	0	Determine receive try by under claim eat.	1.7	4219904
93	715	7	0	\N	1.1	6761472
283	29	4	1.8	\N	1.5	623616
216	635	4	1.7	\N	0.8	5433344
287	144	1	0	Memory wide believe everything condition its point.	1.5	1861632
217	260	4	1.4	\N	1.5	834560
32	595	4	1.0	\N	0.7	6887424
193	507	4	1.2	Single far politics stay.	0.9	5419008
167	845	4	2.9	Provide TV for themselves owner large.	1.8	6860800
248	657	4	1.4	\N	1.1	5434368
15	622	4	2.4	\N	0.7	3630080
215	506	1	0	\N	1.3	5485568
115	110	4	1.7	Nice manage radio research.	1.5	4340736
106	136	1	0	Available wall sign trial. While rise leg activity information without.	1.0	4288512
215	499	4	2.9	\N	0.7	2704384
51	203	4	1.2	Leave off edge with decision.	1.9	5823488
105	99	10	0	\N	0.6	5193728
105	108	1	0	\N	0.8	2448384
164	509	4	1.4	\N	2.0	552960
211	816	4	1.6	\N	1.7	3252224
70	214	10	0	Behavior range I if start care work.	1.1	2138112
278	684	4	1.5	Reveal stage most within dark raise region. Teacher industry everybody.	1.7	5735424
170	381	6	0	Visit space one audience bad.	1.0	1977344
244	761	4	2.7	Three present feel water assume this one. Stuff increase thousand authority away and.	1.3	5739520
244	750	10	0	\N	1.7	3929088
107	429	4	2.1	Each understand north between source pick training.	0.9	1280000
73	408	4	1.8	Seek compare white wish collection policy.	1.4	3720192
191	747	4	1.1	\N	1.6	1769472
248	680	4	1.6	\N	1.2	996352
210	449	4	1.6	\N	1.1	5281792
196	292	4	1.2	\N	0.6	8196096
96	677	4	2.3	Play particularly recent over benefit the. History talk level policy his foreign benefit choose.	0.9	5411840
64	196	7	0	Million thing hotel forward new plan.	1.2	7606272
192	740	4	2.8	Capital describe woman loss expert.	1.3	6163456
276	835	5	0	Set anyone think tend TV rate still. Music them friend herself little.	1.7	4750336
291	295	9	0	\N	1.7	2948096
5	643	10	0	Worry indeed instead analysis environmental. Source century follow return include fund.	1.7	4209664
286	181	1	0	\N	1.7	3063808
168	312	7	0	\N	0.8	5526528
125	143	4	1.0	\N	0.9	7030784
261	420	4	1.8	Care real father quite stop. Run their local build resource suggest despite.	1.8	1546240
175	517	4	2.7	\N	0.7	2326528
137	488	9	0	Certain seven red international new base.	0.5	7396352
286	175	4	1.5	\N	0.7	4516864
116	87	1	0	Physical once mean role sport management.	0.5	2994176
71	40	4	1.3	National tonight author here mind sit huge.	1.6	4503552
179	649	4	1.8	\N	0.5	7595008
210	459	4	2.5	\N	1.6	8154112
74	482	4	1.3	Public interest to visit.	0.7	3914752
204	614	9	0	While always himself across network.	1.4	1078272
310	567	4	1.4	\N	0.5	7660544
160	175	7	0	\N	1.3	4896768
66	435	8	0	\N	0.9	2578432
93	709	6	0	Security though social guess thought second then.	1.1	4922368
228	703	4	2.6	Within professor American often nothing third.	1.5	722944
164	505	4	2.8	Worker usually room single instead early.	0.7	245760
24	807	9	0	\N	0.9	4870144
5	647	4	2.2	Focus tax raise. Happen in loss young become election move.	1.5	8027136
152	819	9	0	Join best even.	0.9	3126272
254	817	4	2.0	\N	0.6	3198976
294	460	10	0	Many others one turn toward write.	1.8	6181888
258	331	9	0	Answer grow animal help describe reality.	0.8	4039680
286	156	9	0	Bit wall end his third.	1.0	3384320
279	421	4	1.4	\N	1.4	3136512
306	541	5	0	Door itself hundred expect.	1.3	6212608
114	485	4	1.2	\N	1.3	4609024
121	732	4	1.2	\N	1.0	1086464
177	219	4	1.1	\N	1.0	884736
66	443	4	2.9	\N	1.2	6477824
189	627	10	0	\N	1.0	3802112
168	311	8	0	Agree study what control modern. Until act reduce while issue maybe.	0.5	650240
79	850	9	0	Pattern best store peace visit green.	1.2	3801088
48	347	4	2.6	Leader rock candidate address side.	0.9	5193728
139	550	6	0	\N	1.7	3026944
108	733	4	1.2	Direction game area score dog.	1.9	5944320
294	452	4	1.6	Scene environmental thing financial join choose recognize soldier.	1.8	411648
249	347	4	2.6	\N	1.6	5411840
144	110	9	0	Performance painting property letter deep character.	1.7	3000320
1	113	4	2.8	\N	0.5	2184192
297	723	7	0	Word year conference collection economy language. Box almost or interesting front turn within.	1.6	927744
215	525	4	2.0	\N	1.9	5510144
245	388	4	1.2	\N	0.6	7708672
171	853	4	2.1	Individual though able light but material conference. Anything should major season pressure.	1.2	5767168
179	636	3	0	Military part home through.	1.6	6941696
204	616	10	0	\N	1.7	5407744
272	748	6	0	\N	1.8	581632
299	391	3	0	\N	1.4	5313536
46	603	4	1.8	Indeed compare eat standard student shoulder.	0.7	4531200
113	502	4	2.4	These number until finally test suffer.	0.8	7317504
26	306	4	1.5	Both set white main event maybe. Where little law feel.	0.8	197632
155	462	1	0	Story think fine wrong house far line.	0.6	7883776
113	510	3	0	\N	0.7	1927168
69	791	10	0	\N	1.4	4690944
184	872	9	0	\N	0.6	3193856
60	341	4	1.5	\N	1.6	1457152
238	622	4	2.4	Quality study appear speech north.	1.7	1745920
135	279	5	0	Citizen outside once might yeah.	0.6	8093696
193	506	4	1.5	\N	1.9	5529600
258	311	3	0	Their what say.	1.9	4226048
151	118	8	0	Public make bring growth continue.	0.6	5278720
281	430	7	0	\N	1.1	1287168
279	428	9	0	About chair send only.	0.9	4227072
137	475	4	0.8	\N	0.6	2084864
173	281	4	1.5	\N	1.0	1412096
231	494	6	0	Provide enjoy rock new interesting.	0.6	6971392
1	107	3	0	\N	1.6	6955008
252	276	5	0	Various writer give professor look hot seven. Usually citizen technology.	0.7	377856
152	831	4	0.5	\N	1.7	8100864
298	725	1	0	About to draw mind nice investment can. Day care training heavy four first almost value.	1.7	1843200
128	126	1	0	Serious hour land character on throw red. Morning any state world.	1.3	4971520
160	176	8	0	Police experience model wall less.	1.9	2521088
207	427	4	0.5	Dream glass myself interesting movement show quite.	0.6	7780352
203	794	7	0	\N	0.7	4671488
268	761	10	0	Radio marriage bit minute school meet.	1.9	1154048
276	828	3	0	Specific him yourself drug yard.	1.0	7274496
86	539	5	0	\N	0.6	6727680
286	154	4	2.2	Will open about street discussion discussion.	1.2	6929408
109	691	4	1.3	Finally town skin her.	0.5	154624
170	377	9	0	Land seven door realize.	0.5	6200320
168	324	4	1.7	Rise fine with almost nor within foreign.	0.6	461824
106	140	8	0	\N	0.5	7077888
280	713	4	1.1	\N	1.3	7707648
9	31	7	0	Hair democratic include or statement century enough.	0.7	1939456
5	642	4	2.5	\N	1.2	126976
251	152	4	1.6	\N	0.9	2412544
240	87	9	0	Old statement mind chance contain drug.	1.7	6569984
221	465	4	1.8	\N	0.7	8183808
249	343	4	2.0	\N	0.8	4040704
241	48	4	2.1	High film national item effort various.	1.9	861184
308	843	4	1.3	\N	1.0	1247232
48	342	4	1.7	Age that current our model.	0.9	5769216
27	734	4	1.0	\N	1.7	2309120
310	571	1	0	\N	0.5	4541440
108	745	9	0	\N	1.1	3705856
156	41	3	0	Speech main physical speak leave.	0.8	2876416
210	448	7	0	\N	1.3	2620416
233	99	4	0.7	Meeting and music travel too scientist. Century court national usually.	1.1	1215488
172	848	1	0	\N	1.3	1782784
53	762	4	2.7	\N	1.9	4929536
258	326	4	2.9	\N	0.6	300032
275	229	4	2.0	Painting former day western so.	0.7	5228544
187	220	10	0	Play few none appear.	1.5	4444160
114	489	7	0	\N	0.6	1036288
134	141	4	2.3	\N	1.8	7986176
264	145	5	0	\N	0.9	7621632
247	197	7	0	\N	0.7	3707904
133	769	4	1.4	During job public main.	0.6	6585344
10	631	3	0	Involve political now there.	1.8	6606848
309	372	4	2.0	\N	0.8	6819840
245	369	4	1.6	\N	0.6	129024
10	642	4	0.8	Opportunity door campaign million activity action feel serious.	0.5	1136640
1	103	4	2.8	\N	1.8	1354752
23	242	5	0	\N	0.8	715776
10	637	4	2.9	\N	1.8	1437696
244	758	5	0	\N	0.8	3031040
202	447	6	0	\N	1.0	2343936
100	715	6	0	Structure measure child.	1.8	2591744
145	365	4	1.2	Perhaps choice television check enter for star.	1.8	7832576
309	385	4	2.7	Produce south rock condition. Face consider country raise.	0.6	6763520
254	835	1	0	Process race worker create argue and. Old event feeling must as piece main.	1.4	5254144
193	503	9	0	\N	1.2	1689600
260	191	4	1.3	\N	1.4	8239104
39	204	4	1.8	\N	0.7	7410688
258	330	4	0.3	\N	0.7	3831808
47	378	10	0	Better board risk draw prepare.	0.7	4809728
135	257	3	0	\N	1.0	5339136
96	667	4	1.5	Often offer without camera budget suddenly side.	1.0	4021248
160	156	4	1.7	Edge season inside skin sign language.	1.5	7474176
241	44	4	1.4	Note in opportunity easy.	1.4	514048
276	823	4	2.0	\N	2.0	1052672
189	629	4	2.8	\N	1.7	7732224
159	407	5	0	Side four live have north like understand.	0.6	3118080
189	624	1	0	\N	0.9	730112
168	322	6	0	\N	1.8	7377920
14	468	5	0	Through whatever eye foot rest old plant.	0.8	6344704
78	253	4	2.0	See play serious vote ready.	1.2	6920192
66	431	6	0	\N	0.8	7544832
144	95	4	2.1	Day father modern rise later guess. Wear pressure son again son chair who fund.	0.7	4345856
295	590	4	1.7	\N	0.6	7532544
30	677	7	0	\N	1.5	4451328
81	786	4	0.7	Nor happy media few would relate.	0.7	6249472
72	658	4	2.0	New will attention kitchen lead medical over.	1.4	3681280
239	241	1	0	\N	0.6	3959808
305	700	1	0	Produce color happy we crime test site. Guess job mission guy use write produce.	0.6	6949888
38	429	4	2.1	System art action evening child bad across. But I message media station deal.	0.8	6039552
310	575	8	0	\N	0.8	2865152
48	345	5	0	\N	1.6	7136256
7	387	4	2.9	Make weight couple budget common.	1.6	3110912
274	81	4	2.9	Risk hotel already break sometimes.	1.1	2856960
45	2	6	0	Hand me her often.	1.2	7014400
156	49	4	1.4	Work her generation more. Agree close heart raise lose contain.	0.9	1007616
80	269	5	0	Identify story much campaign pattern paper.	1.5	5943296
63	51	10	0	Push degree north occur address campaign.	1.1	7223296
237	22	4	1.4	Good expect live fund simply.	1.4	1641472
224	46	4	2.8	Fill conference growth capital simple or.	0.8	6704128
128	128	10	0	\N	1.3	6362112
180	535	9	0	Identify wait significant director choice attack also.	1.2	1548288
189	617	3	0	\N	2.0	2992128
65	211	1	0	\N	1.1	5492736
162	821	4	2.8	Bring capital hit everything decide.	1.8	900096
186	767	8	0	Lawyer happen whole finally. Their owner bank stop financial sign during thing.	0.8	2822144
149	405	4	1.7	Should way worker project want.	0.9	729088
120	592	4	2.1	Single second rather environment check middle go.	1.0	4978688
253	810	4	1.7	\N	1.9	547840
109	695	9	0	\N	1.7	6984704
308	849	1	0	\N	1.6	5545984
276	820	5	0	Myself once dinner be shoulder military. Many wait seem partner personal respond goal me.	1.8	6779904
131	853	4	2.1	\N	1.0	2072576
214	229	5	0	International deal like expert.	1.2	1420288
49	792	8	0	Together officer owner.	2.0	2969600
267	738	4	1.5	\N	1.6	4280320
164	501	7	0	\N	2.0	1298432
265	397	4	1.0	\N	0.9	6824960
66	441	8	0	Mother play maintain increase page up major. Relationship reason interesting.	1.9	1980416
207	419	4	2.1	\N	2.0	3463168
112	384	4	2.2	Million color thank American report.	1.9	4427776
152	834	4	1.8	\N	0.5	357376
187	233	3	0	Person information evidence about.	0.7	7378944
154	437	10	0	\N	1.4	2686976
254	837	10	0	\N	0.9	7281664
286	170	4	2.4	Church exactly career me series.	1.2	1284096
74	475	4	2.3	Bring piece hundred major. Guy example despite board accept.	1.1	4172800
300	744	4	0.9	\N	0.8	1313792
285	497	4	2.4	\N	0.6	5494784
200	289	3	0	Else give market hard.	1.7	2093056
212	336	4	1.0	\N	1.1	4766720
22	233	3	0	\N	1.0	5230592
84	580	4	0.2	\N	1.8	4132864
132	21	7	0	Experience others particularly last character toward day.	1.6	6193152
154	441	4	1.5	Size here allow from mission. Operation manager family trial north property.	0.9	5485568
246	463	9	0	\N	0.5	2418688
251	150	10	0	\N	1.3	2966528
224	53	10	0	From indicate little.	0.8	6313984
247	196	6	0	\N	0.7	3870720
246	475	4	1.3	News describe sit put.	1.6	7858176
286	176	4	1.1	\N	1.5	2433024
58	497	6	0	\N	0.7	5159936
112	373	4	1.6	Maintain focus his red maintain western.	0.6	1509376
204	629	4	1.8	\N	0.8	8148992
130	2	3	0	\N	1.4	2942976
216	640	4	2.1	\N	0.8	2460672
20	343	4	2.0	\N	0.6	7714816
153	75	4	2.8	Official enough large type.	1.1	151552
246	469	8	0	\N	1.6	4093952
195	418	4	2.5	\N	1.1	3125248
8	195	3	0	\N	1.7	3491840
126	8	4	1.2	\N	0.9	5689344
269	430	6	0	\N	0.6	1608704
306	538	4	0.6	\N	1.5	5944320
44	60	10	0	Make suddenly brother style big charge. Hand resource white great.	1.4	1859584
278	691	4	1.3	\N	0.8	1372160
169	354	4	0.5	Share way term hand idea.	1.5	8226816
183	193	3	0	\N	1.6	2608128
64	202	4	1.7	\N	0.7	4725760
8	203	4	1.2	\N	0.6	6108160
122	461	5	0	Anything let to remain yes.	1.2	5914624
90	93	4	1.8	\N	0.5	5704704
160	157	4	2.2	Myself full real individual key then.	1.1	7933952
149	412	4	2.2	\N	0.7	2308096
18	301	4	1.9	\N	1.2	432128
68	635	1	0	See game carry change child.	0.8	4908032
199	556	8	0	Back our meet feel question.	0.5	1304576
150	421	4	1.4	\N	1.6	7569408
237	29	4	2.7	\N	0.7	1055744
300	743	4	2.7	\N	0.8	7804928
96	664	4	0.2	\N	1.0	4287488
25	497	4	2.4	\N	0.9	1299456
51	207	10	0	\N	1.7	5738496
278	694	4	2.8	Big know return for doctor once building stage. Law modern all analysis on agree media tree.	0.6	2321408
2	346	8	0	Technology whose low person in fact.	1.1	8093696
297	721	4	0.2	Wait magazine attention candidate without.	0.9	4372480
276	815	4	2.2	Once education per page. Station opportunity stock should which.	1.2	3415040
155	461	10	0	Reach push make miss good where.	1.7	1406976
275	215	5	0	Movement need stand land design save student.	0.9	5804032
98	717	9	0	\N	1.6	463872
200	284	4	2.8	\N	1.3	6359040
28	329	1	0	\N	0.7	1350656
23	235	4	1.6	Later break course scientist morning federal test.	1.8	5294080
199	573	8	0	\N	1.2	7217152
226	680	4	1.6	\N	2.0	4105216
173	278	4	1.5	\N	1.7	6307840
218	748	4	1.0	Inside identify bill including.	0.7	873472
289	74	4	1.0	Four answer type black firm. Third available single financial whole soldier.	0.5	4089856
127	65	10	0	Reality project administration should society.	1.9	5393408
143	90	5	0	\N	1.7	1853440
149	418	4	2.5	\N	1.9	562176
180	530	3	0	\N	0.8	5640192
71	55	4	0.7	\N	0.9	5654528
59	698	4	1.1	Position matter film million rise contain attorney.	0.7	5821440
264	138	4	1.3	Less Mr easy need remember show ask.	1.1	3012608
89	602	4	1.7	\N	0.5	7349248
202	449	4	1.6	Hear three party.	1.3	5735424
8	204	9	0	Others region size.	1.1	4210688
62	712	4	1.4	\N	1.9	932864
39	195	9	0	Behind particular common run image compare run from.	1.8	2412544
152	815	7	0	Today just still national physical necessary guy.	1.6	1215488
75	98	1	0	As not one hair over.	0.5	730112
30	657	4	1.3	\N	0.8	5777408
248	677	10	0	\N	2.0	2010112
305	696	3	0	\N	1.3	464896
168	314	4	1.0	\N	1.0	5851136
228	705	4	1.4	\N	1.5	7649280
246	466	7	0	Democrat scientist ask too everything idea remember.	0.9	1746944
118	453	4	0.1	Store author write back. Movement assume begin.	1.6	3246080
262	679	1	0	\N	1.4	4737024
291	287	4	2.8	\N	1.4	594944
123	774	9	0	Civil particularly Congress surface bad buy.	1.4	6204416
257	287	10	0	\N	0.8	7147520
194	555	4	1.8	\N	2.0	6816768
280	710	8	0	\N	1.1	1660928
294	446	4	1.1	\N	1.1	2321408
154	430	8	0	\N	1.8	6861824
67	180	4	2.5	\N	1.9	7404544
287	140	4	2.8	\N	1.0	6123520
105	112	4	2.2	\N	1.9	594944
75	101	3	0	Decision crime natural make speech ok.	1.6	6121472
306	540	7	0	Speak thing fact subject way modern. Late guy reveal born side wide.	0.8	5962752
218	758	6	0	However must serve.	1.5	5015552
251	144	4	1.5	\N	2.0	1070080
40	107	4	1.2	Rather since policy language large available food.	1.4	8143872
98	726	4	2.1	Down deal scene them practice red bad.	0.8	8009728
296	431	4	1.0	\N	1.9	1238016
123	784	4	0.1	\N	1.3	3887104
150	422	4	1.4	\N	1.8	1405952
8	197	4	2.5	Agreement eat same term.	1.5	3423232
43	531	4	2.5	\N	0.8	2958336
115	96	3	0	\N	1.6	1768448
19	302	4	2.9	Under capital early from still family these. Senior government everyone view.	1.3	3228672
56	542	4	2.5	\N	1.3	923648
149	420	4	1.9	\N	1.2	1664000
80	256	4	1.9	Without where reduce he college at.	1.3	1015808
259	853	4	1.2	\N	1.4	2536448
198	853	10	0	Start evidence dream or notice cost billion.	1.4	7037952
275	233	4	1.7	Air human card safe ask four.	0.7	7419904
11	227	8	0	Official mean thing discussion indicate area reason if. Too operation forward only.	1.3	3217408
9	34	9	0	Federal throughout education.	1.2	7073792
145	360	6	0	\N	1.7	5311488
138	256	1	0	\N	1.5	6763520
135	282	3	0	Attack good five fight practice wait.	0.6	6474752
168	320	10	0	One marriage clear of together.	0.9	2997248
78	282	4	1.0	Worry perhaps training.	1.5	7448576
305	705	5	0	Spring example wall help dark to grow. Pick another tough second never clear tonight.	0.7	1294336
162	835	4	1.6	\N	1.7	2293760
298	711	4	0.2	\N	1.4	3428352
90	102	4	2.6	\N	1.5	6624256
240	89	7	0	\N	0.5	3452928
22	219	4	2.4	Memory animal sport front.	1.2	2069504
172	845	4	2.9	Produce century father election once.	0.7	4109312
7	380	10	0	\N	1.5	4619264
189	611	9	0	Reveal what think little establish difference.	0.6	8172544
153	78	1	0	\N	0.8	4218880
222	454	9	0	Technology might majority whatever source resource.	0.9	1191936
279	414	7	0	Million single five.	1.9	5966848
222	450	5	0	\N	1.5	6758400
275	231	4	1.3	Road artist grow enjoy letter.	1.4	8203264
289	70	5	0	Begin picture sometimes expect stop seven artist.	0.8	6511616
240	86	3	0	Report week they manager carry skill.	0.6	4787200
197	874	4	2.4	National artist part significant for.	2.0	7687168
39	205	6	0	Us focus natural leave fine.	0.9	677888
186	775	9	0	\N	1.4	6918144
175	514	4	2.7	Two by develop if test practice director.	1.1	5815296
245	379	6	0	\N	1.6	6934528
62	724	4	2.9	Central who term year term.	1.1	6105088
145	348	4	0.9	Score experience participant statement different although item.	1.8	6598656
17	206	10	0	\N	0.7	5348352
17	195	4	0.3	Game vote actually have day home message his. Exist few year word clearly throughout.	2.0	8176640
179	653	4	2.2	\N	1.2	1415168
184	861	4	0.7	\N	1.3	4084736
95	349	4	0.2	American age collection every significant past least.	1.1	4513792
95	348	8	0	By sure class doctor drug there.	0.8	5513216
149	416	4	2.1	\N	1.3	1505280
146	561	4	1.1	Nor fund choose grow before news beat. Item laugh recently laugh benefit air.	2.0	7230464
28	331	4	2.0	Mind person kind end middle chance.	0.7	5783552
70	217	10	0	\N	0.9	2664448
194	571	6	0	\N	1.3	4927488
99	9	5	0	Record star quickly much our fill. Authority pull company treat land woman position visit.	0.7	4731904
298	729	6	0	\N	1.7	2990080
280	726	5	0	Become certainly politics.	1.3	5643264
193	527	4	0.5	Whose us all.	0.8	5706752
222	445	4	2.5	\N	1.2	657408
28	330	4	1.0	\N	0.7	1368064
208	551	4	1.8	\N	1.5	3421184
273	495	8	0	White forget by reach white somebody rise.	1.0	4255744
128	114	4	1.6	\N	0.8	2467840
135	250	4	1.7	Expert image ten camera chance conference song none.	1.8	2482176
310	554	4	2.8	Pass a garden rule boy worry.	1.9	2919424
261	405	1	0	Seven quality from decide join fast.	1.8	6610944
248	661	4	2.3	Away line show outside. Conference event sign though.	0.5	2355200
78	256	5	0	\N	1.9	2421760
220	55	1	0	Authority week state guess.	1.9	2300928
81	794	4	2.9	\N	1.1	7952384
241	50	4	0.1	Buy employee pull ask room western. Half long develop call feel student.	1.2	1515520
270	146	4	0.9	Blue bit baby door.	0.6	6835200
39	208	8	0	Serve box tonight increase report.	1.7	6480896
252	280	4	2.4	Place trial help call woman ability.	1.8	7114752
184	874	6	0	Material could occur discuss.	0.6	3119104
184	860	4	1.3	\N	1.7	3035136
221	474	4	2.9	Prove last pull.	1.5	1300480
300	745	4	2.7	\N	0.5	5929984
131	844	4	2.3	\N	1.7	7633920
226	677	9	0	\N	0.5	721920
129	558	4	1.3	Her quickly out plan.	1.4	1679360
166	316	4	1.4	\N	0.7	7529472
100	721	6	0	\N	1.5	779264
141	361	4	0.1	\N	1.1	5974016
213	563	4	1.4	\N	0.7	2117632
182	227	4	2.6	Accept nice between mouth institution really deep. Raise owner like movie color at perhaps meet.	1.3	8194048
220	54	4	2.7	\N	0.9	5920768
227	675	1	0	Town teach west remain entire book.	1.7	3569664
3	95	5	0	Age production drop around model source. Film right just five require some stuff network.	0.9	7183360
162	834	3	0	Ability garden near administration fire TV. Suffer performance yet history onto phone his face.	1.7	5509120
288	827	4	2.1	Its who born teacher then.	0.9	4032512
71	45	8	0	\N	1.5	5728256
6	692	7	0	\N	1.7	7738368
155	460	8	0	\N	0.6	5787648
259	844	9	0	\N	1.1	1671168
254	819	4	2.7	World response individual serious body table yet.	1.7	4777984
134	144	1	0	Trip style next exactly whatever term maintain. Public address for fast most represent.	1.5	2230272
195	405	6	0	\N	1.1	7439360
10	634	5	0	Rise next example else research season single.	0.9	5614592
34	795	4	0.9	Almost reveal hear drive.	1.4	739328
169	349	4	1.4	Nice really a.	1.6	7725056
264	144	7	0	\N	1.4	5928960
246	464	4	1.7	Another lose firm direction safe number civil. Teacher film hear claim music center.	0.7	6395904
281	433	4	2.2	Suddenly record paper present very military accept draw.	1.9	2408448
268	747	5	0	\N	1.3	3177472
100	732	4	1.3	Scientist already even cup truth enjoy.	1.6	5228544
252	258	4	1.9	\N	1.4	3246080
162	824	10	0	\N	1.8	2376704
204	619	3	0	Remember service little grow stay resource.	0.6	3148800
118	451	6	0	\N	1.0	1072128
62	709	4	2.6	\N	1.0	332800
292	429	4	2.1	Future foot democratic exactly town even.	0.8	536576
228	684	6	0	Body reach next effort whole.	0.9	8010752
29	797	1	0	Life protect both morning drive fact.	1.4	1707008
89	595	4	1.0	\N	0.9	3255296
14	490	5	0	\N	1.9	581632
5	639	4	0.1	\N	0.7	5061632
166	309	4	2.5	\N	1.1	519168
293	335	5	0	Yes recently different community Republican reason.	1.1	876544
226	663	7	0	Term gas prevent west build.	1.6	3481600
201	851	10	0	Later his out now sometimes.	1.3	3378176
284	608	10	0	Across note management necessary either. Move same poor teach require such.	1.4	2024448
105	105	4	1.7	Late off ball charge provide nearly.	1.6	2696192
95	357	8	0	\N	1.5	2735104
190	384	4	2.2	\N	0.9	999424
164	503	8	0	\N	1.9	5807104
187	232	6	0	Young new everything message report.	1.8	914432
144	104	1	0	Contain call return sister recently church.	1.3	7124992
173	255	1	0	\N	1.6	1713152
182	223	1	0	\N	1.4	1100800
238	617	4	1.6	\N	0.7	591872
14	484	6	0	Message yourself probably memory property sort.	1.6	3845120
200	288	4	1.6	\N	0.6	551936
280	712	10	0	\N	1.1	727040
246	490	8	0	\N	1.6	3476480
63	52	4	2.7	Person bag develop since significant perform.	1.0	1318912
209	393	6	0	Those cause on community ever read.	0.8	5149696
222	453	8	0	\N	1.5	5229568
255	77	4	1.7	\N	1.1	3771392
197	871	8	0	Age still say manager great decade.	1.7	675840
67	154	1	0	Blood their pass though sing participant forward.	1.8	6653952
81	795	10	0	\N	1.3	5760000
240	76	4	1.5	Discussion interview age poor.	0.6	5834752
123	773	5	0	Recent first take to.	0.6	5402624
115	92	10	0	Guess little individual relationship throughout little. Air never because future especially.	1.5	7816192
148	406	4	1.9	\N	1.6	8221696
166	308	6	0	Company scientist miss cultural keep scene worry.	1.7	3781632
1	111	4	2.2	\N	1.8	5907456
148	419	9	0	No their leave activity.	0.5	6611968
160	174	4	1.1	\N	1.4	6598656
26	317	3	0	His among against become reach.	1.0	6696960
109	703	3	0	\N	0.7	7642112
179	655	4	2.9	\N	1.7	6845440
1	100	4	0.8	\N	1.5	5978112
43	535	6	0	Strategy development back four.	1.4	4237312
138	267	4	2.1	Adult put worker above order entire candidate stop. Watch try beautiful act election stock everybody.	1.8	2632704
113	511	6	0	Likely real which thousand clearly tend.	0.6	6258688
225	724	10	0	\N	1.7	6667264
53	765	4	1.7	\N	0.9	4332544
14	483	8	0	\N	2.0	7661568
137	468	4	2.9	Include reality purpose according note responsibility time. Point bad main response in region without interesting.	0.6	3917824
288	817	4	1.5	\N	1.8	7810048
26	308	4	2.7	Draw unit fight capital. Degree resource never development close I present statement.	1.7	2799616
47	371	4	2.9	Second someone recently.	1.9	2972672
57	494	6	0	Help full bit claim head upon pressure order.	1.4	7397376
155	444	7	0	Congress night law bed say these news.	1.9	535552
143	110	4	2.0	\N	1.1	4495360
111	345	4	2.6	This evening another candidate father example clearly.	1.4	1490944
173	261	5	0	\N	1.0	3211264
117	333	8	0	Theory anything tree sort discussion.	1.8	7964672
310	563	5	0	\N	0.7	7798784
68	644	9	0	Attorney report feel plan water.	1.1	2225152
229	51	4	0.6	Deal significant writer nice sign kitchen.	1.0	2796544
110	13	5	0	\N	1.3	3290112
120	601	8	0	\N	0.6	7188480
227	677	3	0	Sport short now thus total and out.	1.2	5069824
92	721	5	0	\N	1.4	5315584
141	363	4	0.7	Lose experience cost threat consumer of make.	2.0	7356416
225	728	4	2.4	\N	1.5	5750784
123	775	10	0	Whether cause structure risk increase history eye.	0.9	2192384
92	722	4	2.0	Picture painting include miss traditional picture.	1.1	4274176
45	10	7	0	Though American important different join.	0.8	3040256
247	203	4	1.2	Political ball most itself section well couple early.	1.1	6478848
310	555	4	1.8	Writer them career different perform.	1.5	504832
270	141	4	2.3	\N	0.6	4272128
122	462	4	1.0	Effect choice officer agreement charge manager work.	0.8	3064832
149	427	4	2.7	\N	0.9	6538240
190	389	4	1.2	\N	0.9	7252992
219	85	6	0	\N	1.8	444416
277	612	9	0	\N	1.3	7312384
279	412	9	0	Professor rest eye together artist eat current.	0.7	2665472
114	475	4	2.3	\N	1.4	1331200
44	68	4	2.4	\N	0.5	7394304
79	852	4	2.2	Boy left million option push.	1.3	7519232
73	414	4	1.3	Free player member appear with.	0.7	4493312
96	656	6	0	Attention exactly social no.	0.8	7623680
294	454	4	1.1	Form low his price must rich many morning.	1.7	2434048
47	387	5	0	\N	1.2	442368
152	817	10	0	Perform alone interview. Present these how only during per.	1.7	2775040
9	30	4	1.8	\N	0.5	3152896
124	341	4	1.5	\N	0.7	4457472
30	667	4	1.5	\N	1.4	7176192
217	266	7	0	\N	1.9	3720192
132	34	4	1.5	Grow only medical war still author. Hope blue his public data message party.	1.9	4449280
279	422	4	1.4	\N	1.9	7438336
26	311	4	2.3	\N	1.8	5215232
302	534	4	0.0	\N	1.0	5580800
211	829	4	1.3	Human identify room our television.	1.7	8181760
262	664	4	0.5	\N	1.2	7430144
128	130	7	0	Expert soon leader true skill law.	0.6	4498432
246	471	4	1.2	International service effort form.	0.7	5720064
62	728	4	1.4	\N	0.7	4962304
100	722	4	1.9	\N	1.1	6961152
127	64	6	0	\N	0.8	5351424
96	678	4	2.3	\N	1.8	7672832
139	544	10	0	Staff sometimes rock course large building sea. Money concern approach work provide him.	1.5	887808
237	35	8	0	\N	1.6	942080
173	282	5	0	\N	1.0	6500352
197	879	3	0	Reveal piece lay director try industry ability.	1.1	220160
219	75	4	2.8	Him security bag teacher.	1.0	6386688
104	528	4	1.2	Something ask for chair safe weight. Article thing thus point edge group.	1.8	2775040
297	730	6	0	\N	2.0	6972416
136	210	4	1.4	\N	1.3	2096128
77	398	4	2.6	Image major voice if. Total finally none to establish.	1.8	2324480
94	338	5	0	Live less fly quite. Pattern every Democrat.	1.1	4193280
230	656	4	2.6	Inside keep morning long.	0.9	3392512
255	76	4	0.8	\N	0.8	6565888
100	720	4	2.1	Cover build condition because view concern.	0.9	5622784
138	253	7	0	\N	1.3	7515136
226	670	4	1.5	\N	1.1	7049216
47	384	8	0	\N	1.0	454656
228	701	5	0	\N	0.9	8256512
113	517	1	0	Person nearly measure standard do.	1.3	1545216
294	453	3	0	\N	1.8	7713792
115	94	1	0	Cup interview eight.	1.9	6614016
298	708	8	0	\N	1.6	911360
191	754	9	0	Carry start a ahead.	1.3	1397760
281	443	3	0	\N	1.1	7487488
207	420	4	1.9	\N	0.7	5009408
289	66	8	0	Answer need prepare act ago.	0.6	7326720
246	465	4	2.7	Our scientist entire how.	0.5	140288
270	135	7	0	\N	1.7	7813120
148	413	7	0	\N	1.0	6389760
286	189	4	1.0	\N	1.7	3447808
233	108	6	0	\N	1.1	6424576
63	46	4	2.9	Mrs his manager fact marriage measure position front.	1.4	4248576
220	51	4	2.9	\N	1.0	8120320
127	63	7	0	Lose herself majority land risk interview.	1.7	5779456
68	655	4	2.9	\N	0.7	1714176
27	741	7	0	\N	1.5	4448256
149	423	9	0	Product far at type art born.	0.7	6132736
146	575	4	1.1	\N	1.5	1320960
286	167	4	0.2	\N	1.7	8215552
179	643	4	2.6	\N	1.2	2203648
164	512	6	0	Experience increase specific lose perform perhaps part remember.	1.6	338944
123	783	1	0	\N	1.4	1836032
135	267	10	0	Knowledge himself effort class.	1.9	5158912
143	101	3	0	Time good develop vote eye.	1.6	1200128
119	338	4	0.4	\N	1.1	3045376
198	844	4	2.3	Trip hit test far draw plan including.	1.7	5594112
240	79	4	2.1	Effort take set indeed.	0.6	7162880
139	551	4	1.8	Around heavy crime wall politics ground walk.	1.2	4217856
42	497	4	2.4	\N	0.5	6648832
132	22	4	1.1	\N	1.2	952320
23	234	4	2.6	Fill again project myself least. On rate language.	1.3	5306368
28	317	4	1.0	\N	1.5	4152320
258	308	5	0	\N	1.9	548864
239	237	4	1.8	Successful pretty suddenly especially watch lay eight.	1.4	1182720
86	542	6	0	Without a nearly money.	1.0	5539840
288	837	9	0	\N	1.2	3730432
294	462	4	1.0	Tree him away take. Though opportunity discuss poor.	1.2	2991104
276	834	9	0	I chair choose.	1.9	1316864
167	842	4	2.5	Here star direction.	0.9	7053312
79	842	4	2.5	Hair student however both modern.	0.7	2219008
278	697	4	1.3	\N	1.4	5934080
7	369	4	1.6	\N	1.1	6641664
80	250	4	1.7	Industry produce its music audience full police.	1.4	7789568
53	763	4	1.1	\N	1.9	7580672
72	656	10	0	Officer light expect story write. Particularly practice under rise hotel.	0.9	256000
152	835	6	0	\N	1.1	2656256
166	328	4	1.9	Need fight south consider true common.	1.2	4583424
80	268	4	2.9	\N	1.3	2125824
305	699	1	0	\N	1.4	3726336
100	725	4	2.4	Happy since teach you push. Assume step view better three card prove.	0.7	7391232
26	321	4	2.2	Offer likely degree movement attorney water.	1.7	2933760
173	258	4	1.2	Amount huge option us environment.	1.5	4750336
150	427	4	2.6	\N	1.1	7975936
30	670	4	2.9	\N	0.7	7705600
203	792	4	1.8	System order trouble pressure deep behind deal.	1.6	6226944
133	779	4	2.7	Need magazine Republican give create plant program.	1.6	7830528
148	426	4	1.8	Either student beyond.	1.1	2894848
117	338	4	1.1	Generation successful realize on nature field.	0.6	7154688
40	95	7	0	Rather they gun firm feeling statement.	1.2	1167360
151	114	4	1.1	Red contain win value remember.	1.8	185344
74	472	4	1.7	\N	1.5	7151616
166	304	8	0	\N	0.9	3177472
47	380	4	1.0	Civil outside instead from school main.	0.6	3106816
10	653	9	0	\N	1.4	5895168
217	254	5	0	Help attack meet.	2.0	1081344
184	868	6	0	Case night leader strong.	1.4	5222400
266	768	6	0	Report indicate lead collection energy help.	0.9	3220480
102	792	9	0	\N	1.8	396288
214	214	9	0	Rich particularly practice police maybe.	1.6	3764224
173	254	4	2.0	Response break economic blood material get mouth more.	0.9	3763200
261	427	4	2.8	\N	1.9	2794496
296	443	4	0.7	\N	1.8	7704576
148	405	4	2.6	And seven year meet think interview. Walk political hospital spend lay.	0.9	7217152
7	383	6	0	\N	1.9	4077568
206	392	1	0	Certain hard six million world believe nothing.	1.6	4569088
54	411	4	2.8	Condition be stay no.	0.8	3190784
195	419	6	0	President father night music where strategy. Again question raise lead.	0.6	2062336
135	266	4	2.1	Point college attention traditional dinner talk service dinner.	0.6	4278272
256	299	4	2.9	\N	0.7	329728
88	461	4	2.4	\N	1.5	1670144
228	685	4	1.4	Protect age painting take with. Forget by boy today every.	0.9	4846592
185	791	4	2.2	\N	1.5	7556096
220	49	3	0	Cup contain area imagine individual hold present. Various book degree foreign.	1.2	4102144
71	46	3	0	Attorney herself experience although.	1.3	1738752
272	749	4	2.6	\N	0.8	3434496
7	379	10	0	\N	1.2	6980608
141	357	4	2.2	Edge main nor change cut.	1.6	2471936
283	15	1	0	\N	1.8	1644544
150	420	5	0	\N	0.6	4172800
281	432	4	2.6	Day despite only election.	1.3	3187712
245	377	4	2.0	Billion consumer write dinner yard.	0.7	6440960
85	11	4	1.7	\N	2.0	6898688
274	77	1	0	\N	1.2	8109056
28	327	6	0	\N	1.2	4307968
73	410	6	0	Beyond wide difficult whatever economic well.	1.0	7536640
277	618	9	0	Rather finish drug off and.	1.3	6095872
14	469	4	1.4	Point population personal serve. Again soldier tell.	1.8	4613120
74	485	4	1.2	\N	1.8	965632
128	124	1	0	\N	1.6	5422080
171	845	5	0	\N	1.3	2776064
174	344	4	2.9	\N	1.3	6970368
215	512	6	0	Current to sense middle success.	0.6	4581376
7	381	8	0	\N	1.8	1005568
121	714	9	0	Effect interview spend sure arrive.	0.7	1528832
284	619	1	0	Matter hand thought especially lead authority.	1.5	3289088
179	639	4	1.7	Together run set leader business.	0.7	1638400
267	740	4	2.8	Culture practice season daughter performance whether. Yeah before pass finally fast cup piece.	1.3	6388736
237	16	4	2.5	\N	1.3	5381120
86	538	4	2.0	\N	1.8	2888704
70	227	3	0	Response response doctor region carry news. Boy from even feeling event issue quickly.	1.5	5615616
305	698	9	0	Prepare arm eight foreign.	1.7	6787072
193	522	4	0.3	\N	1.0	7995392
221	477	4	2.5	Positive agreement national especially.	1.3	5950464
24	803	4	1.5	Into whole financial series.	1.2	2160640
305	692	4	1.5	\N	0.9	4102144
294	459	1	0	\N	1.9	1582080
258	319	5	0	Rate baby agency.	0.8	5572608
274	87	5	0	\N	1.5	3950592
231	495	7	0	\N	1.3	5164032
175	512	7	0	\N	1.8	3422208
65	213	4	1.2	Enjoy business service environment state. Service around staff.	1.0	2575360
61	739	4	1.4	Since dinner face hope anyone.	1.4	1114112
221	484	7	0	Question fast nothing movie before determine ground.	1.1	1093632
193	517	4	2.7	Add a everything smile truth police save.	0.7	6054912
43	534	9	0	Class somebody hot economy smile ability federal.	1.8	951296
179	631	4	1.9	Already every push model.	1.2	7700480
80	265	10	0	Much without little west project if.	1.9	1992704
266	779	9	0	Tax add art partner dog live.	1.8	1484800
145	364	4	2.1	Traditional friend true then.	1.5	3412992
193	509	4	1.8	Yet thus raise action section admit.	0.7	7872512
222	449	9	0	Country soon majority mention free.	0.6	2653184
30	658	4	2.0	\N	0.9	3858432
279	411	8	0	\N	1.8	4634624
275	226	4	1.2	\N	0.8	8205312
245	389	3	0	Thought truth indicate physical quality.	0.7	1115136
279	416	7	0	\N	1.0	2521088
43	533	4	2.3	Hit institution step.	1.8	1497088
32	592	1	0	Sign billion change conference learn simply deep.	0.8	8174592
132	20	4	2.8	Agent matter beyond away true trial with.	0.9	6042624
256	301	4	1.9	Team can high west.	2.0	2854912
171	848	6	0	\N	0.7	4277248
233	107	4	0.8	Response less all shake prove seem case.	1.6	8013824
281	436	4	1.0	Chair pass car amount strategy cut.	0.9	5627904
251	139	4	1.2	Shoulder option later child act rise.	1.5	5573632
164	511	4	0.5	\N	1.0	4947968
89	604	4	2.7	Enjoy public by top he season word.	1.3	7823360
189	612	7	0	Type when half approach.	1.0	609280
305	681	4	2.0	Great every center fact fall it. Clear foot believe decide scientist.	1.8	4257792
272	755	4	2.4	Help dream interview ability.	0.7	1425408
134	137	8	0	\N	1.1	7277568
17	205	10	0	Health election mouth beyond.	1.3	1149952
11	228	10	0	\N	1.4	3171328
239	234	7	0	Ahead none network.	1.5	8227840
72	667	4	1.5	\N	0.6	4213760
192	745	5	0	Seat actually a. Throughout study TV really thank impact subject.	2.0	1658880
12	230	4	2.0	Level go building nation wall mention. Police every day so.	1.9	5007360
43	540	4	2.1	Your teacher usually letter top school over.	1.1	6193152
239	235	7	0	\N	1.1	8010752
288	828	4	2.9	\N	1.2	5211136
187	226	4	0.7	Scientist real center take too tell.	1.3	7567360
9	19	4	1.1	\N	1.8	1610752
17	201	10	0	Game hospital truth than difference voice well article.	1.2	5038080
80	259	5	0	Truth side here.	0.8	7356416
204	624	6	0	Attorney build report man.	1.0	1069056
221	493	4	1.8	Environmental wear institution difficult year.	1.5	1056768
55	842	7	0	Machine environmental behind brother behavior.	1.2	710656
120	604	7	0	\N	1.5	7148544
128	122	4	1.4	\N	1.8	2093056
179	646	4	2.0	Almost moment seven thought. Before improve business factor support citizen whether.	0.8	2877440
301	342	4	1.7	Analysis campaign memory hope claim skin commercial.	0.6	5752832
98	731	10	0	Often campaign discover consumer relate. Level while eat collection.	1.6	2277376
54	423	4	0.0	Record very forget analysis usually simply.	0.7	6887424
132	37	4	0.8	\N	0.9	4009984
67	170	8	0	\N	0.7	2523136
140	375	4	2.7	\N	1.7	6463488
173	267	9	0	Southern thought cover.	1.0	7859200
8	208	4	1.3	\N	0.7	3566592
59	703	4	2.6	\N	1.9	1821696
135	263	4	1.9	\N	1.3	2940928
177	226	5	0	\N	1.7	7576576
128	119	4	2.2	\N	0.7	2316288
253	808	8	0	\N	1.9	6465536
289	65	6	0	Page develop nothing similar scene. Into such religious.	0.8	7752704
23	246	7	0	\N	1.9	6759424
146	557	4	0.9	\N	1.9	2782208
298	730	4	0.6	Participant blood system.	0.8	6599680
96	672	4	1.8	Possible stock beautiful impact production. Discover including outside itself.	1.3	4753408
272	756	3	0	\N	1.1	8100864
135	265	4	2.3	Argue rich debate nice quality left. Pm just example shoulder shoulder suddenly senior.	0.6	1486848
93	729	4	2.7	\N	1.4	4257792
127	60	5	0	The cut exist explain national music.	1.2	5581824
12	214	1	0	Score other during possible control record.	1.4	3407872
17	197	8	0	\N	1.7	1778688
157	210	4	1.4	\N	1.0	6604800
33	552	4	0.7	Live writer example shoulder.	1.9	5345280
130	9	4	2.0	Speech beautiful according relate.	1.7	2447360
5	653	3	0	\N	0.8	3685376
7	375	4	2.7	\N	1.7	4147200
252	278	10	0	Choose to unit section tough represent.	1.8	4133888
282	422	1	0	Color station subject onto each stage. Economy chair rock arm increase necessary.	0.7	3320832
6	699	10	0	One bill person score.	0.6	7230464
222	451	5	0	Clearly bar street quality win look article.	0.8	3706880
62	721	10	0	Become understand answer data soldier blood.	1.4	2054144
220	50	3	0	\N	0.9	941056
171	847	4	1.3	Image strategy morning nice.	1.9	7262208
120	599	4	1.3	Include name order institution particularly number identify production.	1.5	7817216
291	298	6	0	\N	0.7	5580800
50	246	3	0	Drive several recognize four president everything.	1.7	5628928
49	787	6	0	Political culture Congress local sell true. Measure citizen husband bag until find.	1.1	797696
7	373	5	0	\N	1.9	413696
125	147	9	0	Effort other arrive two.	1.7	7529472
213	571	4	1.4	\N	0.7	4465664
233	102	3	0	\N	1.9	680960
126	2	5	0	\N	1.2	139264
140	390	4	1.3	History road television wait service smile.	1.2	1042432
14	491	3	0	Hit attack think sure prevent. Party source sit apply benefit.	1.4	1755136
205	290	8	0	Possible hour start.	1.5	3762176
90	103	4	2.8	\N	1.0	495616
73	422	5	0	\N	1.6	2262016
295	591	4	1.6	Total happen most rather race base allow song.	0.6	4365312
155	448	10	0	\N	1.1	279552
239	236	7	0	Debate seven technology save.	0.8	1598464
159	416	4	2.1	\N	1.9	4274176
34	793	7	0	\N	1.8	8225792
204	627	10	0	Tree network that their call.	1.8	7322624
26	313	1	0	How level into sense only.	1.4	4269056
181	795	1	0	Once maintain speak affect hotel view.	1.8	4354048
286	177	4	1.9	Door themselves name recent agency citizen spend.	0.6	5515264
284	615	4	0.1	Federal serve house glass live music.	0.7	3966976
225	723	9	0	Natural second cold often south. Yes include kind choice skill almost.	0.6	1666048
92	709	7	0	\N	1.7	3744768
173	253	4	0.1	\N	1.6	863232
159	409	9	0	Nation bit way each such name.	0.9	1355776
149	422	9	0	Father power least history support.	1.4	4162560
70	222	4	1.8	\N	1.0	3737600
89	601	4	1.5	\N	0.9	1479680
237	37	9	0	Commercial six yourself speech four move red.	1.4	4555776
189	613	4	0.4	Here fight apply.	1.4	7723008
166	327	6	0	\N	0.9	5329920
115	90	4	1.8	\N	0.7	6459392
262	671	4	2.2	\N	0.9	2479104
294	450	3	0	Trip fine ask.	0.5	1024000
55	850	4	1.6	Gas director project.	1.0	7574528
59	685	4	1.4	From others new crime.	1.7	498688
88	446	1	0	Method with boy couple cause man.	1.0	4239360
258	322	8	0	\N	1.2	6068224
180	528	7	0	Success form face three leader partner.	1.7	6085632
226	656	5	0	\N	0.7	3716096
134	145	4	0.1	Simply ready third reach room shake population.	1.0	6178816
5	650	8	0	Change individual American organization part stand.	0.5	512000
128	116	4	2.7	Control poor prove buy imagine sit.	0.8	960512
246	484	8	0	\N	0.8	5853184
6	702	8	0	\N	1.2	2918400
96	668	4	2.8	\N	1.1	5844992
146	560	5	0	\N	1.8	5382144
123	782	4	1.1	Stock loss born.	1.1	7202816
42	494	4	2.8	Discussion finally out carry summer than. Real have modern military.	0.7	7085056
104	537	4	0.6	Involve you several investment cup.	0.8	3870720
91	657	6	0	Experience court candidate if.	1.8	5708800
226	676	3	0	\N	1.3	4806656
186	777	4	1.7	\N	1.6	6823936
14	470	7	0	Vote structure yet hand talk. Democratic surface stop effort agreement.	2.0	5417984
162	828	9	0	\N	1.4	983040
68	632	4	2.5	Government minute thank response discuss candidate father.	1.8	4359168
225	725	4	0.7	\N	1.6	6272000
109	701	4	1.3	\N	0.6	1938432
266	777	4	1.1	Do different different back physical include teacher.	0.9	3099648
13	210	1	0	Quickly score price option fast.	1.9	3757056
120	590	4	2.2	\N	1.0	5735424
97	811	10	0	Me learn effort sure debate bar wonder.	1.7	7320576
91	663	4	2.1	\N	1.5	6067200
7	384	1	0	\N	1.6	4684800
278	698	4	1.1	\N	1.6	6026240
24	796	5	0	\N	1.0	4282368
138	271	5	0	\N	0.7	6692864
276	833	4	2.6	\N	1.2	6482944
133	766	4	1.6	Weight benefit buy feeling. Anything class he push head only.	1.0	7778304
173	250	9	0	\N	1.7	4826112
293	339	8	0	Call play bad similar skin strategy.	0.8	468992
71	53	4	1.5	\N	1.4	8091648
218	755	1	0	\N	1.8	4361216
275	232	1	0	\N	2.0	7235584
45	3	4	1.6	Follow image pull catch too direction rock which.	2.0	3834880
128	125	4	2.2	Opportunity manager participant certainly region.	1.4	4082688
200	291	3	0	Test take throughout oil.	2.0	1740800
156	53	4	0.4	\N	2.0	1319936
272	757	5	0	\N	1.6	468992
310	570	4	1.5	\N	0.6	7953408
258	329	6	0	\N	1.3	5560320
111	346	4	1.3	Dog thank against mean.	0.6	7196672
122	457	9	0	Keep I after lose land college weight.	1.3	164864
100	727	6	0	Into budget own.	1.2	6704128
63	54	7	0	Government hospital son star recognize.	1.2	6797312
34	788	7	0	\N	1.1	1756160
275	214	4	2.3	Know let fish authority sell.	1.0	5572608
224	52	10	0	From them case join let. Wide city account research president himself decide.	0.8	889856
148	417	4	2.4	\N	1.4	4139008
106	135	4	1.0	\N	1.0	2912256
162	841	6	0	Every fill American forward art race kid.	1.8	8162304
52	337	4	2.6	\N	1.2	5366784
171	850	4	1.6	\N	0.8	3973120
219	83	4	2.2	\N	1.8	2373632
240	88	9	0	None particularly southern any friend seem sport.	1.8	1777664
191	765	4	0.4	\N	0.7	4445184
183	190	4	2.5	Station particular agent available.	0.9	6991872
211	832	4	1.8	\N	0.7	7804928
151	126	5	0	\N	1.0	7360512
71	56	6	0	Produce assume peace over between benefit.	0.9	6262784
88	460	7	0	\N	1.1	900096
296	432	4	0.2	\N	0.7	2872320
265	398	1	0	Report item role pressure write them involve. Care check seven believe young walk he like.	0.5	1550336
137	463	5	0	Various all peace just water.	1.9	4503552
52	339	1	0	Certain former still next level.	0.9	5345280
86	532	1	0	Me true understand individual everything human thing everything.	1.1	5122048
307	403	1	0	Occur chair choice machine win.	1.3	8275968
238	624	4	0.7	\N	0.8	5810176
259	843	5	0	Others Congress public hotel interview born.	0.5	4399104
205	287	6	0	Again can real business six.	1.5	3954688
29	806	4	1.4	\N	1.5	7415808
286	185	10	0	Relate relationship tend play major.	1.7	6915072
295	603	8	0	End opportunity actually you.	0.7	6539264
206	402	1	0	\N	0.8	3616768
297	716	8	0	\N	1.4	1028096
201	844	4	0.1	Easy green dream hear.	1.1	192512
261	428	4	2.0	View a rather relate window their whose.	1.6	1157120
12	216	4	1.8	\N	1.0	5404672
254	826	9	0	\N	1.1	5106688
53	761	8	0	Risk partner rise represent present. Black staff matter beat sing stand.	2.0	1235968
30	666	7	0	\N	1.0	7780352
288	816	3	0	Possible push eat nation animal four toward worry.	1.2	2128896
286	159	5	0	\N	1.3	7107584
245	383	8	0	Edge evening end debate wide throughout level. Admit natural across end the.	0.9	5163008
276	824	5	0	\N	1.4	1987584
80	255	4	0.2	\N	1.7	4172800
128	133	4	2.9	Not particular material evening guess.	1.4	3934208
162	819	7	0	\N	2.0	3987456
59	690	4	1.0	Tough suffer art on simple run enjoy.	1.3	153600
222	444	4	2.4	Region last win like bar dream market magazine.	1.9	2180096
227	666	9	0	\N	0.6	6321152
226	673	3	0	Gun part able hope own scientist.	1.9	6165504
105	113	4	2.8	\N	0.8	6226944
67	182	4	1.6	Third necessary ahead history place high.	0.9	4855808
167	844	3	0	\N	1.1	7651328
251	149	3	0	\N	1.2	2273280
132	23	1	0	\N	1.8	3634176
135	271	6	0	\N	1.4	7736320
304	549	1	0	\N	1.0	6528000
293	333	7	0	\N	1.3	6533120
137	477	4	1.5	\N	1.1	3724288
184	870	3	0	High space finish themselves.	0.6	2325504
201	846	4	0.1	Test morning not camera.	0.7	4418560
72	663	9	0	Cultural operation nation key sit student life only. Question stop image will might certainly page.	1.0	4454400
204	615	4	2.7	Hundred idea option or.	0.9	6331392
308	852	5	0	Prove avoid prove author surface wrong six.	0.7	1374208
56	540	4	1.0	\N	2.0	2104320
240	78	6	0	Institution car free person environment commercial.	1.6	2102272
116	89	5	0	Investment pretty child five result. Me big fall short.	0.9	3416064
257	293	1	0	\N	0.9	3065856
110	2	8	0	Open moment service well.	1.4	6303744
298	716	4	2.1	However month even side relationship again policy nation.	0.5	1291264
122	454	7	0	\N	1.5	6173696
254	834	4	1.1	\N	1.1	1796096
150	423	4	1.9	\N	1.6	8058880
112	366	4	1.5	\N	0.6	8156160
128	115	10	0	\N	1.6	4969472
166	324	10	0	\N	1.3	824320
40	91	1	0	Station son cut weight.	1.7	2640896
207	412	4	2.2	All believe loss national hear.	1.8	2563072
236	300	1	0	\N	0.6	1992704
215	501	5	0	Appear common rest green success expect current.	1.1	3507200
96	676	10	0	Remain unit mother class.	1.3	1173504
305	690	7	0	\N	1.9	2071552
215	521	4	1.3	\N	2.0	5399552
279	410	4	1.2	\N	1.8	1666048
208	544	10	0	Lay support agree natural over after spring. Company official himself.	1.3	5096448
199	566	4	1.0	\N	0.8	2477056
183	192	10	0	Away conference affect energy.	1.3	4262912
269	438	7	0	Within house beat character. Home town decade manager rather let number.	1.8	771072
53	754	4	1.7	\N	1.6	2312192
80	271	4	1.3	\N	1.6	7075840
168	326	4	2.9	Describe no information care box increase. Member them character cup section leg science.	1.2	7537664
164	519	3	0	\N	0.8	6211584
267	736	6	0	Move successful pass nearly enjoy produce.	1.2	1205248
280	729	4	1.3	\N	1.1	6960128
252	279	4	1.6	\N	0.5	4167680
10	654	10	0	Firm because speech fine. Third form cup have street blood.	1.0	8035328
9	18	8	0	\N	0.9	3392512
282	424	4	1.5	\N	0.9	6754304
296	442	4	2.7	\N	1.1	7080960
159	405	4	2.6	\N	1.1	6479872
245	384	4	2.2	\N	1.3	7955456
121	722	4	2.5	Rather century cell stand building model order.	1.8	6796288
58	495	4	2.3	Structure bar professional American.	1.3	7185408
298	713	7	0	\N	1.0	1233920
29	809	4	2.3	\N	1.8	4509696
112	381	4	0.3	Tell thought third father state strategy support.	0.9	2118656
271	192	8	0	\N	1.3	274432
17	204	4	1.8	\N	1.4	5037056
224	48	5	0	Toward body phone PM everything institution.	0.8	3123200
93	708	8	0	One hotel development computer food imagine. Create human study affect.	1.2	2250752
127	73	4	2.4	Need let agree environment available.	1.8	363520
184	857	4	1.4	\N	1.8	6874112
15	619	8	0	Energy generation energy social benefit.	1.0	4077568
153	82	4	1.2	\N	1.6	4474880
92	711	4	2.2	\N	1.7	2703360
276	838	4	1.4	\N	0.5	1389568
138	268	4	2.9	Usually executive tough director former.	1.4	949248
148	422	5	0	On find after lay smile social.	1.0	1853440
98	710	5	0	Speak detail between soldier about nearly reflect.	1.9	371712
193	524	4	0.4	Politics focus news. Beautiful measure business security size day.	1.8	891904
78	267	7	0	Consumer program fly executive PM.	0.9	2384896
145	356	3	0	On color medical piece through level ever.	1.7	5445632
217	278	4	2.1	Available dinner mean expert partner issue program.	1.2	3659776
228	690	4	1.0	Door cold attorney.	1.2	7225344
267	744	5	0	Lose quickly protect far.	0.8	2441216
55	845	7	0	Sure campaign behind girl like maintain.	1.1	4898816
149	417	7	0	Member behavior reach land state. Manage bring but successful.	1.1	3693568
286	162	4	2.0	\N	0.8	4799488
113	524	4	1.9	\N	1.8	2908160
3	106	4	2.0	\N	0.7	3728384
238	613	4	1.7	Start base for raise month program play. Reflect rule argue popular series cold.	1.6	4853760
173	280	5	0	\N	0.6	3182592
210	450	4	2.3	\N	1.6	2873344
20	344	4	0.5	\N	1.9	8203264
148	423	4	1.9	\N	0.5	4576256
92	719	3	0	\N	0.8	6668288
261	411	4	2.8	Least suggest responsibility hit arm attorney.	0.8	6529024
47	377	4	2.0	Exactly local nice relationship common.	0.8	5989376
42	495	1	0	\N	1.3	5888000
214	222	3	0	Fact if threat court before beat again.	1.7	786432
156	52	8	0	Most sign against a reduce hit story.	1.1	678912
233	104	4	2.6	\N	0.7	7143424
87	435	4	2.9	\N	0.6	4805632
136	212	4	1.1	\N	1.6	6431744
258	303	4	2.4	Wonder local theory cost eye.	1.4	1979392
168	310	4	1.4	\N	1.4	2862080
182	217	4	0.1	Indicate could question where will compare.	0.7	7443456
226	657	4	1.4	Try pressure enjoy exactly price. Ten strong yourself.	1.1	6430720
170	373	4	1.0	\N	1.4	4089856
288	833	5	0	\N	0.9	7147520
162	830	9	0	College fight wide.	1.0	2991104
160	182	10	0	\N	1.2	714752
228	707	4	1.8	Protect cover lead once course amount.	1.8	7257088
167	853	3	0	\N	0.9	7855104
148	418	4	1.1	\N	1.8	4329472
171	844	4	2.3	Wrong usually major seem.	1.2	5569536
168	318	4	1.5	\N	0.7	4134912
205	296	8	0	\N	0.9	6661120
105	102	8	0	\N	1.3	6149120
228	695	4	2.8	\N	1.4	1171456
94	335	4	1.3	Total myself stay dog.	1.2	7351296
106	153	4	1.5	\N	1.9	2095104
281	435	4	2.9	\N	1.1	7067648
290	391	4	2.7	\N	1.6	1755136
46	604	9	0	\N	1.0	5260288
302	535	4	1.8	\N	1.6	361472
179	641	6	0	Material hand line safe ask official boy.	0.7	1232896
290	400	5	0	\N	1.4	5495808
195	422	4	0.1	\N	1.4	6069248
294	455	1	0	Thus summer forget whose himself. Foreign or positive school admit way.	1.9	1313792
109	689	4	1.5	\N	1.8	6946816
147	301	4	1.9	Region now position move.	1.8	3005440
193	502	5	0	\N	1.0	4723712
91	658	4	2.0	Focus such start son data suddenly call.	0.5	6378496
104	540	4	2.2	Dark outside learn the.	1.1	1443840
66	430	4	1.3	Policy from start professional statement street strategy. Ago kid light professor protect work.	0.8	4940800
245	390	4	1.3	\N	2.0	1750016
294	444	4	2.4	Forward size degree management.	1.2	6161408
268	754	4	1.0	\N	0.7	7579648
76	345	4	2.6	Hand herself unit either.	0.9	2370560
109	693	6	0	\N	1.8	7834624
141	355	4	1.2	\N	1.5	6086656
1	102	4	2.6	Cold radio meeting I.	1.8	5413888
191	755	1	0	Man her likely effect.	2.0	3973120
160	161	4	1.9	\N	1.2	954368
190	381	1	0	Look though especially someone group more administration. Reach we government give.	1.1	962560
14	471	4	0.8	\N	0.9	6529024
227	670	9	0	\N	2.0	6641664
170	374	4	2.2	Process seven management.	1.5	2509824
96	657	4	1.4	Easy different nature dream unit.	1.0	4124672
104	533	4	2.3	Station represent build soon play benefit TV. Lot thousand information least teacher when reflect.	0.5	6443008
132	28	1	0	\N	1.0	289792
228	686	1	0	\N	1.8	474112
309	383	5	0	\N	1.5	4915200
138	254	3	0	That community fear through policy finally eight behind.	1.5	2059264
284	617	5	0	List really tend moment exactly. Success color actually action administration add if girl.	0.6	1613824
255	79	8	0	Open similar time. Leave strong who say themselves former attack.	1.1	6288384
5	652	4	2.3	\N	2.0	6903808
62	711	4	1.5	Skin model although skin husband.	0.7	3472384
199	564	4	1.4	\N	1.5	6860800
194	569	4	1.2	Professor crime work career.	1.2	4203520
122	455	8	0	\N	1.6	2779136
152	826	4	2.6	\N	1.0	8205312
33	550	4	1.3	\N	0.7	2043904
3	90	4	0.6	Trip she without such task accept player glass. Strong cell firm expert.	1.9	5087232
291	290	1	0	Bag simply arm over short individual pretty cover. Cut increase industry will character each reality.	1.4	3463168
252	271	4	1.1	\N	1.5	837632
80	270	4	0.2	\N	0.5	1931264
296	440	6	0	\N	0.9	6374400
282	406	4	1.9	Task page let manage eat prepare feel pick.	0.5	2428928
213	564	4	1.4	\N	0.7	6781952
74	484	4	1.4	Finally enough subject teach step card.	1.4	4438016
103	191	4	2.5	Whose religious fact success fire best child. Again south listen lot if audience agree nothing.	1.4	4609024
278	701	3	0	\N	0.9	5447680
310	562	8	0	\N	0.6	6320128
86	530	5	0	\N	0.5	2160640
149	407	7	0	\N	1.0	2856960
162	829	7	0	\N	1.2	3000320
114	483	4	1.8	Training nature whole project.	0.5	6949888
207	428	4	2.0	Study woman scene within.	1.3	5989376
300	733	4	2.1	\N	1.6	6313984
210	453	4	1.7	\N	0.8	2584576
80	251	4	1.6	Need yes be woman life detail big. Common appear method rise site indicate sure deal.	1.7	3955712
148	428	7	0	\N	1.1	3128320
152	836	8	0	\N	1.8	2504704
62	725	4	2.4	Chair best enter subject way.	1.8	3172352
40	108	4	2.5	\N	2.0	537600
227	673	4	2.8	\N	1.1	7415808
298	719	4	2.6	Site situation community mother than may.	0.6	8144896
83	429	1	0	\N	0.8	3785728
18	299	4	2.9	\N	1.8	7001088
71	50	4	0.8	His ability child college win trade find PM.	0.5	2217984
239	246	4	1.7	Reduce move should anyone hundred both. Across need try wind example woman popular lead.	0.9	334848
236	301	4	1.9	\N	1.3	4954112
187	219	9	0	Community theory authority bill far power watch.	1.6	969728
211	826	5	0	\N	1.4	6818816
106	144	4	0.7	\N	0.6	3600384
278	706	5	0	These detail a resource.	0.9	975872
221	463	10	0	Establish hold health born most report very.	1.4	5613568
298	731	4	1.8	Central the democratic.	1.5	1596416
194	567	4	0.6	\N	1.9	2257920
89	593	9	0	Want information out success read might lay opportunity.	1.2	8171520
278	681	7	0	Ok somebody black thought foreign learn important.	0.5	1091584
182	220	1	0	Exactly rise cause social.	1.1	5157888
243	434	1	0	Poor collection onto store cause form other. Trouble though least trip purpose free including bank.	1.2	7379968
249	346	4	1.3	Form thing moment agent maybe arrive point purpose. Kid defense letter message box game.	0.6	8289280
254	833	6	0	\N	0.9	452608
68	630	10	0	\N	0.5	4469760
215	518	4	0.4	Everybody easy usually. Mrs age system improve never new.	1.5	3365888
227	656	3	0	Court ready war event what.	0.8	5200896
252	251	6	0	Small offer fact anything major.	1.1	2766848
173	277	10	0	Oil continue discover against spend probably modern.	0.6	7664640
216	638	4	2.0	Minute floor food same there current effect.	0.8	2971648
161	791	5	0	Process minute pull yeah pass write.	2.0	4697088
6	687	4	2.6	Picture because wind state.	0.9	5219328
226	659	9	0	\N	1.7	6594560
120	607	4	2.0	Idea mention I letter paper across cup in. Focus role stand.	0.6	7811072
284	612	10	0	\N	1.3	3515392
63	53	4	1.5	\N	1.9	153600
267	733	8	0	\N	0.9	1222656
3	104	4	0.9	\N	1.5	3777536
5	655	4	2.9	Positive truth exactly.	1.3	7788544
92	728	6	0	Simple test every position.	0.8	1310720
71	43	8	0	\N	1.0	8064000
186	768	4	1.3	Organization anything during heart.	1.8	5545984
73	416	3	0	\N	0.6	7574528
159	410	3	0	\N	1.2	2619392
10	643	4	2.6	Traditional travel yes here.	1.1	6787072
9	17	4	2.5	Some prove market clear.	0.6	4728832
123	768	9	0	\N	1.9	640000
67	174	4	1.1	Price green behavior a degree.	1.8	7730176
172	847	5	0	Design sing attention program rich book class.	1.6	3767296
28	325	9	0	\N	0.6	6041600
152	841	10	0	\N	1.8	3388416
56	535	4	1.8	\N	1.4	6534144
186	776	7	0	\N	1.7	2002944
29	804	7	0	Land church person page doctor life. Issue anything yard education.	1.7	3049472
78	252	4	2.3	Threat second guy.	1.3	2995200
145	353	4	1.9	\N	0.8	480256
251	137	8	0	\N	1.7	1170432
62	715	6	0	Music sport admit surface.	1.2	5520384
296	435	4	2.9	\N	1.7	5618688
129	569	7	0	Prevent window heart health south century.	0.5	7578624
200	297	3	0	Reach shoulder offer research learn much evidence especially.	1.2	7719936
29	802	4	2.3	\N	1.1	1690624
114	481	4	2.3	Market experience thing understand evening war. Campaign add office just.	0.7	3603456
206	399	4	2.2	\N	1.8	5182464
228	682	4	1.2	Feeling ball son gas real.	1.2	7539712
230	658	8	0	Film site along cell pull crime their.	1.6	3252224
216	633	6	0	\N	1.1	3165184
132	18	4	1.0	\N	0.7	5725184
166	320	4	0.6	Local name about drug.	1.3	6001664
243	437	4	1.0	Speech three condition significant out list seat real.	0.7	7370752
259	849	5	0	\N	0.9	6437888
46	605	4	2.8	\N	1.6	2640896
274	79	9	0	\N	1.4	1267712
230	675	3	0	Everyone up Mrs executive among.	0.5	2495488
189	625	4	1.1	For ahead decide each whom place.	1.3	1617920
216	652	4	0.9	Leave police even song approach.	0.9	7682048
279	404	7	0	\N	0.5	8109056
229	46	4	2.9	Sometimes campaign professional establish state keep major market. Respond visit sure quite no community.	0.6	2838528
138	264	9	0	\N	1.8	7575552
75	109	4	2.5	Imagine evening to difference dark gas yourself simply.	1.5	636928
132	32	4	2.1	\N	0.6	4432896
132	26	4	2.7	There around amount specific practice.	1.6	1025024
113	503	1	0	Particularly send generation manage act piece.	1.3	724992
97	802	4	2.3	Develop science generation answer citizen.	0.8	4102144
48	343	4	1.0	Without together name husband better rich.	1.9	1555456
259	851	8	0	\N	0.5	5014528
110	7	10	0	Herself and many or.	1.8	2940928
180	531	5	0	\N	1.4	7432192
309	368	7	0	Others floor me. Successful these resource down.	1.6	6012928
238	616	4	1.9	\N	1.3	7328768
114	469	5	0	\N	2.0	5361664
254	840	4	1.5	Enter lead few human century big indeed. Tax design become draw hit.	1.0	4562944
75	94	4	1.1	\N	1.0	7119872
90	91	6	0	\N	1.2	1608704
247	198	6	0	Audience who stuff last entire born executive save.	0.8	6461440
86	529	4	0.6	Training meeting throughout phone.	1.2	1296384
198	843	8	0	Various manager go factor.	1.9	4659200
20	342	7	0	Anyone Democrat another argue teach result. Personal east store fine recent movie rather federal.	1.4	5088256
27	733	4	2.1	Guy give student guess.	1.5	5269504
166	319	3	0	Good list throw box fast TV key.	1.4	5196800
288	813	9	0	Bad continue language level smile common. Story teacher weight agent there risk.	1.4	1088512
112	369	9	0	Window outside record look dinner east begin.	0.6	1811456
61	737	4	2.8	\N	1.6	6937600
205	283	1	0	\N	0.5	6920192
26	305	10	0	Class suffer training trial hospital well.	1.6	8214528
29	811	8	0	\N	0.5	4165632
115	113	4	2.8	\N	1.8	4638720
177	232	4	1.4	\N	1.7	558080
138	255	4	0.0	\N	1.3	5776384
277	611	10	0	Wide individual last could garden billion.	1.1	5971968
247	205	4	0.6	\N	1.4	3990528
254	827	4	2.1	By relate decision smile large. Congress join pattern.	0.5	3031040
75	97	6	0	Business rise around expert bank product anyone young. Oil player seem source economic buy everything.	1.8	2871296
30	671	4	2.2	\N	0.8	7136256
126	7	3	0	\N	1.3	3972096
140	377	4	2.0	Make network television color analysis should. South degree room may occur.	0.7	3848192
110	1	4	1.8	\N	1.3	1525760
299	392	1	0	\N	1.6	5747712
52	333	4	1.9	\N	1.1	7560192
98	714	8	0	Air probably stage say.	0.9	2629632
264	147	10	0	\N	1.7	8185856
5	640	5	0	Choice address dinner morning reveal course.	1.9	2180096
297	715	4	2.9	Describe true main movement.	0.9	4818944
258	321	10	0	Possible maintain part memory.	1.6	2663424
114	463	4	2.3	\N	1.5	6820864
184	859	4	1.0	Music eye lose suffer.	1.7	3190784
284	625	4	0.9	Hour unit couple suddenly reduce before.	1.9	244736
207	417	8	0	\N	1.4	568320
46	597	5	0	We enter appear.	0.7	2755584
253	809	8	0	\N	1.5	5751808
270	144	4	1.1	Deal bed say never.	1.7	3861504
67	178	8	0	Cost doctor arm trouble.	0.7	8260608
280	731	3	0	\N	1.5	1712128
237	30	4	1.8	\N	1.6	2635776
165	300	3	0	\N	1.6	1783808
272	765	4	1.7	Hard letter join school political production. Fact rule determine matter huge mission activity.	0.6	6250496
201	845	4	2.9	Week best site institution war.	1.4	4451328
66	434	4	1.8	\N	0.9	5933056
310	566	4	1.0	His final look argue.	1.0	330752
261	419	4	2.1	\N	1.8	4968448
88	448	1	0	\N	1.8	4507648
296	436	10	0	\N	1.0	5515264
173	260	7	0	Former peace short its.	1.0	4873216
218	762	1	0	\N	0.7	2656256
63	50	8	0	\N	0.7	4667392
92	726	5	0	\N	1.4	4502528
90	97	4	1.1	Development product friend market however specific out. Age wrong college close.	1.0	6500352
211	830	10	0	Lead their end tough trial.	1.6	3942400
73	421	4	1.4	Never crime information worker education responsibility apply.	0.9	4468736
170	370	4	0.5	\N	1.1	223232
77	393	8	0	Former training little.	1.9	3076096
189	619	3	0	Floor design Mrs bag my step wait.	1.7	3993600
92	710	8	0	\N	0.9	3066880
288	832	3	0	\N	1.7	4182016
59	684	1	0	Sound benefit such at magazine he.	0.8	5383168
164	513	3	0	Position generation laugh itself. Let case can vote southern road.	1.1	2195456
248	663	3	0	Image apply away hear morning together.	1.6	7504896
252	268	8	0	\N	2.0	2726912
180	533	4	2.3	\N	1.9	3326976
14	482	4	1.9	Open sea eat admit deep institution sea soon.	1.3	1696768
275	221	4	1.1	\N	1.2	3708928
68	641	5	0	Protect order main hear would past card.	0.7	1422336
91	671	3	0	\N	1.4	6465536
205	298	4	2.4	Society into know newspaper happen.	2.0	6035456
5	638	3	0	List control alone fill.	0.7	6556672
96	673	4	2.8	\N	1.7	854016
149	415	1	0	From set person family marriage.	1.9	5556224
74	468	1	0	\N	0.8	5017600
214	215	4	1.6	\N	1.6	652288
166	325	4	1.4	Responsibility yard left other cover behavior approach state. Join can management hand.	0.7	1996800
197	862	4	1.2	\N	1.4	1817600
271	190	10	0	\N	1.2	4526080
79	854	4	1.9	\N	1.5	2590720
80	260	6	0	Agree consumer believe important assume. Church way beautiful receive kitchen really way.	1.6	2351104
197	878	4	2.3	Red power ability activity may. Check almost design report.	0.6	4060160
8	207	4	1.0	\N	1.1	4499456
305	688	4	2.9	Attention outside agency agency life course.	1.3	857088
161	793	4	0.5	West outside various thank.	1.4	7545856
220	40	4	0.2	\N	1.7	6163456
139	546	7	0	Environment discover good start during Republican car local. Consider amount hour play.	1.0	1381376
92	730	7	0	Hospital and professional.	1.6	861184
280	715	4	1.3	Bring family figure plant partner ok.	1.7	4483072
71	42	4	2.8	\N	0.8	3974144
164	504	4	1.6	Fire argue sign. Attention tend about listen level.	1.0	7256064
230	662	7	0	Modern piece close body however.	0.9	4751360
310	569	4	2.6	Factor try responsibility majority difference identify.	0.7	401408
5	630	1	0	Camera early painting deep him any phone. Seem often individual none travel thousand their.	1.6	7556096
186	783	4	1.3	\N	1.5	6336512
6	705	4	1.3	\N	1.5	3456000
7	385	1	0	That speak answer lot well arm today.	1.6	7703552
63	45	4	2.0	Set want imagine. Success citizen fly price positive rule great.	1.4	1523712
211	823	6	0	Child others gas human middle sure. Health radio study improve arm total unit hundred.	1.4	3940352
157	213	4	1.2	\N	1.0	3803136
202	444	4	0.5	\N	0.6	5143552
23	238	7	0	\N	0.9	2328576
98	728	4	1.0	Radio defense economic method meet.	1.4	1282048
261	416	8	0	About city all newspaper eight bank feel.	0.6	5623808
241	38	4	2.2	\N	1.8	3807232
286	184	4	0.0	Modern recently ask to.	1.6	7455744
142	546	7	0	\N	0.6	1238016
304	545	4	1.5	\N	0.8	7542784
217	265	1	0	Culture rather hope.	2.0	4316160
240	75	4	2.8	Spring would language leg crime wide.	1.9	8275968
190	370	9	0	Amount about expect.	0.7	1363968
12	218	3	0	\N	1.1	2609152
203	791	4	1.7	Loss boy season go less score.	1.5	4972544
277	616	10	0	\N	1.0	1234944
195	406	1	0	Pm whose ball always this gas administration food.	0.6	224256
274	76	4	1.5	Fact husband card effort mean less. Anything even must use article none really.	1.0	5081088
298	715	4	2.9	History night peace north what act cost.	1.2	5199872
7	366	10	0	\N	1.3	5966848
3	108	4	2.5	\N	1.3	7569408
253	806	4	0.7	\N	0.8	5369856
12	229	4	2.0	\N	1.6	5452800
297	719	4	2.6	\N	1.8	3308544
217	271	4	1.3	\N	1.6	1470464
243	439	4	0.8	\N	1.3	2522112
175	516	7	0	\N	2.0	7757824
90	94	4	1.1	Probably have picture personal authority.	1.6	432128
121	718	10	0	\N	0.8	6511616
133	768	5	0	Assume though improve evening light ability western environment. Successful system house each never.	1.2	6948864
48	344	10	0	\N	0.7	2856960
47	381	7	0	Particularly show candidate exactly discussion low nearly.	1.5	4372480
283	28	4	1.5	\N	0.8	1202176
226	669	4	2.6	\N	1.6	7459840
22	224	7	0	\N	1.5	1308672
184	880	8	0	I between sound look door responsibility.	0.8	378880
140	372	4	2.0	Easy citizen almost human really.	0.6	3234816
101	740	4	2.8	Agreement traditional hard friend.	1.8	6412288
282	420	4	1.9	At degree phone improve style.	1.2	7658496
98	712	5	0	\N	1.7	7977984
258	317	4	0.3	Energy building position reduce need.	1.0	5335040
226	668	4	2.8	\N	1.2	6295552
237	24	4	1.2	Three method be fish now democratic piece letter. Vote card describe scene.	0.7	1793024
168	327	4	2.0	\N	1.6	6086656
60	342	1	0	\N	1.5	7015424
160	187	4	1.9	\N	1.7	187392
301	347	4	0.4	Goal measure simple study.	0.9	6130688
45	11	4	1.7	\N	1.3	7164928
113	504	1	0	Institution treatment usually by.	1.2	4592640
80	263	4	1.9	\N	1.3	3006464
217	279	9	0	\N	1.9	3168256
233	112	6	0	\N	1.6	3540992
134	147	5	0	\N	0.6	3789824
257	291	4	1.4	\N	1.5	166912
55	854	7	0	\N	1.9	3894272
108	737	7	0	Reality throughout agreement entire painting arrive scientist training.	1.9	3850240
253	807	4	1.7	Size room back make agent parent. If name event everything somebody phone it organization.	1.5	2718720
253	797	4	2.2	\N	0.6	3627008
244	759	4	0.6	Direction thus interesting pick evidence order pretty.	1.8	7192576
213	557	9	0	\N	1.5	7680000
160	186	3	0	Attorney work threat we.	0.9	3030016
195	421	4	1.4	\N	1.5	2859008
142	548	4	1.9	\N	0.8	6645760
269	439	4	1.7	Region question hospital as east month exactly dog.	1.8	4922368
289	69	4	1.5	Ask future seven.	1.9	480256
75	107	1	0	\N	2.0	6099968
302	540	4	1.8	\N	1.7	4674560
88	450	3	0	Top society perform against.	1.0	3581952
144	102	4	0.5	Administration manager billion turn than whether back. Event color hair close education and claim.	1.2	3433472
114	464	10	0	Send seek performance and.	1.7	7487488
189	620	7	0	Able professor red away ask many defense. Parent someone appear mission resource media.	2.0	2285568
208	547	3	0	\N	1.2	194560
44	73	1	0	\N	1.2	8100864
297	729	4	0.3	Power surface agreement learn edge.	0.7	8089600
305	707	9	0	\N	1.7	7115776
189	616	4	2.0	Energy budget foot car.	1.5	7928832
192	737	4	2.8	\N	0.6	6073344
233	92	4	1.2	\N	1.3	3755008
239	243	3	0	None traditional white especially stop cause. Lose week total exist young score.	1.5	2393088
129	570	3	0	Myself southern job.	1.0	6454272
196	298	4	2.4	\N	0.8	7910400
246	477	5	0	\N	1.6	4705280
197	855	5	0	\N	1.1	6802432
198	842	5	0	Effort speak certainly understand detail town.	1.8	7034880
211	831	4	1.6	\N	0.9	8225792
153	86	1	0	\N	1.1	4067328
9	25	4	2.2	Strong growth game on last resource.	1.0	7883776
173	259	4	1.0	\N	1.3	3118080
141	358	6	0	Movie let change career great.	0.8	3245056
32	599	4	1.3	\N	1.5	7746560
226	664	4	1.0	Address well language.	1.0	3015680
162	833	1	0	Buy upon meeting for. Front forget hard and.	1.9	4390912
144	109	4	2.5	\N	0.6	2067456
171	854	4	1.9	Within evidence blood board long third professional suddenly.	1.1	3546112
28	304	4	2.0	\N	1.5	5240832
92	720	5	0	Loss require evening sport.	0.8	5257216
51	201	4	1.0	Heavy wear environment hospital west investment. Provide live place drop gas community book.	0.5	5850112
228	700	3	0	Full bar surface action their country.	1.7	6392832
243	435	4	2.9	\N	1.2	7524352
26	331	4	2.0	\N	2.0	5823488
121	729	3	0	Effect candidate theory summer appear item.	0.8	7136256
32	607	4	2.0	\N	0.6	5562368
278	695	4	2.8	Some pay author person born subject.	1.1	4676608
153	80	3	0	Your boy heavy.	0.9	3363840
180	542	4	2.5	Focus her service medical.	0.7	5619712
14	488	4	1.8	They movement up senior entire something too.	0.7	4225024
244	765	1	0	Between effort government south over peace investment. Population agree throughout little bring one four.	0.8	2178048
37	429	4	2.1	Hand really research order.	0.7	4511744
50	235	8	0	\N	1.9	8153088
287	147	3	0	\N	1.0	4880384
9	20	9	0	\N	1.1	363520
29	810	10	0	\N	1.8	5064704
273	494	8	0	Use nor someone herself subject.	2.0	7327744
145	358	4	2.2	Wife morning industry.	1.9	2951168
34	787	4	2.9	Receive model production development themselves.	0.8	485376
51	202	1	0	\N	0.8	5933056
172	852	4	2.0	Behavior describe pattern Mrs. Also look dark sea.	1.2	1165312
112	367	4	2.4	Idea environment memory.	1.9	1081344
89	606	9	0	Lead fear break behavior million after student.	0.9	3548160
76	341	4	1.0	\N	1.5	2313216
276	837	1	0	\N	1.9	2470912
91	670	4	2.9	Effort professor not guy standard only need town.	1.1	6973440
168	304	4	1.5	\N	1.6	3053568
102	795	1	0	Left team sound spring.	1.2	5075968
11	219	5	0	Spend south along over itself. Practice listen election would tree.	0.8	3793920
224	50	10	0	\N	1.1	5996544
24	802	4	2.3	\N	1.6	6008832
128	132	4	1.7	\N	1.7	3488768
67	157	7	0	Health organization magazine base own no out protect.	0.5	8133632
28	328	6	0	Character cost benefit. Person face security play her yes.	1.4	5599232
39	207	5	0	Hit produce green feel.	1.3	4400128
164	526	4	2.3	Account above country until.	1.9	5781504
230	657	3	0	Same soon fine each.	1.2	2098176
306	543	4	1.3	Foot send hair.	1.6	625664
135	275	4	1.0	\N	0.6	1747968
187	214	4	2.3	\N	1.1	6529024
130	6	4	2.0	Pretty eye whatever in. Me night million left tonight.	0.8	406528
284	629	8	0	\N	1.5	6897664
242	300	4	1.5	\N	1.3	7760896
306	533	4	2.3	Series lose now big direction second.	1.9	2323456
68	637	4	2.9	\N	1.1	8104960
188	429	10	0	Job tax it news charge.	2.0	6207488
53	753	4	2.2	\N	0.8	7431168
281	437	4	1.6	Sister truth director good purpose year.	0.9	4313088
133	785	4	1.0	\N	0.9	6471680
288	826	5	0	Why now hand.	0.7	8233984
305	691	8	0	Current issue seven almost official.	0.7	5900288
23	241	1	0	Prepare treatment available whether. Authority raise accept central level hotel follow.	1.9	7663616
279	423	1	0	\N	1.1	2941952
148	427	8	0	Response up early describe investment. You vote forget stage fall.	1.1	1649664
193	516	9	0	Whom agency information environment practice including court.	1.8	3079168
114	478	4	1.6	Shoulder approach resource mention until world establish.	1.3	7693312
131	854	3	0	\N	0.8	3571712
226	671	4	2.2	\N	0.6	3507200
213	554	4	2.8	\N	1.0	3072000
197	857	9	0	Health himself window sure.	1.0	614400
75	99	4	1.1	\N	2.0	6729728
190	375	8	0	Provide expert me or that.	1.7	3284992
95	361	4	2.0	Well interview official market out health admit.	1.3	6947840
70	215	1	0	\N	1.5	2539520
23	243	4	1.0	Lead various citizen.	1.9	3173376
28	315	9	0	Real community until democratic fish well information area.	0.7	7098368
7	378	3	0	\N	0.5	3353600
216	653	4	2.2	Total cell raise.	1.1	5193728
6	697	4	1.3	\N	0.5	5108736
306	534	4	2.6	\N	1.3	1745920
140	367	3	0	\N	0.7	3150848
153	81	4	2.9	\N	0.7	2348032
185	787	1	0	\N	1.7	979968
263	443	8	0	\N	0.8	282624
202	455	7	0	\N	1.6	6298624
98	708	4	2.4	Him entire name material voice property. Budget election instead deal.	0.5	4420608
288	825	4	1.9	\N	1.7	192512
78	281	4	1.5	Animal finally do avoid growth family. Though probably several guy name ever individual.	1.5	302080
205	284	1	0	\N	0.6	7842816
170	383	3	0	\N	2.0	4574208
237	28	1	0	\N	1.1	4970496
194	554	4	2.8	Statement decade include later.	1.8	773120
173	263	7	0	Wish product open training happen decade receive year.	1.9	7143424
45	6	4	2.0	\N	0.6	5832704
281	438	4	1.9	Ago weight threat mission and.	1.0	5650432
80	276	4	1.7	\N	0.8	7535616
251	140	4	0.1	\N	1.8	581632
245	375	4	2.7	Week tend kitchen room work security. Police vote husband modern possible.	1.7	4568064
148	410	4	1.4	\N	1.9	729088
276	831	8	0	Floor fall quite.	1.0	1139712
114	467	5	0	Style someone truth physical one let if. Themselves behind require rather visit control.	1.4	2029568
118	454	4	0.1	\N	1.7	4605952
88	453	4	1.7	On line somebody. Community born why.	1.5	1128448
120	602	1	0	Campaign big five field tell buy information. Ever offer since organization.	1.0	1439744
109	688	4	1.4	\N	1.6	6968320
75	96	9	0	Animal region there Congress probably. Help tax wide hard also.	1.6	1608704
25	496	4	2.5	\N	1.8	667648
293	338	5	0	Door television traditional if amount.	1.9	6755328
266	785	4	0.1	\N	1.2	3121152
255	88	7	0	Central anyone girl art picture suffer any.	0.7	2375680
115	101	4	2.6	\N	1.8	3464192
302	536	4	0.4	Two hotel just claim instead budget population.	1.2	1790976
54	422	1	0	\N	1.0	3117056
219	78	6	0	Population money address create environment story.	1.6	5637120
236	302	7	0	\N	0.8	1036288
177	217	4	1.0	Imagine involve one fear it base group series.	1.4	4008960
14	472	4	0.4	Manager wrong direction thing fact question level.	1.4	7768064
149	406	8	0	Their whole husband actually knowledge phone house.	1.4	1898496
150	415	6	0	Impact much man style mean glass. Husband fire degree allow military central.	1.5	6498304
108	735	4	1.9	\N	1.2	2126848
199	568	8	0	\N	1.3	588800
190	374	3	0	Student attorney world parent. Another give improve ever almost middle his parent.	1.4	1043456
115	111	4	2.2	\N	0.9	1282048
241	54	4	2.7	Him executive other computer nothing situation because.	1.4	6577152
156	56	6	0	\N	0.8	781312
23	239	4	2.2	\N	1.9	6335488
49	790	4	1.2	Power himself environmental plan vote why.	1.7	3886080
109	687	4	1.7	Machine attention performance find.	1.7	1326080
72	676	10	0	Will lose religious trouble give from century south.	1.6	7586816
265	399	4	1.5	Office whether today moment democratic change.	1.0	7337984
137	471	5	0	Sense positive feeling four course imagine.	1.5	6212608
143	92	4	1.3	\N	1.9	5958656
295	602	4	1.7	\N	0.6	7614464
54	425	4	0.5	Buy relate program list. Civil his easy reason take money kid.	1.0	4380672
281	431	4	1.0	\N	1.7	7069696
168	323	10	0	\N	1.5	1008640
153	83	4	2.6	\N	1.9	3844096
84	583	4	2.7	\N	0.6	1754112
273	497	8	0	Service degree mother yeah use run.	1.0	2226176
29	805	10	0	Meeting ok population computer. Money business this full property tonight letter.	0.6	1812480
62	710	3	0	Sea response mission son. Some market hear degree arrive be oil.	0.9	6559744
90	100	4	2.7	\N	0.7	5086208
127	70	1	0	\N	1.5	6313984
151	120	4	1.2	\N	0.6	3677184
274	86	7	0	\N	1.8	982016
133	770	4	2.2	Whom when system development. Big skin sound number black.	0.5	7596032
210	458	4	1.2	Accept something Mr.	1.1	1912832
254	838	4	0.0	Low need significant thousand raise say campaign stand.	1.4	4877312
282	427	6	0	Trade woman same guy nation include. Field attention account help remember base eight.	1.1	7287808
282	428	4	2.0	\N	1.8	7240704
245	382	3	0	\N	0.6	2295808
155	452	7	0	Like bank cut create stuff evidence. Hear treat claim foreign fight.	1.8	1016832
66	432	4	1.2	Prevent third deal method law whose market.	1.3	5832704
131	843	4	1.3	Control friend response dream pressure least product election.	1.0	1102848
238	628	4	1.2	\N	2.0	7467008
84	581	5	0	The citizen should.	2.0	2835456
233	109	6	0	\N	1.6	3277824
137	473	10	0	Picture idea than wish step kind.	0.5	4749312
54	406	10	0	\N	1.6	962560
92	731	4	1.8	\N	2.0	1226752
258	309	6	0	\N	0.9	7034880
175	506	1	0	\N	1.7	5896192
230	665	4	1.3	\N	1.5	7857152
264	152	4	1.6	Law every person leader history.	1.1	3226624
149	419	4	2.1	Marriage family usually allow else subject.	1.2	6780928
84	584	4	0.6	\N	0.8	226304
272	747	8	0	We provide meeting during.	1.3	926720
297	714	4	0.5	\N	1.8	1344512
230	679	5	0	\N	1.4	2804736
112	377	4	2.0	\N	1.0	2975744
238	621	10	0	\N	1.2	284672
97	809	4	2.3	Last before oil.	1.3	4011008
184	863	5	0	\N	1.6	3234816
174	346	1	0	Hotel various wall country new. Politics several through peace ahead.	1.0	4672512
197	869	4	2.2	\N	1.9	4511744
184	858	6	0	\N	1.9	6325248
90	104	4	2.6	Culture third many public sport notice other.	0.8	8192000
226	672	4	1.8	Citizen police visit somebody expect.	0.9	5466112
307	399	4	2.2	Those specific theory.	0.5	574464
227	662	8	0	Black not claim voice her opportunity issue.	1.0	2252800
22	223	5	0	\N	1.9	1141760
311	346	4	1.3	\N	0.7	4979712
65	212	4	1.2	\N	0.8	5791744
202	454	5	0	\N	1.6	3360768
298	717	4	1.1	\N	1.4	6894592
67	165	4	1.0	\N	1.8	2684928
230	660	4	2.7	\N	1.5	4686848
30	672	4	1.8	Democratic first far of room field current. Light quality common remain floor fly task Democrat.	1.0	3698688
195	417	4	2.4	\N	1.7	6185984
98	711	10	0	Blue gun produce coach. Someone management guy itself throw model.	1.8	2767872
204	609	4	2.1	Camera hospital impact audience commercial similar.	1.6	2701312
32	605	5	0	\N	1.5	5384192
169	352	4	1.6	\N	1.2	4827136
110	4	4	1.9	\N	0.8	5245952
61	733	3	0	\N	1.2	1929216
225	726	4	2.1	\N	1.5	4228096
29	807	7	0	Imagine write direction party term.	1.5	3909632
95	360	3	0	\N	1.1	4567040
268	756	4	0.5	Rate lot task theory thought.	1.7	1761280
43	528	4	0.6	\N	1.8	4354048
217	269	10	0	Feeling system development do story all away race.	1.5	601088
166	305	4	0.7	\N	2.0	5304320
253	801	8	0	Claim look along door.	0.7	152576
40	102	4	1.1	\N	1.9	8256512
142	551	4	1.8	Read home need student nice.	1.0	2434048
98	715	1	0	\N	1.3	4708352
131	852	4	2.2	\N	1.2	615424
241	49	4	1.4	\N	0.8	2502656
284	621	4	2.4	Air teacher marriage wall group arrive.	1.4	278528
46	598	4	1.5	Heart we either run pick body.	1.2	2285568
266	769	4	1.0	Free own wide recognize support own may.	1.8	2451456
15	620	4	2.8	Hundred apply wife between. Democrat enough me quality new exactly audience.	0.6	7285760
109	705	9	0	\N	1.4	579584
73	404	7	0	\N	1.3	6591488
138	260	5	0	\N	0.5	5072896
133	783	1	0	\N	1.1	5581824
142	553	5	0	\N	1.9	5899264
172	854	4	1.9	Away red itself without late we. Camera white machine cold affect rest behind stop.	1.5	2677760
105	93	4	1.8	Must however perform economic see top would someone.	1.1	2857984
192	734	7	0	He travel fast attorney mother lay attorney.	1.9	2162688
77	399	9	0	Father thousand prove skin can population within.	1.9	6605824
299	398	10	0	\N	0.8	4237312
262	656	4	2.6	\N	0.8	5576704
88	456	5	0	Cultural writer report affect moment.	1.3	3252224
275	217	4	0.9	Sign few couple apply class black this few.	1.6	3164160
244	756	3	0	\N	0.6	8085504
216	649	4	0.1	\N	1.1	1072128
275	224	10	0	Language southern forward realize. And future improve none stay.	1.5	1434624
28	316	3	0	Data food staff.	0.8	3183616
191	748	4	1.0	Congress summer discover class force benefit we.	1.2	5713920
169	365	8	0	\N	0.9	7404544
209	403	4	2.5	\N	1.8	2564096
221	487	4	1.5	\N	1.9	2805760
291	288	10	0	\N	0.7	6645760
261	417	4	0.4	Anyone yard amount woman.	0.7	2151424
1	91	1	0	Well political stand low responsibility west.	0.6	6078464
1	90	4	1.8	\N	1.8	1331200
144	90	4	1.8	\N	1.1	3250176
169	358	7	0	Same teach husband.	1.8	841728
73	411	10	0	Alone whose offer job.	1.0	4709376
280	727	1	0	\N	0.5	1872896
177	228	7	0	\N	0.8	3746816
5	648	9	0	Five spring affect picture visit.	0.6	3663872
112	370	4	1.2	Cut out trip factor tough maybe state. Foot technology reality lay blood amount thought.	0.9	1644544
230	671	5	0	\N	1.1	8175616
204	617	10	0	Likely executive suggest report fear trip actually.	1.1	4508672
239	244	4	1.5	\N	1.5	165888
221	489	4	2.8	Win consider full beautiful. For nothing analysis kind develop it.	1.5	7302144
30	679	8	0	\N	1.8	6007808
310	560	4	1.1	Common position or community national.	0.9	131072
197	861	6	0	South everybody between young standard television. For forward toward treat.	1.8	3408896
137	481	10	0	\N	1.5	5730304
141	360	10	0	Best short since good of particular.	0.9	2365440
27	736	4	2.2	\N	0.7	7296000
216	632	5	0	Wide deep somebody war deal bar.	1.2	3927040
40	103	8	0	\N	1.8	4262912
17	209	4	0.9	Today subject discuss cultural. Wrong together size play five.	0.9	2263040
122	450	4	2.3	Write former environment blue lot economy. View author cultural bar pick.	0.7	821248
294	457	10	0	Name growth perform Democrat nearly.	0.9	1497088
216	645	8	0	\N	1.2	1139712
233	111	3	0	\N	1.9	7053312
185	786	7	0	Tough discussion carry successful with.	1.1	154624
307	396	4	1.6	Hear along stock history learn.	1.0	2104320
135	270	4	2.2	\N	1.0	2096128
143	102	4	2.6	\N	1.4	396288
269	433	9	0	\N	1.7	2193408
146	567	4	1.4	\N	0.7	202752
53	756	4	2.8	\N	0.7	347136
74	473	8	0	Across hotel region very again idea.	1.9	1349632
169	351	1	0	\N	1.1	7599104
98	724	8	0	\N	0.8	8026112
47	382	4	1.1	\N	0.8	7647232
68	653	4	2.2	Others smile effect south best week. Any letter education what view try character.	1.8	1469440
93	727	4	0.5	\N	1.4	2373632
245	370	4	1.2	\N	1.3	7553024
110	6	9	0	\N	0.7	7149568
213	559	4	2.3	View win former somebody account yet girl put.	0.6	2328576
194	568	4	1.4	Break break vote into speak safe table interesting.	0.5	8233984
78	274	3	0	Far offer carry model plan usually. Blood top discuss hope education dinner may.	1.7	7595008
221	478	10	0	\N	1.1	8131584
72	678	4	1.7	\N	1.7	4934656
101	743	4	2.1	\N	1.1	3224576
144	108	4	1.0	Deep exactly concern. Budget particularly finally someone.	1.1	2810880
252	269	1	0	\N	0.7	7945216
175	508	4	0.1	System event continue thus go speech technology.	0.7	202752
88	462	5	0	\N	2.0	2914304
229	55	6	0	\N	1.2	7873536
28	310	9	0	Alone same same foot. Book within edge rather success.	0.5	107520
9	29	4	0.8	Live investment share station.	1.0	4427776
23	237	6	0	\N	2.0	8038400
116	85	4	1.5	\N	1.1	5699584
79	843	5	0	Economy open represent think bring under quite wind.	1.0	3537920
207	411	4	2.2	Late sit two until writer with evidence police.	1.2	632832
75	93	4	1.8	\N	0.7	5582848
46	596	4	1.4	Manager should key give your.	0.9	1130496
217	251	10	0	Else key call available begin. Perform including dog trial carry sport.	1.4	6315008
238	625	1	0	None me million population act per.	1.5	8195072
135	253	7	0	\N	1.2	5794816
9	32	4	2.1	\N	1.0	2987008
140	388	4	1.2	\N	1.4	5553152
228	691	8	0	Consider impact once value foreign development. Success serve debate plant investment site.	0.6	1095680
302	532	4	2.3	Member building open for out.	1.5	441344
24	811	8	0	\N	1.8	561152
78	254	6	0	\N	1.8	7553024
213	558	4	1.1	Reveal expert radio expert here last. Field police long as us table.	1.4	5086208
239	238	4	2.5	Blood result pattern measure determine player.	1.2	4666368
2	345	8	0	\N	0.8	6385664
11	223	4	0.9	\N	1.2	7243776
101	742	6	0	\N	1.6	1111040
59	704	4	1.8	Become buy family protect billion. Rock behavior future away.	1.6	6477824
92	712	4	1.2	\N	1.1	1171456
241	46	9	0	\N	1.4	2114560
216	644	10	0	\N	1.3	2787328
243	442	10	0	Financial wife line new speech nation debate.	1.5	5833728
152	813	6	0	Find wrong nor power member nice.	0.8	3862528
184	876	6	0	Center hotel traditional just.	1.2	3898368
138	250	4	1.7	\N	1.2	5300224
59	693	1	0	Public carry drive indicate gun right.	0.6	8280064
53	750	9	0	\N	1.2	4098048
47	383	1	0	We environment tough authority however.	1.4	4302848
51	208	4	1.3	Walk smile firm.	1.1	6918144
11	229	1	0	Usually important garden apply. Meeting dark energy speech.	1.1	1885184
261	409	4	1.0	\N	0.6	936960
175	500	4	2.3	Career age statement trouble student red.	1.6	4876288
59	691	8	0	West hour evening keep.	1.4	215040
251	143	4	1.0	\N	1.7	3247104
211	813	7	0	So concern over draw song lead.	0.8	3378176
160	169	4	1.4	\N	0.9	5692416
310	568	8	0	Such international account son world wide subject. Inside information than road.	0.6	3697664
12	215	6	0	Either establish individual full.	0.6	7396352
53	749	9	0	Head late worry early likely.	1.1	8248320
28	314	6	0	Specific movie small out save vote friend.	2.0	5838848
100	726	8	0	North be thought particular candidate certain bill.	1.4	4977664
206	401	4	1.5	\N	1.9	3913728
288	836	4	2.1	Girl become because determine stop.	1.5	3314688
48	346	4	1.3	\N	0.7	3630080
215	509	4	1.8	\N	0.5	5806080
185	790	4	1.2	Read us senior argue.	0.5	1213440
95	352	4	2.3	\N	1.8	6282240
114	470	7	0	Resource claim firm either.	0.8	8272896
284	627	4	1.0	\N	1.3	5610496
196	295	4	1.0	\N	1.7	2222080
213	565	7	0	\N	1.9	6503424
276	839	4	1.9	Discover station environmental son air. Interest suddenly policy live ball.	0.8	2222080
186	774	9	0	Three sure fast table interesting.	1.2	6906880
120	596	8	0	Account rich citizen.	1.6	288768
57	496	5	0	Market six let memory my join red role.	0.7	5515264
197	868	4	2.9	Chair generation it common official. Expect idea hard.	1.3	1084416
135	255	8	0	Season sure few moment force rich.	0.7	6329344
51	205	10	0	\N	1.5	6766592
277	615	10	0	\N	1.7	4213760
32	602	4	1.7	Either red yet.	1.8	806912
74	464	5	0	Put player sure whose save music how coach. And together eat agent strategy your.	0.9	2751488
155	446	1	0	Hundred others effect receive seek new religious.	1.3	4941824
98	729	1	0	\N	1.4	3948544
74	466	3	0	\N	1.5	3166208
191	757	4	2.3	\N	1.8	6752256
185	795	4	1.4	On four class yard. Long billion them common care.	1.2	7538688
205	291	3	0	\N	0.6	6966272
186	773	8	0	\N	0.9	5846016
74	489	4	2.8	Nearly wide true let relate. Others become specific region leader cost raise.	1.1	5456896
55	851	4	1.7	\N	1.1	7672832
221	482	4	1.9	\N	0.7	6240256
68	631	4	1.9	\N	1.0	521216
290	395	5	0	\N	1.7	3908608
228	699	4	2.0	Skin health reflect seven sister step front. Food buy data summer wall entire.	1.7	8194048
207	413	7	0	Fear a important common billion free treatment. Evidence example smile simple.	1.9	1812480
126	4	4	0.0	Full move Democrat detail front reduce. Spend morning join police whole seek a.	1.0	6473728
26	303	4	1.2	Feel front learn it dark.	1.0	4680704
276	829	4	1.7	Wear before rest reality. Individual bad hot despite.	0.6	582656
78	275	4	1.0	Seat have other project situation.	0.9	3675136
197	860	4	1.3	Occur try account support bed.	1.8	110592
280	723	4	0.7	\N	1.3	531456
213	560	4	0.4	\N	0.6	3375104
166	331	4	1.0	Moment prevent including agreement position.	0.8	1818624
115	105	4	1.7	Travel nothing song professor present member.	1.0	2549760
247	201	4	1.0	\N	1.0	5005312
264	148	4	1.8	\N	1.6	2546688
99	11	3	0	\N	1.7	4421632
225	718	4	2.0	\N	1.4	2679808
137	472	10	0	\N	0.7	3191808
289	67	7	0	\N	0.8	6714368
123	779	4	2.7	\N	1.7	2582528
224	39	1	0	\N	1.6	803840
180	536	9	0	Record avoid fine social likely quite purpose place.	1.5	4074496
198	847	4	1.3	\N	0.6	5695488
24	810	6	0	Green report computer involve southern production huge. Station as outside.	1.2	7380992
44	61	4	2.3	\N	0.8	4140032
137	482	9	0	\N	2.0	2495488
1	105	4	1.7	\N	0.8	8269824
303	343	4	2.0	\N	1.7	7503872
276	840	3	0	Region sea might behavior administration cultural son sea. Face simple from though brother art.	1.3	7522304
68	645	8	0	Near wall at machine small usually.	0.5	1560576
285	496	4	0.4	Hospital number by article manager mother wide.	2.0	1311744
59	687	10	0	Environment leg third create PM decision second.	1.0	7398400
95	359	4	2.0	Indicate service a office paper land play. Message majority him director energy require.	1.5	2021376
123	777	5	0	Herself goal beyond together itself.	1.0	2838528
279	406	4	1.9	\N	0.6	2863104
247	200	4	1.0	Model before situation accept. Likely knowledge hotel important.	1.0	3561472
180	532	7	0	\N	0.7	8042496
9	24	4	1.2	\N	1.3	6976512
28	318	7	0	Bit shoulder effort society green.	0.8	3520512
98	725	7	0	\N	1.4	1120256
97	812	3	0	Task eight to world scientist claim.	1.7	1870848
104	541	4	2.0	Reduce nothing culture sign month ball.	1.2	6923264
36	192	4	1.6	Fish respond cup near.	1.0	3763200
22	222	10	0	Trip believe ever benefit color either energy.	0.6	5761024
74	471	4	1.2	Face treatment east movie piece big value. Cell pay agent property.	0.7	5643264
207	425	1	0	\N	1.6	4193280
215	526	7	0	\N	1.0	6054912
272	753	4	2.2	Training mean structure guess and. Seven pattern or there.	1.4	6471680
46	595	6	0	\N	1.8	1146880
138	282	1	0	\N	1.3	5557248
217	258	4	1.9	\N	1.6	4761600
121	726	4	2.1	\N	1.8	5340160
309	378	4	1.3	However physical whatever whether.	1.6	1099776
138	252	4	2.4	Government crime mean fast.	0.7	7015424
137	492	4	2.0	\N	0.8	5606400
273	496	4	2.5	\N	0.6	2902016
177	222	4	1.8	\N	1.8	1085440
200	283	4	2.3	\N	0.6	3120128
305	685	7	0	\N	0.7	8006656
170	382	4	1.1	\N	1.0	833536
233	94	5	0	\N	1.9	4836352
44	66	4	2.0	Article relate deep husband listen while yard.	0.8	7841792
99	5	4	0.2	Notice mouth why drive campaign tough just.	1.7	7806976
210	451	9	0	Development send yet his mind goal hope.	0.6	1059840
248	667	4	1.5	Wife site stand source discuss.	1.7	2830336
238	619	5	0	Live strong final right education medical.	1.1	2719744
242	299	4	2.9	\N	1.4	6172672
293	334	4	1.6	\N	1.0	502784
41	194	4	2.9	National tend market song follow.	1.5	8073216
9	21	10	0	\N	1.9	1388544
159	414	4	0.2	Fear three behind fly.	1.3	5718016
282	409	10	0	\N	0.7	6701056
146	562	10	0	Former music husband start stage hot life. Leg experience with stand either let research.	0.5	4629504
1	108	4	2.5	\N	1.1	3091456
270	136	4	1.5	\N	1.0	6018048
128	129	4	2.4	Inside table whole identify talk check year.	1.7	4363264
171	843	4	1.0	\N	0.8	3645440
74	492	8	0	Drug wall sound officer much either.	1.3	7784448
190	385	4	2.7	\N	1.9	8249344
127	57	4	1.8	\N	0.9	4922368
162	832	5	0	\N	2.0	420864
122	445	4	2.5	Late recently central sport should attack quite yet.	1.4	5345280
129	560	4	1.1	Now rise data interesting local result.	0.9	6825984
56	538	8	0	\N	1.4	4173824
118	448	4	2.8	Current reality assume admit model certain.	0.5	640000
45	12	4	1.3	Close true management thus behind test down.	2.0	5817344
181	794	4	2.9	Thing game last energy most group sometimes. Choice wish cover management.	1.0	3409920
5	632	4	2.5	Type away size.	0.5	4113408
123	776	4	0.4	Star scientist table them size expert raise. Building animal their week only.	1.2	4397056
170	379	4	1.4	\N	0.6	8275968
299	396	4	1.6	Stop realize someone control them mother. End son summer conference paper suffer behind.	1.8	4535296
30	659	3	0	\N	1.8	3203072
160	155	4	0.6	Remember job could field help four technology.	0.6	5909504
99	1	9	0	Letter six agency but later wall consumer detail. Medical boy popular PM.	0.9	7446528
51	195	4	1.4	\N	1.1	3864576
252	263	4	1.9	Leave small near entire type radio their account.	1.4	6623232
122	460	6	0	\N	1.8	5342208
154	436	4	2.7	Night line sound.	0.5	821248
302	539	5	0	East ready produce source unit.	1.8	7036928
17	199	4	1.3	Other study himself perhaps many effort.	0.7	1069056
174	343	4	2.0	Cultural energy bad poor.	0.6	5808128
5	649	4	1.8	\N	1.9	6636544
178	211	4	2.5	\N	1.0	221184
117	334	8	0	\N	1.2	2747392
68	640	4	1.5	Civil rock continue. Audience whether provide range he information trade.	1.7	4605952
146	563	3	0	\N	1.2	3682304
54	404	3	0	Executive challenge worker among.	1.0	936960
93	720	6	0	\N	0.5	5578752
263	439	4	1.7	Attention fund myself mention reality about continue.	1.9	4897792
254	839	4	1.9	Month church cold method.	1.0	3083264
132	33	7	0	American daughter necessary side effect.	0.5	1599488
171	851	9	0	\N	1.8	7554048
280	725	4	1.3	Everybody teacher civil customer indeed from area dark. Compare pattern between go we.	1.0	1912832
122	458	6	0	\N	0.6	2207744
186	780	4	0.2	Future direction against too rise attack.	0.7	5515264
164	507	8	0	\N	1.7	6304768
110	11	3	0	\N	1.5	3889152
26	330	4	1.0	Policy just happen than up relationship. Keep interesting one modern.	1.7	677888
305	703	1	0	\N	0.5	4106240
254	820	4	2.9	\N	1.0	4482048
175	511	4	0.5	\N	1.5	7813120
244	751	6	0	\N	1.7	8092672
91	679	8	0	\N	2.0	3255296
266	778	4	2.1	\N	1.2	1152000
190	373	3	0	During within ground follow civil whole nice.	1.7	6846464
289	73	5	0	Kitchen seek however significant.	1.5	1992704
51	197	4	2.5	Cause tell military beyond white white city.	1.4	2610176
202	462	4	1.0	Hot vote range law this environmental parent.	1.7	2051072
209	398	4	0.8	\N	0.8	1644544
279	419	1	0	Three decide show budget him.	0.6	954368
69	792	10	0	Model beat sister feeling. Environment life stuff explain organization.	1.5	4376576
307	402	4	1.9	Former world history administration best way Mrs instead.	1.2	4501504
199	567	4	1.4	Direction indicate allow rather which level morning first. Debate task side civil wait be human.	1.1	4554752
220	48	4	0.6	\N	1.9	808960
180	529	8	0	The see chance for.	1.2	3311616
114	474	10	0	Follow serve teacher seem high hospital three.	1.7	2464768
248	665	4	1.3	\N	0.6	5897216
8	198	4	2.1	\N	1.9	3796992
275	230	8	0	Admit themselves girl upon fact scene. These election artist how federal expect issue.	0.6	5823488
138	263	4	1.9	\N	0.6	2088960
225	713	5	0	\N	1.0	519168
229	45	4	1.7	So role employee throw notice itself.	1.9	3453952
255	84	4	1.7	Democratic detail these represent.	0.8	5256192
130	13	4	2.9	\N	0.6	3433472
28	322	4	1.6	\N	0.8	7108608
143	105	1	0	\N	1.2	5131264
117	339	6	0	\N	1.9	5013504
76	346	4	1.3	Bed study character kitchen west expert security.	0.9	6535168
180	539	7	0	\N	1.2	4019200
258	318	4	2.2	\N	2.0	7898112
190	380	9	0	\N	1.8	6533120
70	231	4	1.3	\N	1.6	5308416
161	787	4	2.9	Simple various man low boy new save across.	0.6	3740672
186	781	6	0	Surface note tonight better step figure simple seat.	1.1	8135680
138	270	8	0	Mention stop minute research carry appear.	0.5	3836928
239	239	4	2.2	\N	1.2	8219648
81	791	5	0	\N	1.2	8088576
145	352	4	2.3	\N	1.4	5131264
237	34	4	1.5	Dark service food light need mean. Cup decade can career end hospital.	1.4	809984
277	622	7	0	Method wait project similar challenge subject open number.	1.5	221184
270	151	4	0.1	\N	1.4	7346176
75	113	8	0	Give radio company professional the system think reflect.	1.5	5594112
118	447	5	0	\N	0.6	4259840
138	273	4	2.8	See degree blue moment.	1.7	7457792
105	103	3	0	\N	1.9	433152
243	440	10	0	Amount consider especially down young mean.	1.0	3228672
68	642	4	2.5	\N	1.2	2997248
129	565	4	1.6	\N	1.5	4267008
77	402	10	0	Born success true a include. Member minute of buy.	1.2	6928384
233	110	7	0	\N	1.7	233472
266	774	4	1.0	\N	0.5	718848
163	301	1	0	Analysis public far per spend across small.	1.8	6501376
137	466	4	2.1	\N	1.1	7362560
1	110	4	2.0	\N	1.3	3958784
113	513	4	2.2	More large money never.	0.9	3385344
224	40	5	0	\N	0.9	6498304
124	346	10	0	\N	1.6	2969600
283	16	4	1.5	Method father base item member natural.	1.8	3960832
260	194	4	2.9	\N	1.7	3458048
144	98	4	1.7	Difference offer again. Build as morning yourself.	1.8	4937728
173	274	5	0	\N	0.6	6066176
22	231	4	0.8	\N	0.7	7373824
221	490	1	0	Run research both smile where ahead.	1.9	6451200
253	800	4	1.8	Goal few nothing significant.	1.5	6148096
295	595	7	0	\N	0.9	7836672
115	109	4	0.2	Nor set door coach support there fine difference.	0.8	5195776
28	311	4	2.3	Despite claim western employee head direction me here. Those my police difficult.	1.5	5817344
309	374	5	0	Clearly bill provide change risk sort possible floor.	1.7	8076288
179	652	3	0	\N	1.8	295936
3	105	3	0	Visit your born side market radio.	0.6	1725440
238	623	4	2.5	Give try exactly ago appear money.	1.9	6130688
244	753	4	2.2	\N	0.9	2277376
217	257	4	1.4	\N	1.3	5360640
193	525	3	0	Thought section have unit paper change want. Other sort growth this well.	1.6	4737024
286	161	5	0	\N	1.2	2239488
92	716	4	2.1	Fight realize travel there down network. Campaign nature church increase environmental rock class.	1.8	2147328
173	279	3	0	\N	1.4	7268352
126	6	4	2.0	Rate natural reflect attorney. Real difficult public economic time.	0.9	6502400
171	842	9	0	Party expect certain deal.	0.9	4092928
295	601	4	1.5	Serious stage use theory own.	1.3	4562944
6	696	4	1.2	\N	1.8	3807232
102	788	4	0.7	\N	1.2	399360
112	382	4	1.1	\N	0.5	4332544
224	56	3	0	Event move prepare expect clear bag.	1.1	3143680
125	146	4	1.6	If method kitchen.	0.8	5638144
287	135	4	1.0	\N	0.9	3640320
172	842	4	2.5	\N	1.1	7785472
159	425	4	2.6	\N	0.9	2888704
19	299	4	2.9	Test force keep race. One keep it capital land research.	0.7	5397504
145	354	7	0	\N	0.5	4568064
295	599	4	1.3	Can particular happy heavy organization like. Thus mind stand method.	0.9	8142848
250	300	4	0.2	Popular local walk price now you event.	2.0	5844992
280	717	7	0	Guy center deal trip behavior either oil.	0.9	1678336
22	228	4	1.7	\N	1.8	6183936
193	504	4	1.6	\N	1.8	2449408
9	36	4	0.9	\N	1.8	2838528
279	415	4	1.0	\N	1.0	6301696
225	710	4	2.2	\N	1.9	7699456
276	821	4	2.8	\N	0.8	1185792
131	842	4	0.6	Scene season by drop economy.	0.8	6044672
181	790	1	0	\N	1.6	4037632
200	296	6	0	Animal surface smile life message sing.	1.0	3815424
291	289	9	0	Hope one second find everyone staff. May official popular join.	1.4	2656256
189	609	4	1.7	Avoid machine your throw camera size middle.	1.0	3751936
73	425	4	2.6	\N	1.3	2726912
32	603	5	0	\N	1.8	3645440
118	452	10	0	Which friend hand wrong at appear certain. Worry large agent space.	1.0	5206016
67	172	10	0	Might accept hit road goal compare since.	0.6	6608896
40	90	4	0.2	Indicate worry site market.	1.6	7839744
47	385	4	2.7	Radio radio magazine huge scientist contain different.	1.4	5039104
238	611	8	0	\N	1.2	4452352
108	742	4	1.8	\N	2.0	5987328
98	719	7	0	\N	0.7	5344256
89	605	7	0	Religious mean hit all mention.	1.2	5734400
213	562	3	0	Sometimes site until make. Tv little leave politics stand hear fight.	1.1	1232896
28	320	4	2.9	Relate close analysis since court.	1.7	3263488
33	545	4	1.5	\N	2.0	3038208
6	689	4	1.5	\N	1.1	5811200
99	7	4	1.4	\N	1.6	8112128
271	191	4	2.5	Offer with possible likely.	1.2	4493312
218	763	4	1.1	\N	1.8	1180672
40	112	4	1.1	Win community school.	1.6	2649088
140	386	4	2.7	Strategy sport son heart list travel case.	1.1	2510848
46	600	6	0	\N	0.7	2735104
198	849	9	0	Per must short current.	1.8	6001664
184	877	1	0	Particularly good different argue heart close certain. Feel issue adult month floor.	1.3	1980416
144	94	4	1.1	Send heart serve message top. Offer reveal itself note.	1.0	1426432
297	731	9	0	\N	1.1	2350080
306	532	7	0	\N	0.8	4514816
88	447	4	1.3	American letter staff.	0.6	5872640
164	502	3	0	\N	1.2	5022720
75	111	4	2.2	Create direction sense month.	1.9	3356672
125	152	8	0	\N	1.5	4089856
199	575	7	0	Recent budget war under other require.	0.7	6315008
233	98	9	0	\N	1.2	2793472
9	15	4	2.5	\N	1.8	7139328
186	771	9	0	\N	1.5	8130560
111	347	4	2.3	Section material movement to bank. Involve we never great wide but human.	0.6	395264
221	472	4	1.7	Bad project prevent wear office learn.	0.9	5332992
47	374	5	0	What follow assume concern herself meeting.	1.4	3864576
105	101	5	0	Memory something shake range only message response.	0.7	5586944
180	541	10	0	\N	1.0	7932928
214	225	4	2.1	Point senior box have.	0.6	5585920
221	481	4	2.3	Compare agreement expect scientist.	1.0	2010112
159	421	4	1.4	Memory voice those music minute effort maintain. Tax middle no site collection base popular.	1.5	5677056
289	63	7	0	By available statement table.	1.2	2971648
104	529	10	0	Benefit quite those dinner firm best policy.	1.5	1139712
28	303	4	2.4	Understand reduce himself body.	1.5	252928
132	25	3	0	\N	0.7	7574528
88	445	4	2.5	Fill science however do.	1.0	970752
63	41	8	0	\N	1.3	2341888
194	574	10	0	\N	0.6	6471680
173	262	4	2.9	Mrs seek born quickly run. Wind business house just mouth rock decide.	1.1	7439360
222	460	7	0	Political maintain process item ever social.	0.8	1967104
216	648	7	0	\N	0.7	217088
202	460	4	2.2	Window might bag sit market he amount investment. Line loss discussion few.	1.9	917504
218	757	5	0	Hundred customer successful kind store.	1.1	4176896
232	341	4	1.5	Similar yes medical almost.	0.8	705536
245	386	3	0	Degree letter clear under rest.	1.3	6345728
26	327	4	1.2	Education rather ready war back.	1.2	4688896
2	341	4	1.5	Ten understand as someone.	0.9	2991104
296	438	4	1.9	\N	1.5	940032
152	837	3	0	\N	0.8	3016704
144	106	4	1.1	Play process cut trial care beautiful coach. Whatever wear measure bad.	1.1	2479104
216	636	10	0	Cut reflect case data draw them see language.	0.7	5111808
109	700	4	1.9	\N	1.9	3116032
128	123	6	0	Whether tend in voice. Language maybe prepare social.	0.7	1573888
151	115	5	0	\N	1.1	3715072
248	675	3	0	Exist hand girl card thing view.	1.2	2019328
310	558	9	0	\N	1.5	1319936
61	744	3	0	Least mother record join. Network human southern technology.	2.0	1910784
167	843	4	0.0	Contain serve listen at actually career. Take reduce baby happen cup himself behind happen.	1.5	756736
266	770	4	2.2	Keep shake address hundred.	1.5	731136
145	362	7	0	\N	0.8	2851840
278	690	4	1.0	Example method consider true agent.	1.7	2039808
32	596	1	0	Other necessary little.	1.3	831488
154	442	5	0	Author simply race on.	0.9	6630400
286	188	4	1.5	Food federal site value ground.	1.4	1416192
15	613	4	2.9	\N	0.9	2604032
5	636	4	1.4	Sometimes box mention start.	1.9	5071872
149	413	4	2.2	Matter base everybody accept.	0.6	3213312
252	253	1	0	Perhaps from several least question. Cut near able three.	1.7	7979008
109	706	3	0	\N	1.5	7452672
24	800	4	2.4	\N	1.1	4189184
127	69	4	0.8	\N	0.8	4796416
135	280	8	0	Offer performance with. Some time something.	0.9	4674560
268	748	4	1.0	\N	1.5	4516864
150	416	4	2.1	Religious material push century.	1.0	8062976
260	193	4	1.6	Including begin perform example nothing follow.	1.5	3130368
106	142	1	0	\N	1.7	2939904
309	366	5	0	Participant different whatever organization.	0.8	7237632
103	193	3	0	Make seven lot real heavy class recognize.	1.0	1940480
175	519	9	0	\N	1.4	5576704
193	518	9	0	Seek current loss account skill.	0.7	4956160
70	226	6	0	\N	1.3	4652032
56	541	4	2.0	\N	1.0	2801664
80	272	10	0	End no under page.	2.0	2762752
40	104	4	2.6	\N	1.3	5006336
289	62	4	1.0	\N	1.4	2028544
61	736	3	0	\N	1.5	7139328
182	229	4	0.4	\N	0.6	6727680
90	109	4	2.5	Price health a music military enter hair agency.	1.5	8253440
26	318	4	2.2	\N	0.7	7175168
30	663	8	0	\N	0.5	7236608
213	568	4	1.4	Bag hit person some American.	1.4	5591040
70	228	1	0	\N	1.4	2140160
15	629	3	0	Reach community free player sort research research.	1.9	1063936
268	749	8	0	Level sport level build key rich way.	1.9	1340416
3	110	4	1.6	\N	1.8	5125120
129	572	4	2.7	\N	1.4	6938624
138	272	4	1.3	\N	1.9	4204544
250	301	10	0	\N	1.9	5983232
259	845	7	0	\N	0.8	3303424
100	712	10	0	\N	0.6	7545856
98	709	5	0	Cost center around agree film else rather. Lay blue ball other different change Mrs scientist.	1.5	4912128
126	10	3	0	Wrong public push.	1.0	163840
14	486	4	2.4	Order prepare that show source law range.	1.5	7382016
3	99	4	1.4	Such walk total woman each job. Simply carry own wind professional together.	1.1	7635968
286	165	6	0	\N	1.6	2549760
72	664	6	0	Meet own tough research join foreign seem.	1.5	4508672
51	199	4	1.3	\N	0.6	5464064
110	9	4	2.0	\N	1.9	3836928
216	639	4	1.7	Population general return eye list nature.	1.6	4824064
110	12	1	0	More morning begin learn above board. Woman film answer suddenly line employee test.	2.0	4956160
298	712	4	1.4	\N	1.4	7366656
224	42	8	0	Woman my indicate step check person notice professor. Collection point decision beyond skin entire.	1.0	5810176
270	149	4	2.9	\N	1.0	8082432
54	408	5	0	\N	1.9	2082816
228	706	3	0	Hospital stuff door international worry easy home. Black moment onto husband no six.	0.7	2673664
303	342	4	0.4	\N	1.1	7899136
148	409	4	0.3	Continue wide Mr central bank.	1.9	7384064
145	363	10	0	Traditional mother line clearly.	1.3	4321280
14	493	4	1.8	Wear consumer lay heart free cost.	1.7	4696064
184	866	4	2.2	Sit look floor ever age increase understand.	1.5	1874944
284	622	8	0	\N	1.3	7553024
21	343	4	2.0	Glass check data test close brother. Happy American cut cover billion just.	1.7	115712
64	209	4	1.0	Home building spring although. Firm everyone bag be main sometimes.	1.5	3310592
160	171	4	0.7	Significant radio tax make.	0.9	2828288
78	263	4	1.9	Once environmental determine she probably around grow.	1.4	4397056
194	575	7	0	Newspaper crime you important there.	0.6	6621184
98	721	8	0	\N	1.4	4346880
120	600	4	2.2	Your must remain off.	0.8	886784
32	606	1	0	\N	0.9	1134592
135	252	7	0	Would subject policy majority she. Discover full protect without conference.	1.1	7054336
210	452	4	2.7	Firm control child his argue sign former figure.	1.7	4430848
226	661	10	0	\N	0.6	3476480
121	731	7	0	\N	1.3	6630400
118	446	9	0	\N	0.7	2546688
199	558	10	0	\N	0.8	3960832
3	103	4	2.8	\N	0.9	6076416
199	554	5	0	\N	1.0	2865152
268	760	8	0	\N	1.9	5023744
298	721	4	2.3	Capital build person sort change which born.	1.4	2340864
191	761	5	0	\N	1.7	5208064
67	189	6	0	\N	1.5	8201216
211	834	4	1.8	Firm which property far moment.	1.6	4322304
143	98	4	1.7	\N	1.6	6976512
169	361	5	0	\N	1.7	3139584
168	306	10	0	After environment note station military form.	1.0	2887680
68	652	4	2.3	\N	1.4	6910976
150	408	10	0	Benefit number way laugh doctor.	1.8	2543616
221	491	4	1.5	\N	1.9	7185408
113	518	4	1.2	\N	0.8	6536192
142	552	4	1.5	Drug look return purpose company road.	1.7	1540096
262	678	6	0	No total manager research issue.	1.6	4350976
100	709	9	0	\N	1.1	7348224
72	660	4	2.7	Case deal end little.	0.8	5502976
181	792	4	1.8	\N	1.9	7220224
307	394	4	1.8	My make strategy me teacher sea soon.	1.1	5432320
246	482	9	0	Hard my my fine career.	1.9	5372928
190	376	10	0	Against music meet difficult adult.	0.8	5771264
169	357	8	0	\N	0.7	4515840
87	442	3	0	\N	0.6	6139904
137	484	6	0	\N	0.6	3668992
152	832	5	0	\N	1.2	5591040
7	376	3	0	\N	0.8	5211136
54	426	4	0.7	\N	0.6	6034432
121	716	4	1.2	Again run suffer its party resource career.	1.4	447488
252	250	4	1.7	Interview statement difference base care. Very leader much never officer later model.	1.0	4122624
71	54	10	0	People ask somebody clearly direction door much.	1.7	3945472
228	693	4	2.9	Place popular decide open.	1.2	8045568
175	515	6	0	\N	0.9	7430144
150	410	7	0	\N	1.3	3067904
215	519	1	0	\N	0.9	6519808
74	481	1	0	\N	1.0	7860224
299	403	8	0	Service project hour what name nothing than. Truth rise matter expert never popular face.	0.7	6903808
148	411	7	0	\N	1.4	1110016
146	574	4	1.0	Range edge school minute letter music.	1.1	4007936
173	276	4	2.2	\N	1.0	3643392
187	223	4	2.4	\N	1.9	7617536
26	314	5	0	Practice office material whatever middle over.	2.0	418816
118	450	4	2.3	Environment fly rise those customer.	1.1	914432
122	459	3	0	Least ground entire dark decade American. Tax service position.	2.0	1215488
153	79	5	0	Money work in both break.	0.9	4703232
217	261	6	0	\N	1.3	7748608
283	30	4	1.8	\N	0.6	3225600
264	143	3	0	\N	1.2	7985152
229	39	9	0	Mission card air score help them east.	1.9	2688000
149	408	1	0	\N	1.2	4025344
92	725	4	2.3	\N	1.0	2925568
196	294	4	2.8	\N	1.1	5048320
46	592	5	0	Let early natural grow shoulder.	1.8	1127424
286	163	4	1.9	\N	0.8	5916672
305	686	4	2.8	Democrat beat machine system.	1.6	2035712
108	740	1	0	Perform policy town prove. Series executive base nothing ground up.	1.3	3912704
306	537	10	0	\N	1.3	1717248
64	207	1	0	Reveal many sound full my.	1.4	4695040
126	3	7	0	Almost police know senior simple.	0.5	3812352
219	89	4	1.2	\N	0.8	5513216
221	475	8	0	\N	0.5	2642944
138	258	4	1.9	Daughter end miss white long event onto.	0.8	3739648
260	190	4	2.5	\N	1.6	582656
294	449	4	1.6	These job participant since.	2.0	3586048
254	832	4	0.7	The wait budget art behind more get.	1.0	2313216
254	824	10	0	Discover see attorney tonight.	1.1	6530048
64	204	4	0.9	\N	1.9	6062080
91	660	4	2.7	\N	1.5	1678336
40	109	1	0	\N	0.6	6829056
78	273	4	2.8	\N	1.3	8280064
66	438	8	0	Reason up executive.	0.7	2277376
86	541	5	0	\N	1.1	6432768
140	381	4	2.6	Season various speech room company sport forward later.	1.5	2738176
279	405	10	0	\N	0.6	7688192
299	397	4	1.1	Food truth mention inside form behind turn.	1.0	6400000
23	245	1	0	\N	1.2	1160192
182	215	10	0	Start economy rock clearly development.	1.7	6178816
112	387	8	0	Factor eat remain with see us. Say activity total about.	1.3	667648
294	451	4	1.4	\N	1.7	7979008
10	655	7	0	\N	1.2	2681856
88	457	8	0	\N	0.6	7910400
171	852	4	2.2	Make teacher minute street himself too.	1.9	1232896
307	397	4	1.1	Late million crime.	1.8	646144
275	228	4	1.7	\N	0.6	8101888
211	824	4	2.6	Morning sort member prevent.	1.0	794624
11	226	8	0	\N	1.2	1692672
92	729	1	0	\N	1.1	6829056
\.
COPY submit_results (submit_id, score, status) FROM STDIN;
136	6.199999999999999	4
268	10.5	10
196	21.2	9
77	4.800000000000001	10
48	8.1	10
229	20.0	9
211	37.800000000000004	10
237	25.6	9
124	12.399999999999999	10
269	12.399999999999999	9
247	10.5	10
183	5.0	10
68	28.8	10
227	22.6	10
69	8.600000000000001	10
60	2.8	9
62	31.299999999999994	10
61	8.899999999999999	9
129	20.500000000000004	10
295	15.7	10
300	13.299999999999999	10
81	8.3	10
216	23.0	10
215	27.9	9
155	9.299999999999999	10
113	32.49999999999999	10
119	3.3	9
4	7.7	8
259	8.0	10
53	15.600000000000001	9
76	12.3	5
144	22.8	10
223	2.1	4
103	2.5	7
52	5.5	7
200	19.200000000000003	8
80	33.4	10
245	20.799999999999997	8
87	20.7	10
96	36.199999999999996	10
172	17.2	10
292	2.1	4
30	32.8	9
197	33.3	10
56	14.0	10
1	35.300000000000004	9
107	2.1	4
164	30.599999999999998	10
220	18.5	8
301	7.7	9
104	15.2	10
256	6.1	9
272	23.9	10
15	22.199999999999996	10
116	19.599999999999998	9
277	14.599999999999998	10
226	27.999999999999996	10
217	20.9	10
14	32.0	10
112	18.200000000000003	9
190	15.799999999999997	10
7	13.3	10
166	30.499999999999996	10
82	2.1	4
2	6.1	10
161	13.1	10
258	32.9	10
293	4.2	8
163	4.6	5
266	15.899999999999999	10
135	37.1	10
134	14.700000000000001	8
105	29.8	10
291	14.8	10
171	12.399999999999999	10
262	22.900000000000006	10
28	31.900000000000002	10
228	29.899999999999995	9
231	2.5	8
89	16.900000000000002	10
264	12.5	10
128	19.6	10
71	18.599999999999998	10
18	7.5	5
11	12.6	10
191	17.0	10
19	5.8	5
133	17.900000000000002	8
306	16.6	10
275	19.299999999999997	10
194	18.799999999999997	10
83	0	1
152	24.700000000000006	10
22	18.9	10
249	13.100000000000001	4
153	16.5	10
57	4.699999999999999	6
199	17.599999999999998	10
34	8.3	10
147	4.8	5
238	30.099999999999998	10
121	26.599999999999998	10
154	7.2	10
85	11.6	10
257	8.0	10
9	24.400000000000002	10
273	2.5	8
288	19.4	10
58	5.1	6
303	5.4	10
290	16.1	10
45	14.200000000000001	7
17	9.100000000000001	10
236	1.9	8
23	13.399999999999999	10
243	9.9	10
78	30.2	10
54	16.099999999999998	10
168	28.499999999999996	10
106	14.3	9
140	22.0	10
59	30.1	10
179	28.799999999999997	7
254	30.299999999999997	10
244	16.8	10
309	21.699999999999996	10
6	33.7	10
304	6.2	10
165	6.800000000000001	4
118	18.7	10
185	12.799999999999999	9
114	37.5	10
125	11.0	10
242	4.4	10
150	20.1	10
139	5.6	10
195	25.3	10
99	12.3	9
111	12.8	8
225	31.7	10
252	37.599999999999994	10
79	17.0	9
279	13.4	10
239	14.399999999999999	10
41	4.4	4
123	16.299999999999997	10
271	6.0	10
270	14.1	10
278	25.200000000000003	9
286	37.49999999999999	10
294	15.5	10
102	7.3	10
12	17.9	10
37	2.1	4
203	15.700000000000001	7
261	25.8	10
5	29.5	10
182	12.1	10
66	12.8	9
235	2.1	4
205	11.0	10
305	24.2	9
308	11.2	5
280	20.400000000000002	10
253	17.799999999999997	8
20	9.7	7
130	18.1	7
91	28.699999999999996	9
177	17.6	9
178	5.2	4
35	2.5999999999999996	4
310	16.5	10
240	14.0	9
117	2.4000000000000004	10
55	10.799999999999999	8
311	3.8	10
201	15.000000000000002	10
75	23.000000000000004	9
241	22.5	9
8	12.9	10
47	23.499999999999996	10
137	24.5	10
10	20.5	10
36	3.2	7
149	30.999999999999996	10
298	28.1	10
267	15.2	8
143	27.1	9
16	2.0	4
101	21.700000000000003	7
38	2.1	4
67	33.099999999999994	10
13	1.2	7
84	10.1	9
39	13.8	9
27	13.0	10
138	36.099999999999994	9
43	12.2	10
297	25.700000000000003	9
207	27.3	10
296	13.600000000000001	10
63	19.799999999999997	10
73	15.200000000000001	10
141	17.4	10
160	38.00000000000001	10
189	21.2	10
233	15.299999999999999	10
260	8.3	9
169	15.100000000000001	9
146	20.0	10
175	25.5	10
219	18.799999999999997	6
142	10.8	8
167	13.4	8
274	9.700000000000001	10
40	23.000000000000004	10
32	14.3	9
232	11.3	7
221	39.9	10
230	26.200000000000003	9
246	21.999999999999996	9
158	2.5999999999999996	7
181	11.900000000000002	10
50	11.1	9
159	25.6	10
93	26.8	10
70	17.8	10
186	11.5	10
110	10.0	10
3	31.8	9
132	18.900000000000002	9
122	19.2	9
90	30.500000000000007	10
\.
