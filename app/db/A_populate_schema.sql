COPY users (login, name, surname, password_hash, email) FROM STDIN;
edwardtaylor	Bonnie	Conner	$2b$12$Vwxt8YoHuO7cli2JqXSiQevuczSUzDI1WzROF0qeY/2hn7Fmwq0lG	bwilliams@example.net
mcdanieljustin	Jason	Hart	$2b$12$FyUCoiTsECVoVxiV9iNswuldt6l5/nYwJLHXHS7acIjmpbnk6KJ86	elizabeth17@example.org
moralesthomas	Chad	Walker	$2b$12$VLeTazdqCWRgkaEysnz9LOEoC5L09r/wsFybUvQXL99Y/BUcdAg0G	barbarapatterson@example.com
schneiderjacqueline	Andrew	Mason	$2b$12$pnOGbRtEG4AZ1PnYie9Ny.aerEOA/0k5rF5gbLFjjk6UuZLuwHdV6	dhill@example.org
jeffreygarcia	Brandon	Powell	$2b$12$UUzWdg9pmgMrZsn4dSPuaeBbRBLPY3H3qBS7VIujfZiADvUa68yeq	jameskrueger@example.com
andrewnichols	Tiffany	Lindsey	$2b$12$8Br0R7k2U0PyaJjVIXOoeOkvn1al0dYxcngO8eWA3VcNmsq.a5ufa	michelle34@example.com
kathleen66	Cassandra	Wright	$2b$12$WKaEU/.G593NLl8mnoJV4Oi7na.GQ0b.q3KEvKnyY7J.4Xyg4G4ni	jessicahouston@example.net
trubio	Carl	Roberts	$2b$12$3rvfD8HNCXWgBHr5A4oQ0uyS5pmU74XmzGcv9hki0hRgg4iOPdpp.	cosborn@example.com
laurieevans	Samantha	Farmer	$2b$12$4FrURh4Ou9RT4BGhmLafwudS0NjtQEvBil6YFjmUvuOogiPR9Fwq.	xsmith@example.net
melanie99	Melanie	Shah	$2b$12$.bW6UYlEG7GwAnko/m4KjO.sgkRfYG6TuBFhloG2/.7nNlzeBApk6	martinezashley@example.net
admin	A0	D	$2b$12$EBNqXJqx7dlIWMi6nwVD8eHxAx0bPGpqYTWqE1cY3O4roAdQNqMdq	administracja@tanuki.pl
admin1	A1	D	$2b$12$JzaK8BJm7.qNysY16Rx3yO6VZ.eVWZka2CtMjbQ6HxtCaFNeh417m	administracja@tanuki.pl
admin2	A2	D	$2b$12$5ft6AQ4hfqPj/gZ/NHGX2.seBAHH8L74kBr3UUtJ5UG/X43jvx7Oq	administracja@tanuki.pl
admin3	A3	D	$2b$12$CabdBksFmoVIiQ9hzF1gTufsvaNdGpkVM12Z.XD7Y/PjHXumR.H1i	administracja@tanuki.pl
admin4	A4	D	$2b$12$OquRYVrYY2mhZ21S27FdUe0a8QrHK8GKdeluzYsuBoiPHvR1qnYra	administracja@tanuki.pl
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
Look system only leave.	Choose skin.	True
See skill idea scene think.	Base field.	True
Everybody almost including see.	Ask forward.	True
Report send sort follow.	Clear.	True
Provide kid feeling.	Sign name.	True
Trade seat assume put TV.	Never bank.	True
Least once you power.	Family.	True
Single might year new itself.	The.	True
Hope peace evening remain no.	Garden.	True
Material return fall recent.	Power not.	True
\.
COPY permissions_for_contests (name, description) FROM STDIN;
MANAGE	Allows user to edit contest and manage participants
SUBMIT	Allows user to view problems and sending submissions
\.
COPY contest_permissions (user_id, permission_id, contest_id) FROM STDIN;
10	2	3
2	2	5
3	2	1
8	2	2
6	2	9
7	2	9
10	2	5
2	2	7
6	1	10
4	2	9
5	2	6
6	2	2
7	2	2
9	2	4
4	2	2
2	2	9
5	2	8
6	2	4
8	2	6
7	2	4
9	2	6
2	2	2
4	2	4
5	2	10
1	2	8
3	2	10
6	2	6
7	2	6
9	2	8
2	2	4
4	2	6
5	2	3
1	2	1
3	2	3
9	2	1
7	2	8
9	2	10
10	2	7
5	2	5
1	2	3
3	2	5
8	1	7
7	2	1
9	2	3
7	2	10
10	2	9
5	2	7
1	2	5
3	2	7
8	1	9
7	2	3
9	2	5
10	2	2
1	2	7
3	2	9
6	2	8
7	2	5
8	2	10
9	2	7
10	2	4
2	2	6
5	2	2
4	2	8
3	1	3
3	2	2
1	2	9
6	2	1
8	2	3
6	2	10
7	2	7
9	2	9
10	2	6
4	2	1
2	2	8
1	2	2
4	2	10
3	2	4
6	2	3
9	2	2
2	1	2
2	2	1
10	2	8
4	2	3
2	2	10
1	2	4
3	2	6
5	2	9
8	1	8
8	2	7
1	1	5
5	1	4
7	1	6
10	2	1
2	2	3
10	2	10
4	2	5
1	2	6
3	2	8
8	1	1
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
Benefit fast drug phone fact.	None.	1	/problems/dummy	False	0	0.4	2002-11-24, 03:26:32	2009-05-30, 17:54:03	True	1	64512
Write force right word.	Now.	1	/problems/dummy	False	1	0.3	2006-10-24, 08:10:12	2012-01-21, 12:39:08	False	1	77824
Air TV subject short.	Area.	1	/problems/dummy	True	2	0.3	1992-08-09, 06:37:50	1999-09-11, 14:15:34	True	2	18874368
Much manage class age.	Until.	1	/problems/dummy	True	3	0.2	1997-02-15, 18:22:22	2000-12-12, 04:59:28	True	3	45088768
Reality nation draw issue.	Program.	1	/problems/dummy	True	4	0.2	\N	\N	False	3	59392
While huge career life thing.	Pick.	1	/problems/dummy	True	5	0.0	2012-07-20, 09:20:15	2017-10-31, 08:10:23	True	2	65536
Away score kid toward.	Require.	1	/problems/dummy	False	6	0.1	2009-12-02, 12:25:42	2012-11-01, 10:56:58	True	1	2048
Sing share success change.	Past.	1	/problems/dummy	False	7	0.4	1998-01-27, 09:29:50	2009-11-15, 19:27:11	True	2	79872
Most though training.	Peace.	1	/problems/dummy	False	8	0.3	2000-02-17, 07:18:24	2010-08-20, 12:22:06	False	3	17408
Really new focus positive.	Choose.	1	/problems/dummy	True	9	0.4	\N	\N	True	1	60416
Later realize feeling any.	Would.	2	/problems/dummy	True	0	0.4	2009-07-26, 19:41:59	2019-09-27, 15:22:05	True	1	17408
Develop thank see beyond.	Station.	2	/problems/dummy	True	1	0.4	\N	\N	True	1	42991616
Hold feel life soldier.	Address.	2	/problems/dummy	True	2	0.1	\N	\N	True	1	69632
Marriage radio case.	Your.	2	/problems/dummy	True	3	0.4	2003-02-26, 16:33:57	2008-04-25, 02:09:18	True	2	46080
Type walk standard course.	Mission.	2	/problems/dummy	False	4	0.1	2010-03-27, 15:03:52	2022-05-30, 06:33:36	True	3	49283072
Country president say.	By.	2	/problems/dummy	True	5	0.4	\N	\N	True	3	35840
Race fire medical read.	Brother.	2	/problems/dummy	False	6	0.1	1999-06-14, 13:57:25	2017-09-14, 12:39:40	True	2	30408704
World growth father cultural.	With.	2	/problems/dummy	False	7	0.1	2000-10-24, 08:37:52	2007-07-22, 20:10:39	False	3	23068672
Author lead ever specific.	Budget.	2	/problems/dummy	True	8	0.1	1994-08-01, 06:26:58	1994-09-26, 19:32:19	True	2	6291456
Quickly both page usually.	Morning.	2	/problems/dummy	False	9	0.0	\N	\N	True	1	39845888
Design yeah skin course.	Recent.	3	/problems/dummy	True	0	0.3	2005-11-03, 02:10:36	2006-06-13, 18:36:01	True	2	41943040
See they democratic reach.	Heavy.	4	/problems/dummy	False	0	0.1	2015-06-10, 04:57:59	2021-08-05, 20:01:11	True	1	54525952
Arrive area range hold.	Policy.	4	/problems/dummy	True	1	0.3	1995-01-20, 02:17:04	2015-12-02, 18:03:48	True	1	91136
Green cover act born policy.	School.	4	/problems/dummy	False	2	0.2	\N	\N	True	2	16384
Yeah trip owner successful.	Remain.	5	/problems/dummy	False	0	0.2	2007-05-20, 10:07:18	2011-07-05, 00:32:01	True	3	61440
Want PM thus.	Loss.	5	/problems/dummy	False	1	0.3	1996-06-11, 15:24:45	2014-01-05, 17:51:00	True	1	29360128
Young cell company skill nor.	Western.	5	/problems/dummy	False	2	0.0	1994-06-13, 08:48:45	2013-12-22, 07:12:57	True	3	5242880
Toward close fact.	Wrong.	6	/problems/dummy	False	0	0.3	2007-05-14, 18:18:32	2021-12-29, 02:21:10	True	3	70656
These voice land industry.	Full.	6	/problems/dummy	False	1	0.3	2011-02-08, 00:49:05	2014-06-10, 22:22:02	False	2	89128960
Environment win figure work.	Age him.	6	/problems/dummy	True	2	0.0	2000-08-13, 07:00:30	2002-03-22, 15:17:03	True	1	32505856
Conference population many.	Theory.	6	/problems/dummy	False	3	0.3	\N	\N	False	3	29360128
Indeed pretty of time drug.	Base in.	6	/problems/dummy	False	4	0.0	1994-07-10, 17:14:52	2010-10-31, 16:46:29	False	3	18432
Market born people.	His.	6	/problems/dummy	True	5	0.4	1995-03-22, 10:35:55	2005-07-10, 10:12:09	True	3	60817408
Agree per left stock until.	Agent.	6	/problems/dummy	True	6	0.4	1995-12-09, 15:39:21	2003-04-22, 01:00:52	True	3	13312
Day Democrat site have time.	Garden.	6	/problems/dummy	True	7	0.1	1992-09-30, 15:25:36	2017-09-23, 01:26:27	True	1	17408
Opportunity huge art.	Country.	6	/problems/dummy	True	8	0.3	1995-11-09, 12:13:14	2019-09-02, 11:17:14	True	3	60416
Look finally guess enjoy.	Foot.	6	/problems/dummy	True	9	0.3	2014-08-08, 23:22:42	2015-10-15, 16:42:58	True	2	54525952
Even produce surface level.	Here.	7	/problems/dummy	False	0	0.0	2011-02-02, 02:49:37	2015-06-05, 05:37:26	True	1	6291456
Recently should stage white.	Guy.	8	/problems/dummy	False	0	0.3	2001-02-18, 19:21:54	2009-04-15, 11:31:03	True	2	14680064
Professional any leader.	Need.	8	/problems/dummy	True	1	0.0	2010-09-15, 04:08:23	2010-09-27, 17:09:19	False	3	100352
Race personal trial economy.	Than.	8	/problems/dummy	False	2	0.3	2011-08-06, 17:52:29	2016-06-22, 10:46:03	False	2	15360
And Mrs rate that painting.	Trial.	9	/problems/dummy	False	0	0.0	1993-05-20, 14:20:59	2020-04-24, 13:37:57	False	1	36864
May both time lose.	Nor.	9	/problems/dummy	False	1	0.3	1997-11-07, 00:20:55	2019-09-17, 18:56:37	False	2	47104
Suffer sure save way bit.	Agency.	10	/problems/dummy	True	0	0.0	1998-01-27, 12:38:10	2006-03-07, 11:29:34	False	2	62464
Green scene huge year first.	Worker.	10	/problems/dummy	False	1	0.0	1999-03-07, 19:47:45	2008-10-12, 15:01:37	True	2	36864
\.
COPY problem_languages (problem_id, language_id) FROM STDIN;
12	4
34	1
5	1
17	3
42	2
32	3
18	1
45	3
5	3
43	5
13	1
35	1
16	6
7	3
18	3
37	1
8	4
9	3
33	6
38	2
6	6
21	4
22	5
36	4
3	1
5	7
30	6
9	5
41	3
7	7
39	5
36	6
14	3
17	2
37	5
1	5
13	7
24	7
26	4
35	7
37	7
17	4
4	4
42	6
44	3
26	6
2	6
31	5
3	7
10	3
44	5
21	6
23	3
27	3
42	1
1	2
40	3
8	1
19	1
11	6
2	3
40	5
29	5
21	1
28	6
30	3
33	2
16	4
20	4
14	6
7	6
12	2
19	7
10	4
25	2
13	6
15	3
29	2
38	5
\.
COPY submits (source_uri, user_id, problem_id, language_id, submission_time) FROM STDIN;
/submitted/dummy	1	30	3	1996-08-01, 06:15:45
/submitted/dummy	1	41	3	2002-03-18, 13:20:11
/submitted/dummy	1	11	6	2017-03-28, 17:54:14
/submitted/dummy	1	29	5	2004-07-15, 13:30:42
/submitted/dummy	1	37	5	2012-06-25, 08:48:47
/submitted/dummy	1	14	6	2005-11-03, 06:50:20
/submitted/dummy	1	18	1	2001-09-07, 13:44:21
/submitted/dummy	1	4	4	2006-01-10, 11:27:28
/submitted/dummy	1	34	1	2002-10-11, 10:50:50
/submitted/dummy	1	9	5	1996-10-23, 06:54:17
/submitted/dummy	1	43	5	1992-12-15, 22:52:17
/submitted/dummy	1	22	5	2004-09-19, 11:13:19
/submitted/dummy	1	26	4	2013-01-05, 03:19:46
/submitted/dummy	1	22	5	2015-06-20, 00:12:34
/submitted/dummy	1	42	6	2021-12-09, 07:11:08
/submitted/dummy	1	22	5	2000-04-14, 19:41:59
/submitted/dummy	1	33	2	2004-07-06, 20:02:43
/submitted/dummy	1	3	1	2001-10-28, 08:13:15
/submitted/dummy	1	39	5	1996-07-02, 09:47:57
/submitted/dummy	1	1	2	2011-12-14, 01:34:22
/submitted/dummy	1	28	6	1994-04-04, 00:31:57
/submitted/dummy	1	5	3	2019-11-10, 17:44:16
/submitted/dummy	1	21	6	1998-12-17, 14:55:10
/submitted/dummy	1	22	5	1993-08-09, 21:27:04
/submitted/dummy	1	35	1	2015-12-08, 21:11:06
/submitted/dummy	1	31	5	1995-11-08, 06:35:39
/submitted/dummy	1	43	5	1996-02-02, 12:35:05
/submitted/dummy	1	25	2	1994-11-10, 09:04:13
/submitted/dummy	1	41	3	1998-04-12, 14:52:14
/submitted/dummy	1	24	7	2004-01-26, 15:43:13
/submitted/dummy	1	32	3	1992-10-06, 05:21:04
/submitted/dummy	1	3	7	1995-04-08, 05:31:12
/submitted/dummy	1	20	4	2005-08-21, 18:49:41
/submitted/dummy	1	4	4	2001-09-23, 20:12:44
/submitted/dummy	1	17	3	2014-02-22, 11:07:20
/submitted/dummy	1	24	7	2006-12-24, 17:53:46
/submitted/dummy	1	43	5	2008-03-08, 08:40:50
/submitted/dummy	1	15	3	2005-01-25, 21:45:44
/submitted/dummy	1	42	1	2009-08-17, 15:09:46
/submitted/dummy	1	22	5	1998-04-21, 11:21:03
/submitted/dummy	1	41	3	2010-01-13, 09:15:59
/submitted/dummy	1	10	4	2017-10-30, 20:39:56
/submitted/dummy	1	18	3	2021-05-24, 18:27:10
/submitted/dummy	1	41	3	2021-02-04, 08:31:19
/submitted/dummy	2	19	7	2012-08-23, 01:58:51
/submitted/dummy	2	19	7	2017-01-14, 12:28:46
/submitted/dummy	2	45	3	2018-09-06, 11:50:22
/submitted/dummy	2	17	2	2004-05-21, 08:15:47
/submitted/dummy	2	14	6	2021-01-21, 01:18:49
/submitted/dummy	2	20	4	1997-11-19, 08:40:10
/submitted/dummy	2	41	3	2004-07-12, 02:02:33
/submitted/dummy	2	7	7	2021-07-22, 02:20:23
/submitted/dummy	2	5	3	1997-02-28, 16:07:28
/submitted/dummy	2	13	6	2012-09-27, 09:06:35
/submitted/dummy	2	20	4	1992-10-25, 03:43:20
/submitted/dummy	2	6	6	2003-10-03, 12:14:28
/submitted/dummy	2	11	6	2005-05-07, 10:41:24
/submitted/dummy	2	37	7	2011-08-10, 15:03:39
/submitted/dummy	2	4	4	2007-05-06, 22:32:08
/submitted/dummy	2	10	3	1993-12-06, 11:33:02
/submitted/dummy	2	44	3	2007-01-19, 16:56:31
/submitted/dummy	2	19	7	1995-01-22, 00:38:16
/submitted/dummy	2	40	3	1996-12-11, 05:18:12
/submitted/dummy	2	12	2	2015-10-16, 16:27:06
/submitted/dummy	3	3	7	2003-05-06, 11:47:04
/submitted/dummy	3	16	4	1994-09-01, 01:36:23
/submitted/dummy	3	42	1	2012-01-16, 17:07:00
/submitted/dummy	3	24	7	2015-11-20, 18:25:44
/submitted/dummy	3	17	2	2009-07-26, 03:25:29
/submitted/dummy	3	29	2	2011-12-16, 15:35:32
/submitted/dummy	3	3	1	2000-10-07, 14:07:11
/submitted/dummy	3	37	1	1994-07-20, 02:24:57
/submitted/dummy	3	41	3	2012-03-18, 04:34:06
/submitted/dummy	3	39	5	2009-06-05, 02:03:04
/submitted/dummy	3	36	4	1993-01-01, 05:33:54
/submitted/dummy	3	9	5	2014-11-22, 06:39:57
/submitted/dummy	3	15	3	1999-04-01, 13:08:09
/submitted/dummy	3	15	3	2004-01-23, 13:29:36
/submitted/dummy	3	12	4	1994-12-27, 20:15:05
/submitted/dummy	3	32	3	2009-07-18, 16:32:34
/submitted/dummy	3	35	7	2000-10-29, 23:16:01
/submitted/dummy	3	10	4	2015-12-03, 19:49:24
/submitted/dummy	3	6	6	2008-01-31, 14:44:41
/submitted/dummy	3	31	5	1998-01-15, 12:10:09
/submitted/dummy	3	38	5	2006-10-04, 22:58:14
/submitted/dummy	3	14	3	2000-10-04, 23:24:25
/submitted/dummy	3	44	3	1995-11-15, 17:19:25
/submitted/dummy	3	25	2	1995-05-10, 03:30:32
/submitted/dummy	3	33	6	2021-04-20, 19:29:21
/submitted/dummy	3	41	3	1996-03-28, 04:04:01
/submitted/dummy	3	33	6	1995-11-17, 11:35:11
/submitted/dummy	3	20	4	1993-10-28, 16:44:15
/submitted/dummy	3	19	7	2005-10-28, 23:26:05
/submitted/dummy	3	20	4	2010-03-16, 15:45:57
/submitted/dummy	3	37	5	1999-11-06, 21:51:15
/submitted/dummy	3	19	7	2013-04-19, 11:58:33
/submitted/dummy	3	44	3	2013-12-30, 13:57:03
/submitted/dummy	3	40	3	2001-03-05, 20:07:52
/submitted/dummy	3	9	3	2010-02-21, 17:41:51
/submitted/dummy	3	39	5	1993-08-06, 14:42:04
/submitted/dummy	3	8	1	2022-04-03, 07:53:21
/submitted/dummy	4	29	2	2020-11-16, 13:09:51
/submitted/dummy	4	12	4	2001-02-10, 17:23:59
/submitted/dummy	4	24	7	2003-09-28, 09:16:56
/submitted/dummy	4	29	2	2013-11-04, 06:38:28
/submitted/dummy	4	42	1	1996-05-13, 22:42:47
/submitted/dummy	4	42	1	2011-09-14, 18:00:51
/submitted/dummy	4	39	5	1995-12-26, 19:24:39
/submitted/dummy	4	2	6	2015-07-15, 23:10:01
/submitted/dummy	4	6	6	1997-09-22, 04:36:50
/submitted/dummy	4	26	6	1995-12-15, 06:49:43
/submitted/dummy	4	39	5	2019-07-11, 18:00:24
/submitted/dummy	4	5	7	2019-04-24, 04:34:38
/submitted/dummy	4	18	3	2006-04-20, 23:37:00
/submitted/dummy	4	33	6	2001-03-30, 11:42:20
/submitted/dummy	4	28	6	1995-08-01, 02:58:09
/submitted/dummy	4	36	6	1995-01-28, 19:12:13
/submitted/dummy	4	34	1	2010-05-14, 11:16:39
/submitted/dummy	4	34	1	2014-07-25, 04:58:40
/submitted/dummy	4	19	7	2020-03-27, 12:25:15
/submitted/dummy	4	43	5	1994-08-01, 10:18:14
/submitted/dummy	4	40	5	1993-06-14, 21:25:39
/submitted/dummy	4	20	4	2008-01-03, 12:27:11
/submitted/dummy	4	4	4	2000-06-06, 14:42:06
/submitted/dummy	4	21	1	2004-12-09, 18:01:47
/submitted/dummy	4	12	2	2010-10-23, 01:20:51
/submitted/dummy	4	20	4	1993-02-20, 17:57:24
/submitted/dummy	4	28	6	2015-09-26, 07:27:48
/submitted/dummy	4	34	1	2001-12-16, 09:32:28
/submitted/dummy	4	4	4	2000-07-03, 08:50:43
/submitted/dummy	4	1	2	2016-08-29, 16:32:24
/submitted/dummy	4	20	4	1993-09-06, 03:55:11
/submitted/dummy	4	6	6	1998-01-25, 04:24:20
/submitted/dummy	4	23	3	2007-10-10, 15:13:11
/submitted/dummy	4	16	6	1996-12-06, 09:17:49
/submitted/dummy	4	22	5	1998-03-04, 12:03:33
/submitted/dummy	4	18	1	2002-12-25, 10:43:56
/submitted/dummy	4	36	6	2021-02-25, 15:38:01
/submitted/dummy	4	17	3	2020-02-21, 12:37:27
/submitted/dummy	4	7	3	2004-08-15, 21:31:14
/submitted/dummy	5	37	1	2015-02-09, 07:20:56
/submitted/dummy	5	23	3	2020-03-12, 17:32:52
/submitted/dummy	5	29	2	2013-09-12, 00:47:38
/submitted/dummy	5	27	3	2005-10-17, 16:36:57
/submitted/dummy	5	12	4	2003-06-11, 03:49:40
/submitted/dummy	5	16	4	2016-07-07, 13:30:01
/submitted/dummy	5	31	5	2018-08-01, 15:12:33
/submitted/dummy	5	39	5	2007-12-13, 01:20:06
/submitted/dummy	5	38	2	2020-01-10, 22:57:01
/submitted/dummy	5	34	1	2007-10-06, 23:23:15
/submitted/dummy	5	37	1	2004-11-30, 06:47:34
/submitted/dummy	5	12	2	2004-10-05, 14:25:00
/submitted/dummy	5	44	5	2012-05-26, 11:41:20
/submitted/dummy	5	38	2	2018-03-11, 07:17:06
/submitted/dummy	5	19	1	2003-11-17, 12:19:40
/submitted/dummy	5	13	6	2003-04-06, 00:10:36
/submitted/dummy	5	41	3	2000-02-02, 18:20:54
/submitted/dummy	5	30	6	1997-08-30, 01:46:34
/submitted/dummy	5	33	6	2010-04-01, 01:01:23
/submitted/dummy	5	43	5	2006-05-05, 22:37:44
/submitted/dummy	5	43	5	1996-09-15, 05:12:05
/submitted/dummy	5	24	7	2001-01-25, 21:30:14
/submitted/dummy	5	29	5	2006-09-21, 10:14:33
/submitted/dummy	5	26	6	1994-03-01, 10:38:31
/submitted/dummy	5	27	3	1995-01-31, 11:26:38
/submitted/dummy	5	11	6	1997-12-14, 08:33:32
/submitted/dummy	5	24	7	2000-09-17, 19:10:46
/submitted/dummy	6	3	7	2001-01-22, 05:55:35
/submitted/dummy	6	36	6	2018-10-31, 06:28:13
/submitted/dummy	6	44	5	1997-12-20, 22:33:18
/submitted/dummy	6	30	6	2019-05-08, 18:41:49
/submitted/dummy	6	2	3	1993-08-24, 21:39:39
/submitted/dummy	6	45	3	2016-01-18, 16:38:50
/submitted/dummy	6	44	3	2006-01-21, 16:11:07
/submitted/dummy	6	15	3	2012-10-13, 19:17:47
/submitted/dummy	6	4	4	2016-09-01, 06:14:01
/submitted/dummy	6	42	1	2012-09-24, 23:06:34
/submitted/dummy	6	11	6	1997-08-04, 07:29:42
/submitted/dummy	6	37	5	2019-01-12, 06:40:19
/submitted/dummy	6	37	1	1997-10-20, 08:47:41
/submitted/dummy	6	15	3	1992-06-14, 00:36:07
/submitted/dummy	6	30	3	1997-03-17, 20:29:10
/submitted/dummy	6	22	5	2004-01-09, 14:30:11
/submitted/dummy	6	6	6	2007-12-18, 07:50:08
/submitted/dummy	6	5	3	2021-01-28, 03:15:15
/submitted/dummy	6	2	3	1999-12-30, 08:07:37
/submitted/dummy	6	45	3	2009-09-13, 14:06:04
/submitted/dummy	6	7	3	2022-02-23, 06:08:09
/submitted/dummy	6	37	5	2014-12-25, 14:23:20
/submitted/dummy	6	36	4	1993-05-11, 12:22:39
/submitted/dummy	6	45	3	2010-05-22, 11:05:33
/submitted/dummy	6	7	7	2022-01-26, 10:04:16
/submitted/dummy	6	42	6	1997-07-19, 10:40:57
/submitted/dummy	6	13	1	1993-03-28, 00:24:56
/submitted/dummy	6	10	3	2006-09-14, 20:37:46
/submitted/dummy	6	8	1	2013-01-27, 04:30:02
/submitted/dummy	6	32	3	1997-08-26, 05:14:45
/submitted/dummy	6	13	6	2020-05-23, 20:41:01
/submitted/dummy	6	3	1	2001-07-30, 18:00:15
/submitted/dummy	6	14	3	2000-05-16, 06:14:57
/submitted/dummy	6	17	4	2011-08-29, 12:28:15
/submitted/dummy	6	13	1	2019-05-23, 09:13:22
/submitted/dummy	6	30	6	1996-02-09, 17:01:12
/submitted/dummy	6	15	3	2002-10-05, 01:03:40
/submitted/dummy	6	45	3	2021-05-12, 01:34:38
/submitted/dummy	7	12	2	2007-10-19, 02:22:37
/submitted/dummy	7	31	5	2008-06-09, 01:41:18
/submitted/dummy	7	33	6	1996-10-31, 05:35:03
/submitted/dummy	7	41	3	2005-10-01, 00:30:39
/submitted/dummy	7	14	3	2020-08-17, 10:21:00
/submitted/dummy	7	30	6	2004-11-22, 17:57:35
/submitted/dummy	7	2	3	1993-03-24, 00:53:25
/submitted/dummy	7	23	3	2017-10-17, 22:11:25
/submitted/dummy	7	14	6	2020-11-13, 22:11:57
/submitted/dummy	7	15	3	2022-03-22, 16:53:52
/submitted/dummy	8	31	5	1995-06-08, 10:04:16
/submitted/dummy	8	4	4	2010-06-26, 05:08:58
/submitted/dummy	8	20	4	1993-11-14, 23:03:16
/submitted/dummy	8	44	5	1992-06-23, 16:40:20
/submitted/dummy	8	21	1	2016-09-16, 13:40:38
/submitted/dummy	8	45	3	2007-08-23, 19:57:37
/submitted/dummy	8	7	7	2011-02-21, 03:25:03
/submitted/dummy	9	25	2	2017-12-27, 18:49:32
/submitted/dummy	9	39	5	2021-10-01, 05:46:44
/submitted/dummy	9	6	6	2001-09-29, 03:27:40
/submitted/dummy	9	1	2	2000-02-07, 01:46:23
/submitted/dummy	9	1	2	2003-12-06, 02:49:57
/submitted/dummy	9	17	4	2005-05-07, 19:48:10
/submitted/dummy	9	12	4	2006-07-13, 07:55:28
/submitted/dummy	9	17	2	2018-11-13, 12:13:19
/submitted/dummy	9	19	7	2001-10-10, 06:46:13
/submitted/dummy	9	34	1	2004-11-10, 18:32:07
/submitted/dummy	9	26	6	2011-09-07, 16:06:25
/submitted/dummy	9	4	4	1997-10-14, 21:23:26
/submitted/dummy	9	18	1	2013-10-13, 12:40:50
/submitted/dummy	9	2	6	2009-06-07, 08:55:55
/submitted/dummy	9	8	4	1998-09-05, 17:00:14
/submitted/dummy	9	2	6	2020-05-04, 00:36:23
/submitted/dummy	9	17	4	2002-02-12, 03:07:45
/submitted/dummy	9	11	6	2000-04-21, 13:58:10
/submitted/dummy	10	34	1	2016-08-11, 12:37:19
/submitted/dummy	10	40	5	1994-07-31, 11:03:17
/submitted/dummy	10	6	6	2021-12-24, 06:27:50
/submitted/dummy	10	19	1	2016-08-29, 04:02:19
/submitted/dummy	10	39	5	1997-12-10, 01:45:14
/submitted/dummy	10	28	6	2007-05-31, 23:55:30
/submitted/dummy	10	24	7	2005-11-19, 10:47:44
/submitted/dummy	10	3	1	1995-03-31, 17:38:02
/submitted/dummy	10	4	4	2003-05-31, 07:50:59
/submitted/dummy	10	33	2	2003-09-08, 00:07:31
/submitted/dummy	10	6	6	2006-01-21, 03:19:02
/submitted/dummy	10	30	3	2003-12-31, 10:50:56
/submitted/dummy	10	36	6	2007-08-03, 11:13:39
/submitted/dummy	10	43	5	1999-02-21, 02:11:26
/submitted/dummy	10	3	7	2012-12-24, 13:50:53
/submitted/dummy	10	7	7	1999-07-23, 04:48:07
/submitted/dummy	10	27	3	2014-12-19, 17:02:01
/submitted/dummy	10	34	1	2003-02-14, 18:49:42
/submitted/dummy	10	20	4	2004-04-03, 11:19:47
/submitted/dummy	10	25	2	2011-08-03, 04:38:37
/submitted/dummy	10	22	5	2010-10-26, 21:54:20
/submitted/dummy	10	29	2	2011-11-04, 23:07:09
/submitted/dummy	10	35	1	1994-06-03, 12:37:38
/submitted/dummy	10	3	1	2005-12-13, 13:22:01
/submitted/dummy	10	38	5	2016-09-30, 00:58:44
/submitted/dummy	10	40	5	2011-02-25, 10:31:33
/submitted/dummy	10	3	7	2010-04-13, 06:00:14
/submitted/dummy	10	43	5	1999-06-12, 17:31:09
/submitted/dummy	10	27	3	2001-08-25, 12:01:31
/submitted/dummy	10	24	7	2011-04-05, 02:41:53
/submitted/dummy	10	28	6	2005-06-29, 08:07:56
/submitted/dummy	10	10	4	2020-09-24, 00:47:47
/submitted/dummy	10	5	1	2017-12-30, 16:52:57
/submitted/dummy	10	28	6	2012-03-14, 00:20:53
/submitted/dummy	10	39	5	1994-12-11, 14:03:59
/submitted/dummy	10	3	7	2015-12-24, 06:15:10
/submitted/dummy	10	24	7	2006-05-09, 01:48:41
/submitted/dummy	10	35	1	2019-01-28, 13:29:53
/submitted/dummy	10	30	3	2014-04-14, 07:12:29
/submitted/dummy	10	38	2	2021-11-14, 10:19:46
/submitted/dummy	10	38	5	2005-12-09, 19:19:14
/submitted/dummy	10	43	5	2010-06-23, 14:45:21
/submitted/dummy	10	33	2	2015-09-26, 08:09:17
/submitted/dummy	10	33	2	2016-02-20, 03:02:37
/submitted/dummy	10	1	5	2002-09-24, 00:30:53
/submitted/dummy	10	18	1	2019-04-27, 23:54:16
/submitted/dummy	10	11	6	2020-04-20, 22:42:40
/submitted/dummy	10	4	4	1996-04-23, 07:39:08
/submitted/dummy	10	37	7	2014-12-02, 12:55:27
\.
COPY submit_results (submit_id, score, status) FROM STDIN;
145	0.39649422669178935	5
221	0.06842345911962588	8
85	0.08657494033977697	7
110	0.41096936908952963	4
262	0.010089230615867306	7
95	0.8763949338247701	2
129	0.059789015882551255	3
28	0.421197914140941	9
148	0.027982805307046	2
255	0.6100748935381584	10
123	0.2340380936249784	8
16	0.12323924079585846	3
44	0.5877938536087752	2
239	0.9251509569635041	9
6	0.38887741482370874	5
181	0.43507806260828463	9
223	0.6653706457240028	1
213	0.2271847746611575	7
5	0.1275937863843557	9
22	0.06406329316805648	7
119	0.26348133290023323	8
91	0.5377249484205412	7
234	0.5880376849154062	5
42	0.4747860237777417	5
250	0.6108766255948829	1
193	0.08816421216102166	1
134	0.14682975338084148	7
75	0.18170027045985426	6
185	0.29975805719790105	1
55	0.13511445045468684	7
21	0.13078852514592842	4
237	0.04801404445272661	1
24	0.21525828114306667	6
285	0.45119942278073344	8
41	0.6268246686423037	5
140	0.7102569851015978	7
207	0.7568733359346808	6
253	0.643581015103587	6
17	0.933832354172305	5
2	0.5948977370252473	3
76	0.880562749021999	5
114	0.9782964829785917	8
168	0.17066865015155552	9
121	0.23483606406246205	4
172	0.2088882763369878	1
261	0.14363447987504552	9
104	0.9250444744350206	5
260	0.526448685891455	8
282	0.800110731497744	9
12	0.0673128589177513	9
264	0.6579415501847412	6
195	0.19046298248579596	7
10	0.9515444839500337	10
228	0.8767214752435732	4
230	0.41577630684893707	4
240	0.8544932646437535	3
227	0.9665471025448207	8
122	0.7374344717994078	8
219	0.5355233882690797	10
284	0.39311233251962785	2
58	0.2268447991527126	1
80	0.5139320323033085	4
84	0.4268470154546865	4
26	0.09190642362862356	7
248	0.4082955395658696	2
45	0.2321544385918588	2
112	0.03500146483646027	6
211	0.49253375491425977	3
275	0.5997797099628646	4
137	0.456225939063042	7
51	0.5600977707256716	6
57	0.4067460492730327	5
97	0.5721092557530131	8
254	0.034627131362850005	5
206	0.4865523862331774	4
30	0.6262410229108883	9
89	0.3873123365101355	1
179	0.9544486716700811	10
131	0.9264199297292318	2
252	0.21697912332951175	8
178	0.6641500887887319	1
267	0.9725833532428851	5
196	0.07249731253431602	8
277	0.9899875456739012	7
35	0.5051590284193659	1
190	0.099174843760784	4
63	0.09791739335918626	7
210	0.006042141880708618	4
149	0.023466415380099526	4
49	0.322724377621583	5
124	0.8153913887700893	2
165	0.6395501904655886	7
102	0.839337168395478	7
215	0.20000518549960344	2
126	0.3431122123484156	4
69	0.8895619941045588	4
105	0.3887027818219697	4
151	0.028374894103740056	2
135	0.562556058648677	7
150	0.5784572591477285	6
180	0.6716248281505813	3
160	0.7911238338513444	1
246	0.4313608892644858	5
205	0.14387574922375856	3
60	0.29969929606600165	3
164	0.1405246183723533	10
115	0.996384002881569	2
73	0.41092319512134845	1
174	0.8921660063336263	8
100	0.08849789832927335	4
266	0.606044284049906	5
156	0.954224018666612	1
241	0.9997105462151913	3
101	0.47894818487573887	10
79	0.22091336457580268	2
9	0.8662886101700449	4
194	0.24498844850536405	9
218	0.8727490819785005	7
132	0.08388194547150885	4
143	0.5258925291861303	10
43	0.33216181901597863	9
147	0.48211084734829146	5
47	0.26533779574679206	8
236	0.12346768522595686	1
36	0.75276765962764	9
158	0.6340309594734179	4
171	0.13783118272091033	8
15	0.28340052853990094	9
138	0.7739070122898839	5
3	0.39637026206445236	4
64	0.510904311694402	2
87	0.3066220884503278	8
113	0.7531263094653441	1
161	0.09777464588909712	7
176	0.36914429769101353	2
288	0.5676404485777592	1
268	0.1364331058766396	1
96	0.5442812230528391	5
8	0.1907958995301796	7
201	0.4497199213388071	5
220	0.6971342768877649	4
175	0.9245209444808503	3
279	0.794893446948328	4
247	0.6023902883564244	6
99	0.38069117636358296	5
204	0.7354072759016389	2
280	0.6147856340524027	3
155	0.04617773170158901	5
184	0.7925963479325789	7
136	0.7305646717255816	5
98	0.30687166682248335	4
19	0.8500503908799536	6
217	0.8427371147829712	4
203	0.013788218817534226	5
118	0.6051024580143001	3
4	0.906283893617388	7
258	0.5024980895921336	9
13	0.1864664530448018	4
167	0.35988339335829556	7
265	0.2591173780147559	3
209	0.7560890218458353	3
197	0.29210576800205545	2
81	0.5836526536641297	3
162	0.4205716812351957	3
231	0.028222174469578754	3
177	0.04507771761834578	1
130	0.6557751290842961	4
18	0.8234042370486435	6
152	0.5306829766155332	1
198	0.48204586635170577	5
199	0.7340445415346462	6
278	0.12897645830814608	6
276	0.6685294966451055	9
62	0.5167171452147616	10
40	0.15589698460127221	4
222	0.431441166886427	10
33	0.17274131977566554	3
32	0.15799262166573702	3
116	0.04209432312765704	7
269	0.7257670454314221	7
133	0.4757363709295004	10
1	0.7581692712400574	5
48	0.04285026202669373	6
259	0.8042382864545675	10
272	0.849029983671844	7
53	0.17239055267980252	3
94	0.3032210153701246	9
46	0.03249820289836436	2
139	0.698877788117676	9
50	0.7245509505473602	3
243	0.4442182091982204	7
188	0.9213483959936917	3
128	0.25793414326703945	4
108	0.758541721174646	7
186	0.29132039380174957	10
242	0.39628270130088594	9
77	0.41908773563813895	6
70	0.9183387909630963	9
153	0.4169005644896454	8
192	0.6808785419178304	2
229	0.20661017586661712	7
29	0.33549040774166383	10
25	0.720476669403713	7
59	0.5867854088199195	2
245	0.07209382606163672	2
52	0.8581530816050527	4
88	0.3959850359924295	6
\.
