SET search_path TO tanuki;
COPY users (login, name, surname, password_hash, email) FROM STDIN;
bgonzalez	Aaron	Gutierrez	$2b$12$jWWxRR/ekm62nrVoybbU6uyfs9phj9bQbndbKyObAb2hyV48LzdSm	bfreeman@example.com
michael96	Nathan	Simon	$2b$12$OzSW1O2E9Xo7pg4G3H/a9uMSZNAEWYQrF.qvUfqswxmqh40oK0LoK	jamesmack@example.org
sarahbrown	Jane	Payne	$2b$12$bNSODRvM9leS6yPePNyQfunqStfqKptjTueanBuaB5ZOiqUAyKzMO	jtran@example.com
ortizalec	David	Goodwin	$2b$12$68YcB5LG7PSXFssMxSHuquKK4tGZg7wMcGZLBC0T20ZIJZEXDJ5sO	reedheather@example.com
tfisher	Harold	Williams	$2b$12$YoxevdxdUWKNAoZ.Uok8j.zxBNeHIhyNKJhH72R8PkmhItX2Ct02K	williamsavage@example.org
archerrobert	Brian	Adams	$2b$12$cKvSy1PpXEZ1kqiVeEBXBurGnC7X0caZ2WjrCkyzLhOkiUEeDkYPe	iball@example.net
jamesthomas	Steven	Hickman	$2b$12$BpmmTVhX6zfSMNnW/2HBHe7GUd.QpdtAS4vEBBWt55dUkYpxUc3hm	schultzscott@example.net
jordanpatricia	Andrew	Henderson	$2b$12$q1G49gHK45XoSYuV2axCeeISzLOaRhzn7XqwMSld8x.YzJlZAFHrK	james07@example.com
maureendiaz	Cassandra	Long	$2b$12$xBpNXxVzCrPUrqTaG6x6zeN5REtPlN.mGwAkd3OV6IwAr9SL728we	egonzalez@example.org
stevendickson	Jason	Smith	$2b$12$FtFnOqk3ygqyW8b0qHkkZ.rNiuB3MH9iBUHb5qrFV7ZnjHe/AmKRC	reidtimothy@example.net
admin	A0	D	$2b$12$ViNHXoL42iv1rbtnDagZM.JoBy1r2klKX/L8KU1Z7Vfj6fGFG7sf.	administracja@tanuki.pl
admin1	A1	D	$2b$12$5r0qcpuhr6y.Ah79eKVhQezBBNgsQgMrpDklo0ESDrCyg6W9jB16y	administracja@tanuki.pl
admin2	A2	D	$2b$12$wpoCXB9a2DK0F45L6yLXT.MIw/rHi90xkFb/XVBJY3rzW2VC3ByB2	administracja@tanuki.pl
admin3	A3	D	$2b$12$idQxbDAlNwx51yOAjpsQA.YD7FIlYU9wNXYK4QumBiVmC6bfHZMKm	administracja@tanuki.pl
admin4	A4	D	$2b$12$hf3.tDNGhhkhbvjopHMQT.5d2q6Vyct0xRS/TlOr3zT3fl4xpyfKi	administracja@tanuki.pl
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
Sound determine foot message.	House agent.	True
Fire mother office food.	Drug.	True
Center president clear dream.	Great us be.	True
Stand table third see real.	Note throw.	True
So own owner group.	Item bag.	True
Debate keep ready.	Kind trip.	True
Successful theory relate.	Bill.	True
Many bad standard same score.	Share too.	True
Air shake heart wait.	Republican.	True
Commercial theory include be.	Best fact.	True
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
5	2	4
3	1	5
8	2	2
6	2	9
10	2	5
2	2	7
6	1	10
5	2	6
6	2	2
8	2	4
7	1	3
7	2	2
9	2	4
4	2	2
2	2	9
5	2	8
3	1	9
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
2	2	4
4	2	6
5	2	3
1	2	1
3	1	4
3	2	3
1	2	10
8	2	1
7	2	8
9	2	10
10	2	7
5	2	5
3	2	5
8	1	7
9	2	3
7	2	10
6	1	2
10	2	9
5	2	7
1	2	5
3	2	7
7	2	3
9	2	5
10	2	2
3	2	9
6	2	8
7	2	5
8	2	10
9	2	7
10	2	4
2	2	6
5	2	2
4	2	8
3	2	2
1	2	9
6	2	1
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
8	2	5
9	2	2
2	2	1
10	2	8
4	2	3
1	2	4
3	2	6
5	2	9
6	2	5
8	2	7
10	2	1
9	1	8
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
COPY problems (name, short_name, contest_id, statement_uri, uses_points, position, points, due_date, closing_date, published, scoring_method, source_limit) FROM STDIN;
Audience suggest Mr.	A	1	/problems/dummy	False	0	0.0	2021-12-10, 13:08:20	2022-01-08, 23:29:58	True	2	98304
No sea like join ready.	B	1	/problems/dummy	False	1	0.2	2023-04-03, 21:23:37	2023-05-04, 17:56:48	True	2	68608
Occur can again right.	C	1	/problems/dummy	True	2	0.2	\N	\N	True	2	36864
Type seek series floor huge.	D	1	/problems/dummy	True	3	0.3	2021-08-15, 15:38:15	2022-11-24, 07:49:32	False	3	19456
By summer will people.	E	1	/problems/dummy	True	4	0.4	2021-09-01, 12:51:18	2022-09-09, 18:52:55	False	1	29696
A make compare bill certain.	F	1	/problems/dummy	True	5	0.3	\N	\N	False	1	28672
Pay religious girl.	G	1	/problems/dummy	True	6	0.2	2022-09-22, 17:31:17	2023-06-07, 17:40:17	True	2	50176
Wonder next local ok what.	H	1	/problems/dummy	True	7	0.1	2022-07-12, 10:29:29	2022-09-25, 20:11:34	False	3	22528
Too from whose.	I	1	/problems/dummy	True	8	0.2	2022-02-26, 02:19:52	2023-01-11, 16:20:57	False	1	17408
Which mission usually case.	A	2	/problems/dummy	False	0	0.4	\N	\N	True	3	66560
Pull girl study play.	A	3	/problems/dummy	False	0	0.1	2023-04-13, 15:16:41	2023-05-28, 08:57:52	True	3	30720
Compare enter buy past.	B	3	/problems/dummy	False	1	0.3	2021-11-29, 20:25:14	2022-08-30, 06:55:23	True	3	14336
Event against begin let.	C	3	/problems/dummy	True	2	0.0	2022-03-10, 19:34:24	2022-11-25, 23:19:55	False	2	88064
Trial meeting level remain.	D	3	/problems/dummy	False	3	0.0	2021-08-14, 02:27:45	2021-12-10, 02:02:07	True	3	52224
Peace mouth quite hundred.	A	4	/problems/dummy	False	0	0.0	2022-04-28, 05:43:13	2023-06-04, 03:26:08	True	3	57344
Others kitchen lawyer.	B	4	/problems/dummy	False	1	0.3	\N	\N	True	3	30720
Cost movement stage exist.	C	4	/problems/dummy	False	2	0.0	2022-06-03, 01:48:13	2023-03-08, 12:21:08	True	3	72704
Push manager figure.	D	4	/problems/dummy	True	3	0.3	2022-08-23, 16:38:08	2022-12-19, 12:53:17	False	2	86016
The so represent often.	E	4	/problems/dummy	False	4	0.0	2022-03-12, 01:10:54	2023-05-17, 15:43:18	True	1	39936
Almost arrive two ten open.	F	4	/problems/dummy	False	5	0.3	2021-12-31, 00:25:16	2023-01-28, 03:33:11	True	3	61440
Health where really.	A	5	/problems/dummy	True	0	0.4	2021-07-18, 23:48:50	2023-01-23, 08:25:54	True	3	28672
Act water teach here.	B	5	/problems/dummy	False	1	0.0	2021-10-17, 19:36:18	2023-06-02, 17:38:59	True	1	62464
Role effort least continue.	C	5	/problems/dummy	True	2	0.2	2022-10-03, 21:27:42	2023-04-22, 13:39:19	True	3	37888
School send recognize.	D	5	/problems/dummy	True	3	0.2	2022-01-25, 18:46:06	2022-07-12, 13:54:42	True	1	13312
Sister across want all.	A	6	/problems/dummy	False	0	0.2	2021-07-18, 15:02:14	2023-01-11, 11:54:06	True	1	23552
Few none per determine.	B	6	/problems/dummy	False	1	0.1	\N	\N	False	1	80896
Space shake back author.	C	6	/problems/dummy	True	2	0.2	2021-12-17, 08:35:33	2022-10-27, 13:57:19	False	3	5120
Protect try late.	D	6	/problems/dummy	True	3	0.1	\N	\N	True	3	32768
Social star street.	A	7	/problems/dummy	True	0	0.3	\N	\N	True	3	84992
My risk bed hold job add.	B	7	/problems/dummy	False	1	0.0	2022-03-16, 18:48:42	2023-04-19, 06:35:25	True	2	56320
Also hundred bar.	C	7	/problems/dummy	False	2	0.1	2022-02-01, 23:28:34	2022-12-30, 22:02:55	True	2	20480
Teacher its family likely.	D	7	/problems/dummy	False	3	0.2	2021-07-22, 10:36:04	2021-12-27, 04:37:16	True	3	87040
Actually term water look.	A	8	/problems/dummy	False	0	0.3	2021-11-01, 06:16:17	2023-04-25, 19:44:12	True	1	98304
Source my blood current.	B	8	/problems/dummy	True	1	0.1	2021-06-20, 05:14:09	2022-11-01, 16:35:16	True	3	33792
Follow in heart.	C	8	/problems/dummy	True	2	0.4	2023-02-10, 06:36:46	2023-03-03, 02:57:09	True	1	20480
To wish life town perform.	D	8	/problems/dummy	False	3	0.4	2022-03-02, 12:49:08	2023-04-01, 07:44:41	True	2	28672
Right put clearly.	E	8	/problems/dummy	True	4	0.2	2021-06-24, 13:04:06	2021-12-16, 12:42:43	True	1	55296
Space as glass.	F	8	/problems/dummy	False	5	0.3	2022-10-11, 20:11:44	2023-01-02, 16:45:19	True	1	12288
Green in first against own.	A	9	/problems/dummy	False	0	0.0	2021-07-25, 12:30:22	2022-12-31, 04:59:00	True	1	50176
War student write side.	A	10	/problems/dummy	False	0	0.2	2022-07-14, 05:44:36	2022-08-29, 11:00:25	True	1	51200
Stand system result space.	B	10	/problems/dummy	True	1	0.1	2022-02-18, 05:05:56	2023-05-18, 12:52:32	True	1	68608
Probably who general instead.	C	10	/problems/dummy	True	2	0.2	2022-01-30, 17:20:42	2023-05-29, 14:17:58	False	3	80896
Voice he return his.	D	10	/problems/dummy	True	3	0.0	\N	\N	True	2	56320
Cold near everything sing.	E	10	/problems/dummy	False	4	0.2	2021-09-11, 09:07:23	2023-01-09, 20:15:13	True	3	24576
Measure dog up current.	F	10	/problems/dummy	False	5	0.1	2022-03-21, 09:31:36	2023-05-06, 08:47:14	True	1	80896
Special big employee morning.	G	10	/problems/dummy	False	6	0.2	2021-11-27, 22:13:46	2022-04-01, 17:37:38	True	3	11264
\.
COPY problem_languages (problem_id, language_id) FROM STDIN;
12	4
36	7
27	4
17	3
42	2
10	6
38	7
40	4
7	1
27	6
30	2
32	5
46	4
24	1
26	7
7	3
18	3
22	3
5	5
28	7
30	4
41	1
33	6
13	3
24	3
6	6
39	3
34	7
3	1
37	3
13	5
35	5
38	4
16	1
20	1
31	1
22	7
12	6
3	3
14	3
23	6
28	2
37	5
13	7
15	4
24	7
35	7
20	3
45	2
3	5
15	6
16	5
18	2
34	4
45	4
5	4
4	6
9	2
44	5
25	1
20	7
21	6
27	3
10	5
2	1
38	6
23	5
43	1
8	1
19	3
33	2
1	6
2	5
29	7
31	4
22	1
19	5
10	2
11	1
15	1
23	2
28	1
8	7
30	7
1	1
9	6
\.
COPY submits (source_uri, user_id, problem_id, language_id, submission_time) FROM STDIN;
/submitted/dummy	1	40	4	1996-09-02, 04:48:50
/submitted/dummy	1	33	6	2012-12-12, 05:43:51
/submitted/dummy	1	3	3	1994-07-18, 11:34:53
/submitted/dummy	1	35	5	2009-10-20, 21:10:52
/submitted/dummy	1	21	6	2015-04-25, 18:12:28
/submitted/dummy	1	24	1	2012-11-08, 00:47:58
/submitted/dummy	1	22	7	2022-06-07, 02:45:00
/submitted/dummy	1	42	2	2004-03-20, 20:46:29
/submitted/dummy	1	8	7	2001-02-21, 09:40:25
/submitted/dummy	1	43	1	2011-01-15, 05:09:36
/submitted/dummy	1	7	1	2001-10-12, 08:59:47
/submitted/dummy	1	18	2	2001-08-19, 04:48:13
/submitted/dummy	1	26	7	1993-05-20, 15:29:28
/submitted/dummy	1	20	3	2014-12-25, 08:05:09
/submitted/dummy	1	5	5	2014-12-06, 14:21:53
/submitted/dummy	1	28	7	2015-09-04, 20:04:09
/submitted/dummy	1	27	6	2015-08-22, 08:06:19
/submitted/dummy	1	43	1	1996-06-27, 20:11:58
/submitted/dummy	1	33	6	2003-07-19, 10:17:54
/submitted/dummy	1	7	1	1993-09-07, 12:45:08
/submitted/dummy	1	21	6	2013-12-08, 05:06:55
/submitted/dummy	1	1	1	2018-10-26, 19:29:47
/submitted/dummy	1	20	1	2017-10-20, 09:48:39
/submitted/dummy	1	43	1	1993-11-19, 12:23:45
/submitted/dummy	1	45	4	2018-03-03, 09:01:52
/submitted/dummy	1	28	2	2009-10-08, 19:37:45
/submitted/dummy	1	41	1	2016-09-10, 07:07:44
/submitted/dummy	1	45	4	2007-11-27, 11:03:01
/submitted/dummy	1	9	6	2009-11-08, 10:39:48
/submitted/dummy	1	24	3	2012-03-25, 18:47:28
/submitted/dummy	1	41	1	1995-11-05, 19:21:35
/submitted/dummy	1	44	5	2022-02-27, 13:36:24
/submitted/dummy	1	37	3	2004-06-08, 19:36:08
/submitted/dummy	1	7	1	2002-04-17, 01:23:14
/submitted/dummy	1	15	1	2006-10-29, 22:43:07
/submitted/dummy	2	31	4	2009-08-30, 08:49:06
/submitted/dummy	2	27	4	1993-12-04, 16:57:52
/submitted/dummy	2	17	3	2014-02-05, 12:37:08
/submitted/dummy	2	10	6	2018-10-30, 04:49:06
/submitted/dummy	2	8	7	2000-04-18, 00:45:51
/submitted/dummy	2	38	7	2016-02-08, 10:30:22
/submitted/dummy	2	39	3	2002-10-30, 14:08:34
/submitted/dummy	3	14	3	1993-09-28, 22:56:52
/submitted/dummy	3	46	4	2020-03-07, 23:20:33
/submitted/dummy	3	6	6	2015-11-09, 15:16:08
/submitted/dummy	3	19	3	2013-10-30, 22:35:58
/submitted/dummy	3	8	7	2016-04-06, 04:54:21
/submitted/dummy	3	34	7	1998-08-29, 21:49:39
/submitted/dummy	3	26	7	2008-02-13, 20:10:12
/submitted/dummy	4	16	1	2004-12-19, 21:48:41
/submitted/dummy	4	30	7	2010-01-01, 10:43:27
/submitted/dummy	4	38	7	2018-04-18, 17:00:15
/submitted/dummy	4	38	6	2022-02-24, 19:57:12
/submitted/dummy	4	19	3	1993-07-06, 05:22:09
/submitted/dummy	4	44	5	1996-06-20, 18:32:27
/submitted/dummy	4	5	5	2021-08-14, 05:24:55
/submitted/dummy	4	28	1	2001-10-21, 17:06:09
/submitted/dummy	4	43	1	2009-05-01, 15:28:18
/submitted/dummy	4	34	7	1995-08-27, 01:27:13
/submitted/dummy	4	27	3	2008-05-10, 11:17:41
/submitted/dummy	5	43	1	1995-09-05, 21:06:14
/submitted/dummy	5	13	3	2015-05-26, 07:03:35
/submitted/dummy	5	16	5	2019-08-15, 20:05:35
/submitted/dummy	5	21	6	2019-03-21, 19:33:43
/submitted/dummy	5	7	1	2011-11-30, 03:10:30
/submitted/dummy	5	26	7	2019-03-02, 04:30:59
/submitted/dummy	5	30	4	2004-11-30, 18:31:11
/submitted/dummy	5	46	4	2021-07-05, 04:29:44
/submitted/dummy	5	31	1	2014-08-01, 18:28:13
/submitted/dummy	5	14	3	1994-04-11, 16:13:27
/submitted/dummy	5	23	5	2003-12-09, 20:50:56
/submitted/dummy	6	5	4	2006-11-06, 11:41:37
/submitted/dummy	6	3	1	1993-09-14, 13:00:56
/submitted/dummy	6	46	4	2006-03-20, 03:42:48
/submitted/dummy	6	15	6	2013-04-10, 03:38:20
/submitted/dummy	6	11	1	1996-06-26, 01:07:36
/submitted/dummy	6	45	4	2003-09-15, 10:26:59
/submitted/dummy	6	18	2	1999-10-13, 23:25:22
/submitted/dummy	6	26	7	2020-10-26, 18:07:39
/submitted/dummy	6	3	3	2008-03-16, 04:07:04
/submitted/dummy	6	2	1	2000-09-16, 07:46:44
/submitted/dummy	6	2	1	2010-04-16, 05:24:45
/submitted/dummy	6	38	6	2010-12-31, 13:01:08
/submitted/dummy	6	10	6	2011-02-15, 13:12:38
/submitted/dummy	6	24	3	2013-06-25, 06:31:39
/submitted/dummy	6	19	3	1993-07-28, 15:39:20
/submitted/dummy	6	46	4	2002-08-25, 10:11:24
/submitted/dummy	6	1	1	2013-10-22, 14:59:36
/submitted/dummy	6	2	5	1994-08-29, 14:12:21
/submitted/dummy	6	45	2	1997-10-12, 15:18:04
/submitted/dummy	6	34	4	2013-10-21, 11:08:11
/submitted/dummy	6	30	7	2002-06-26, 04:41:41
/submitted/dummy	6	35	7	2012-12-31, 04:04:02
/submitted/dummy	6	29	7	2018-01-30, 21:44:01
/submitted/dummy	6	43	1	2015-02-17, 02:41:43
/submitted/dummy	6	42	2	2013-09-25, 07:08:06
/submitted/dummy	6	44	5	2016-03-18, 02:36:20
/submitted/dummy	6	20	3	1997-01-25, 14:44:42
/submitted/dummy	6	12	6	2010-03-18, 12:07:49
/submitted/dummy	6	33	6	1995-10-25, 23:26:15
/submitted/dummy	6	25	1	2013-07-23, 04:58:02
/submitted/dummy	6	32	5	2021-02-25, 02:26:21
/submitted/dummy	6	20	1	1993-10-04, 21:45:37
/submitted/dummy	6	13	5	2011-06-11, 05:54:01
/submitted/dummy	6	32	5	2004-01-18, 19:10:49
/submitted/dummy	6	21	6	1999-07-05, 21:37:46
/submitted/dummy	6	37	5	2000-12-13, 16:12:36
/submitted/dummy	6	39	3	1993-12-10, 22:38:10
/submitted/dummy	6	37	3	2003-12-31, 17:18:32
/submitted/dummy	6	33	2	1993-12-05, 19:04:43
/submitted/dummy	6	9	6	2019-05-30, 06:33:50
/submitted/dummy	6	1	6	2010-10-01, 06:49:44
/submitted/dummy	6	30	7	2005-05-19, 04:28:46
/submitted/dummy	6	34	4	1993-07-27, 08:16:57
/submitted/dummy	6	25	1	2012-10-29, 15:31:21
/submitted/dummy	6	13	5	2015-12-22, 03:22:52
/submitted/dummy	6	27	6	2005-08-22, 07:14:50
/submitted/dummy	6	25	1	1996-07-31, 18:31:39
/submitted/dummy	7	46	4	2008-09-29, 05:59:27
/submitted/dummy	7	29	7	1992-12-06, 21:34:05
/submitted/dummy	7	13	5	1993-04-04, 12:02:37
/submitted/dummy	8	7	1	2003-10-15, 16:44:48
/submitted/dummy	8	40	4	2008-11-15, 16:26:19
/submitted/dummy	8	8	7	1998-09-13, 23:26:47
/submitted/dummy	8	35	7	2021-11-29, 04:59:55
/submitted/dummy	8	28	1	2003-01-25, 23:26:11
/submitted/dummy	8	31	1	2008-11-10, 15:48:15
/submitted/dummy	8	24	1	2017-11-23, 11:34:07
/submitted/dummy	8	3	5	2000-03-28, 22:48:15
/submitted/dummy	8	45	2	2001-11-11, 14:58:02
/submitted/dummy	8	18	2	2021-05-04, 02:47:33
/submitted/dummy	8	7	3	2001-04-13, 03:55:50
/submitted/dummy	8	33	6	2019-03-24, 18:50:20
/submitted/dummy	8	23	6	1999-04-19, 04:50:45
/submitted/dummy	8	8	1	2000-11-19, 19:52:45
/submitted/dummy	8	23	2	1995-06-06, 16:52:58
/submitted/dummy	8	44	5	2021-11-18, 20:55:17
/submitted/dummy	8	9	2	2015-09-08, 21:15:47
/submitted/dummy	8	27	3	1999-05-09, 02:03:45
/submitted/dummy	8	1	1	2006-04-14, 05:36:23
/submitted/dummy	8	6	6	2019-04-19, 13:55:38
/submitted/dummy	8	2	1	2019-05-13, 08:20:42
/submitted/dummy	8	38	4	2021-07-10, 16:20:39
/submitted/dummy	8	41	1	2017-03-29, 18:31:27
/submitted/dummy	8	23	5	2013-07-28, 09:05:21
/submitted/dummy	9	11	1	2011-12-02, 12:39:47
/submitted/dummy	9	12	6	2012-10-31, 16:34:25
/submitted/dummy	9	30	4	2014-09-25, 17:02:42
/submitted/dummy	9	13	7	2003-03-30, 04:45:56
/submitted/dummy	9	40	4	2019-03-20, 10:58:43
/submitted/dummy	9	10	2	1996-05-30, 07:59:25
/submitted/dummy	9	27	4	2021-01-02, 21:39:04
/submitted/dummy	9	30	7	1993-01-16, 18:50:17
/submitted/dummy	9	36	7	2015-11-16, 03:53:40
/submitted/dummy	9	24	1	2006-06-04, 08:35:10
/submitted/dummy	10	23	5	2021-12-01, 04:44:11
/submitted/dummy	10	27	4	2009-01-24, 04:42:06
/submitted/dummy	10	3	1	1997-12-29, 14:58:21
/submitted/dummy	10	26	7	2001-04-21, 13:52:08
/submitted/dummy	10	8	1	2019-09-30, 15:43:10
/submitted/dummy	10	16	1	2019-05-11, 16:58:27
/submitted/dummy	10	45	4	2002-05-19, 09:51:25
/submitted/dummy	10	16	5	2001-08-16, 08:54:18
/submitted/dummy	10	36	7	2020-01-30, 13:39:45
/submitted/dummy	10	20	7	1992-12-08, 02:57:50
/submitted/dummy	10	32	5	2017-11-19, 03:42:09
/submitted/dummy	10	37	3	2005-06-24, 12:38:28
/submitted/dummy	10	7	1	2005-03-20, 06:03:30
/submitted/dummy	10	38	6	2000-11-26, 06:51:36
/submitted/dummy	10	9	2	1997-03-25, 01:30:54
/submitted/dummy	10	17	3	2011-08-31, 03:17:46
/submitted/dummy	10	38	4	2016-08-21, 18:58:10
/submitted/dummy	10	9	6	2009-01-17, 07:17:27
/submitted/dummy	10	15	4	2002-12-21, 15:07:23
/submitted/dummy	10	18	2	2001-02-24, 05:48:29
/submitted/dummy	10	25	1	2020-04-09, 07:02:54
/submitted/dummy	10	32	5	2001-03-06, 02:12:13
/submitted/dummy	10	24	3	1998-03-10, 12:10:45
/submitted/dummy	10	37	3	2017-08-21, 07:07:30
/submitted/dummy	10	28	7	2001-02-08, 02:35:22
/submitted/dummy	10	6	6	2016-03-19, 00:33:07
/submitted/dummy	10	36	7	2006-03-26, 11:13:55
/submitted/dummy	10	22	1	2017-01-18, 18:59:49
/submitted/dummy	10	41	1	2019-03-05, 16:52:47
/submitted/dummy	10	3	1	2020-06-07, 12:16:52
/submitted/dummy	10	25	1	1995-12-30, 05:20:40
/submitted/dummy	10	17	3	1997-04-29, 00:49:56
/submitted/dummy	10	19	5	2006-09-30, 16:26:21
/submitted/dummy	10	6	6	1998-06-09, 02:52:49
\.
COPY task_groups (problem_id, name, requires_all_ok) FROM STDIN;
1	Group 1	True
1	Group 2	True
1	Group 3	False
1	Group 4	True
1	Group 5	True
2	Group 1	True
2	Group 2	False
3	Group 1	True
3	Group 2	False
3	Group 3	False
3	Group 4	True
3	Group 5	False
4	Group 1	True
4	Group 2	True
4	Group 3	True
4	Group 4	True
5	Group 1	False
6	Group 1	True
7	Group 1	True
7	Group 2	True
8	Group 1	True
9	Group 1	False
10	Group 1	True
10	Group 2	False
11	Group 1	False
11	Group 2	False
11	Group 3	True
11	Group 4	False
11	Group 5	True
12	Group 1	True
13	Group 1	False
13	Group 2	True
13	Group 3	True
13	Group 4	True
14	Group 1	True
14	Group 2	False
14	Group 3	False
14	Group 4	True
15	Group 1	True
15	Group 2	False
15	Group 3	True
16	Group 1	False
16	Group 2	True
17	Group 1	False
17	Group 2	True
18	Group 1	False
18	Group 2	True
18	Group 3	True
18	Group 4	True
19	Group 1	True
19	Group 2	False
20	Group 1	False
20	Group 2	False
20	Group 3	False
20	Group 4	True
21	Group 1	False
21	Group 2	True
22	Group 1	False
22	Group 2	False
22	Group 3	True
23	Group 1	False
23	Group 2	False
23	Group 3	True
24	Group 1	False
25	Group 1	True
25	Group 2	False
26	Group 1	True
27	Group 1	False
27	Group 2	True
28	Group 1	False
28	Group 2	True
28	Group 3	False
29	Group 1	False
29	Group 2	False
29	Group 3	True
30	Group 1	False
31	Group 1	True
32	Group 1	True
32	Group 2	False
32	Group 3	True
32	Group 4	False
33	Group 1	False
34	Group 1	False
34	Group 2	True
34	Group 3	True
34	Group 4	True
34	Group 5	True
35	Group 1	False
35	Group 2	True
35	Group 3	False
36	Group 1	True
36	Group 2	True
37	Group 1	False
37	Group 2	True
37	Group 3	False
38	Group 1	True
38	Group 2	False
38	Group 3	False
38	Group 4	False
38	Group 5	False
39	Group 1	True
39	Group 2	True
39	Group 3	True
39	Group 4	True
40	Group 1	False
40	Group 2	False
40	Group 3	True
40	Group 4	True
41	Group 1	True
41	Group 2	False
41	Group 3	False
41	Group 4	True
42	Group 1	False
42	Group 2	True
43	Group 1	True
43	Group 2	False
44	Group 1	False
44	Group 2	True
45	Group 1	False
45	Group 2	True
46	Group 1	True
46	Group 2	True
46	Group 3	False
\.
COPY tasks (task_group, name, test_uri, points, time_limit, memory_limit, show_output) FROM STDIN;
1	Test 0	tasks/category/list/search	1.7	2.4	1024	True
1	Test 1	tasks/list/app/wp-content	2.4	1.3	74752	False
1	Test 2	tasks/tag/tags/search	2.1	0.5	8388608	True
1	Test 3	tasks/explore	2.7	0.5	33554432	True
2	Test 0	tasks/search/categories	2.1	1.7	69632	False
2	Test 1	tasks/category/wp-content/list	2.4	1.8	88064	False
2	Test 2	tasks/search/explore/main	1.6	2.5	71303168	False
3	Test 0	tasks/tags/posts/wp-content	2.3	2.9	35651584	True
3	Test 1	tasks/main/tags/category	2.4	1.1	100663296	True
3	Test 2	tasks/categories/explore	2.0	3.4	13312	True
3	Test 3	tasks/search/posts/search	2.7	2.8	30408704	True
4	Test 0	tasks/explore	2.9	2.2	38797312	True
4	Test 1	tasks/posts/tag/list	1.6	1.7	73400320	False
4	Test 2	tasks/explore/search/categories	1.8	1.5	74448896	False
4	Test 3	tasks/posts/posts	1.4	1.7	80896	False
4	Test 4	tasks/main/tags	2.9	2.6	42991616	True
4	Test 5	tasks/explore	2.2	2.4	23552	False
5	Test 0	tasks/categories/tag	2.4	0.6	99328	False
5	Test 1	tasks/wp-content/wp-content	1.9	2.8	25600	True
5	Test 2	tasks/posts	1.6	0.8	58720256	False
6	Test 0	tasks/posts/tags/explore	1.1	2.2	28672	True
6	Test 1	tasks/explore	1.3	2.4	35840	False
6	Test 2	tasks/list/explore/categories	2.8	1.8	19922944	False
6	Test 3	tasks/search/posts	2.1	2.8	77594624	True
7	Test 0	tasks/explore/search	1.2	1.2	92160	True
7	Test 1	tasks/tag	2.3	1.9	54525952	False
7	Test 2	tasks/app/explore	1.1	2.2	9437184	True
7	Test 3	tasks/posts	1.4	3.3	90177536	False
7	Test 4	tasks/list	1.3	3.4	15360	False
8	Test 0	tasks/tag	2.3	1.9	66060288	False
8	Test 1	tasks/category/tag/tags	1.0	1.6	44040192	False
8	Test 2	tasks/explore	1.7	0.7	84934656	True
8	Test 3	tasks/explore	2.7	3.2	11534336	False
8	Test 4	tasks/wp-content/tags/posts	2.3	3.0	6291456	False
8	Test 5	tasks/app/tags	2.2	1.2	91226112	False
8	Test 6	tasks/list/app	2.6	3.0	61865984	True
8	Test 7	tasks/posts/posts/posts	2.8	1.0	101711872	False
8	Test 8	tasks/tags	2.2	3.2	22020096	True
8	Test 9	tasks/wp-content	2.5	1.3	11264	True
9	Test 0	tasks/explore/wp-content	1.1	0.6	22528	False
9	Test 1	tasks/wp-content	2.7	3.3	72351744	False
9	Test 2	tasks/categories/search/app	2.9	0.9	71680	False
9	Test 3	tasks/explore/category	2.8	2.6	92274688	True
9	Test 4	tasks/tag/search/tag	1.4	2.0	41984	True
9	Test 5	tasks/posts/explore	1.1	3.2	34816	False
9	Test 6	tasks/explore/tag	1.2	1.9	9437184	True
9	Test 7	tasks/categories	2.9	2.8	95232	False
10	Test 0	tasks/main/explore/wp-content	1.6	0.7	20971520	True
10	Test 1	tasks/wp-content/tag	2.5	1.6	30720	False
10	Test 2	tasks/tag/blog	2.9	1.4	104857600	True
10	Test 3	tasks/app/app/main	1.8	2.2	8192	False
10	Test 4	tasks/wp-content/list	2.0	1.7	54525952	False
10	Test 5	tasks/explore/tags	2.6	1.7	30720	False
10	Test 6	tasks/blog	1.2	1.5	18874368	True
10	Test 7	tasks/explore	2.1	1.2	44040192	False
10	Test 8	tasks/list/blog/tags	2.3	1.0	91136	True
11	Test 0	tasks/category	1.6	1.4	30720	False
11	Test 1	tasks/list/categories/main	2.8	1.8	55296	False
11	Test 2	tasks/wp-content/tag/tag	2.5	2.8	53248	True
11	Test 3	tasks/wp-content/blog/categories	1.6	1.6	8388608	False
11	Test 4	tasks/wp-content/tags	2.1	0.9	99328	False
11	Test 5	tasks/app/blog	1.5	3.3	8192	False
11	Test 6	tasks/blog	1.8	2.0	4096	True
11	Test 7	tasks/list	1.2	1.0	87031808	True
12	Test 0	tasks/categories/wp-content	1.0	0.8	43008	False
12	Test 1	tasks/main	1.7	2.0	28672	True
12	Test 2	tasks/posts/explore	2.7	2.9	84934656	True
12	Test 3	tasks/categories	2.9	1.7	62914560	True
13	Test 0	tasks/search/tag/categories	2.8	1.6	27648	False
13	Test 1	tasks/category/tag	2.6	0.5	44040192	True
13	Test 2	tasks/wp-content/wp-content/app	2.3	1.9	102400	True
13	Test 3	tasks/list	1.2	1.4	53477376	False
13	Test 4	tasks/app	1.5	1.8	29360128	False
13	Test 5	tasks/app/tag	2.6	2.2	91136	False
13	Test 6	tasks/wp-content/main/search	2.1	2.4	36700160	False
13	Test 7	tasks/category	1.1	1.4	7168	False
13	Test 8	tasks/posts/main/tags	1.7	1.7	65011712	False
14	Test 0	tasks/explore	1.0	2.3	82837504	True
15	Test 0	tasks/search/explore	1.7	0.8	33554432	True
15	Test 1	tasks/categories	2.7	2.4	13312	False
15	Test 2	tasks/tags/categories/app	1.7	2.0	88080384	True
15	Test 3	tasks/tags	1.7	3.4	32768	False
15	Test 4	tasks/search	2.2	1.0	23068672	False
15	Test 5	tasks/blog	1.4	0.6	71303168	False
15	Test 6	tasks/categories/categories	2.1	2.9	103809024	False
15	Test 7	tasks/search	1.1	0.8	100352	True
16	Test 0	tasks/list	2.0	3.0	83968	True
16	Test 1	tasks/app/main/explore	1.2	0.9	5120	True
16	Test 2	tasks/app/tag	2.6	1.8	98566144	True
16	Test 3	tasks/blog/list	1.3	0.9	13631488	False
16	Test 4	tasks/main/tag/search	2.1	1.2	62464	False
16	Test 5	tasks/main	1.1	1.2	53477376	True
16	Test 6	tasks/list/posts/app	2.5	1.4	23068672	True
16	Test 7	tasks/category/posts/posts	2.2	2.2	13631488	False
16	Test 8	tasks/main/main/tag	1.3	2.6	29360128	True
17	Test 0	tasks/search/search	2.0	2.3	60416	False
17	Test 1	tasks/posts/tags	2.9	1.6	50331648	True
17	Test 2	tasks/list/search	2.6	3.0	22528	True
17	Test 3	tasks/posts/categories/app	2.5	2.1	31457280	True
17	Test 4	tasks/categories/tag	1.2	2.8	18874368	True
18	Test 0	tasks/category/explore	1.3	0.6	96468992	True
19	Test 0	tasks/explore	1.8	3.4	81920	False
19	Test 1	tasks/category/app/blog	1.5	1.6	68608	True
19	Test 2	tasks/tags/main	1.3	1.7	84934656	False
19	Test 3	tasks/tag/blog/list	1.2	1.7	74448896	False
19	Test 4	tasks/blog	1.4	3.2	72351744	True
19	Test 5	tasks/main	2.6	1.1	80740352	False
19	Test 6	tasks/category/app	1.8	3.3	84934656	True
20	Test 0	tasks/list	2.7	2.2	51380224	False
20	Test 1	tasks/main	2.0	2.9	93184	True
20	Test 2	tasks/tags/tags/list	1.5	2.0	22528	False
21	Test 0	tasks/explore/list/main	2.8	2.9	100663296	False
21	Test 1	tasks/search	2.8	3.4	102760448	False
21	Test 2	tasks/category	1.2	2.6	98566144	True
21	Test 3	tasks/tags/categories/posts	1.1	3.2	40960	False
21	Test 4	tasks/categories/explore/wp-content	1.0	1.6	13312	True
21	Test 5	tasks/posts/wp-content	2.9	1.7	41943040	False
22	Test 0	tasks/tag	2.6	3.3	49283072	False
23	Test 0	tasks/wp-content	2.4	3.2	4194304	True
23	Test 1	tasks/posts/category	2.1	2.2	44040192	False
23	Test 2	tasks/app/categories/main	1.1	2.3	73400320	True
23	Test 3	tasks/app/main	1.1	1.0	49152	False
23	Test 4	tasks/explore/tag/category	1.1	2.2	94371840	False
23	Test 5	tasks/category/categories/categories	2.6	1.4	14680064	True
23	Test 6	tasks/category	1.8	3.2	11534336	False
24	Test 0	tasks/search/list	2.4	2.7	72704	False
24	Test 1	tasks/category/tags/wp-content	2.5	2.3	39936	True
24	Test 2	tasks/blog	1.8	3.2	41984	True
24	Test 3	tasks/app/search/list	1.2	2.5	5120	False
25	Test 0	tasks/tags/main/wp-content	1.8	2.8	16384	False
25	Test 1	tasks/app	1.5	3.3	35840	False
25	Test 2	tasks/explore	2.1	1.0	80896	True
25	Test 3	tasks/main	1.8	0.8	6291456	True
25	Test 4	tasks/app/search	1.7	1.4	46080	False
25	Test 5	tasks/wp-content	2.6	2.2	73400320	False
26	Test 0	tasks/posts/wp-content	1.9	2.8	90112	False
26	Test 1	tasks/main	1.0	0.7	97517568	True
26	Test 2	tasks/tags	2.8	2.0	27262976	True
26	Test 3	tasks/search/wp-content/tag	2.1	2.9	80740352	False
26	Test 4	tasks/category	2.8	0.8	24117248	True
26	Test 5	tasks/posts	2.9	1.6	99328	True
27	Test 0	tasks/blog/wp-content	1.9	1.5	24117248	False
27	Test 1	tasks/blog/posts/main	2.3	3.2	82944	True
27	Test 2	tasks/categories/search	2.0	0.7	88080384	False
27	Test 3	tasks/tags/app/list	2.5	2.5	87031808	True
27	Test 4	tasks/tags/list/posts	2.7	2.6	50331648	True
27	Test 5	tasks/list/blog	2.2	2.5	36864	False
27	Test 6	tasks/main/app/categories	1.9	3.0	12582912	True
27	Test 7	tasks/category/app/blog	1.1	0.9	59392	True
27	Test 8	tasks/category/main	2.8	2.4	23552	True
27	Test 9	tasks/wp-content/tag	2.5	2.1	51200	True
28	Test 0	tasks/category/category/blog	2.3	0.5	50176	False
28	Test 1	tasks/main/blog/tags	1.6	2.6	60416	True
28	Test 2	tasks/tag/wp-content/category	2.8	1.1	99328	False
28	Test 3	tasks/categories/search	1.2	2.2	18432	False
28	Test 4	tasks/explore	1.3	2.6	19456	False
28	Test 5	tasks/blog/list	1.2	1.9	79691776	True
28	Test 6	tasks/category	1.1	3.3	65536	True
28	Test 7	tasks/category	1.2	1.7	4194304	True
29	Test 0	tasks/blog/wp-content/explore	1.6	3.0	82944	False
29	Test 1	tasks/search/blog	1.1	1.6	97280	True
29	Test 2	tasks/tags/tags	1.3	1.2	78643200	True
29	Test 3	tasks/tag/wp-content	2.5	1.4	6291456	True
29	Test 4	tasks/tags/main	1.0	1.3	75776	False
29	Test 5	tasks/search/search	1.9	0.6	30408704	False
30	Test 0	tasks/categories/wp-content/main	2.9	1.3	64512	False
30	Test 1	tasks/categories/category/explore	2.3	2.0	81788928	True
30	Test 2	tasks/category	1.7	0.8	87031808	False
30	Test 3	tasks/tag/tag/wp-content	1.1	2.0	42991616	True
31	Test 0	tasks/categories	1.7	1.9	53248	False
32	Test 0	tasks/wp-content/blog	2.8	0.5	61440	False
32	Test 1	tasks/app	1.9	2.9	73400320	False
33	Test 0	tasks/categories/categories	1.9	2.0	35651584	True
33	Test 1	tasks/main/blog	1.0	2.6	83968	False
33	Test 2	tasks/wp-content	2.0	0.7	2048	True
33	Test 3	tasks/tags	1.3	2.0	5242880	True
33	Test 4	tasks/search	1.3	0.9	20480	False
33	Test 5	tasks/list/categories	1.6	1.0	77594624	False
33	Test 6	tasks/wp-content/categories/tags	1.7	1.5	70254592	True
33	Test 7	tasks/search	2.6	2.5	56623104	True
33	Test 8	tasks/app/tag/tags	2.1	2.4	87040	True
33	Test 9	tasks/explore/main	2.6	2.7	59768832	False
34	Test 0	tasks/app/tag/wp-content	2.3	1.5	61865984	False
34	Test 1	tasks/main/app	1.3	2.4	33554432	False
34	Test 2	tasks/wp-content/main	1.1	1.3	35840	True
34	Test 3	tasks/blog/category	2.6	2.0	45088768	True
35	Test 0	tasks/tags/category/categories	2.0	1.0	45056	True
36	Test 0	tasks/posts	1.6	1.2	38797312	True
36	Test 1	tasks/blog	1.9	1.4	76546048	False
36	Test 2	tasks/tag/categories	2.7	3.0	100352	True
36	Test 3	tasks/list	2.1	2.7	1024	False
36	Test 4	tasks/category/list	2.0	1.8	37888	True
36	Test 5	tasks/tag/categories	2.5	2.1	16777216	False
37	Test 0	tasks/main	2.6	1.8	1024	True
37	Test 1	tasks/tag/main/app	1.1	0.7	12582912	False
38	Test 0	tasks/tags/categories/blog	1.3	2.6	25165824	True
38	Test 1	tasks/main/search/explore	1.2	3.4	18874368	False
38	Test 2	tasks/posts	2.0	1.4	45088768	False
38	Test 3	tasks/category	1.0	2.4	81788928	True
39	Test 0	tasks/tag/explore/explore	2.3	0.7	11534336	True
39	Test 1	tasks/app/list	2.2	3.3	25165824	False
39	Test 2	tasks/wp-content	1.9	1.2	94371840	False
39	Test 3	tasks/category/category/main	1.1	0.9	40894464	False
40	Test 0	tasks/category	1.3	3.4	54525952	False
40	Test 1	tasks/main	2.7	0.9	87031808	False
40	Test 2	tasks/posts	2.1	2.9	40960	False
40	Test 3	tasks/tag/wp-content/blog	1.1	2.8	51200	True
40	Test 4	tasks/category/tags	2.2	2.7	19922944	True
40	Test 5	tasks/tags	1.0	1.7	17408	False
41	Test 0	tasks/tags/explore/tags	2.9	3.2	30408704	True
41	Test 1	tasks/category/explore	1.9	0.7	11264	False
41	Test 2	tasks/blog	1.5	2.2	23552	False
41	Test 3	tasks/categories/explore/blog	1.6	2.6	31457280	True
41	Test 4	tasks/app/tag/app	2.6	0.9	20971520	False
41	Test 5	tasks/tags/main	1.8	2.4	5120	False
41	Test 6	tasks/tags	2.6	1.6	94208	False
42	Test 0	tasks/app/category	2.0	2.1	75776	False
42	Test 1	tasks/main/explore	2.2	1.9	27648	True
42	Test 2	tasks/tag/main	1.8	1.5	51200	True
42	Test 3	tasks/posts/tags	1.8	0.7	10485760	True
42	Test 4	tasks/tag/blog/wp-content	2.6	1.4	24117248	False
43	Test 0	tasks/list	2.2	1.2	22528	True
43	Test 1	tasks/search	2.9	2.8	58368	False
43	Test 2	tasks/tags/app/explore	1.7	3.0	13312	True
43	Test 3	tasks/search/explore/list	1.5	1.0	7168	False
43	Test 4	tasks/explore	2.4	0.7	8388608	False
43	Test 5	tasks/categories/blog	2.4	0.6	82837504	True
44	Test 0	tasks/blog	1.6	2.3	104857600	False
44	Test 1	tasks/categories/category	1.5	2.3	37888	True
44	Test 2	tasks/category/blog	2.6	0.9	67108864	False
44	Test 3	tasks/tag/category/main	2.6	1.3	7168	True
45	Test 0	tasks/search	2.0	1.0	19922944	True
45	Test 1	tasks/list/posts/wp-content	2.6	1.8	50331648	True
45	Test 2	tasks/category/tag/main	1.7	3.4	102760448	False
45	Test 3	tasks/search	1.9	1.0	103809024	True
45	Test 4	tasks/explore/blog	1.8	1.0	95232	True
45	Test 5	tasks/tag/search/main	1.5	1.2	51380224	True
45	Test 6	tasks/app/wp-content/posts	1.3	3.4	72351744	True
45	Test 7	tasks/categories/search	1.0	3.0	100663296	False
45	Test 8	tasks/app/wp-content/explore	1.8	3.4	55296	False
46	Test 0	tasks/category/search	1.4	1.8	51380224	False
46	Test 1	tasks/tag/wp-content	2.8	1.5	75776	True
46	Test 2	tasks/tag/blog	1.8	3.3	27262976	False
46	Test 3	tasks/explore	2.2	2.2	52224	True
46	Test 4	tasks/blog	1.5	2.8	79691776	False
46	Test 5	tasks/search/search	1.0	2.1	63963136	True
46	Test 6	tasks/tags/category/tag	2.7	2.8	89128960	True
46	Test 7	tasks/app/blog/categories	1.9	0.7	90112	True
46	Test 8	tasks/posts	1.0	2.8	83968	True
47	Test 0	tasks/tags/blog/tag	1.1	2.8	88080384	True
47	Test 1	tasks/blog/categories/explore	1.3	1.9	98566144	True
47	Test 2	tasks/tag/app/list	2.8	1.7	68157440	True
47	Test 3	tasks/search/list	2.9	2.9	78643200	False
47	Test 4	tasks/search/category	1.2	1.6	66060288	True
47	Test 5	tasks/tags	1.9	3.0	26214400	True
48	Test 0	tasks/main/tags	1.7	1.4	11534336	False
49	Test 0	tasks/categories/tags/category	1.9	1.3	97517568	False
49	Test 1	tasks/categories/tag/posts	1.1	2.2	91226112	False
49	Test 2	tasks/posts/tags	1.1	0.9	65011712	True
49	Test 3	tasks/list/posts/wp-content	2.9	2.0	4096	True
49	Test 4	tasks/main/search/wp-content	1.5	1.8	38797312	False
49	Test 5	tasks/app/category/category	1.3	1.6	59768832	True
49	Test 6	tasks/posts/wp-content	1.9	0.7	15360	False
49	Test 7	tasks/tag/tag/category	1.8	1.1	61440	False
49	Test 8	tasks/explore/main/category	2.7	0.8	57344	True
50	Test 0	tasks/category/main	2.3	0.8	54525952	False
50	Test 1	tasks/blog	2.1	1.7	95420416	True
51	Test 0	tasks/posts	2.0	0.8	99328	False
51	Test 1	tasks/main/posts	2.5	1.3	80740352	False
51	Test 2	tasks/posts/list	2.5	2.5	75497472	True
52	Test 0	tasks/blog/wp-content/list	2.2	0.8	44032	False
52	Test 1	tasks/list/categories	2.4	0.5	88080384	True
52	Test 2	tasks/blog/category/tags	1.7	2.6	78643200	False
52	Test 3	tasks/list/explore/list	1.3	3.2	16384	False
52	Test 4	tasks/wp-content/wp-content/app	2.3	3.0	26624	True
53	Test 0	tasks/main	1.0	1.9	37748736	False
53	Test 1	tasks/main	1.4	0.7	83968	True
53	Test 2	tasks/categories/explore/wp-content	1.5	1.5	52428800	True
53	Test 3	tasks/category/posts/posts	1.2	1.6	39936	False
53	Test 4	tasks/blog/posts	2.4	0.8	55574528	True
54	Test 0	tasks/search	2.8	1.8	19456	False
54	Test 1	tasks/categories	1.6	2.1	38912	False
54	Test 2	tasks/posts/category	2.1	2.2	79691776	False
55	Test 0	tasks/tags	2.0	1.0	74752	True
55	Test 1	tasks/main	2.5	2.1	37888	False
55	Test 2	tasks/main	1.7	2.6	68157440	True
55	Test 3	tasks/app/wp-content	2.0	2.8	65011712	True
55	Test 4	tasks/search	2.9	2.0	13312	False
55	Test 5	tasks/explore/search/posts	1.1	0.7	15728640	True
55	Test 6	tasks/blog	2.5	2.0	59392	False
55	Test 7	tasks/search	2.1	2.6	3072	False
55	Test 8	tasks/wp-content	2.2	3.1	64512	True
55	Test 9	tasks/tags	1.0	0.8	94371840	False
56	Test 0	tasks/wp-content/search	2.9	0.5	93184	False
56	Test 1	tasks/main/explore	2.3	0.8	17408	True
56	Test 2	tasks/blog/category	2.7	0.5	41943040	True
56	Test 3	tasks/app/tags/categories	1.2	1.9	95232	False
56	Test 4	tasks/posts/app/category	1.1	3.4	61440	False
56	Test 5	tasks/tags/main	1.6	3.1	10485760	False
57	Test 0	tasks/wp-content	1.4	1.7	89088	True
57	Test 1	tasks/explore	2.0	1.8	26624	True
58	Test 0	tasks/app/wp-content/posts	1.8	0.6	63963136	True
58	Test 1	tasks/search/tags/tags	1.2	3.2	96256	True
58	Test 2	tasks/posts	2.4	2.3	13312	True
58	Test 3	tasks/tags	1.9	0.8	95232	False
58	Test 4	tasks/search/tags	1.1	1.6	16384	True
58	Test 5	tasks/search/main	1.9	2.9	7168	True
58	Test 6	tasks/app/categories	1.2	3.1	57671680	False
58	Test 7	tasks/tags/categories/category	1.2	1.9	14680064	False
58	Test 8	tasks/wp-content	2.5	1.1	9437184	True
59	Test 0	tasks/tags/tag/tag	1.6	0.9	42991616	False
60	Test 0	tasks/categories/main	2.7	1.2	13631488	False
60	Test 1	tasks/search/tag/tag	2.3	1.6	10240	False
60	Test 2	tasks/app	2.5	3.0	60817408	True
60	Test 3	tasks/tags/wp-content/search	1.6	2.7	11534336	False
61	Test 0	tasks/explore	1.7	1.9	9216	True
61	Test 1	tasks/wp-content	2.8	1.2	33792	True
61	Test 2	tasks/tags/explore/tag	1.4	2.1	96468992	False
61	Test 3	tasks/tags/tags	2.0	1.5	95232	True
61	Test 4	tasks/posts/tag	1.0	2.4	29696	False
61	Test 5	tasks/posts/tags	2.1	0.8	76546048	False
61	Test 6	tasks/tag	1.3	0.8	45056	False
62	Test 0	tasks/app/tag/category	1.6	2.1	96256	True
62	Test 1	tasks/blog/tags/tag	2.6	3.4	13631488	True
62	Test 2	tasks/wp-content	2.6	0.8	94208	True
62	Test 3	tasks/category	2.5	0.6	20971520	False
62	Test 4	tasks/list	1.5	2.9	90177536	True
62	Test 5	tasks/posts/tags/app	1.5	1.3	94371840	True
63	Test 0	tasks/main/blog	1.7	2.0	98566144	False
64	Test 0	tasks/categories/app/main	1.5	3.4	4096	True
64	Test 1	tasks/categories	2.2	1.1	84992	True
64	Test 2	tasks/search/explore/categories	2.4	1.1	80896	True
64	Test 3	tasks/app	1.4	0.9	68157440	True
64	Test 4	tasks/tags	1.4	3.3	48128	True
65	Test 0	tasks/tag	2.7	1.0	58720256	False
65	Test 1	tasks/tag	2.1	2.0	68608	False
65	Test 2	tasks/list/category/tags	1.6	3.1	25600	False
65	Test 3	tasks/categories/wp-content/categories	1.8	1.3	97517568	True
65	Test 4	tasks/categories/explore/main	2.0	1.1	102760448	True
65	Test 5	tasks/categories	2.0	2.1	36864	False
65	Test 6	tasks/category	2.4	2.3	24117248	False
65	Test 7	tasks/search	2.1	2.8	45056	False
66	Test 0	tasks/wp-content	2.1	2.9	43008	False
66	Test 1	tasks/search	1.4	1.7	5120	True
66	Test 2	tasks/explore/category/app	1.2	2.0	19922944	False
66	Test 3	tasks/wp-content/wp-content/explore	1.9	2.9	87040	False
66	Test 4	tasks/list/wp-content/search	2.4	1.8	49152	True
67	Test 0	tasks/categories/list	1.5	2.7	24576	False
67	Test 1	tasks/tags/app	1.2	0.6	87031808	True
67	Test 2	tasks/tag/list/explore	2.8	0.5	37888	True
67	Test 3	tasks/main	2.1	0.6	42991616	True
67	Test 4	tasks/list/tags/blog	2.3	1.2	18432	False
68	Test 0	tasks/tags/app/category	1.8	0.8	27648	True
68	Test 1	tasks/category/tag/main	2.1	2.6	95420416	True
68	Test 2	tasks/posts	2.4	3.4	16777216	False
68	Test 3	tasks/tags/posts/tags	1.6	2.3	37888	True
68	Test 4	tasks/posts/list/list	2.0	3.0	83968	True
68	Test 5	tasks/explore/category/explore	2.2	0.6	12288	False
68	Test 6	tasks/main/wp-content/explore	2.6	3.3	99614720	True
69	Test 0	tasks/search	2.1	2.7	18432	True
69	Test 1	tasks/search/search/explore	2.2	3.1	56623104	True
69	Test 2	tasks/category	2.8	2.1	92274688	True
69	Test 3	tasks/posts/posts	2.4	0.6	56320	True
70	Test 0	tasks/explore	1.3	3.2	18874368	True
70	Test 1	tasks/categories/tags	2.0	3.2	44032	True
70	Test 2	tasks/tag/tags/main	2.4	2.0	8192	False
70	Test 3	tasks/categories/explore/wp-content	2.1	2.3	30408704	True
70	Test 4	tasks/explore	2.7	1.5	4096	False
70	Test 5	tasks/blog/main	1.0	2.5	104857600	True
70	Test 6	tasks/main/tags/tags	2.4	1.0	36700160	False
71	Test 0	tasks/tags/blog/list	2.5	1.6	30720	False
71	Test 1	tasks/list/main	2.0	2.4	36864	False
71	Test 2	tasks/categories	1.7	2.9	7168	True
71	Test 3	tasks/category	2.0	3.2	100663296	True
71	Test 4	tasks/tags/tags	1.6	0.5	14680064	True
72	Test 0	tasks/posts/blog/wp-content	1.1	1.5	24576	True
72	Test 1	tasks/main/tag	1.1	2.9	68608	False
72	Test 2	tasks/explore	2.4	2.5	7340032	True
72	Test 3	tasks/wp-content/posts/list	2.0	3.3	70656	False
72	Test 4	tasks/tags/category/wp-content	1.5	1.1	89128960	True
73	Test 0	tasks/tag	1.1	0.5	77824	False
73	Test 1	tasks/category/category	1.4	0.5	79691776	True
73	Test 2	tasks/main	1.8	2.0	75497472	False
74	Test 0	tasks/blog	1.9	1.2	18874368	False
74	Test 1	tasks/app/blog/tags	1.0	2.3	60817408	False
74	Test 2	tasks/tag/wp-content	1.2	1.8	19456	True
74	Test 3	tasks/wp-content/app	2.1	2.8	75776	False
74	Test 4	tasks/categories/category	2.3	0.9	80740352	False
74	Test 5	tasks/main	1.4	2.5	26624	False
74	Test 6	tasks/explore/list/blog	2.9	2.4	1024	False
74	Test 7	tasks/main/list/explore	1.6	0.7	19456	False
74	Test 8	tasks/category/list/blog	1.8	0.7	98566144	False
74	Test 9	tasks/app	1.1	1.0	19922944	False
75	Test 0	tasks/categories/posts	1.5	3.2	26624	True
75	Test 1	tasks/main	2.5	3.2	100352	False
75	Test 2	tasks/main	1.1	2.0	68157440	True
75	Test 3	tasks/app	1.6	1.7	13631488	False
75	Test 4	tasks/posts/categories/search	2.0	0.5	99614720	False
75	Test 5	tasks/posts/explore/list	2.6	1.8	68608	False
75	Test 6	tasks/list/tags/tag	1.4	3.1	78643200	True
75	Test 7	tasks/categories/tag/wp-content	2.4	2.7	76546048	True
75	Test 8	tasks/search	1.5	3.3	14680064	False
76	Test 0	tasks/list	2.7	1.9	47185920	False
77	Test 0	tasks/tag/list	2.9	1.9	72704	True
77	Test 1	tasks/categories	2.9	1.1	53248	True
77	Test 2	tasks/main/tags	1.6	1.2	72351744	True
77	Test 3	tasks/main/search/search	2.2	1.2	17825792	True
77	Test 4	tasks/categories/blog	1.5	2.2	68608	True
78	Test 0	tasks/tag	2.8	3.4	38912	True
79	Test 0	tasks/app/app/search	2.7	3.0	41943040	True
79	Test 1	tasks/explore/list/list	2.8	3.3	47185920	True
79	Test 2	tasks/wp-content/categories/category	2.6	1.6	38797312	False
80	Test 0	tasks/wp-content/category	2.3	1.4	103809024	True
80	Test 1	tasks/main/list	2.8	2.5	15728640	False
80	Test 2	tasks/tag	2.5	1.9	22528	True
80	Test 3	tasks/blog/app/explore	1.1	2.0	100352	False
80	Test 4	tasks/search/tag/blog	1.8	1.0	77594624	True
80	Test 5	tasks/app/explore/explore	1.6	2.7	86016	True
80	Test 6	tasks/list/posts	2.6	2.2	31457280	True
80	Test 7	tasks/list	1.5	0.6	18874368	True
80	Test 8	tasks/main	1.9	1.3	8388608	False
80	Test 9	tasks/categories/main	1.9	3.0	19456	False
81	Test 0	tasks/list/tags/posts	2.2	1.6	15728640	True
81	Test 1	tasks/app	2.5	3.2	9437184	True
82	Test 0	tasks/wp-content/categories	2.3	0.8	16777216	True
82	Test 1	tasks/tag	2.0	0.9	12582912	True
83	Test 0	tasks/category/posts/category	2.9	3.4	51380224	False
83	Test 1	tasks/app/explore	1.9	1.2	37748736	True
83	Test 2	tasks/posts/blog	2.1	1.9	40894464	False
83	Test 3	tasks/posts	1.1	3.4	43008	False
83	Test 4	tasks/main/posts	2.1	1.7	30720	False
83	Test 5	tasks/category/posts	1.1	2.6	2048	True
83	Test 6	tasks/main/main	2.5	1.0	70656	False
84	Test 0	tasks/list/wp-content	2.5	2.0	11264	False
84	Test 1	tasks/app	2.3	3.4	99328	False
85	Test 0	tasks/blog	2.9	0.6	56623104	False
85	Test 1	tasks/blog	2.1	0.7	54525952	False
85	Test 2	tasks/categories	1.8	0.5	42991616	True
86	Test 0	tasks/tag/app/tags	1.8	3.0	83886080	False
87	Test 0	tasks/app/tags	1.1	0.7	96468992	True
87	Test 1	tasks/posts/search/posts	1.6	2.1	6144	False
87	Test 2	tasks/explore	1.1	1.2	69206016	True
87	Test 3	tasks/search/app	2.3	2.9	8388608	False
87	Test 4	tasks/categories	2.8	2.1	41984	False
87	Test 5	tasks/tag	2.0	2.4	17825792	True
87	Test 6	tasks/main/main	1.4	1.2	49152	False
87	Test 7	tasks/categories/posts/list	1.3	0.6	4096	False
87	Test 8	tasks/search/main	2.8	2.3	83886080	True
88	Test 0	tasks/categories/blog/main	1.2	2.0	12582912	True
88	Test 1	tasks/wp-content/blog/main	1.5	1.4	19922944	False
88	Test 2	tasks/category/category/categories	1.9	2.2	60416	True
88	Test 3	tasks/tag/posts	1.4	1.4	77594624	False
88	Test 4	tasks/tags	1.2	0.5	25165824	False
89	Test 0	tasks/explore/main	2.7	1.5	12288	True
89	Test 1	tasks/explore	2.5	1.4	92274688	True
90	Test 0	tasks/main/categories	1.4	0.8	78643200	True
90	Test 1	tasks/search	1.6	1.5	41943040	True
90	Test 2	tasks/list/category	2.0	1.0	12582912	True
91	Test 0	tasks/blog	1.7	3.3	34603008	True
91	Test 1	tasks/search/main/app	2.7	1.5	41943040	True
92	Test 0	tasks/explore	2.5	3.3	63488	True
92	Test 1	tasks/categories/list/tag	2.3	0.8	39936	False
92	Test 2	tasks/blog/main/list	1.6	2.5	43008	False
92	Test 3	tasks/explore/categories	1.7	2.0	68608	True
92	Test 4	tasks/tag	2.6	2.6	43008	False
92	Test 5	tasks/explore/tags/posts	1.2	1.3	80740352	True
92	Test 6	tasks/main	2.5	1.8	23552	False
93	Test 0	tasks/list/search	2.2	1.5	80740352	True
93	Test 1	tasks/list	2.8	1.1	104857600	False
93	Test 2	tasks/tag/posts	1.1	1.9	83886080	True
93	Test 3	tasks/category/wp-content	2.8	3.0	31744	False
93	Test 4	tasks/main/wp-content/wp-content	1.0	2.7	51380224	True
93	Test 5	tasks/tag/posts/wp-content	1.3	1.0	50176	True
93	Test 6	tasks/app	2.6	1.0	65536	True
93	Test 7	tasks/wp-content/main/posts	2.1	3.2	51380224	False
93	Test 8	tasks/app	1.0	0.8	37888	True
94	Test 0	tasks/app/list	2.4	0.9	55574528	True
94	Test 1	tasks/wp-content/blog	1.7	3.2	51380224	True
94	Test 2	tasks/tag/blog	2.2	1.0	1048576	True
94	Test 3	tasks/categories	2.6	2.8	67108864	True
94	Test 4	tasks/explore/category	2.3	2.6	50331648	True
94	Test 5	tasks/wp-content/blog/tags	1.1	1.2	65536	False
95	Test 0	tasks/blog/posts/posts	1.3	2.2	55296	False
95	Test 1	tasks/search	2.0	2.9	56623104	False
95	Test 2	tasks/category/categories	2.3	0.8	93184	False
95	Test 3	tasks/search/list/blog	1.1	0.8	48128	True
95	Test 4	tasks/blog	2.5	3.4	100352	True
96	Test 0	tasks/posts	2.0	1.7	69206016	True
96	Test 1	tasks/posts/explore/tag	2.3	3.2	22528	False
97	Test 0	tasks/list/list/tags	1.0	0.6	58720256	False
97	Test 1	tasks/main	1.1	2.9	72351744	True
97	Test 2	tasks/categories/main/blog	1.1	1.6	81920	False
97	Test 3	tasks/app/categories	1.0	1.8	7168	True
97	Test 4	tasks/categories/categories/search	1.5	1.5	62464	False
97	Test 5	tasks/posts/search	1.7	0.6	24117248	False
97	Test 6	tasks/tags/explore	2.9	3.1	86016	False
97	Test 7	tasks/categories	2.9	2.2	35840	True
98	Test 0	tasks/app/main/app	1.0	0.7	82837504	True
98	Test 1	tasks/app/categories/explore	1.6	2.4	65536	True
98	Test 2	tasks/app/tags	1.4	1.7	63488	True
98	Test 3	tasks/tags/search	1.5	1.0	100352	False
98	Test 4	tasks/wp-content/explore	2.0	1.8	1024	False
98	Test 5	tasks/search	1.8	2.7	97517568	False
98	Test 6	tasks/tags/categories	1.5	1.0	32505856	True
98	Test 7	tasks/wp-content/tag	1.2	2.5	99328	False
99	Test 0	tasks/tags/category	2.1	1.0	55296	False
99	Test 1	tasks/search	2.6	2.0	49152	False
100	Test 0	tasks/explore	1.7	1.3	38797312	False
100	Test 1	tasks/list	1.9	1.0	11534336	False
100	Test 2	tasks/blog/tag/category	2.3	3.1	88064	False
100	Test 3	tasks/category/main/tags	1.6	2.2	57344	True
100	Test 4	tasks/wp-content/app	2.1	2.4	91226112	True
100	Test 5	tasks/wp-content/main	1.7	0.6	41984	False
101	Test 0	tasks/tags/tag/tag	1.9	3.0	19922944	True
101	Test 1	tasks/category	2.8	1.4	91226112	True
101	Test 2	tasks/list	2.5	3.1	92274688	False
101	Test 3	tasks/list	1.0	2.9	80896	False
101	Test 4	tasks/blog/blog/categories	2.3	0.6	84992	True
101	Test 5	tasks/explore/explore/tag	1.2	0.8	23552	False
101	Test 6	tasks/categories/tag	1.0	1.2	62914560	True
101	Test 7	tasks/tag	2.6	2.4	77824	True
101	Test 8	tasks/app/explore	2.1	2.6	78643200	False
102	Test 0	tasks/categories/blog	2.3	0.8	91136	False
102	Test 1	tasks/wp-content/search/search	1.6	2.1	78848	True
102	Test 2	tasks/explore/tag/search	2.7	1.1	5242880	True
102	Test 3	tasks/tag	1.3	1.3	90177536	True
102	Test 4	tasks/blog/app	1.0	1.5	18874368	True
102	Test 5	tasks/list/blog	1.4	2.0	90112	False
102	Test 6	tasks/tag	1.3	1.6	59392	True
103	Test 0	tasks/blog	2.0	2.4	76800	True
103	Test 1	tasks/wp-content/tags	1.2	2.4	6291456	False
103	Test 2	tasks/blog/explore/main	2.8	2.5	101711872	True
104	Test 0	tasks/posts/category/explore	1.1	0.9	66060288	False
104	Test 1	tasks/tags	1.7	2.2	63963136	True
104	Test 2	tasks/tags/explore/wp-content	2.6	0.9	20971520	True
104	Test 3	tasks/posts	2.4	1.5	94371840	True
104	Test 4	tasks/search	1.0	0.8	28672	True
104	Test 5	tasks/main/app	2.9	1.1	91226112	True
104	Test 6	tasks/explore	2.0	2.2	86016	True
104	Test 7	tasks/main/category/wp-content	2.5	1.5	22020096	False
105	Test 0	tasks/explore/explore	1.0	1.1	15360	False
105	Test 1	tasks/explore/list	2.5	0.9	67584	True
105	Test 2	tasks/tag	2.6	1.0	5120	True
105	Test 3	tasks/tag/list	2.4	1.3	83968	False
105	Test 4	tasks/app/app	1.9	0.8	40960	False
105	Test 5	tasks/search	2.3	3.2	82944	True
105	Test 6	tasks/tags/posts	1.6	2.7	33792	False
105	Test 7	tasks/explore	2.6	2.7	22020096	False
105	Test 8	tasks/tag/explore	2.8	1.5	94371840	True
105	Test 9	tasks/tags/wp-content/categories	2.2	2.1	26214400	False
106	Test 0	tasks/tags/wp-content/tag	2.0	1.3	71680	True
107	Test 0	tasks/app/tags/app	1.0	2.0	93323264	True
107	Test 1	tasks/list/tags/categories	2.8	3.2	63488	False
107	Test 2	tasks/categories	1.1	1.0	97517568	False
107	Test 3	tasks/main	1.1	2.9	100663296	False
107	Test 4	tasks/list/list	2.1	2.3	14680064	True
107	Test 5	tasks/category	1.5	2.6	84992	True
108	Test 0	tasks/posts/posts	1.3	1.1	35840	True
108	Test 1	tasks/list	2.3	1.8	27648	True
108	Test 2	tasks/tags	2.4	2.3	23068672	False
108	Test 3	tasks/explore/categories	2.8	1.2	48128	True
108	Test 4	tasks/tags	1.2	2.2	57344	False
109	Test 0	tasks/app	2.5	3.0	63488	False
109	Test 1	tasks/posts/app	1.9	3.1	90112	True
109	Test 2	tasks/posts/blog	2.2	1.9	45056	True
109	Test 3	tasks/tag/blog/tags	1.9	2.3	94208	True
109	Test 4	tasks/list/wp-content/search	1.8	3.1	91226112	True
109	Test 5	tasks/tag	1.7	1.9	77594624	True
109	Test 6	tasks/tag	1.5	0.5	78643200	True
109	Test 7	tasks/search/list/main	2.9	0.8	90177536	True
109	Test 8	tasks/categories/tags	2.2	3.4	62464	False
110	Test 0	tasks/main	2.1	3.1	85983232	True
110	Test 1	tasks/app	2.8	2.0	11264	True
110	Test 2	tasks/main/list/category	2.1	0.6	11264	False
110	Test 3	tasks/tag/category/posts	1.2	3.3	16777216	False
110	Test 4	tasks/category/blog	2.8	2.6	69632	True
110	Test 5	tasks/categories/posts	2.3	0.7	72351744	True
110	Test 6	tasks/posts/main	2.3	3.0	6144	False
110	Test 7	tasks/categories/wp-content/wp-content	1.2	0.8	28311552	False
111	Test 0	tasks/wp-content	2.0	0.9	21504	True
111	Test 1	tasks/posts/main	1.3	2.3	74448896	False
111	Test 2	tasks/category/explore	1.3	2.7	77594624	False
111	Test 3	tasks/tag/tags/categories	2.7	2.4	62464	False
111	Test 4	tasks/wp-content/tag	1.4	1.3	4194304	True
112	Test 0	tasks/tags/search/tag	2.3	1.0	18874368	False
113	Test 0	tasks/blog/main	1.3	2.1	78848	True
114	Test 0	tasks/wp-content	2.2	0.9	81788928	False
114	Test 1	tasks/categories/posts	2.8	1.4	19922944	True
114	Test 2	tasks/wp-content/search	1.0	2.5	100352	True
114	Test 3	tasks/posts/categories	1.6	1.0	48128	False
115	Test 0	tasks/tags/blog	1.0	3.2	32768	False
116	Test 0	tasks/main	1.4	2.2	77824	True
116	Test 1	tasks/explore	1.4	1.6	12582912	False
116	Test 2	tasks/explore/search/wp-content	2.7	1.5	83968	False
116	Test 3	tasks/main	2.4	1.3	12288	True
116	Test 4	tasks/wp-content/category/explore	2.6	0.5	100352	True
116	Test 5	tasks/wp-content/main/posts	2.6	3.1	48128	False
116	Test 6	tasks/categories	1.5	2.9	17825792	True
116	Test 7	tasks/category/categories/list	2.8	2.3	76546048	False
116	Test 8	tasks/app	1.9	1.8	104857600	True
116	Test 9	tasks/app/categories/main	2.9	2.7	80896	True
117	Test 0	tasks/tags/list/main	2.0	3.1	59768832	False
117	Test 1	tasks/tags/explore	1.6	1.7	23552	True
118	Test 0	tasks/list/search/wp-content	1.7	3.2	59768832	False
118	Test 1	tasks/main/wp-content/tags	2.2	1.9	96256	True
119	Test 0	tasks/app	2.0	1.8	29696	True
119	Test 1	tasks/category	1.6	1.7	2048	False
119	Test 2	tasks/category/explore/wp-content	1.9	0.8	14336	False
119	Test 3	tasks/tag	1.7	1.3	52224	True
120	Test 0	tasks/blog/app/categories	1.9	3.3	28311552	True
120	Test 1	tasks/explore	2.3	3.4	101711872	False
120	Test 2	tasks/posts	1.5	3.4	81920	False
120	Test 3	tasks/main/tag	1.2	3.1	29360128	False
120	Test 4	tasks/search/main	1.0	2.5	98566144	False
120	Test 5	tasks/categories/tags	2.6	2.3	79691776	False
121	Test 0	tasks/categories/blog	1.2	2.8	33792	True
121	Test 1	tasks/categories	2.8	2.5	5242880	False
121	Test 2	tasks/categories/category/categories	2.0	2.7	104857600	True
122	Test 0	tasks/main/category	1.3	2.3	61440	True
122	Test 1	tasks/tags	2.8	0.9	74752	False
122	Test 2	tasks/app/wp-content	2.3	1.4	24576	True
122	Test 3	tasks/blog/category/category	2.7	1.6	27648	True
122	Test 4	tasks/tags	1.9	2.2	25600	True
122	Test 5	tasks/posts/app/category	1.7	0.5	96256	True
122	Test 6	tasks/category	2.1	0.6	16777216	False
123	Test 0	tasks/search/list/list	1.4	2.7	64512	True
123	Test 1	tasks/tag/search/search	1.7	0.7	19922944	False
123	Test 2	tasks/explore/main/app	2.4	2.2	97517568	True
123	Test 3	tasks/app	1.3	1.5	83968	False
\.
COPY task_results (submit_id, task_id, status_id, points, summary, execution_time, used_memory) FROM STDIN;
131	261	4	1.5	Example feeling whose item.	1.8	7471104
188	267	4	2.1	Use six song heavy.	1.5	5194752
129	63	4	1.8	\N	0.9	2174976
177	419	4	1.2	Suffer character west.	0.7	2808832
158	31	4	1.0	Itself not cause agree research image.	1.9	1436672
42	514	9	0	\N	1.5	3748864
85	332	1	0	\N	1.0	8114176
7	312	3	0	Scene anyone yourself financial hard.	2.0	2797568
10	598	4	1.5	Day notice fear available southern smile east.	1.1	1232896
25	612	3	0	Decision onto quickly action cause do.	1.8	1921024
80	47	1	0	Nothing rise foreign word chair do event.	1.1	4580352
101	335	4	2.7	Artist later especially plant benefit old herself.	1.3	3115008
120	382	4	1.4	\N	1.5	3234816
158	54	3	0	Human car candidate water top star the. Start listen situation worker.	1.0	8083456
158	66	4	1.7	Activity onto close us coach.	1.5	3126272
183	303	4	1.2	Become reduce allow sell middle development end.	1.2	7563264
94	398	9	0	Sport rate this mother.	1.5	6530048
62	181	4	2.1	\N	0.7	7584768
115	337	4	1.6	Edge expert though benefit.	0.6	1050624
89	25	4	1.0	\N	1.7	5058560
123	552	1	0	\N	1.1	7570432
78	253	4	2.9	\N	1.4	3528704
177	415	10	0	\N	0.7	2405376
98	287	5	0	\N	1.2	7434240
118	344	5	0	\N	0.6	2140160
121	182	4	2.6	\N	0.8	2480128
25	610	4	1.9	Moment boy summer billion political these.	1.4	4738048
65	110	1	0	Loss marriage population one know.	0.7	3217408
177	417	1	0	\N	1.8	1865728
103	292	4	2.2	\N	1.3	5240832
135	116	10	0	\N	1.8	4434944
44	616	6	0	\N	2.0	595968
48	438	10	0	\N	1.3	3216384
27	576	4	2.8	Guy throughout the rule. Receive leg ball create speech find.	1.9	3208192
78	252	4	2.8	Also police fire.	1.0	3584000
144	575	4	1.2	\N	0.9	3473408
175	245	4	1.5	Popular receive hard item.	0.8	3357696
116	170	3	0	\N	1.8	7241728
16	368	4	0.9	Night family over get treatment parent.	1.7	1615872
80	30	4	0.2	\N	1.0	2899968
53	497	4	2.9	\N	1.0	5828608
59	439	5	0	Toward wind individual or resource voice brother. Garden miss maintain situation social third child.	1.0	7386112
27	578	9	0	\N	1.8	674816
72	99	4	2.5	Support wall evidence let send in.	1.0	4743168
174	210	8	0	\N	1.1	495616
84	128	4	0.0	\N	0.8	7268352
26	367	10	0	Appear wide government throughout conference.	1.6	4720640
78	256	4	1.7	And political individual another.	1.9	6287360
3	64	4	1.2	\N	1.6	2241536
112	14	4	0.8	Check international list.	1.8	4468736
22	16	4	2.9	Change remain recent get little. Result step senior statement food.	2.0	540672
73	38	8	0	\N	0.9	4173824
41	508	4	0.5	\N	1.8	3982336
38	239	5	0	Yard number paper recognize pass.	0.7	1872896
112	20	4	1.6	Environment but memory money after.	1.1	3747840
150	555	4	1.1	\N	1.5	4736000
83	512	4	2.1	No not save without watch operation.	2.0	358400
63	226	4	2.4	\N	1.5	1106944
13	349	3	0	\N	0.5	6283264
126	375	6	0	By edge season order.	0.6	3212288
73	45	5	0	\N	1.4	5553152
93	450	5	0	\N	0.6	2519040
134	322	4	0.9	\N	1.1	3549184
102	422	5	0	Trouble shake class whatever budget.	0.8	6991872
139	360	9	0	\N	1.7	5067776
37	354	6	0	\N	1.2	1339392
112	19	4	1.9	\N	1.3	6481920
43	187	10	0	Western information economic reduce.	1.5	3704832
73	65	4	1.0	\N	0.7	7191552
179	478	1	0	Fly parent response customer scene start beyond tend.	0.5	8274944
129	41	4	2.7	Off Democrat cold bank teacher order every attorney.	1.6	1392640
118	338	3	0	Office doctor buy along.	1.3	3163136
3	56	4	2.3	Thought bag out increase born management. More candidate himself.	0.8	3429376
146	147	4	0.2	\N	1.7	3991552
151	129	4	1.2	\N	1.4	1783808
41	496	3	0	\N	1.0	7618560
147	167	4	0.1	Central big population hair nearly pass.	1.3	1748992
171	230	3	0	Next attorney civil language. Type friend improve individual social despite.	1.7	4590592
12	257	4	0.0	\N	1.7	594944
102	421	4	1.9	\N	0.9	1316864
23	274	4	1.3	\N	2.0	7232512
140	3	4	2.1	Serve military plan push wear town add.	1.9	8042496
6	334	5	0	\N	1.6	8060928
50	222	4	0.6	\N	1.9	3331072
91	432	4	0.6	\N	1.6	5178368
180	370	4	0.6	Build among student space boy.	2.0	7827456
88	4	7	0	Audience sing represent clearly will work find. Ten a world me.	1.3	8192000
26	377	4	1.1	Its quickly financial with sense authority. Bring significant citizen behind state.	0.8	6105088
131	250	4	1.1	Artist first ask standard son keep.	1.9	3919872
5	295	6	0	Edge discuss artist official five tend just.	0.7	6149120
103	287	6	0	\N	1.9	1259520
80	62	4	1.5	Avoid card hope light economy.	1.5	2956288
1	547	4	1.6	Upon better hot they play letter.	0.5	4436992
69	408	4	0.9	Glass firm loss every group trade relationship.	1.4	5443584
165	284	4	2.0	Political discuss whatever above apply cost suggest. Physical skill check street radio.	0.8	364544
136	327	4	1.1	Executive everybody skill yeah result price above. Seat born determine return hour win study.	1.5	7392256
27	568	8	0	Able word early leader Democrat at place customer. Recently time detail key.	1.2	6427648
168	104	4	1.3	Whose set since century development as. Fact rest campaign.	0.5	356352
75	212	4	1.5	\N	1.0	749568
88	17	3	0	\N	1.1	4488192
112	13	4	1.6	According picture interesting loss.	1.0	4370432
142	22	4	1.3	Than leg class alone recognize.	1.7	3469312
53	498	9	0	While with suffer everything imagine.	1.2	5812224
164	465	10	0	\N	0.5	8058880
146	143	4	2.3	Number hard indicate range loss official.	0.8	2287616
166	417	4	1.5	Certain rest return never including discussion hard.	0.8	1017856
83	495	6	0	\N	1.9	5865472
63	221	8	0	\N	1.9	3027968
137	603	4	1.6	\N	0.6	3755008
61	595	4	1.2	\N	1.1	5963776
135	113	4	2.8	\N	0.6	4066304
132	106	10	0	\N	1.9	8163328
169	499	4	1.6	\N	1.3	2199552
112	7	4	1.6	\N	0.6	2312192
118	339	5	0	\N	1.7	5229568
22	9	4	2.4	\N	1.0	3123200
48	431	4	1.8	Detail house hotel blood.	0.9	7761920
184	573	4	2.8	\N	1.0	268288
91	436	8	0	\N	0.8	1200128
80	61	1	0	Every myself onto.	0.6	6349824
22	17	8	0	\N	1.1	1067008
27	582	10	0	\N	0.7	7326720
103	274	4	0.6	\N	1.5	4112384
124	114	4	1.2	Still ahead billion food. Focus simple present kid he girl.	0.7	7380992
157	353	7	0	Can raise finally they citizen response hair.	1.7	1639424
91	444	4	2.8	Meet interest family some our church.	1.9	2488320
176	337	3	0	Ask require mouth idea. Often light long or.	1.4	6866944
171	238	4	1.3	\N	1.8	5694464
107	484	4	2.0	\N	0.9	114688
144	579	4	1.2	\N	1.1	7185408
185	58	4	2.8	Student back special. Film national send green somebody.	1.7	3708928
165	280	3	0	Specific concern exist theory.	1.8	6937600
167	480	4	2.6	\N	1.9	577536
92	403	4	2.3	Friend they pick teacher guess support black.	1.7	5045248
34	109	4	2.7	\N	1.5	1378304
98	288	10	0	Explain its marriage.	1.7	1598464
80	37	4	2.4	\N	0.7	1709056
150	561	4	2.8	\N	1.3	4665344
116	174	9	0	\N	1.9	5646336
71	328	1	0	Place long technology.	0.9	4759552
143	499	8	0	\N	1.0	1576960
177	422	4	1.2	Should our author should for. Choice treat wait act.	1.9	8119296
97	605	4	2.2	\N	1.9	1693696
119	617	4	1.6	\N	1.5	187392
69	405	4	2.9	Food statement mother Mr model.	0.7	1564672
44	617	4	1.7	Manage though democratic someone. Social us street movement ask senior interesting inside.	1.4	5828608
17	355	6	0	Common customer future direction religious son hard.	1.5	4099072
77	613	4	1.2	Consumer tax girl decision college would hair.	0.8	5405696
174	212	7	0	\N	0.5	6159360
179	479	3	0	Away grow stop she open event.	1.2	5730304
94	387	9	0	\N	1.3	4770816
78	246	4	1.0	\N	1.8	5787648
171	236	4	1.8	\N	1.7	6335488
179	470	1	0	Thousand teacher to add blue.	1.6	6173696
150	547	4	1.6	\N	0.5	6238208
78	255	3	0	\N	1.2	6733824
38	231	4	2.6	Hot seem reduce.	1.3	5888000
76	159	4	1.1	Organization interview outside site hundred operation. Become field west sit future arm hour.	0.8	3943424
109	469	4	2.8	Those interview nation training son.	1.4	528384
184	565	3	0	Bill respond people yourself dream laugh. Indeed pattern later stuff fund.	0.7	7341056
140	7	10	0	\N	1.4	7808000
107	472	6	0	Society question low experience little.	1.5	698368
90	609	6	0	\N	1.6	7916544
75	216	1	0	\N	0.8	6690816
180	366	3	0	Cultural discussion artist. Challenge artist voice decide.	1.9	2203648
102	419	4	0.8	Visit kitchen bag.	1.0	5862400
157	359	4	2.6	\N	1.7	7389184
147	166	5	0	Rule material represent conference court walk she.	0.7	1335296
31	576	4	2.8	Though listen question option this almost responsibility.	1.1	4743168
44	629	4	1.3	Next win lay age choice lose interview or. Government standard available author should article.	1.3	4555776
114	447	4	1.3	\N	0.7	933888
164	464	4	1.7	\N	0.7	6296576
177	421	7	0	Clear likely event question body candidate begin establish.	2.0	7208960
42	527	4	1.0	\N	1.0	6213632
150	556	4	2.1	\N	1.6	8039424
57	379	4	2.0	Possible society child team strategy moment physical.	0.9	3366912
94	393	4	1.1	\N	2.0	1188864
14	275	4	1.8	\N	0.9	6627328
184	563	4	2.5	\N	1.2	1808384
3	30	3	0	Turn material so my.	1.0	3601408
146	157	6	0	\N	0.9	281600
172	512	7	0	Hot after name late own pass hotel word.	0.5	7748608
114	441	3	0	Like recognize item effect voice generation individual.	1.8	2144256
175	253	4	2.9	\N	1.7	6851584
112	17	4	1.1	Us choice effort town really want professor political.	0.8	6727680
129	35	4	1.0	\N	1.6	7802880
83	498	8	0	\N	0.8	4833280
16	367	4	1.1	Wait easy every despite. Inside everybody score I scene.	1.5	8250368
73	61	4	2.1	Note win chair PM power management.	0.8	952320
119	626	9	0	Cut physical almost particularly call crime.	1.9	779264
129	59	4	2.5	But garden region either call field rise almost.	1.8	4557824
107	471	1	0	\N	1.8	4679680
174	206	6	0	Opportunity draw very various should.	0.5	5835776
114	442	4	1.1	Court run common recognize student sit.	1.3	1179648
70	192	9	0	Hope create result market range purpose fine.	1.3	6276096
83	503	4	1.8	Size hear activity manage fact move sing.	1.6	1263616
3	47	1	0	\N	1.4	727040
22	3	4	2.1	Contain school particular seat since rich forward.	1.8	4312064
9	113	4	2.8	Any conference section rich up year.	1.1	7110656
79	348	10	0	Economic recently me other.	0.8	7261184
137	604	10	0	\N	1.1	4170752
91	437	4	2.1	Raise police Mr decision gas.	1.0	5476352
93	452	4	1.4	\N	0.9	2617344
139	354	1	0	\N	1.0	5864448
22	4	4	0.6	Long style recognize.	0.6	571392
27	564	4	1.5	Always professional near wish itself eye animal east.	1.0	783360
184	574	7	0	\N	1.2	6641664
165	290	5	0	Now walk several theory enough know shoulder.	0.7	7203840
103	277	7	0	Ok training them.	0.6	7493632
41	513	4	1.7	\N	1.1	4793344
125	452	4	1.4	\N	2.0	2361344
42	535	9	0	Bank benefit notice manager right must operation. It north environmental best second head.	0.7	3523584
135	117	1	0	\N	1.8	4417536
91	439	6	0	\N	0.6	1085440
117	354	8	0	Technology any surface challenge between more early.	1.1	6812672
166	423	3	0	Back consider compare message turn.	1.5	1821696
53	513	4	1.7	But after important think city young game.	1.7	1896448
94	392	4	1.8	Travel ten sit garden whatever able ahead.	1.8	3758080
52	502	4	2.0	\N	1.8	5707776
104	175	4	1.0	\N	1.1	1882112
146	141	1	0	Campaign success degree thing.	1.8	1700864
122	105	1	0	Air speech us.	1.5	3079168
16	369	4	1.0	\N	0.8	4583424
78	254	4	1.0	Dinner just between we hit. Affect party company use fact if.	1.1	3367936
186	342	4	2.1	\N	2.0	1627136
31	563	4	2.5	Remain ask whether information yet later.	1.7	4489216
171	239	4	1.0	\N	0.9	7555072
4	452	4	1.2	Sell event once our somebody check. Play degree administration your walk play.	0.8	499712
91	427	4	2.9	\N	0.9	5737472
169	510	4	2.3	\N	1.8	694272
18	601	4	2.9	Experience lawyer pay allow phone woman.	2.0	4773888
82	22	1	0	Analysis security huge wait then.	1.2	4300800
26	375	4	1.6	\N	1.7	5920768
52	500	8	0	Course kid already foot the civil.	1.6	5515264
119	620	6	0	Wish open work true sister seat compare.	1.5	4401152
23	280	1	0	Explain bit manager.	0.8	696320
19	426	4	2.0	At toward meet.	0.8	5790720
14	271	4	2.2	Available you appear hope interesting mission.	0.8	8237056
162	606	6	0	\N	1.5	3524608
114	433	8	0	\N	1.5	7821312
172	497	10	0	Paper hair finally social music. Seat institution arm seven.	0.7	7732224
86	270	8	0	\N	0.6	6247424
14	278	4	1.5	\N	1.3	6821888
14	290	4	2.4	Them group to later team player.	1.8	1794048
73	43	6	0	Growth forward positive student shoulder now.	0.5	5229568
134	320	4	1.0	Wall approach especially head section.	1.5	6273024
38	232	4	2.0	\N	0.8	7194624
23	284	4	2.0	\N	1.8	2825216
9	117	4	1.2	\N	0.9	4657152
140	14	9	0	Paper present player great maybe almost. Hand think case magazine.	1.8	2275328
1	555	4	1.1	Middle member prove chair avoid.	0.8	2932736
23	279	3	0	\N	0.6	7284736
54	269	4	1.0	\N	1.8	3998720
143	491	3	0	\N	2.0	8265728
146	145	4	2.5	\N	1.9	8284160
117	357	3	0	\N	1.5	3709952
14	293	4	0.3	Thousand provide Congress word either determine carry.	1.8	6581248
180	365	4	1.3	Newspaper from know politics.	1.3	854016
142	26	5	0	\N	0.7	6662144
185	42	3	0	Price human month candidate.	0.7	6524928
116	178	4	1.6	Edge success chair anyone letter voice eight.	1.5	6667264
140	15	4	1.4	\N	0.8	520192
146	153	10	0	\N	1.1	4505600
76	164	5	0	\N	0.6	3294208
169	506	9	0	\N	0.7	5680128
188	269	5	0	Lawyer reality difficult reality. Bar worry show success happen.	1.3	3826688
80	54	8	0	Particular ok care way prepare stuff generation.	0.7	5602304
16	366	4	2.4	Certain beautiful away little result.	1.2	1392640
39	125	5	0	Interview seem easy time.	1.3	5557248
161	217	6	0	Century bill street game eat huge price several.	1.2	258048
90	608	9	0	\N	1.9	893952
167	482	4	1.0	\N	1.9	1031168
180	364	3	0	\N	1.3	7621632
37	357	4	2.0	Political move message media consumer career. Game write church picture money speech.	1.0	724992
115	344	8	0	Once say crime laugh.	1.0	3218432
145	316	3	0	\N	1.8	2206720
108	522	4	2.1	Just food animal page raise firm.	1.3	7178240
73	53	6	0	\N	0.9	5606400
33	469	4	2.8	Strategy actually Democrat amount style.	1.3	7304192
68	622	4	2.7	Hot middle past middle dog.	0.7	1042432
114	440	6	0	Me today ask him long term task.	0.8	4743168
132	109	6	0	\N	1.2	7460864
70	187	4	0.8	Civil control mission let.	1.7	1560576
22	1	4	1.7	\N	1.0	2564096
94	381	4	1.1	President debate brother area control specific.	1.7	7840768
165	283	4	2.1	\N	1.5	5156864
106	300	4	1.4	\N	0.6	2619392
144	566	4	1.9	\N	0.9	191488
27	579	4	1.2	\N	2.0	6591488
129	54	7	0	Break language alone work.	1.7	4292608
185	43	4	2.7	Thus at police head. Site floor to go into.	0.8	3166208
61	596	4	2.6	\N	0.7	6016000
70	196	4	1.3	Floor writer wrong debate million site.	0.9	1029120
76	156	3	0	Page southern half story table.	1.7	4273152
47	116	10	0	Administration whatever account.	2.0	7984128
94	399	10	0	Require win suffer nice care. Color strong once magazine window although.	1.7	6844416
175	255	10	0	\N	1.6	4759552
7	303	6	0	Pick road western. That both establish local.	0.9	3835904
150	559	4	2.3	\N	1.0	5054464
63	225	4	1.5	Onto ground before each note say phone.	1.7	2466816
123	541	4	1.0	Huge ability describe up take party.	1.3	7564288
63	219	4	1.8	Cause mind exist account simply head. Audience way already among.	1.4	6426624
73	41	4	2.7	Month effect exist style.	1.5	684032
91	429	10	0	\N	1.7	2885632
158	42	4	2.9	Sure air director action street better bad.	1.8	1027072
177	424	4	2.5	Her upon edge thousand lay.	1.4	7009280
33	483	4	0.8	\N	1.6	7566336
146	164	4	0.7	Onto easy rather mission area. Heavy according candidate charge.	0.7	3800064
38	235	4	1.9	Center attorney remain enjoy order assume show understand.	1.5	1019904
35	214	9	0	Agent claim share will.	0.7	7033856
52	492	10	0	\N	1.7	957440
104	180	3	0	Threat less interview population place. Relate we policy first smile forward forget.	1.0	1430528
187	236	4	1.8	Cold feeling well development.	1.0	6871040
145	329	4	1.7	Federal thought pull trip.	1.1	485376
172	499	4	0.8	\N	0.8	3433472
58	598	7	0	Result cover and main.	1.5	4035584
53	509	5	0	\N	0.8	8199168
167	469	4	2.8	\N	1.5	2329600
27	575	8	0	Term land between customer listen.	1.9	6829056
72	97	7	0	Must never continue design issue participant film. Fish eight crime sell rock set nation.	1.4	6010880
131	251	4	1.3	Final do government return business.	1.5	7140352
6	330	1	0	\N	1.2	6136832
12	263	4	1.9	Work common season ago community address industry.	2.0	7206912
183	306	3	0	\N	0.6	1162240
68	627	4	1.4	\N	1.3	3083264
12	260	9	0	Action another expert future impact.	1.4	2900992
98	291	4	2.1	Avoid bring pull call security cup.	1.6	375808
83	493	4	0.5	\N	1.7	6400000
129	46	4	1.2	\N	1.1	6492160
131	243	1	0	Plant tough one actually some quickly off enjoy.	0.6	4296704
136	317	7	0	\N	1.2	6197248
149	185	4	1.1	\N	0.7	6285312
120	402	1	0	Rule ball factor friend well party blue.	1.6	7810048
98	292	4	2.2	Book yet phone tell act. Available single total two cut risk do.	1.4	975872
168	110	8	0	\N	1.9	4891648
18	595	4	2.4	\N	1.3	5989376
57	380	4	1.3	\N	0.9	3230720
114	432	4	1.1	\N	0.8	2179072
55	604	3	0	Every nice not challenge evidence research. Body put eat page.	1.8	3477504
157	356	4	1.6	\N	1.3	1175552
33	484	4	1.3	\N	0.8	1758208
89	29	1	0	Agency road production affect sister say. Indicate yard too inside do computer yourself.	1.4	935936
168	102	4	1.3	Meeting stage paper wish.	0.7	3437568
179	481	4	2.3	Rise join rock and part on meet.	1.9	6517760
6	331	4	2.2	\N	0.5	6716416
185	50	6	0	\N	1.1	7407616
59	446	4	1.4	\N	0.9	5805056
169	501	4	1.5	Together stage table business success building.	1.7	3899392
164	462	7	0	Practice sell watch believe product. College pretty report brother hair young size.	0.9	8169472
118	335	4	2.7	Election mention seek half trouble before grow author.	1.5	1724416
42	525	4	2.7	\N	1.3	5618688
94	401	8	0	Manager partner rate.	2.0	5586944
106	301	8	0	Yes claim have practice.	1.4	7851008
186	347	4	1.5	Probably trade party stand up government.	0.9	871424
158	57	4	1.6	\N	1.6	3074048
108	540	1	0	\N	0.6	3075072
43	195	4	1.1	\N	1.0	1114112
76	151	4	2.5	\N	0.8	1867776
78	263	4	1.9	\N	2.0	5475328
126	379	4	2.0	\N	0.6	1838080
167	487	4	1.1	Dinner sign teacher member type alone attention. Him my recognize body.	1.3	2453504
165	278	1	0	Long visit crime style senior.	0.7	3831808
167	471	6	0	Song lay lose value front investment language.	1.3	3300352
175	246	8	0	\N	1.7	5665792
120	391	9	0	Art place character million ten wait national.	1.8	1077248
3	31	4	1.0	Offer structure almost matter field.	1.6	7654400
183	313	10	0	\N	1.3	5248000
132	102	9	0	\N	0.8	7227392
105	414	4	2.8	Physical rock I force. Might later painting short mother woman.	1.2	1287168
149	172	4	1.9	\N	0.8	2001920
120	393	3	0	\N	1.2	4686848
45	101	8	0	Chair ability church protect land.	1.6	1683456
179	472	4	1.0	Production win set.	1.2	8266752
33	476	4	1.0	\N	1.0	2928640
7	304	3	0	\N	1.5	224256
12	262	7	0	Support also cultural reveal rock guess.	1.2	2232320
180	373	10	0	\N	0.8	2612224
63	223	4	2.9	\N	0.5	3023872
59	442	10	0	\N	1.4	6621184
6	333	3	0	\N	1.1	6732800
139	359	4	2.6	Fish level early top join quickly. Trouble account tonight season buy difference.	2.0	4554752
144	574	4	0.6	You campaign pull need or wear.	0.9	1282048
175	259	4	1.1	\N	1.4	4263936
164	461	4	2.2	\N	1.4	4183040
158	40	4	0.9	Human big there pressure letter end church fund.	1.2	887808
80	32	4	1.7	\N	0.5	7487488
140	6	10	0	\N	1.7	4283392
166	412	4	2.6	\N	1.3	5099520
43	198	4	2.0	\N	0.9	1415168
35	213	9	0	Game security miss book.	1.4	464896
76	146	4	2.7	Reduce specific including rather.	0.8	6506496
107	468	4	2.2	\N	1.9	1572864
183	305	10	0	\N	1.9	6067200
10	601	6	0	Live shake effort walk field thank.	1.0	459776
80	68	4	2.9	Dream issue within.	0.7	4430848
3	67	4	2.7	Likely unit identify lead management.	0.7	2191360
39	129	4	1.2	Several short eat pressure.	1.9	634880
73	67	7	0	\N	0.9	2771968
33	486	4	1.1	Authority case stand provide.	1.2	5143552
134	318	4	1.4	Positive product down impact admit.	1.2	2044928
65	103	9	0	\N	0.9	142336
33	487	4	1.4	\N	1.0	4513792
98	281	4	2.8	\N	0.9	5917696
160	114	4	1.2	Possible notice pull hundred send play contain.	0.6	1057792
98	275	4	2.3	Community his sport account.	1.1	6779904
139	361	4	2.2	\N	1.0	626688
64	300	9	0	Truth believe fire scientist including institution common.	1.3	1049600
84	127	6	0	\N	1.8	2796544
126	374	4	1.0	\N	0.7	8069120
95	598	10	0	Easy buy trade idea.	0.7	2851840
151	124	4	2.6	Skill work surface conference.	1.5	6617088
129	61	3	0	Speak break help health walk people agent.	0.9	5929984
20	105	1	0	Car early garden until both light.	1.6	6100992
76	149	4	1.1	\N	0.6	457728
116	185	3	0	\N	1.3	4636672
156	319	4	0.2	Yeah themselves ready rise.	0.7	3722240
81	26	7	0	Medical you former arm according thus population. Leave land card natural talk Republican economy prevent.	1.8	4263936
169	511	6	0	\N	1.0	2996224
107	480	3	0	Serious significant concern say may society reflect side.	0.6	4849664
116	171	9	0	\N	1.2	2236416
90	610	8	0	\N	0.6	2964480
109	468	4	2.2	\N	1.9	989184
15	98	6	0	East defense employee go protect.	1.7	6910976
63	220	4	1.4	\N	1.7	8219648
21	294	7	0	\N	0.7	5528576
130	611	9	0	\N	1.8	850944
146	146	4	2.7	Phone some but institution.	1.6	4539392
187	238	4	1.3	\N	0.7	5938176
151	125	4	1.8	Option want shoulder ok sell pull.	0.9	1327104
35	212	4	1.5	\N	1.9	5660672
142	25	4	1.2	Art easy past moment dog. Wear avoid sing whole artist left travel.	0.9	657408
151	127	4	2.5	\N	0.5	3494912
41	497	4	2.9	Area even really there determine where direction however.	1.2	5287936
184	578	3	0	Develop medical majority heart should.	1.4	4132864
77	611	6	0	\N	1.9	7513088
4	456	9	0	Different environment language edge huge over. Father return woman while world where.	1.5	183296
140	2	9	0	\N	1.7	3622912
68	617	4	2.8	\N	1.4	2160640
48	441	4	1.2	Shoulder wonder speech mouth involve contain. Suggest bit small that.	2.0	8095744
171	233	4	2.6	Him wish discuss successful.	0.6	5045248
64	294	4	0.6	Happen two animal than stay color approach true.	0.5	3755008
89	27	4	1.1	Coach sit contain raise necessary beat thank.	1.0	3326976
104	176	4	1.3	\N	0.5	246784
162	614	4	1.0	\N	1.1	3407872
101	344	4	1.4	My under other it whose exist. North data receive training arm.	1.8	7292928
25	606	10	0	West into lay safe.	0.7	2568192
55	603	4	1.6	\N	0.5	4639744
14	281	10	0	Reflect always painting record camera. Page voice growth major.	1.9	379904
180	369	4	1.0	\N	1.5	674816
114	428	4	1.9	Provide music begin analysis house edge country. Become remember travel sometimes minute this war history.	1.1	7444480
52	510	4	1.2	\N	0.9	4589568
119	623	10	0	Dark career degree. Black executive million outside color memory.	1.9	7800832
143	495	6	0	Fly away fight parent. Threat down outside answer model.	1.1	5505024
156	316	4	1.4	\N	0.7	3160064
149	175	4	0.7	Sort compare at.	0.8	252928
187	232	4	2.0	\N	2.0	705536
93	458	9	0	Money have such pressure.	1.2	365568
27	585	5	0	Mouth positive change special seem. Laugh entire responsibility parent become factor.	1.8	580608
76	157	4	1.2	Camera sport as since nation.	1.7	506880
42	520	7	0	Buy special television want film station.	1.7	7558144
89	23	9	0	\N	0.7	8119296
84	124	4	2.6	Fact popular reveal.	0.7	415744
12	253	3	0	Audience success western condition politics think game development.	1.8	4272128
150	550	4	2.2	\N	1.8	3852288
105	420	4	0.7	It government north as.	0.9	523264
114	439	3	0	Miss significant decide direction high price here.	1.5	6418432
53	494	10	0	\N	1.3	5985280
44	618	1	0	Size fear change change western. Move side month avoid product likely opportunity.	1.5	787456
158	32	1	0	\N	1.2	6227968
185	30	4	2.3	Six really try figure most.	1.0	1604608
95	596	7	0	\N	1.8	7775232
98	271	4	2.2	Seem economy score bed truth although.	1.7	6772736
73	34	4	2.3	Per it per answer.	0.9	8066048
48	446	4	0.4	Design their yard mother.	1.7	7671808
108	536	7	0	Consider life I left low need since. His shake up loss space.	1.2	3837952
157	354	4	2.1	Democrat around face.	0.9	1589248
33	478	9	0	Threat indeed surface those.	1.2	2448384
48	430	4	1.1	\N	1.1	888832
91	440	5	0	\N	0.5	4827136
63	227	1	0	Mouth mind just themselves.	1.1	6558720
176	347	4	2.4	\N	1.1	1736704
157	363	4	2.4	\N	1.3	5817344
180	368	7	0	\N	1.7	2429952
21	300	4	1.4	Information cost since class trial.	1.4	8183808
120	396	4	1.1	\N	0.7	3770368
62	180	4	2.6	\N	1.1	2611200
128	331	8	0	These major strategy evidence doctor parent. Attack threat room contain.	1.3	3097600
183	310	4	0.2	See everyone tough bank rich.	1.2	1712128
12	252	4	1.1	\N	1.9	526336
149	171	4	2.8	Page station bill discussion wife bit report well. Scientist child health general different former something.	1.6	527360
14	280	6	0	Because he rich rich.	0.5	3640320
62	170	1	0	Conference recent television state institution. Since lose who firm political.	0.7	8274944
1	542	4	1.5	Create significant job put recently whole small.	0.6	4543488
132	111	4	0.4	Commercial fall stage result economic sort try challenge.	1.0	7523328
174	209	5	0	\N	1.8	4235264
120	392	6	0	\N	0.6	2985984
103	272	4	0.1	Color relationship effect sound TV spend pretty.	0.9	3426304
76	147	4	2.2	Create kind fly.	1.3	7924736
10	592	4	1.4	Month enter from art contain another.	1.2	3270656
41	512	4	2.1	Third center sense degree mind me.	0.7	1012736
95	597	4	2.6	\N	1.3	5343232
109	477	4	2.4	Drive north international fund what player important.	1.6	5072896
172	503	8	0	\N	1.0	384000
157	361	4	0.6	Certainly commercial side task.	0.8	6603776
76	155	4	1.2	\N	0.5	135168
58	596	3	0	\N	1.9	1639424
158	60	4	0.7	Trip result fight improve.	1.1	4775936
114	446	4	0.7	\N	2.0	2981888
84	129	6	0	Tv create various wonder unit politics test.	1.7	7305216
172	492	4	1.1	\N	1.5	181248
185	37	8	0	Fact professional well order minute yeah. Account per where wish recognize cut with.	1.3	4477952
80	44	4	1.4	Great want account call rule into.	0.8	726016
89	21	4	1.1	\N	0.7	1738752
46	267	10	0	Attorney six stay behavior professional half opportunity front. Herself my agree become fine box.	1.4	980992
80	39	9	0	Executive ahead employee reveal sometimes concern term democratic.	1.2	6171648
131	242	4	2.8	\N	1.9	3786752
31	577	4	2.3	Color final effort money.	1.2	4296704
117	360	4	2.1	\N	1.7	566272
174	215	4	1.8	\N	1.2	2103296
35	215	4	1.0	\N	1.7	2438144
158	53	8	0	\N	1.5	4429824
158	65	4	1.0	\N	0.8	4227072
22	12	4	2.9	Relationship standard room give need food star car.	0.9	4850688
60	353	4	1.8	\N	0.7	3419136
116	179	5	0	\N	1.0	3536896
32	603	6	0	\N	1.0	6045696
156	326	5	0	\N	2.0	7523328
20	109	8	0	Every authority major.	0.9	7140352
162	610	4	0.5	\N	0.8	3061760
109	481	6	0	\N	1.9	1206272
118	345	6	0	Pressure modern edge voice.	1.2	6584320
165	275	9	0	Decade believe wear wear. Game develop car memory subject own.	1.9	3051520
55	605	4	2.2	Yeah allow them mission grow strategy almost.	1.7	969728
52	496	1	0	Someone task know leg rather group. Generation represent media it land.	1.9	1256448
3	45	7	0	\N	1.5	1644544
52	503	4	1.8	\N	0.5	3813376
175	258	4	1.1	Generation drive young.	0.9	5851136
56	97	4	2.5	Mouth paper each event source.	1.2	6724608
114	430	4	1.0	Company identify answer onto baby artist soon.	1.4	2002944
172	511	9	0	Resource different direction section move name participant.	1.4	6623232
93	449	4	0.9	\N	0.6	7365632
52	493	4	1.0	Debate pay drive economy.	1.4	1620992
166	424	9	0	\N	0.6	1891328
20	111	4	1.5	Late read glass nor.	1.1	6272000
65	102	4	1.8	\N	0.7	6706176
71	326	4	2.5	\N	1.2	7064576
47	114	4	1.2	\N	0.5	3509248
143	496	3	0	Window feeling building nice.	2.0	6963200
53	492	1	0	Act Mr list nature sing.	1.5	6008832
93	455	4	2.5	\N	0.8	3778560
149	186	4	2.5	Hotel court in. Easy positive home west evening major.	2.0	3604480
3	50	10	0	Billion use maintain option perform reveal rich.	0.5	5472256
125	454	4	2.7	Move maintain talk collection minute would none.	1.1	663552
115	347	3	0	\N	1.1	263168
77	612	4	1.5	Point north long expect people especially.	1.8	1411072
173	118	4	1.7	\N	1.0	1814528
164	467	4	1.8	\N	1.1	7804928
105	416	7	0	\N	1.8	7385088
62	179	6	0	\N	1.7	5807104
11	105	4	1.2	President those mind blood price weight turn. Today again attention professor must one risk.	1.7	5404672
129	68	4	2.9	Often tell like million.	1.9	7798784
146	144	7	0	\N	0.5	4106240
100	426	4	2.0	\N	2.0	5025792
174	214	4	2.6	Final themselves he live which natural.	0.9	890880
12	243	4	1.8	He magazine respond whole coach process side ability. Executive bank stop early event on.	1.8	2625536
26	380	3	0	\N	1.1	3214336
36	407	4	2.2	\N	1.5	5528576
185	38	8	0	Contain report federal imagine.	1.3	1093632
179	469	5	0	\N	1.4	3289088
174	201	4	2.2	\N	0.7	5516288
37	356	10	0	Daughter he dinner individual.	1.7	1860608
101	341	1	0	\N	1.3	2934784
122	104	4	0.6	\N	0.6	4611072
186	341	4	0.7	\N	2.0	5739520
83	513	6	0	Final camera range truth investment pass than large.	0.9	2723840
169	513	4	0.0	Whatever life live me control television town rate. National happy that everything focus world.	1.2	996352
81	25	4	1.2	\N	0.6	6640640
31	570	4	2.9	Campaign new civil a everybody report.	1.1	6856704
40	115	4	1.1	Course fire above since house eight.	0.6	2137088
83	494	6	0	Those song herself among follow defense learn. Run student before sea heart enter.	1.4	1825792
88	6	7	0	\N	0.9	2532352
58	591	4	1.0	Exactly somebody return professional dog.	1.0	7281664
47	115	4	1.1	\N	1.7	1845248
131	259	4	0.6	Rest right walk.	2.0	6246400
8	589	7	0	Its expert marriage debate learn again year. About hit argue staff free.	0.6	204800
88	15	4	1.4	\N	1.6	7091200
1	556	6	0	Offer cover miss thing recently. Dog Congress specific base for.	1.6	2774016
101	336	9	0	Tree important poor admit someone fast.	0.9	260096
9	112	10	0	\N	1.1	6302720
42	533	7	0	Matter door amount Republican hand language.	2.0	7521280
103	273	8	0	Create while growth significant grow attorney big ok.	0.6	1120256
172	494	4	1.5	Cause forget top start. Shoulder music interesting rule.	1.4	2123776
120	400	3	0	Eat indeed cold look mind attorney live whole.	1.5	3767296
179	487	4	2.5	Pattern financial woman open trouble TV.	1.6	1061888
11	109	4	2.7	\N	1.5	2932736
36	406	4	1.6	\N	0.8	5739520
135	115	10	0	\N	0.9	3628032
122	108	4	0.8	Guy customer your since writer. Think son room media drug place politics.	1.2	2890752
14	272	7	0	\N	2.0	6384640
76	136	5	0	Present ever size fall animal sister might. Visit environment expert news.	0.6	1660928
94	385	7	0	\N	1.2	6532096
184	575	1	0	\N	1.8	3651584
101	342	3	0	\N	0.5	6661120
165	288	6	0	Improve produce plan decision always next.	0.7	7719936
114	427	1	0	\N	0.6	7929856
5	296	10	0	\N	1.9	6466560
22	15	4	1.4	\N	1.0	6528000
68	620	4	2.5	Turn PM fly establish there.	1.1	7398400
42	515	4	2.8	\N	0.9	6240256
138	118	4	2.6	\N	1.1	6005760
108	518	8	0	Under total manage high.	1.7	3202048
149	184	8	0	Class probably shake soldier travel across.	1.4	6573056
139	355	6	0	Practice student career.	1.0	3444736
143	510	4	2.3	Throughout behavior return chair others rise.	1.2	3377152
168	108	4	1.8	\N	1.7	3093504
42	532	4	2.8	Laugh opportunity defense.	0.5	6632448
90	615	4	2.6	Reflect eight knowledge major understand happen.	1.0	4183040
167	475	4	2.1	\N	0.6	4262912
31	573	8	0	Career notice land stuff team role. Player follow someone act election too generation.	1.1	7910400
89	24	4	2.1	American land care represent remain economy.	1.7	3796992
24	599	3	0	\N	0.7	3210240
52	497	3	0	\N	1.8	4273152
126	365	4	2.0	\N	1.3	2106368
61	597	1	0	\N	0.9	6274048
115	342	4	1.9	Even community cover make law nor reality.	1.6	7971840
73	57	10	0	\N	1.1	5705728
33	474	4	2.6	Billion arrive common common son.	1.7	4301824
82	27	4	1.1	\N	1.5	7390208
14	279	4	0.3	\N	1.4	6588416
184	580	6	0	\N	1.4	8098816
84	122	4	0.4	Five under baby general nice. Rate point Republican land social tell specific.	1.9	8275968
145	321	6	0	\N	1.3	3355648
146	161	9	0	\N	1.2	3332096
165	273	4	1.7	\N	2.0	6605824
22	13	3	0	\N	1.7	1660928
83	501	4	1.5	\N	1.0	7069696
154	467	9	0	Week office movement lead.	0.6	4109312
41	510	9	0	Paper look close.	1.8	969728
28	607	4	1.0	Big talk size result. Ball tend medical minute lawyer.	1.3	3632128
5	301	4	0.1	Race effect unit white almost report. Open vote fact.	1.8	584704
128	333	4	1.4	\N	0.5	4534272
178	331	1	0	Piece pull appear positive likely.	1.6	8119296
73	40	4	1.1	\N	1.0	1837056
82	23	4	2.8	Method effort employee.	0.9	2642944
175	262	4	0.1	Adult become artist along.	1.7	2485248
7	302	4	1.8	\N	1.7	4039680
181	101	4	1.3	Send son choice kid company manage.	1.9	2153472
42	529	8	0	\N	1.0	4357120
174	213	5	0	Finally around because toward eye.	0.8	876544
33	482	5	0	\N	1.3	7222272
146	148	7	0	\N	0.8	7539712
87	617	4	1.8	\N	1.4	1461248
44	627	8	0	Ball six toward compare my.	1.5	7816192
83	509	4	1.9	\N	1.0	6530048
174	204	8	0	Watch agency among feeling.	1.1	3668992
38	229	1	0	\N	1.4	7975936
62	186	4	2.6	Everyone fast be single election. His sound into how majority son police establish.	1.2	6499328
95	591	7	0	\N	1.3	5733376
184	585	6	0	Couple thought property at Congress finally.	1.9	2123776
129	30	4	2.1	Wide structure country.	0.5	1452032
28	609	9	0	Right money today north song institution nearly.	0.9	975872
187	240	4	1.8	\N	1.4	8022016
53	493	4	1.0	\N	2.0	285696
27	580	4	1.2	Perform record rule animal husband store ok.	1.1	273408
154	465	4	2.6	The cause me control chance.	0.7	1447936
185	49	3	0	Claim decade ahead.	1.0	819200
168	107	4	0.5	\N	1.5	6140928
139	362	4	2.8	\N	0.9	1914880
117	358	4	2.2	Figure until guess kind mother fill.	0.7	4465664
28	613	6	0	\N	1.2	3995648
39	121	4	1.1	\N	1.4	2210816
112	2	4	2.4	\N	1.1	6407168
91	433	6	0	\N	0.8	1266688
121	174	4	1.0	Media professional wonder environmental table collection later.	1.1	823296
172	502	4	2.0	\N	1.2	7479296
186	345	4	1.2	\N	1.4	5443584
143	505	4	0.4	Local financial remember ok open.	1.5	3977216
73	55	4	0.7	Bag information not prevent opportunity. Can too western interest lose argue.	1.7	7724032
35	202	7	0	Me soldier cause into consider now other.	0.7	2361344
87	626	3	0	\N	0.6	4003840
68	629	4	1.3	\N	0.8	6286336
120	387	5	0	Red author mean stuff father.	1.4	5500928
5	294	4	2.9	\N	0.9	6097920
19	425	3	0	Newspaper fund strategy range.	0.5	4304896
94	394	4	1.5	\N	1.5	6708224
27	574	4	2.1	\N	0.6	4254720
180	367	4	2.1	Behavior parent risk rate much. Food teach charge use require.	1.4	1374208
135	112	8	0	Computer thank some church.	0.6	631808
75	202	6	0	\N	1.6	620544
71	327	10	0	Line significant large especially probably.	0.8	7348224
166	418	8	0	However continue past child day local.	1.1	1622016
118	347	4	2.4	\N	1.4	4296704
106	294	10	0	Another agency begin about together trial nation. American idea something through fact itself.	1.8	5428224
132	103	9	0	Yard help wind which.	1.0	7414784
26	370	4	2.4	Store only college sport major rest end.	1.1	4341760
31	583	3	0	\N	0.9	2875392
38	234	4	1.7	\N	1.7	6411264
91	430	8	0	Action human ok consider special everything.	1.1	2167808
158	43	4	2.8	\N	1.4	6923264
136	320	4	1.0	Smile newspaper consider force. Property family these create window even.	0.7	4077568
177	416	10	0	\N	1.6	1606656
140	19	3	0	\N	1.7	1722368
9	114	4	1.2	Evening up number father operation of.	1.1	5937152
70	193	6	0	Play course degree interesting reveal almost gas.	1.8	2527232
57	376	10	0	\N	1.9	8056832
158	49	10	0	Available again market.	1.7	5701632
14	292	8	0	Hear produce page approach might.	1.9	1366016
65	107	5	0	Fall course past sea box there.	1.6	5918720
185	52	8	0	Almost feel color candidate information artist significant. Movie appear hotel top lead nor space.	1.9	1006592
177	412	9	0	Source several become role sit month. Sure song pass key particular edge follow.	1.3	7334912
169	503	4	0.5	Quality media cover modern.	0.6	912384
71	318	5	0	Young manager son apply value certain popular.	1.9	2065408
87	619	4	0.1	\N	0.9	4904960
87	621	4	2.2	\N	0.9	2240512
59	438	8	0	\N	0.6	4343808
83	511	9	0	\N	1.1	1991680
60	358	4	2.2	\N	1.3	6518784
174	203	4	1.1	Across old teacher represent pay experience four.	1.8	1994752
151	121	4	1.1	Three begin evidence game other per teacher meeting.	1.3	2339840
34	103	7	0	Himself bit little trouble fine reveal hotel. Task nation politics our smile under.	0.7	6250496
76	142	4	0.9	Marriage return hundred authority watch. School fine act personal employee understand service strategy.	1.1	2515968
12	250	4	1.1	\N	1.2	5915648
52	506	6	0	\N	0.5	6950912
78	260	7	0	\N	0.6	5038080
108	517	7	0	Language message fish white knowledge suggest technology foot.	0.8	722944
159	348	4	1.5	Debate what material none deep.	1.1	3393536
116	181	4	2.1	Store wall unit during like happy each.	0.8	4118528
56	96	7	0	Street difference data main far leave.	0.8	5462016
166	409	4	2.8	\N	1.1	6496256
108	532	4	2.8	Trip heavy of.	1.0	3759104
116	176	4	1.3	Either contain bill. Trial either history possible spend economic upon.	1.2	5093376
180	379	4	2.0	Former management huge western truth carry head.	1.9	7627776
71	323	10	0	Yourself interest church measure at trouble be do.	1.4	2231296
3	40	4	0.7	\N	1.4	2551808
130	615	4	2.6	\N	0.6	8142848
101	338	4	1.3	\N	1.7	1366016
90	607	6	0	Child bed clearly local across stock fly. Health similar common tax.	0.7	1214464
96	586	4	0.1	\N	1.3	5686272
112	8	6	0	\N	1.1	1652736
70	198	4	2.0	\N	0.9	6983680
132	105	4	1.2	\N	1.3	2477056
169	493	1	0	Within television sing art site onto north.	1.1	7433216
124	116	4	0.7	\N	1.1	5815296
146	140	7	0	\N	1.0	7632896
59	443	4	2.3	\N	0.5	5244928
144	563	7	0	Arm your system right watch order. Face mouth cut oil.	1.9	1700864
37	355	1	0	Who fine a set own over position.	1.8	6099968
26	379	3	0	Finally partner story recent message wear they example.	0.8	2012160
53	511	4	1.6	\N	0.8	2106368
158	62	9	0	\N	0.9	7954432
20	110	4	2.0	\N	1.9	4875264
122	111	4	1.5	May region forget high computer wife. Then many indeed operation.	1.7	627712
59	431	4	2.1	\N	0.6	662528
91	443	4	2.3	\N	0.7	7327744
146	138	5	0	Wish series onto social idea.	1.7	2180096
121	185	9	0	Number low attack around perform west.	1.3	2611200
105	415	7	0	\N	1.2	1682432
150	553	4	2.8	\N	1.6	7683072
105	419	4	2.6	Full prepare brother away since behind.	1.6	5153792
125	451	9	0	\N	1.6	3301376
78	248	4	1.9	First program from see explain.	1.2	2276352
12	264	10	0	Job fight base attorney.	1.8	7010304
175	249	4	1.0	Sing water phone arm sea population rock. Large team home within campaign mouth.	0.8	4102144
103	275	4	2.3	\N	1.6	3517440
76	144	5	0	Key eye political chance theory couple.	1.8	1150976
156	318	3	0	Prepare thank society style order tough central doctor.	0.7	7052288
107	478	7	0	Market story such our difficult here.	1.5	3595264
68	626	3	0	Air wish fast certainly eye garden two. Prevent rest scientist beat plant face gas.	1.7	2510848
145	319	4	2.0	\N	1.3	7001088
11	102	10	0	\N	1.8	3163136
89	22	4	1.3	\N	1.1	6350848
143	506	1	0	\N	1.0	1881088
78	259	4	0.4	\N	1.9	3628032
112	1	4	0.4	\N	1.0	2444288
48	444	7	0	\N	1.3	4459520
148	403	3	0	\N	1.2	7339008
145	324	4	2.6	\N	0.6	6571008
14	277	3	0	\N	0.6	6859776
110	425	4	2.1	Director voice central. Bring use trial phone.	0.7	2351104
120	399	4	2.6	Effect picture he others fund area party.	1.8	2593792
3	49	4	2.5	Community wonder message. Into participant especially find.	0.8	6467584
31	575	4	0.8	\N	1.9	3659776
35	206	7	0	Should career food beat first.	1.7	1867776
184	576	4	2.8	Deep fly television end despite course. Wonder site free economic.	0.8	5864448
8	586	4	1.1	High age suffer us rest herself however. Sea season another agreement.	0.7	3840000
115	339	4	2.0	Deal small relate half financial hospital live. Source arm bad fire structure.	0.9	2720768
54	266	6	0	\N	1.7	1847296
39	120	4	2.1	Enough share he discussion can stock section.	1.9	3471360
109	480	4	2.6	\N	0.8	8161280
76	130	10	0	Vote bill defense. Voice tonight religious avoid recently reduce.	1.6	5257216
21	301	10	0	Stand morning matter computer yourself participant. Tonight article account better necessary professional you.	1.2	1963008
61	592	6	0	\N	0.9	6597632
172	493	9	0	\N	0.8	1039360
68	621	4	1.8	World last country player director respond another ask.	0.8	747520
78	262	4	1.2	\N	0.9	2031616
26	368	7	0	Fast wear manager.	1.7	2013184
73	66	5	0	\N	0.8	537600
56	100	4	0.9	Improve capital training industry. Tell peace several item.	0.9	888832
22	8	7	0	Research another PM hold hour sit event.	1.1	7298048
129	66	8	0	\N	1.7	3624960
144	583	4	2.7	Development thought analysis her peace claim treat.	1.9	2304000
175	260	4	2.9	Central pass movement class agreement like job staff.	1.4	1471488
114	445	4	2.0	\N	0.5	6459392
53	501	4	0.5	\N	0.5	2728960
140	10	4	2.0	Individual movement reduce never reason.	1.3	6625280
83	499	4	1.6	Lay personal day.	2.0	6971392
185	36	5	0	\N	0.6	1983488
42	524	1	0	Executive figure moment occur word. Politics situation environmental half education.	1.4	4092928
42	523	9	0	Student him want lot. Along final firm perform relationship from.	0.7	4439040
80	59	4	2.5	\N	1.2	4918272
103	284	4	1.5	\N	1.1	848896
11	111	1	0	Season thought kind their note. Partner claim trip more.	0.5	5388288
71	320	4	0.3	\N	0.6	3818496
187	234	4	1.6	Modern offer sound pay never together than sit. Guy opportunity stock.	1.0	2217984
1	557	4	1.5	\N	1.9	4896768
23	277	4	0.9	\N	0.6	1520640
72	96	4	0.2	\N	0.8	1936384
84	121	8	0	Tonight attorney any energy pull.	1.8	2407424
53	505	4	1.2	Present learn often investment source general resource.	1.8	1757184
144	580	4	2.0	Late thousand effort eye decision finally use.	1.2	2515968
131	246	4	1.0	\N	0.8	3355648
98	277	1	0	Either get bag population maintain central effect speech.	0.6	3298304
41	493	4	1.0	\N	1.3	2453504
63	218	10	0	Our yard sometimes face. Nothing run garden prevent me she affect open.	1.3	3566592
83	488	4	2.0	List exist budget attack. Sort face chair teacher statement.	1.1	6840320
121	175	3	0	Yard behind capital glass old.	0.8	3841024
1	545	4	1.9	\N	0.6	3699712
175	265	4	2.7	Career watch ok seat.	1.8	3149824
112	5	4	2.1	Also why out need. Town same everybody account real church off.	1.5	5390336
186	346	4	0.7	\N	0.8	4732928
76	140	4	2.8	\N	0.6	4234240
130	612	4	1.5	\N	0.6	643072
116	175	5	0	Control bad front mission share end. Wind name evening.	1.7	1547264
64	296	4	2.5	Former himself tonight these thing.	2.0	7539712
12	244	9	0	\N	1.9	7153664
163	220	4	1.8	\N	0.7	2590720
169	500	7	0	Personal lawyer thing call yet trade.	1.4	3890176
24	595	1	0	\N	0.9	5696512
21	298	8	0	\N	1.1	3617792
129	31	4	1.0	\N	0.6	891904
14	289	4	1.1	\N	1.1	5027840
152	358	4	2.2	Rate skin herself show.	1.0	926720
123	549	4	2.8	\N	0.9	1200128
73	39	10	0	\N	1.3	1015808
150	549	4	0.8	\N	1.3	1216512
88	11	4	2.7	Feel seek magazine girl could high.	0.9	6584320
87	618	10	0	Change unit morning decade on too mind.	0.8	8174592
109	483	4	1.3	Suddenly later experience full draw international big.	1.7	6752256
140	11	4	2.3	\N	0.6	3167232
103	282	4	1.6	\N	1.8	6700032
44	620	4	2.8	Meeting town street dog about quickly.	0.9	5001216
185	63	1	0	\N	0.8	3750912
123	543	4	0.2	\N	1.6	3852288
36	404	1	0	Fall scene serious project apply theory.	0.5	5515264
166	421	1	0	\N	0.5	3078144
7	309	9	0	\N	1.6	7780352
59	445	4	2.0	\N	1.7	7003136
98	273	9	0	\N	1.9	1007616
64	299	3	0	Middle big laugh.	0.6	5096448
155	333	4	1.4	Out kind eight great able protect foreign. Computer campaign table opportunity serve add successful.	1.4	7779328
140	20	7	0	Answer be conference may history. Consumer life base western grow plan.	0.9	2420736
94	400	8	0	\N	0.6	1220608
27	572	10	0	\N	1.9	4748288
129	34	1	0	Evening during history final. Why direction resource discover low view pay.	1.9	7046144
74	627	4	1.7	Next from choose relate.	1.7	2732032
41	504	3	0	\N	1.4	5526528
185	67	4	2.7	Really about run current best clearly. Tough face price what.	1.4	5158912
24	592	4	1.4	\N	1.5	1054720
13	352	4	2.3	High interest ask agree become glass fire.	1.8	3338240
98	289	9	0	\N	1.0	5975040
53	496	10	0	Position support stock.	1.2	780288
115	346	4	1.9	\N	1.6	5453824
53	504	4	0.1	Probably range election citizen policy step condition another.	1.2	2849792
86	269	9	0	\N	1.0	263168
82	21	9	0	\N	0.8	2314240
54	268	5	0	\N	0.5	2154496
107	481	3	0	\N	1.0	2372608
165	282	4	1.6	\N	0.8	8091648
115	338	4	1.8	Community better none above century.	0.9	6245376
25	608	4	1.9	Bank prevent effort. Quickly alone field teacher pressure send seven.	1.4	7577600
12	255	4	1.9	\N	1.5	5596160
87	623	3	0	\N	1.6	5294080
23	287	4	2.0	\N	1.8	5832704
43	191	4	2.0	\N	1.8	3684352
165	279	5	0	\N	0.8	1429504
73	63	4	1.8	\N	0.5	455680
149	176	9	0	\N	1.5	8046592
120	390	8	0	Of nature hospital. Personal develop may person month indicate.	0.5	6416384
31	565	4	2.2	\N	1.4	7650304
127	405	4	2.9	Analysis sell process drug like.	0.7	4033536
77	615	3	0	\N	1.7	5957632
41	500	4	0.7	\N	1.7	6728704
152	357	4	2.0	\N	1.6	7980032
154	464	4	1.3	Dinner room happen until opportunity arrive.	0.9	6727680
125	453	4	1.2	\N	1.5	4954112
70	189	9	0	\N	0.5	5656576
66	349	4	1.2	Very our risk maintain. Chance reason cell.	0.7	471040
122	110	4	2.0	We phone lose pattern education. Us former they someone experience.	1.0	3809280
131	265	9	0	Accept whether back over avoid change item order.	2.0	1806336
82	25	7	0	\N	0.8	2352128
21	296	4	2.7	These quickly seven store pay unit table.	1.3	646144
68	616	4	1.2	Street test reach three. Just capital alone know treatment page.	1.3	1085440
43	192	4	2.0	\N	1.4	876544
145	320	8	0	Major gun blood customer site offer.	0.6	4123648
79	349	4	1.2	\N	1.8	7121920
91	441	4	1.6	\N	1.7	3343360
12	249	7	0	Item street cut provide same each nothing.	1.9	3778560
103	289	4	0.9	\N	1.7	4326400
168	106	6	0	Gun one for better state.	1.4	7146496
126	376	4	0.4	\N	0.8	3484672
142	27	5	0	Room ok second officer detail candidate arm weight.	0.6	7130112
20	106	4	1.4	\N	1.6	1089536
83	508	6	0	Clear actually agree kid not pick assume.	1.7	6665216
129	43	10	0	\N	1.3	4610048
139	358	1	0	Poor city just join ability hit military.	1.6	5110784
180	377	9	0	Fly whether father push.	1.7	7902208
13	348	4	1.3	First Republican today Mr wind country feeling.	1.3	1164288
88	12	3	0	\N	0.6	4749312
4	451	4	1.9	\N	1.0	2305024
80	36	5	0	\N	1.6	1814528
184	584	9	0	\N	1.2	1534976
83	496	6	0	\N	0.6	2711552
109	479	6	0	Pay thousand local mouth.	1.1	1838080
169	492	4	1.1	Book against away baby. Most consumer attorney answer agent.	1.2	6721536
73	60	4	1.1	\N	1.8	5537792
185	44	4	0.7	\N	0.8	6398976
78	243	4	1.8	\N	1.2	5486592
62	176	4	1.3	\N	1.6	1853440
103	293	4	1.0	\N	1.2	834560
108	539	4	1.3	\N	1.4	588800
134	328	6	0	Media town citizen series.	1.5	5568512
31	567	4	1.8	Tax nation opportunity less throughout.	1.0	1553408
140	8	1	0	International probably site decision.	1.4	7831552
167	483	4	0.0	Same could partner. Thing mind important certainly ball blood.	0.6	1000448
109	476	4	0.0	\N	1.4	7891968
75	206	4	2.1	Partner forget boy war.	0.6	2841600
185	68	4	2.9	Forget activity relate large cost. Player father decide onto win exist media treat.	0.6	2258944
2	425	9	0	\N	1.9	5825536
35	205	5	0	\N	0.5	5545984
104	184	5	0	Avoid garden through.	1.4	302080
182	464	4	1.7	\N	0.6	7606272
39	128	7	0	Part television pressure first resource.	1.3	1296384
162	613	4	1.2	Major dark accept we can bad dark everyone. Character prevent at forget foot page.	1.9	1086464
187	235	8	0	\N	0.6	6871040
170	118	4	2.1	Book position marriage heavy crime.	1.7	5274624
130	607	4	1.6	\N	1.5	1858560
79	352	9	0	Data hospital need.	0.8	727040
42	538	8	0	\N	1.0	7232512
91	446	10	0	\N	1.4	7888896
74	617	5	0	Concern mean citizen toward rise that fire. Various investment certain part.	0.7	5369856
42	537	9	0	Rather wind vote.	1.6	3837952
126	364	4	1.3	Same put human issue pay note pull take. Thousand property save town.	0.5	2395136
164	460	4	2.7	Alone general country represent ahead old represent.	1.8	7354368
60	360	10	0	\N	0.6	7091200
44	624	4	1.7	School value focus.	1.2	6242304
18	600	4	1.9	Listen city type.	1.4	4815872
41	494	4	1.1	\N	1.2	7398400
83	490	4	1.0	\N	1.7	2222080
101	345	10	0	College able maybe wind card step never event.	1.6	5549056
80	34	4	2.3	\N	1.1	3821568
71	319	4	2.0	\N	1.2	6154240
112	4	8	0	\N	1.3	3194880
103	279	7	0	Wide development instead professional. Painting lay camera pay voice anything.	0.7	7571456
72	98	4	2.6	\N	0.9	3212288
167	485	4	2.3	Better tough leader.	1.2	4083712
158	38	4	2.2	\N	1.2	8212480
26	366	9	0	Usually technology difficult memory per.	0.7	5291008
158	34	4	2.0	\N	0.8	2273280
134	329	4	1.7	Employee number air seem single wife born.	1.4	1245184
22	7	3	0	Necessary detail read throw matter. Century list modern may by to.	1.4	4078592
155	332	5	0	Purpose career indicate. Smile cut politics street behind trip.	1.3	4508672
76	132	4	2.1	\N	1.1	5793792
93	451	6	0	\N	1.5	2242560
124	115	4	1.1	\N	1.8	5834752
158	64	4	1.2	\N	1.6	2526208
119	624	6	0	Window first her particularly edge there arrive.	1.5	1534976
143	492	1	0	\N	1.5	2644992
187	230	9	0	Money nature store he pattern painting.	0.7	461824
183	302	10	0	Light key whether professor clear.	2.0	1826816
119	616	9	0	\N	1.3	3705856
134	327	4	1.5	\N	1.0	4920320
52	501	4	1.5	\N	1.8	6100992
134	323	4	1.6	\N	1.0	3584000
57	375	4	1.6	\N	1.5	5011456
146	139	7	0	\N	1.6	2173952
185	61	9	0	\N	1.4	428032
162	607	4	1.4	\N	1.4	6792192
156	327	1	0	\N	0.7	258048
165	274	1	0	Could source American.	0.9	7427072
162	611	4	2.3	\N	1.5	3092480
125	455	7	0	Draw former develop short it light.	0.9	608256
80	63	4	1.8	Someone particularly color on Democrat.	1.0	7268352
145	325	7	0	Eat even kind visit need thought hope quality.	0.7	1661952
183	307	7	0	\N	1.2	2160640
24	591	4	1.0	Yard agreement worker police year.	2.0	5947392
28	608	7	0	Recognize a style husband about many.	1.0	1150976
144	567	4	1.2	\N	0.7	3700736
179	483	4	1.3	\N	1.6	7468032
24	597	4	2.6	Western increase too court purpose.	1.1	4218880
70	190	10	0	\N	1.5	3470336
126	368	9	0	Six he conference however agency including history. Detail never respond experience number agency.	1.6	4302848
184	579	5	0	Only miss someone expert.	0.5	7536640
146	131	4	1.4	Development long big fact learn.	1.4	1310720
172	510	4	2.3	Big international couple relationship article. On week themselves.	1.2	4823040
129	32	4	1.7	Produce off easy fact level cup.	1.1	1430528
80	66	8	0	\N	1.2	7486464
172	509	8	0	\N	1.7	1633280
152	355	4	2.4	Mean skill number well will.	1.1	5970944
189	101	5	0	\N	1.3	866304
126	366	4	2.4	\N	1.7	7602176
1	546	4	2.3	\N	0.5	561152
33	480	4	1.9	\N	1.8	6716416
167	478	4	0.5	\N	1.3	233472
101	343	4	2.1	Represent actually name stand. Free fight should mean while.	2.0	2068480
175	264	9	0	Effort home but of.	0.7	2928640
41	498	4	1.0	Example road decide. Ago professional few.	0.6	6052864
59	447	4	1.3	\N	0.6	5071872
163	226	1	0	Oil network property.	1.4	5639168
175	254	4	1.2	They create remember what life daughter usually. Price whom opportunity history perform recent nice.	1.2	6444032
31	585	6	0	\N	1.0	7848960
52	513	10	0	\N	0.6	6188032
129	55	9	0	\N	1.4	6021120
123	547	4	0.4	Trial very control western its.	1.1	1412096
14	288	9	0	\N	1.2	7425024
146	136	8	0	News continue ground hear. Significant town want then.	1.8	689152
23	292	9	0	\N	1.2	4156416
157	358	4	2.2	Truth store key two charge. Build bed since happen window building behavior.	1.1	7366656
3	38	4	2.2	\N	1.9	5673984
71	325	9	0	\N	1.6	2492416
129	56	4	2.3	Course five laugh since.	1.7	5751808
104	181	4	0.1	\N	1.6	5433344
81	29	4	1.3	\N	1.9	7493632
107	483	4	0.3	Make tax box house standard off middle. Foot worker factor really traditional.	2.0	3878912
144	578	4	2.3	\N	0.9	2796544
150	557	4	1.5	Month these perform. National today table green project.	1.3	715776
44	626	7	0	\N	0.7	549888
137	605	6	0	Contain box family matter three there. Air executive must decade machine.	1.1	4314112
161	222	4	2.2	\N	1.3	8156160
7	310	7	0	\N	0.9	3598336
73	56	10	0	\N	1.1	2661376
145	327	4	0.9	Future job read policy.	1.9	4064256
155	331	4	2.2	\N	1.5	4862976
158	35	10	0	\N	0.6	4938752
162	612	4	1.5	\N	0.6	1316864
63	217	6	0	Order realize term outside tree beautiful.	0.9	1248256
20	102	5	0	\N	1.1	224256
149	179	4	1.7	So material suddenly friend interview.	1.9	2293760
144	571	5	0	Down rather career thank.	1.9	532480
90	611	4	2.3	Well receive challenge mention.	0.7	7966720
166	422	9	0	Thought section four while two range send.	1.1	7284736
82	29	5	0	Way air business wide student.	0.6	7698432
3	61	1	0	Center measure drug who student.	0.7	2535424
71	329	4	1.7	\N	0.5	577536
88	3	8	0	\N	1.5	670720
140	4	1	0	\N	1.6	3557376
169	508	4	1.7	Later better three tonight. Follow four laugh toward.	0.9	6706176
80	46	4	1.2	\N	1.3	4282368
31	574	8	0	Amount ball road magazine choice become wonder.	1.6	111616
83	510	4	2.3	\N	1.0	7166976
184	564	4	1.9	\N	0.6	6664192
76	152	4	2.3	\N	0.7	205824
35	209	4	1.0	Recent until cell itself.	1.5	4732928
185	46	4	1.2	\N	0.6	7275520
88	10	5	0	\N	1.9	2679808
158	47	4	2.9	Lot example responsibility city more west.	1.0	253952
144	569	4	1.5	\N	1.2	5478400
127	408	4	0.5	\N	0.9	617472
143	494	4	1.5	Worry year everyone write past serve box.	2.0	4920320
129	36	8	0	\N	1.8	2375680
80	49	10	0	\N	0.6	2606080
3	48	6	0	Cause put book she. Half government little continue movement possible movement.	1.8	6566912
144	568	4	1.7	Lose tonight east. Color lead he capital heart example information can.	1.7	5123072
98	280	9	0	Senior condition support.	1.5	147456
131	253	8	0	Certain enter I of north.	1.7	5808128
158	50	1	0	Floor doctor ever war coach hotel level their.	1.5	2713600
7	307	6	0	Who together without soon where white stop.	1.5	3250176
42	518	5	0	Technology alone news may organization imagine.	1.8	1871872
151	126	4	1.2	Most increase what hear step whatever ahead plan.	1.5	3302400
172	500	4	1.4	Join sit from official better according.	1.8	3847168
160	115	10	0	\N	1.8	2791424
68	624	4	1.7	\N	1.5	2157568
108	526	10	0	More ago analysis start. Billion about challenge series surface economic.	1.3	7198720
7	306	7	0	\N	1.8	3344384
26	364	5	0	\N	1.7	6555648
176	344	4	1.4	Order himself upon who miss business enjoy list.	1.6	1963008
98	272	3	0	Share weight just tonight fire question role group.	0.6	5020672
26	376	4	1.1	\N	0.8	7950336
31	581	4	1.3	Foreign reflect can.	1.3	780288
30	331	4	2.2	General idea look late.	0.6	7952384
83	505	4	0.5	Question else agent region.	1.5	3097600
93	457	8	0	Professor ball watch military something reality.	1.6	4792320
48	437	4	0.5	Sign ground even everyone enter economy born. Defense concern speech ahead arrive challenge.	1.3	5377024
26	378	4	2.4	Knowledge play admit half total when.	0.8	6775808
143	501	4	1.5	\N	1.3	3209216
43	196	1	0	\N	1.6	1866752
131	262	5	0	\N	1.2	1001472
136	322	5	0	\N	1.1	2883584
171	229	3	0	Interest away doctor both future cost.	1.2	4339712
107	477	4	0.1	\N	1.5	8284160
75	204	1	0	Cup pay only trial yard reason. Almost even cause.	2.0	6635520
180	376	4	0.7	Research certain town present herself.	0.6	5047296
121	180	4	2.6	Might little thought evidence lawyer little artist.	0.9	4734976
73	37	4	2.8	Pull great international strategy could. Carry seat service administration expect room.	1.9	7276544
49	351	4	2.1	\N	1.2	5714944
28	606	4	2.0	Decide page side relationship never gun. Rich cause least series study brother.	0.9	5452800
175	263	4	1.9	\N	1.0	3235840
119	625	6	0	Project wonder look boy yeah before yourself.	1.9	6866944
130	610	5	0	For culture property end grow no.	0.8	673792
80	57	10	0	\N	1.7	7242752
76	138	4	2.8	Game recent these page pattern.	1.0	3605504
12	245	6	0	\N	1.4	6756352
37	353	4	1.1	\N	1.4	2718720
109	475	4	0.4	Design meeting me someone. Down collection once foreign enjoy democratic recent.	0.8	6106112
7	313	4	2.2	System idea later could religious ability rich. Instead worry usually body matter.	1.2	6041600
140	18	4	0.5	Dark program third growth beautiful then they entire.	0.8	559104
103	280	4	2.4	Line Mrs century likely reduce wish. Time value traditional relate.	1.5	409600
152	361	7	0	Skin line behavior firm.	1.4	2460672
87	625	5	0	Short development explain agency cost interesting. Most live which piece.	1.9	5255168
41	490	3	0	Nice power should surface.	0.6	4530176
57	374	3	0	\N	0.5	3210240
27	567	4	1.4	\N	1.4	772096
44	623	4	1.3	Clear open then space tell.	1.7	1883136
114	448	4	2.2	Analysis expect be strategy. Fire first hit order production.	1.1	3520512
75	209	8	0	\N	1.6	4356096
31	584	4	1.4	Line everyone yes avoid prevent.	1.2	3539968
30	333	4	1.4	Star thousand article too around significant.	1.3	4936704
78	244	5	0	\N	1.0	115712
4	450	6	0	\N	1.6	3394560
42	522	4	2.1	Attack spring painting.	1.6	1472512
123	562	4	1.2	Question how likely.	0.7	5521408
158	36	10	0	\N	1.7	522240
158	67	4	2.7	\N	1.9	3693568
114	437	3	0	\N	1.4	6635520
114	434	4	2.5	\N	1.2	7456768
42	536	4	2.4	Candidate political seem particular hospital service despite.	1.6	2004992
22	14	7	0	\N	0.8	3279872
136	324	4	2.6	\N	1.9	6584320
139	353	3	0	\N	1.5	3571712
174	202	4	0.7	Prove style million alone.	1.7	3363840
131	248	4	1.5	Answer list mention account many him office.	1.9	1275904
141	101	9	0	Listen carry somebody.	1.2	4988928
114	435	4	2.3	\N	2.0	4248576
150	552	3	0	Strong road man respond because poor should fine. Event program far.	0.7	5615616
163	222	9	0	\N	0.9	1618944
158	45	4	1.1	Month surface player argue it debate change.	0.8	5965824
185	62	3	0	\N	1.0	8126464
75	205	10	0	Public career occur. Stage use news nothing shoulder ok than.	0.9	8001536
81	23	1	0	Have I three body color.	1.2	778240
136	326	4	2.5	Approach late enjoy sort response successful.	1.0	4048896
150	543	10	0	About attention likely heart.	2.0	3814400
161	221	7	0	\N	2.0	4724736
182	462	6	0	Civil true security why. Decade side special seem know.	0.6	2077696
23	289	7	0	\N	1.5	5035008
59	429	1	0	\N	0.7	628736
61	601	9	0	Western bill recently animal. Choice continue food current only true.	1.6	1156096
23	283	4	0.4	Increase performance perhaps city school.	1.9	3353600
157	362	4	1.8	\N	1.9	5383168
34	105	4	0.6	\N	1.2	4124672
33	472	4	1.0	Computer side sort.	1.4	1996800
109	470	4	0.5	Artist try toward wife example occur sort international.	1.6	6412288
75	208	7	0	\N	0.5	331776
88	7	5	0	\N	1.5	8215552
97	604	4	1.7	Agent election cell audience. Reason take democratic method old.	0.9	6383616
111	118	4	2.6	Set catch seven result medical. College authority by.	1.5	846848
26	369	5	0	\N	1.1	5092352
151	119	4	2.4	Newspaper need adult almost can.	1.5	6137856
31	572	4	2.0	Check raise worker also.	0.7	5937152
87	629	6	0	Go training hold against image manage husband.	1.5	5818368
3	51	4	0.8	Natural collection assume she nearly such movement.	1.3	3996672
52	491	4	1.1	\N	0.7	1098752
134	326	6	0	\N	0.9	3008512
184	581	8	0	\N	0.9	985088
119	628	4	2.4	\N	1.2	1547264
80	31	4	1.0	Affect law he your. Anyone card action rise bed travel adult.	0.9	2996224
144	573	4	1.0	\N	1.8	3160064
103	276	4	0.1	\N	1.9	3247104
35	200	4	0.7	\N	0.6	6371328
5	298	3	0	Six never western nearly end although. Kind federal throw.	1.4	4800512
39	126	4	2.4	Subject whom important.	1.7	1307648
57	372	4	2.0	Success side be behind tell also soldier.	0.5	2384896
184	571	4	2.0	\N	1.4	2699264
165	287	4	2.0	\N	0.6	1533952
16	365	4	1.3	\N	1.7	2572288
107	470	4	1.1	\N	2.0	2946048
156	320	1	0	A fact expert value.	0.7	1222656
135	114	4	1.2	White serious miss past shake plant.	1.3	218112
105	412	4	0.6	\N	1.5	4612096
42	540	6	0	\N	1.4	6609920
96	590	7	0	\N	1.5	3461120
184	570	4	2.9	Until end experience.	1.4	7422976
184	583	4	2.7	\N	0.5	806912
81	27	4	1.1	\N	1.2	4014080
184	567	4	1.8	Store door against image.	1.7	4595712
182	460	4	2.7	\N	0.6	2092032
172	498	4	1.0	Case read real late at fall.	1.0	4908032
32	604	4	1.7	Know across affect television low tell.	1.4	6068224
35	201	4	2.2	Book standard animal own recent require.	1.1	3679232
123	542	4	2.5	\N	0.6	7206912
123	544	8	0	Term player agency whatever feel fill event.	0.7	8276992
109	484	7	0	\N	1.0	3213312
89	28	4	1.4	Them class serious mother.	1.2	3225600
43	197	4	1.2	\N	0.8	1403904
53	512	4	2.1	Particularly budget investment real. Though turn bar.	0.6	1984512
158	30	4	2.3	\N	1.1	7351296
77	608	4	1.9	\N	1.4	6069248
167	476	4	1.0	East middle hope item fund moment create. College test most.	0.6	2439168
80	41	4	2.7	Capital language physical cost according.	1.3	5453824
94	397	4	1.6	Any international defense require dream.	1.7	5704704
146	158	4	1.1	My from water check.	1.5	5997568
79	350	4	2.8	\N	1.3	278528
163	217	6	0	\N	0.5	2838528
131	264	10	0	Civil nice story over.	1.4	3837952
27	583	3	0	\N	1.5	6644736
48	448	4	2.8	Learn former ahead minute course assume.	1.2	5977088
42	528	3	0	\N	1.6	6666240
134	316	4	1.7	Team involve it kid million especially baby. Great military them media require now short.	1.6	1351680
59	448	6	0	Professional west too debate.	1.4	2974720
81	22	4	1.3	\N	0.7	690176
59	432	5	0	Agreement threat purpose tonight arrive fill yeah.	1.0	4882432
53	488	4	2.0	Be cell industry behavior price successful.	1.9	3266560
122	103	8	0	\N	1.8	3406848
129	67	10	0	Wind generation season last answer. Go clearly drop change action prepare simple.	1.4	2441216
143	500	4	1.4	\N	0.6	4332544
167	474	5	0	Eight close impact apply interesting consider. Serve movie condition stand.	0.6	7229440
71	321	4	1.6	Type record federal three. Bad seem team walk.	1.8	2996224
134	319	4	2.0	About doctor approach side tend.	2.0	6775808
150	545	3	0	Truth stage deal hear glass. Way down network main structure piece.	1.3	1021952
88	19	4	0.4	Wish throughout throughout than region.	1.7	3546112
50	218	4	1.3	\N	1.0	3384320
146	134	4	1.7	\N	1.1	7010304
53	507	9	0	Teach rock hard born evidence model.	1.6	5086208
120	383	7	0	\N	1.1	1470464
70	195	1	0	Shake they of remain sell rather. Parent agent must enough.	1.5	6658048
23	285	4	2.5	Little left cultural determine personal manage. Red personal understand within my.	1.3	5389312
12	258	4	1.1	Writer item thought senior size speech hair. Take my put board tax young fire.	1.7	1223680
52	495	10	0	\N	1.7	2548736
28	615	4	2.6	\N	1.5	1626112
187	231	8	0	Do job rule consumer involve street with.	1.1	5843968
171	240	5	0	Measure west oil.	1.4	4344832
31	566	4	1.9	Pattern we hair property type good southern receive.	2.0	1595392
33	485	4	2.3	Economy sport half study these other develop.	0.5	777216
150	541	9	0	Security treat morning want analysis alone race.	1.4	346112
68	625	4	2.1	\N	0.9	1280000
103	271	4	1.0	Tax she matter nature land fine catch.	0.6	680960
176	338	4	0.0	Owner more my wind. Stock religious government myself.	2.0	954368
73	64	4	1.2	Professional door draw least to how.	1.2	3914752
154	463	3	0	Car machine gun maybe agency own travel.	1.5	3351552
64	297	8	0	\N	1.5	3517440
126	378	4	1.8	\N	2.0	3323904
93	456	10	0	\N	1.7	5039104
4	457	4	1.6	\N	1.9	3136512
167	477	4	2.4	\N	0.8	6377472
69	406	6	0	\N	0.7	1672192
129	45	9	0	\N	1.3	7418880
16	378	1	0	\N	1.9	747520
110	426	4	2.0	Thousand before name today ahead. Street fill say wear door.	0.5	4585472
80	35	4	0.4	\N	1.0	7886848
73	30	6	0	\N	1.9	457728
73	44	4	1.1	Tonight within include article stuff.	1.0	4199424
158	51	4	0.0	\N	1.8	6189056
118	346	3	0	Usually cup trade.	1.9	1029120
160	117	1	0	\N	1.7	4132864
132	110	4	0.7	Partner part management gas. Gas drug power figure.	0.9	5823488
119	629	4	1.3	\N	2.0	486400
44	628	4	2.4	\N	1.8	6277120
163	224	4	0.3	Role chair group pass enter Mrs.	1.5	2122752
59	427	7	0	Majority say mission see letter. Herself nearly field religious.	0.5	7777280
43	199	7	0	\N	1.5	4165632
73	68	4	2.9	Do look model trip wait.	0.7	6283264
27	571	4	2.2	\N	1.4	110592
101	339	5	0	Congress floor something surface air happy class whom.	1.2	983040
91	442	4	1.1	\N	1.3	902144
188	268	5	0	\N	1.4	827392
161	218	10	0	Political career lose rate yourself strategy similar. Debate parent time late agreement memory thank.	2.0	1261568
12	259	5	0	Democratic together actually letter allow skill threat. Direction institution right operation table public.	0.5	6434816
39	119	1	0	\N	1.6	217088
159	352	6	0	\N	0.6	7289856
112	12	9	0	\N	1.2	931840
65	109	4	2.7	\N	2.0	4974592
80	67	4	2.7	Short serve quickly since.	0.9	1625088
76	141	4	2.6	East whole enter improve game.	1.2	1217536
159	349	8	0	Task need visit water visit.	1.3	6759424
3	59	4	2.5	Into teacher tax.	1.2	4969472
186	339	4	2.0	\N	1.5	6107136
91	445	4	0.0	\N	0.8	811008
61	594	4	2.7	Human put break third might fight. Business player inside development rise nation cost.	1.4	1197056
48	427	4	2.9	\N	1.0	5726208
104	174	4	0.5	Value center tree recognize save second picture.	1.4	7247872
127	404	6	0	Democratic important choose tonight shake.	0.6	1124352
150	558	7	0	\N	1.7	2404352
112	15	4	1.4	\N	1.1	7797760
17	357	4	2.0	\N	0.6	5992448
91	431	4	2.1	Call through receive big.	0.8	1142784
22	5	4	0.9	Choose affect hour week born.	1.3	1444864
17	360	4	2.1	\N	1.2	1082368
172	507	8	0	\N	1.7	2208768
105	409	5	0	\N	1.9	5192704
185	55	4	2.1	Citizen will poor common place. Yes degree challenge difficult value reduce interest relate.	1.4	4984832
114	438	4	1.6	\N	1.0	1255424
23	278	6	0	\N	1.0	5316608
51	403	10	0	Ahead despite drive line. Oil myself behind.	2.0	5696512
80	43	4	0.5	Guy when religious experience former expect center everything.	0.6	5856256
165	291	6	0	Anyone court need purpose lot.	1.3	1538048
41	488	4	2.0	\N	1.5	7035904
185	41	5	0	Employee keep check up bank newspaper guy those. That adult team defense section south two.	1.9	989184
53	500	8	0	Moment growth now fast difference.	0.6	827392
76	160	9	0	\N	2.0	2227200
23	286	4	1.5	Power choice play low tonight wear money we.	1.2	2055168
102	409	4	2.8	She politics majority agency.	1.3	4287488
108	533	5	0	Significant themselves education cut. Few in religious medical clear project soon.	1.8	3976192
164	463	9	0	North often body turn head baby all.	0.6	7017472
131	245	10	0	\N	1.7	1386496
187	229	8	0	Phone far evidence heart across institution.	0.8	2985984
70	199	10	0	\N	1.9	3314688
185	33	4	2.7	\N	0.8	3286016
117	353	4	1.8	Add before bill cold always task week. Why actually as group rich realize.	1.2	7208960
3	33	4	2.5	\N	1.6	2351104
65	111	6	0	Including city rich line fear produce dinner body.	1.6	7388160
93	453	4	1.2	\N	1.0	7723008
87	620	1	0	\N	1.5	3039232
14	282	4	1.6	Star south along church year senior.	1.0	1885184
175	247	9	0	\N	1.6	1864704
121	171	4	2.8	\N	0.7	7179264
5	300	4	1.4	Sit effort music security open.	1.4	5340160
179	480	4	2.6	\N	1.1	124928
167	470	4	0.2	Evidence age government decision.	1.2	4214784
26	365	4	2.0	Put plan age popular town a bank.	1.7	7947264
73	32	4	1.7	Land animal senior.	2.0	1245184
84	125	4	1.8	\N	0.8	2653184
158	37	4	2.8	\N	1.5	7014400
10	591	4	1.0	\N	1.8	7243776
182	467	4	2.5	\N	0.7	4826112
23	275	5	0	\N	1.3	2404352
185	48	4	1.6	Despite morning technology go include amount nature.	1.1	8107008
33	470	8	0	\N	1.6	664576
112	6	10	0	International difficult why dark else.	1.1	1771520
156	322	10	0	Material service information sort market.	1.9	6818816
25	615	4	2.6	\N	1.9	8133632
76	139	4	2.1	Them sort study.	1.3	612352
74	626	4	1.4	\N	1.9	6161408
74	622	9	0	Field whom across present glass. Member education American letter staff street.	0.8	7545856
124	117	7	0	Challenge laugh experience may behind involve. Resource thing term because record report five.	0.9	408576
80	38	4	2.2	Truth firm every security bad.	0.8	6941696
132	107	10	0	\N	1.0	7056384
126	377	1	0	\N	1.5	7425024
58	599	5	0	\N	1.6	5866496
177	410	4	0.0	Listen large blood per approach step. Why him bill season player our.	2.0	1998848
130	608	4	1.1	\N	1.1	5958656
26	373	4	1.7	\N	1.5	3169280
175	243	4	1.8	Machine garden appear wonder form speech college. Pick politics occur guess sea both class.	1.0	7956480
144	584	8	0	Speak because else between fish.	1.8	1386496
39	124	7	0	Own individual worker land girl usually address.	1.4	4848640
164	459	1	0	\N	1.2	623616
108	528	4	0.3	\N	0.9	803840
177	420	4	1.5	\N	1.2	7480320
49	350	4	2.8	\N	1.8	7056384
88	8	4	2.3	\N	0.9	1760256
116	183	4	2.3	\N	1.6	2754560
94	391	1	0	\N	1.3	5322752
160	113	4	2.8	General class billion set let Mr. Resource least those begin improve near one.	1.2	1475584
180	372	1	0	Artist poor generation yourself key.	1.5	4157440
124	112	4	2.8	\N	0.8	5918720
59	440	5	0	\N	0.6	1511424
3	37	4	2.8	Table to maybe public reach against sport project.	1.1	3985408
184	568	8	0	\N	0.8	6484992
15	99	4	2.5	\N	1.4	2802688
101	347	4	2.4	Management determine black consider individual letter note doctor.	0.6	5473280
158	59	6	0	\N	2.0	6003712
125	457	6	0	\N	0.6	5288960
121	179	1	0	\N	0.7	1981440
129	38	3	0	Ability girl fear. Alone thing factor for.	1.6	4927488
23	276	4	1.0	Say foot sometimes data third drive own very. Sit section civil he concern.	0.9	7950336
42	517	1	0	\N	0.9	3458048
95	600	10	0	\N	1.5	6065152
102	410	4	2.7	Old card would house.	1.7	1486848
83	497	4	1.3	Next subject over local north one long. Under themselves put can.	1.5	4959232
1	548	1	0	Before himself space sort.	1.9	7661568
38	230	4	2.6	Reach which experience key whom certainly. Citizen fall read foreign truth weight.	1.9	1680384
70	191	4	2.1	\N	1.1	272384
97	602	6	0	Technology mention not history this difficult federal.	1.2	1085440
22	11	4	2.7	The world would population pretty.	1.3	1410048
42	519	8	0	\N	0.6	4507648
103	281	4	2.8	Never enjoy decide even body. Particular tough federal success then present.	1.6	6032384
158	46	4	1.2	\N	1.5	459776
64	301	3	0	Nor performance population tonight.	1.3	4718592
131	255	3	0	\N	1.1	3990528
21	297	8	0	\N	1.8	8159232
66	351	4	2.1	\N	1.5	1790976
114	443	5	0	\N	1.9	7159808
8	587	4	2.2	Across last stage fast others. Soon notice media second institution citizen.	1.5	6208512
185	64	10	0	\N	1.4	7158784
24	600	7	0	Believe official buy almost economic movement.	1.0	4553728
42	526	3	0	\N	1.2	845824
41	489	6	0	\N	1.8	7973888
163	218	5	0	Expert various leg.	1.9	5225472
37	358	4	2.2	Different style mission enter sister break control.	1.1	8010752
116	173	3	0	\N	1.0	1232896
123	560	5	0	Board bag live after suddenly positive.	1.9	1201152
80	33	10	0	\N	1.2	7478272
123	555	4	1.1	\N	1.3	2880512
41	495	4	1.7	\N	0.9	3048448
84	123	4	1.1	Body last total city. Religious threat daughter mention.	1.6	1162240
143	502	5	0	Every none among indicate. Measure view relationship may.	1.0	376832
83	500	7	0	Term fire politics. News six have.	1.2	2932736
3	68	4	2.8	\N	0.8	1811456
83	489	4	1.7	\N	1.7	2327552
100	425	4	2.2	Lead these through event.	1.2	1549312
105	417	1	0	\N	0.5	3756032
129	39	3	0	Wind letter area price how.	1.2	8231936
98	274	4	0.1	Heart special world long us.	1.4	2289664
102	414	4	2.8	Animal down everything among. Course nothing condition seat.	1.6	4527104
23	272	4	2.4	Do same example nearly yet.	0.9	3569664
73	35	8	0	New middle movie ten cultural scene.	1.4	3333120
108	531	4	1.2	\N	0.7	3324928
43	194	10	0	Contain company beautiful quickly.	1.9	3270656
104	178	4	1.6	\N	1.1	1885184
73	48	8	0	Require assume make today admit crime owner animal. Vote do memory key quality election show.	0.7	249856
62	173	7	0	\N	1.9	1261568
71	324	4	2.6	\N	1.0	1631232
94	396	6	0	Available cover gas purpose.	0.6	4712448
144	564	7	0	\N	1.6	5044224
172	490	4	1.0	\N	0.6	6952960
49	352	4	2.3	\N	1.9	792576
75	207	5	0	\N	1.8	5043200
41	492	1	0	\N	0.7	1723392
5	297	10	0	Sure hot idea fill wall free quickly.	0.9	5347328
18	593	4	0.9	\N	1.4	5665792
109	472	4	1.0	Budget drug gas simply same tax. Wonder section poor.	1.6	3941376
73	51	4	1.8	\N	1.9	351232
169	512	4	2.0	\N	1.8	3989504
136	325	6	0	\N	1.7	343040
53	506	4	0.2	Again training room. Know summer well move many level.	1.3	2360320
37	359	4	2.6	Difference feel cut any ask deal least.	0.6	7998464
52	508	4	1.7	\N	0.9	2802688
129	50	4	2.9	\N	1.8	4905984
76	161	5	0	\N	1.4	2329600
157	357	6	0	Girl benefit near already section five goal final. Minute office actually senior response.	0.9	869376
40	114	4	0.2	\N	0.8	5485568
65	105	3	0	Name above some.	0.5	563200
158	44	4	1.4	\N	1.8	1076224
120	397	4	1.6	Game simply fly actually subject near whether class. Born food stop own oil upon bed despite.	1.2	557056
185	60	4	0.4	\N	1.9	146432
129	57	4	1.5	Miss carry say perhaps collection.	1.0	4931584
176	335	4	2.7	\N	1.0	1529856
52	489	4	2.3	\N	1.8	451584
129	65	4	1.0	Fill same group end space find floor.	0.7	147456
161	226	7	0	\N	1.0	6024192
73	49	4	2.5	\N	1.6	7243776
185	34	4	2.3	\N	1.5	5446656
99	166	4	2.9	\N	1.7	5683200
38	238	5	0	\N	1.0	2107392
33	471	7	0	Weight box light no election truth. Young three show image charge.	0.5	8053760
46	269	8	0	\N	1.9	2044928
129	64	5	0	\N	0.6	6992896
177	418	3	0	\N	1.7	3726336
127	406	6	0	Offer old food rather tree.	1.2	6069248
30	330	9	0	Describe sort than fast step interview.	0.6	3248128
48	428	4	1.9	Future once table at century single. Which although thousand today.	1.1	2862080
46	270	4	2.5	Rich such require role inside car give.	1.0	5190656
160	112	4	2.8	Life cell week key school stage.	1.2	2743296
175	251	4	0.1	Carry to sure during room consumer enough.	1.0	2251776
72	100	4	1.2	\N	1.6	7329792
142	23	4	2.8	City sea arrive stop level.	1.4	223232
3	34	4	2.3	\N	1.6	6349824
62	184	4	1.3	Like southern strategy.	1.7	7715840
106	297	4	1.2	Red police every though risk yet.	1.6	6704128
146	159	3	0	\N	1.7	2618368
172	504	4	1.5	\N	0.9	809984
73	42	9	0	\N	1.8	4596736
78	245	3	0	\N	1.8	4975616
78	261	4	1.5	\N	1.8	2676736
22	10	5	0	\N	0.7	7485440
167	484	1	0	\N	1.8	356352
123	561	4	2.8	Would dinner wait truth simple small.	1.7	456704
59	437	5	0	\N	1.8	7687168
109	471	4	2.2	\N	1.1	1612800
175	242	4	0.6	\N	1.5	1989632
62	185	4	0.8	Either challenge study task call crime huge.	0.7	1169408
112	10	4	0.6	Choose inside discover continue paper seven cultural.	1.0	3379200
26	372	7	0	Seem model all want event.	1.6	4209664
172	488	8	0	More ball along more.	1.6	1094656
165	286	4	0.4	Determine national ball feel sit senior.	0.6	4344832
105	423	10	0	\N	0.7	4261888
27	570	5	0	\N	0.9	5309440
48	439	4	1.8	Policy hospital smile peace happy wall bed.	0.7	3171328
66	350	10	0	\N	1.9	1581056
172	508	10	0	\N	1.8	470016
35	207	6	0	\N	1.5	2973696
144	585	6	0	\N	1.8	882688
184	566	4	1.0	\N	1.5	8250368
42	534	4	1.7	\N	1.2	1152000
124	113	4	2.8	\N	1.4	6884352
38	240	3	0	Town beyond certainly my so major than.	0.6	2444288
39	122	4	1.1	\N	0.8	3056640
82	28	4	1.4	Boy budget avoid sure card.	0.8	8145920
82	24	4	2.1	Within appear late at thousand truth budget.	1.3	2443264
94	395	8	0	\N	1.8	1449984
63	224	4	1.7	\N	1.3	8190976
174	216	9	0	Sea trial throw too mission.	0.7	5414912
131	257	8	0	Enough necessary by.	0.9	7973888
119	627	4	1.7	Interview raise old fall adult question foreign small.	1.5	2906112
151	122	9	0	Measure network answer popular.	1.9	2276352
183	315	9	0	Himself sure indeed rate attorney return learn. Watch enter pick exactly leader.	0.7	2023424
86	268	4	2.0	Herself car consumer summer military about compare police.	1.8	293888
103	283	4	2.1	\N	1.8	7292928
168	109	5	0	Nature fish room car method college.	1.9	1677312
171	232	4	2.0	\N	0.6	8223744
94	390	4	2.9	Stay understand beat lawyer continue first gun. Owner themselves project performance first participant easy put.	1.9	7123968
80	52	4	2.0	\N	1.2	3870720
155	334	4	1.4	\N	0.5	357376
126	373	4	1.7	\N	1.5	2657280
52	488	4	1.7	\N	1.8	539648
7	308	4	1.2	Build everyone thus employee different man.	1.7	7152640
1	551	8	0	\N	0.5	4713472
60	357	4	2.0	Source discussion rather task set fear.	1.2	4064256
166	415	4	2.5	Ten hotel skill record front realize who.	1.5	2989056
27	565	9	0	\N	0.7	3618816
116	186	8	0	\N	2.0	6273024
76	154	4	2.8	\N	1.6	800768
21	295	4	1.8	Meeting area recently body trial father effort. Station expect usually seem indeed.	1.8	1250304
52	511	4	0.0	Glass player station young traditional state design.	1.3	2387968
121	172	10	0	Bill include rather that show use time morning.	1.1	5744640
102	423	6	0	Author year truth minute it be. Page property identify indeed someone picture score.	0.7	7685120
167	479	4	2.2	\N	1.1	8009728
24	601	1	0	Summer first military start.	1.1	762880
106	299	1	0	Least month science coach. Goal middle tough save race.	1.0	2775040
35	210	4	2.7	\N	0.7	5684224
40	113	1	0	\N	1.8	3773440
112	9	3	0	Moment wide entire charge culture throw player.	1.1	5262336
131	252	4	2.8	\N	0.6	6858752
76	158	4	1.1	\N	0.6	4400128
52	498	7	0	\N	1.2	171008
179	474	6	0	\N	1.2	2165760
52	504	4	0.4	Low eye size fish. Vote war alone moment analysis from sport.	1.8	914432
154	466	4	1.2	\N	0.5	1236992
129	37	4	2.8	\N	1.7	7496704
74	619	10	0	\N	1.0	7798784
182	465	4	2.6	\N	0.6	3055616
12	248	4	1.9	\N	1.2	2158592
105	424	4	2.4	\N	0.8	1996800
31	580	4	0.8	\N	1.4	3997696
3	55	5	0	\N	1.3	2552832
140	5	6	0	Citizen will leave thought knowledge.	0.6	3194880
123	556	10	0	Know road no himself special behind. Eat exist number mission seven thought.	1.8	2611200
75	211	4	1.9	\N	0.8	2391040
35	203	9	0	Order such hold ever interest soldier.	2.0	6636544
153	403	4	2.7	Thousand push hot expert part.	0.7	7609344
3	58	7	0	Yard hot attention along such by. Future near which line per star.	0.9	6024192
18	598	4	1.0	Notice cause close federal painting thank west.	1.9	3641344
98	279	8	0	Stock find scientist gun low understand story.	1.5	8115200
171	234	3	0	Because town increase town thank city west.	1.8	5052416
85	330	8	0	\N	1.5	5917696
17	361	4	2.2	\N	1.6	4396032
9	116	3	0	Ago energy remember kind detail born.	0.6	3850240
14	284	4	2.0	\N	0.5	7613440
104	185	10	0	Peace program control we join.	2.0	7429120
3	36	6	0	Enter area maintain to.	0.6	6323200
98	286	9	0	Drive science some rate. Work tonight more career.	0.6	4589568
105	421	4	1.9	Watch environmental property daughter audience anything. Challenge really security.	0.8	4644864
4	458	4	2.0	Than visit memory worker.	1.5	6782976
50	223	6	0	We fight page international record local. Never prevent modern anything follow.	1.8	4153344
157	360	4	2.1	\N	1.8	7530496
176	336	10	0	Son son point woman art central.	1.9	2312192
113	403	6	0	Feeling wife money view adult. Mean home apply free at answer democratic road.	1.6	4994048
23	288	5	0	\N	1.0	3854336
39	127	6	0	\N	0.6	103424
18	591	4	1.0	\N	1.7	6782976
10	600	4	1.9	Material Congress production information.	0.5	3547136
74	618	4	2.0	Thing position case thank.	1.6	7957504
102	411	9	0	\N	0.9	4039680
172	489	1	0	\N	1.7	4960256
17	363	4	2.4	\N	0.5	2925568
1	552	4	1.0	\N	0.6	2577408
150	544	4	1.5	\N	1.1	7525376
175	244	4	2.2	\N	1.9	6537216
136	321	7	0	\N	0.9	3053568
12	242	10	0	Us again big. Response unit little activity.	0.9	7805952
41	503	4	1.8	\N	1.7	1026048
48	447	7	0	Cell including high call staff school half.	0.6	4605952
57	371	4	2.5	Education born note town maybe.	1.6	2493440
67	403	4	2.7	Build onto imagine team specific.	1.0	7836672
17	354	4	2.1	\N	0.8	7865344
123	554	4	1.1	\N	1.6	7530496
172	513	1	0	Prevent past very nearly fly group base behind.	1.0	2163712
74	621	4	2.3	\N	1.4	490496
140	16	4	0.1	Fire hot travel list daughter nearly only.	1.4	6661120
47	112	4	2.8	Similar popular break along skill often.	1.1	5580800
53	491	4	1.1	\N	1.4	4059136
76	134	4	1.7	Light social class. South religious truth opportunity white message why.	0.5	6133760
18	594	6	0	\N	0.5	7751680
115	345	4	1.2	Them number bank approach.	1.6	6123520
144	572	1	0	Same fact boy hold nature.	2.0	4149248
112	3	3	0	Turn stock project enough fish pull best.	1.4	7171072
179	477	4	2.4	Personal security outside measure minute thus.	1.3	7171072
54	267	4	2.1	Seek computer concern resource artist program consider.	2.0	1239040
117	355	4	2.4	Approach section fear play southern interview big consumer.	1.8	4575232
183	314	9	0	Mouth accept explain finally really person.	1.0	6893568
60	362	8	0	Edge get magazine third view size show agreement.	1.8	7575552
62	178	4	1.0	Response pressure marriage.	0.6	2744320
119	622	4	2.7	\N	0.6	290816
145	323	5	0	\N	1.5	7548928
32	602	8	0	Life memory place end whose vote.	0.7	4340736
139	363	4	2.4	\N	0.5	2721792
126	370	4	2.4	Least fine reach break. Paper success American officer turn.	0.9	1563648
174	207	4	1.1	\N	0.5	8243200
11	106	1	0	\N	1.2	3062784
27	581	9	0	\N	1.5	5691392
27	577	4	2.3	\N	0.6	1714176
169	490	4	1.0	Follow specific low take front realize.	0.7	6914048
122	107	4	1.8	\N	1.6	1897472
94	383	9	0	\N	1.2	3900416
98	283	9	0	See use especially others wear.	1.3	5388288
169	505	4	1.2	\N	0.9	6214656
105	418	4	1.6	Garden whose I reach example be. Already set ask wide officer.	1.6	4793344
12	261	4	1.5	\N	0.8	408576
158	33	4	2.7	Control option it writer community someone.	1.9	2178048
98	293	6	0	\N	1.4	5841920
149	183	4	0.2	Bad sometimes win husband. Production visit capital marriage.	1.3	7139328
185	57	4	1.6	Yourself Democrat produce money sea painting key. Ball possible operation year.	0.9	243712
8	588	1	0	Seek claim property people despite others.	1.7	7384064
169	489	7	0	\N	1.7	791552
131	244	7	0	Cup strong two war night watch identify. Family couple fly wall story account.	0.7	5215232
14	283	4	2.1	White front hard bag. Last example area store.	0.9	3563520
44	619	1	0	\N	1.7	2983936
41	509	4	1.9	Feel baby city civil.	0.5	5949440
48	436	4	2.9	But police south house where.	1.6	7280640
129	40	4	1.1	\N	1.9	1207296
108	524	10	0	\N	1.4	299008
76	131	4	1.5	Myself board management likely. Character foot other.	1.9	8134656
17	362	4	2.8	Democratic view base person road condition city.	1.7	5426176
88	2	4	2.4	Miss impact would size.	0.9	7961600
158	48	5	0	Plant least right industry.	1.7	4794368
163	225	4	1.1	Drop military remain young us.	0.7	8012800
37	362	10	0	Behavior writer development. Number history commercial fill decide.	1.5	6968320
85	334	4	0.5	\N	0.6	4151296
144	576	4	2.8	\N	1.7	1944576
12	254	4	1.2	\N	1.7	5215232
120	388	4	0.5	Girl during role power throughout.	0.7	569344
44	621	4	2.3	Society debate body general station talk consumer. Add prove four.	0.9	2317312
76	143	8	0	Product how best budget skin.	1.0	3869696
94	384	4	1.9	\N	1.3	7908352
75	215	4	1.8	\N	0.7	4256768
174	205	4	2.7	Notice chair one admit item raise meet any. Cultural including by issue image any drug us.	0.6	5689344
101	346	4	1.9	\N	1.5	4290560
108	519	9	0	\N	1.2	8249344
20	104	4	1.3	Start than catch attack clearly huge.	1.2	4407296
76	135	1	0	\N	0.6	2317312
152	360	4	2.1	\N	1.9	2682880
3	35	8	0	Picture media deep.	2.0	3499008
48	445	7	0	It consumer protect week may.	1.3	3984384
108	520	1	0	\N	1.7	7224320
14	274	4	0.2	Action more magazine eye area meet adult.	1.3	4301824
121	184	4	1.3	Try your agency late he oil.	1.4	6335488
142	21	9	0	\N	0.5	1446912
179	476	5	0	\N	0.6	7871488
166	419	1	0	\N	0.6	3184640
106	298	4	0.2	\N	1.4	6319104
88	9	5	0	Hair middle choice wait.	1.8	974848
158	39	4	1.7	Agent reach little.	1.7	2520064
104	173	4	1.9	\N	1.9	5225472
187	237	7	0	\N	1.7	2294784
31	569	4	1.5	\N	0.9	208896
71	316	4	1.2	\N	1.6	4868096
112	16	4	2.9	Choice Democrat suffer bit hope tree.	0.9	458752
3	62	9	0	Source exactly standard animal.	1.7	8219648
48	435	1	0	\N	1.9	2585600
172	495	4	1.3	\N	1.3	6383616
143	493	4	1.0	Area only particular start benefit. Action drop agency.	1.2	3549184
166	416	6	0	Dream their measure media you fine mother.	1.1	4612096
36	405	10	0	\N	1.7	6552576
182	463	4	0.2	\N	1.3	3625984
151	123	4	0.5	\N	1.7	5332992
34	106	4	1.4	Candidate attack attorney almost information sing money.	1.7	3211264
61	598	3	0	\N	0.5	2665472
161	219	4	1.8	Character debate to. Interesting situation traditional wife form.	0.6	2525184
169	498	9	0	\N	1.6	7341056
185	45	4	0.0	\N	2.0	4795392
32	605	4	2.2	\N	1.4	4015104
169	495	4	1.7	\N	0.9	6263808
179	473	3	0	\N	1.4	5445632
75	200	5	0	Heart issue cause ahead film while too.	1.8	3996672
102	420	5	0	\N	2.0	8151040
150	562	3	0	Main purpose book wait.	0.6	2697216
105	413	4	2.3	Recently tough particular without television world. Join which arm example.	1.8	3898368
22	19	4	1.9	Threat finally however stand represent address back want.	0.9	4187136
99	169	4	1.1	\N	1.6	3256320
22	18	4	2.4	Democrat expect purpose financial spring receive. Local remain bag way.	1.4	6035456
77	607	4	1.6	All kind nation recognize source.	0.7	6620160
36	408	6	0	And federal individual probably.	0.7	3736576
41	511	9	0	\N	1.6	5691392
24	598	4	1.5	\N	1.2	7241728
59	428	1	0	Town within your morning where whole any. Street nice travel represent.	1.7	5705728
95	592	3	0	\N	0.8	8223744
86	266	3	0	\N	2.0	2805760
121	186	4	2.6	\N	0.9	2608128
129	48	8	0	Agreement or base water ability.	1.2	6202368
75	214	1	0	\N	0.7	3137536
81	28	4	1.1	\N	1.3	4764672
122	109	3	0	Only together attorney. Far increase group pay likely line structure.	1.8	3515392
120	385	7	0	Personal way share pattern especially. Try cover wear question admit finish court.	0.9	7589888
66	352	8	0	\N	1.8	4088832
123	557	9	0	Offer because spring win anyone must almost.	1.6	2423808
98	284	4	2.0	Produce activity floor thus write. Herself send image kitchen.	1.3	4556800
76	153	7	0	City everybody near human.	1.8	1738752
88	5	10	0	\N	1.9	7640064
177	423	4	2.2	\N	1.5	1516544
23	282	8	0	\N	1.3	1138688
157	355	8	0	Interesting management however machine evening time later.	1.2	6885376
61	599	10	0	Price claim north south hear understand kitchen. Left after art.	0.7	3818496
167	472	4	1.0	Foreign our writer station heart.	0.5	5682176
117	356	6	0	\N	1.5	244736
80	48	3	0	Campaign professor level kid present bank own.	0.7	6726656
165	285	4	2.5	\N	1.0	691200
78	249	4	1.0	Through reach detail wife leave information last range. Far can help claim air conference both.	1.8	2562048
60	361	4	2.2	Side ahead opportunity sign camera thought.	0.6	6973440
142	28	8	0	Leader lead along evidence.	1.7	1763328
65	108	10	0	\N	2.0	5576704
3	53	4	2.6	Fund travel prepare use imagine number.	1.1	7649280
74	616	5	0	Protect support pretty also.	1.6	6394880
27	569	4	1.2	\N	1.6	6750208
49	349	4	1.2	Black tend Republican.	1.3	3810304
87	622	1	0	\N	0.6	1107968
53	510	4	2.3	Try share get art say appear agreement movement.	0.9	8265728
16	373	4	0.9	Boy important race threat their guess realize sort.	1.1	3050496
78	247	4	2.7	\N	1.1	3853312
114	431	4	2.1	Force listen us customer expert that specific.	1.1	1461248
78	242	7	0	Argue word since include own by PM decide.	1.9	1803264
146	133	8	0	\N	1.7	2610176
16	370	9	0	\N	1.9	6631424
115	340	4	2.0	\N	1.2	2661376
120	395	10	0	Remember identify close organization already energy federal. Through animal become interest.	0.6	3111936
169	494	4	1.4	\N	1.9	6410240
48	432	4	1.1	\N	1.0	4319232
4	454	4	2.7	Rest environmental drug fly affect.	2.0	6351872
7	305	4	1.9	Against brother operation lead firm kitchen grow place.	0.6	6427648
70	194	4	2.6	History position hour something include piece.	1.3	397312
38	233	4	1.7	Organization television authority.	1.2	509952
129	51	4	1.8	Writer management describe financial continue level.	1.7	7883776
23	291	4	2.1	\N	1.6	5071872
61	600	4	1.9	Source best land yourself candidate close various.	1.9	1781760
143	508	4	1.7	Chance four sing sure.	1.4	1374208
77	610	1	0	Before look old about toward teacher.	1.4	1053696
123	545	4	1.9	Rate play class speech middle.	1.6	3301376
167	473	4	1.3	Blood state forward party.	1.4	686080
117	362	4	2.8	Determine especially build use despite she police.	0.9	2845696
25	609	4	1.7	\N	1.1	7915520
140	9	4	2.4	\N	0.9	5926912
44	625	4	2.1	\N	1.5	1504256
83	504	4	1.3	Game home cause grow mouth not modern. Garden that share give market family range nothing.	1.3	6030336
87	616	3	0	With I attention serious ask. Point cup lot build I author.	1.6	5898240
180	375	4	1.6	Former method decade big attention suffer final.	1.1	460800
5	299	3	0	Skin project someone wind hot from street.	1.7	1716224
108	515	9	0	\N	1.2	109568
132	104	7	0	Own enjoy second perform. Character capital hot continue they simple decide run.	0.5	8155136
107	475	3	0	\N	1.5	3523584
26	371	3	0	\N	0.7	8199168
61	593	8	0	Citizen source kind conference see official. Everybody continue future western later feeling.	0.7	1689600
102	424	4	2.5	\N	1.2	5109760
78	264	4	0.8	\N	1.4	7830528
57	370	4	2.4	Put everyone it four three building.	1.3	6329344
53	502	4	0.0	Product green item.	1.7	6427648
102	417	4	1.8	Management office write wish speak interview summer seat.	1.6	747520
123	558	4	0.4	\N	0.8	4287488
178	333	4	1.4	Again because after future. Kitchen everyone produce third street phone.	0.8	5440512
35	208	4	2.1	\N	1.2	4938752
165	281	1	0	Everybody moment impact turn unit response issue.	1.3	3084288
62	183	9	0	\N	1.1	760832
91	428	4	1.9	\N	0.8	4449280
59	435	7	0	Moment occur moment run. Focus professional space particular hit sit seven product.	1.2	4954112
112	11	4	2.7	\N	1.3	3481600
33	481	9	0	Make themselves usually before himself beautiful five.	1.9	7700480
12	246	7	0	Difficult officer together for get certain majority.	1.8	5277696
73	36	3	0	Bad long reach short study myself month. Hour tough we admit.	0.5	6329344
85	331	6	0	Situation situation analysis look stop nice east.	1.8	8136704
94	382	4	1.4	\N	2.0	129024
3	42	4	2.9	Agent fund light religious.	1.7	5340160
57	377	4	1.1	\N	1.2	7847936
76	150	4	2.8	\N	1.4	3592192
48	434	4	2.5	\N	1.3	3230720
57	369	10	0	\N	1.8	4324352
60	355	4	2.4	\N	1.0	7230464
163	221	4	1.0	\N	1.5	4914176
81	24	1	0	Let another as trial.	0.6	1521664
156	329	4	1.1	Lose thought movement condition camera.	1.8	4637696
182	459	6	0	\N	1.9	8072192
82	26	3	0	\N	0.9	5373952
143	507	3	0	Job who become.	1.5	7836672
7	314	10	0	\N	1.9	4828160
101	340	10	0	Huge behind Mrs play require analysis minute.	1.3	2934784
99	168	4	1.7	\N	0.9	7225344
64	295	7	0	\N	1.9	6787072
14	276	4	1.0	\N	1.2	4515840
52	512	10	0	\N	1.4	3388416
22	6	4	2.4	\N	0.8	4966400
104	170	4	1.7	Growth third run they democratic sometimes.	1.5	1819648
73	58	4	2.8	\N	1.8	4313088
146	152	10	0	\N	1.2	1927168
95	599	10	0	\N	1.8	2788352
14	285	4	2.5	Finish quality stay.	2.0	4791296
34	107	5	0	\N	1.1	5345280
52	499	4	1.6	According say manage cost piece catch.	1.5	6144000
163	223	7	0	\N	1.3	3406848
41	501	8	0	Financial street son policy want.	1.1	4042752
58	600	4	1.9	\N	2.0	2655232
171	235	4	1.9	Study ball kid activity language road. Million add town politics education cost provide.	0.6	5186560
158	63	4	1.8	\N	1.9	3872768
146	160	3	0	\N	1.1	4183040
175	257	6	0	Boy inside book history off professor.	1.1	4897792
175	250	9	0	Phone daughter training.	2.0	5190656
76	133	4	1.8	\N	1.6	3667968
109	474	4	2.6	\N	0.9	7944192
154	460	8	0	Arrive system strategy film form impact deal.	1.3	2878464
186	337	3	0	Use brother brother entire.	1.8	7930880
3	43	4	1.3	\N	1.9	4372480
107	473	4	0.2	\N	0.6	4636672
154	462	4	2.3	Girl also decide force green wind.	1.7	1007616
176	345	4	1.2	Blue indicate person able social.	1.2	5210112
60	359	3	0	Treat whose image. Five risk person chance defense.	1.8	6965248
77	609	1	0	Say weight industry cultural deal consider.	1.1	4733952
3	46	7	0	Above central feel heart. Well main thought finally shoulder gas help.	1.7	2711552
136	319	9	0	Side stock suggest wear.	1.6	7535616
165	293	9	0	Piece heart pick onto. Audience fear clear must baby their.	0.8	4799488
103	278	3	0	Continue price care.	1.7	7401472
107	476	4	0.8	Get dog down why something something.	0.7	3109888
163	227	4	2.4	\N	1.1	3812352
7	315	4	1.6	Five up cultural environment choose.	1.2	3656704
184	582	4	1.3	Take indicate trouble current.	1.3	7421952
177	411	4	2.8	A look decade read sort.	1.9	1823744
78	251	4	1.3	\N	1.0	5249024
147	168	4	1.7	\N	1.7	286720
175	252	4	2.8	\N	1.8	7151616
185	32	4	1.7	Sign central under.	1.7	6517760
22	2	3	0	Democratic heart wish show instead east.	0.8	1158144
57	367	1	0	Democrat amount too throw west reason Congress relationship. Go hard person decide necessary.	0.5	1788928
168	103	4	0.6	When window heavy everybody establish.	1.7	5925888
98	278	4	1.5	Style show improve phone those experience thus writer.	1.5	705536
9	115	3	0	Together always second station information about interesting.	1.4	6318080
38	237	9	0	Attack less price decade wrong.	1.9	8262656
152	362	10	0	\N	1.9	7621632
108	529	8	0	\N	1.7	3526656
179	482	4	1.1	Rock staff glass better letter evidence public. Hit from whether compare.	0.9	2344960
169	502	4	2.0	\N	1.8	4617216
77	606	4	2.0	\N	1.6	8126464
14	287	8	0	Effect identify war account mention quite.	1.0	5686272
13	351	10	0	Room determine visit.	0.6	1511424
73	52	7	0	Morning suggest travel black career.	1.1	2469888
62	177	5	0	\N	0.9	3435520
149	177	4	0.9	Data as who medical high up.	1.1	1284096
48	440	10	0	Opportunity national peace capital. Beyond wait music front.	1.2	369664
76	163	3	0	\N	1.0	133120
87	624	4	0.6	Right simple sense discussion.	1.3	3461120
104	177	4	1.3	Else high go build.	1.9	3965952
121	177	9	0	\N	1.1	1427456
123	546	5	0	\N	0.9	1634304
175	261	6	0	\N	0.7	7155712
118	342	9	0	\N	0.9	7492608
53	503	4	1.6	\N	1.9	654336
14	286	4	0.7	Visit major gas participant quite information.	1.8	3869696
123	553	4	2.8	\N	1.1	4585472
146	151	4	2.3	\N	1.2	7316480
16	375	3	0	Could wrong share. Rule type western.	1.3	1972224
71	317	4	2.8	Sure how continue beautiful thank.	1.0	2095104
76	165	4	1.9	\N	0.7	3054592
145	318	4	1.4	\N	1.6	5157888
169	509	1	0	\N	1.9	7757824
91	448	1	0	It guy attorney.	1.5	2423808
43	193	6	0	Concern agent anyone benefit media. Way allow prevent early indeed fight.	0.5	6048768
1	559	1	0	Environment why remain necessary.	1.4	3398656
158	61	4	2.1	\N	1.7	7545856
68	619	10	0	Build set carry positive hold probably because range. Board far personal say among can claim.	0.6	873472
107	485	4	2.3	Either town number summer technology boy red.	2.0	4047872
186	344	8	0	\N	1.2	1057792
160	116	1	0	We must according. Do relate although leave quickly worker single maintain.	1.4	7187456
50	225	4	1.5	\N	1.4	3214336
87	627	4	0.7	\N	1.3	2066432
4	455	5	0	Hit nature usually political.	1.2	1787904
143	488	4	2.0	Growth lawyer final class.	0.6	2939904
35	211	4	0.1	\N	0.6	6425600
28	610	8	0	Environment foreign western fill kitchen boy current go. Door already down.	1.7	6710272
80	55	4	2.1	Role center rise.	0.5	6507520
143	504	4	1.5	\N	2.0	5094400
176	346	1	0	See dinner purpose garden law. Establish half quality.	0.9	7336960
147	169	6	0	Turn claim hair third.	1.1	3004416
24	594	4	2.7	\N	1.0	5436416
171	231	5	0	Tonight market born somebody such condition middle.	1.0	8176640
158	55	5	0	\N	0.8	1659904
136	328	4	1.5	Speak player during.	1.5	6515712
183	309	1	0	Program arm something even worry. Such level bank thousand task community success.	1.9	5658624
88	18	4	2.4	\N	1.3	5633024
94	389	5	0	\N	0.6	4848640
177	413	4	2.3	Lose industry traditional laugh world future ten. Drop manage perform them know.	1.3	1991680
23	271	1	0	Figure nearly his.	1.0	4803584
23	290	3	0	Through room house military audience chair compare. Yet will hair suffer simply.	0.6	1170432
140	17	1	0	\N	1.9	3641344
18	597	4	2.6	\N	0.7	2669568
52	490	4	1.0	Necessary culture police finally trade wide common.	0.8	3192832
84	120	4	2.1	\N	1.4	5830656
106	295	6	0	Yourself during world often recently wall put.	1.4	2588672
130	609	4	1.7	Interest type material.	0.6	4367360
149	173	4	1.6	Get culture price clear between officer point understand. Drive policy himself focus coach pretty.	1.3	5953536
52	507	4	2.6	\N	1.1	1844224
58	601	4	2.9	\N	1.8	861184
150	542	4	2.5	By forget how accept. Film recognize mouth police prove difficult instead.	0.5	2254848
28	612	7	0	\N	1.3	6356992
76	137	8	0	\N	1.8	3701760
159	350	5	0	Friend hear discuss air want six produce.	1.4	4043776
3	44	8	0	\N	1.8	4374528
156	328	8	0	Deep develop friend want stop.	1.6	5685248
12	251	6	0	\N	1.7	5089280
30	332	4	2.4	\N	1.0	1518592
98	276	8	0	\N	1.4	6031360
108	523	10	0	State world own operation apply establish.	0.7	2061312
187	228	4	1.6	Dog quality network stay capital method.	1.8	8118272
79	351	4	2.1	\N	0.7	8207360
78	257	4	1.9	\N	0.6	7731200
114	444	4	2.6	\N	1.7	6263808
166	410	4	2.7	\N	1.6	4794368
129	53	4	2.6	Next consider either company old.	1.0	1384448
139	356	1	0	Group large success at lot author personal feeling.	1.4	2882560
168	111	10	0	Receive case fish information conference feel movement decision.	0.8	2672640
109	485	8	0	\N	1.2	3305472
1	561	3	0	Season dinner hand air young.	1.5	4424704
118	340	5	0	Center education red. Ask Republican four sound dog.	0.8	6730752
171	228	3	0	\N	0.6	5051392
107	487	4	2.1	\N	1.8	1910784
131	263	4	1.9	\N	1.2	4508672
165	289	4	1.0	Someone employee impact offer indicate instead recent bank.	1.6	8034304
34	110	10	0	\N	1.8	3030016
146	154	4	2.1	\N	1.9	2627584
75	210	4	2.9	Event economic stock those street.	1.4	2716672
1	549	1	0	\N	1.6	7587840
131	247	4	2.7	\N	2.0	2257920
34	108	7	0	Night how million five.	0.8	1504256
10	599	4	2.8	Great I hair since always avoid old.	1.9	710656
88	13	4	1.6	Instead skin age resource place. Physical ask marriage real sense make responsibility.	1.4	964608
120	394	5	0	\N	1.5	4803584
185	31	4	1.0	\N	1.3	5478400
62	182	6	0	Course example family value.	1.1	4827136
96	589	1	0	Beyond image president them sea. Firm go dinner.	1.5	7080960
143	511	4	0.3	\N	1.6	7072768
185	39	3	0	Other hit party challenge seem.	1.8	4779008
188	266	4	2.3	\N	2.0	3387392
182	461	6	0	\N	1.0	1628160
88	14	1	0	Start medical itself actually goal hotel.	1.7	7527424
104	171	1	0	Young firm son debate some upon if.	1.1	6096896
61	591	4	1.0	\N	0.7	1438720
144	565	9	0	Lose security son military international.	1.3	4184064
80	45	9	0	Fight so onto brother next.	1.5	1342464
123	559	4	2.3	Play information sound clearly present glass.	1.5	3037184
142	29	4	1.3	Avoid either ground stay sound film young. Animal place store however share.	0.7	5601280
12	256	4	1.7	\N	0.6	1067008
145	317	4	2.8	\N	0.8	2050048
11	104	6	0	\N	0.6	5355520
143	498	4	1.0	\N	1.4	6181888
26	374	4	2.0	Hold let on central. Billion without community have just federal.	1.8	5513216
178	332	4	2.4	To member avoid throughout analysis.	0.5	1480704
98	285	10	0	\N	0.6	3574784
186	336	6	0	\N	0.7	3112960
28	611	4	2.3	\N	1.0	510976
75	213	6	0	\N	0.9	1004544
52	509	3	0	\N	0.5	5081088
130	613	4	1.2	\N	1.7	5550080
29	118	8	0	Standard current hand let school middle pull.	1.6	2123776
109	482	4	1.1	Apply would glass arm sure. Move free event run instead.	0.8	7952384
115	343	10	0	\N	1.2	4359168
166	413	7	0	\N	1.6	7815168
107	479	8	0	\N	1.6	1100800
108	516	4	2.5	Than bar sport number it air magazine yeah. Central policy anyone four machine their new.	1.8	7352320
109	487	1	0	Medical on spend baby.	1.1	7475200
76	145	4	0.5	Girl me policy involve us president.	1.6	6509568
122	106	4	1.4	\N	0.6	2685952
54	270	4	2.5	\N	1.7	2034688
154	461	4	0.3	\N	1.8	4990976
146	150	4	2.8	Quickly seven recent guess as source argue.	1.1	4646912
41	506	4	2.1	Take perhaps create allow successful or. Wrong try oil pretty sport side four.	1.3	3684352
24	593	4	1.4	\N	1.9	4425728
112	18	4	2.4	He big trial main.	1.2	6835200
130	606	3	0	Social stock out stock market suffer.	1.3	5797888
91	447	4	1.3	\N	1.9	7921664
16	377	4	1.1	Listen production finish also paper. She his summer imagine section.	0.5	536576
150	551	4	2.0	\N	0.7	5676032
165	271	4	2.2	\N	1.0	7449600
13	350	6	0	Official decade difficult. Chance hotel kid over.	1.5	1243136
149	170	4	1.7	\N	0.6	1473536
174	211	4	1.9	Back sister young maintain level.	1.1	6913024
70	197	9	0	\N	1.6	1289216
80	56	9	0	Director bit window woman attorney bed. Specific happy attack participant.	1.9	3354624
62	171	4	2.8	\N	1.0	7914496
156	317	4	2.8	Trial still pattern force particularly.	1.6	2770944
146	163	7	0	Hospital head season evidence ask option card.	1.1	3840000
98	282	4	1.4	Region alone language federal friend choice. Determine good difficult.	0.8	7697408
57	365	1	0	Guy moment arrive his how.	1.5	112640
74	624	1	0	Option charge common we southern general. Mr else onto deep quality court however.	1.5	664576
108	537	4	0.3	\N	1.9	6188032
116	180	4	2.6	Concern forget country decade serious.	1.6	3999744
125	450	4	1.5	\N	2.0	6601728
8	590	6	0	\N	1.9	4932608
53	495	8	0	Concern dream draw thousand consider civil.	1.3	5079040
1	558	4	0.4	Purpose opportunity day.	1.9	7776256
60	354	6	0	Sign try cost politics education book.	1.7	3109888
84	119	5	0	\N	1.0	2495488
155	330	4	1.5	\N	0.7	5612544
68	623	5	0	\N	0.6	2180096
38	228	9	0	Someone relate learn plant hotel meeting.	1.8	6056960
31	578	4	2.2	\N	1.3	5316608
151	128	4	1.8	Hope serve weight.	1.3	4703232
50	219	4	1.8	\N	1.1	1594368
108	538	4	2.9	\N	1.3	7438336
48	433	4	2.5	\N	2.0	7332864
53	499	7	0	\N	0.8	7511040
34	104	8	0	Teach will language indicate reduce.	1.4	3146752
78	265	4	2.7	Author eight argue.	1.9	6141952
96	588	8	0	\N	1.8	6036480
143	489	5	0	\N	1.9	2764800
158	52	4	2.0	Along we explain politics include.	0.6	2446336
165	272	8	0	\N	1.1	2805760
89	26	4	1.3	\N	1.5	3548160
59	434	4	0.5	Benefit simple dinner current yard in seat like.	1.1	7622656
115	335	10	0	\N	0.5	4469760
183	304	4	2.4	\N	0.5	302080
101	337	5	0	\N	1.0	7812096
127	407	4	2.2	\N	1.6	7098368
121	170	4	1.7	\N	1.2	5878784
94	402	4	1.5	Ask too soldier everything require.	1.8	2230272
121	176	4	1.3	\N	1.5	5277696
129	33	8	0	Sit money education news.	1.8	6950912
1	550	7	0	Sense onto voice which technology. Summer weight whose.	0.9	3587072
91	434	10	0	Source loss material career white project next together.	1.2	7388160
90	606	4	2.0	Indicate sea team someone organization main treatment.	0.8	6815744
103	290	4	2.5	Study put measure structure.	1.1	5216256
35	204	4	1.3	Machine table green.	1.5	5991424
55	602	10	0	Occur first again and bad focus course manager. Choose little form goal.	0.6	3930112
129	49	4	2.5	\N	0.9	869376
158	58	4	2.8	Money training different whole.	1.7	3837952
16	372	1	0	\N	0.6	4045824
161	224	4	1.7	\N	1.5	5638144
118	336	7	0	\N	0.7	1847296
146	149	3	0	\N	1.7	1332224
186	340	10	0	Computer growth security maintain place author. Bank would scene morning too.	0.7	7113728
94	388	4	0.0	Myself seven my cell leg here rather.	0.8	3509248
10	597	4	2.6	Worry itself on risk play accept.	1.7	7121920
129	62	5	0	\N	0.8	6311936
49	348	9	0	\N	1.6	4012032
126	367	4	2.1	Member protect exist trade.	1.0	1369088
185	54	4	0.8	Public message most another improve left exist.	1.7	7591936
185	56	4	2.3	\N	1.9	3505152
118	341	10	0	Turn care thing suggest level.	1.2	1876992
57	373	8	0	Main yard nearly enter those.	1.6	7843840
188	270	3	0	\N	1.1	6429696
187	233	3	0	\N	0.6	7942144
33	468	7	0	\N	0.8	6127616
34	111	4	1.5	\N	1.3	2956288
25	613	4	1.2	\N	1.6	7931904
122	102	4	1.8	\N	1.8	6468608
116	184	4	1.1	Feeling policy message despite new direction reason. None official indeed change more.	1.5	296960
146	132	1	0	Poor scientist ready relate individual research.	1.1	7568384
90	612	5	0	Party deal point last writer all among.	1.4	5250048
80	58	4	2.8	\N	0.7	3533824
73	33	7	0	Believe short company he no. Everything rather little sense government quite.	1.0	2504704
109	486	4	1.1	\N	1.4	2283520
33	475	4	2.1	\N	1.9	2563072
144	581	4	1.3	College country financial section next catch risk.	1.6	7231488
102	418	10	0	\N	2.0	8128512
186	343	7	0	Dinner father direction century. Age civil during.	1.9	348160
103	291	1	0	Experience Mr everything.	1.0	3262464
108	525	10	0	Player baby set against contain mean.	1.1	3686400
73	31	4	1.0	\N	0.9	2003968
116	172	4	1.9	Speak six hold.	1.2	2436096
131	241	4	1.4	\N	1.6	2704384
94	386	4	0.9	\N	1.0	7811072
131	260	8	0	Environment kind must design land item third.	1.3	8072192
183	312	4	2.7	\N	1.7	1266688
152	359	10	0	\N	0.9	5390336
166	414	4	2.8	\N	1.7	7718912
99	167	4	2.3	\N	0.7	1331200
97	603	4	1.6	Degree parent choice administration seek bed usually.	1.5	3836928
103	286	4	1.7	\N	1.1	6132736
154	459	4	1.7	\N	0.8	4558848
136	329	9	0	Response ball wonder TV data the.	1.2	1280000
156	321	4	2.1	\N	1.3	5042176
166	420	8	0	\N	1.6	7811072
150	560	4	2.4	\N	0.9	7492608
33	479	9	0	\N	0.5	5106688
95	594	4	2.7	\N	0.7	1081344
69	407	5	0	\N	1.2	2937856
66	348	4	1.5	Attorney six agree Congress.	1.8	2547712
83	492	8	0	\N	1.5	5157888
144	570	4	2.9	\N	1.3	2637824
183	311	5	0	\N	1.7	7147520
18	592	4	1.4	\N	1.2	1681408
172	505	4	0.6	Last arrive much.	0.8	3697664
114	429	4	2.1	Social several focus beautiful minute appear.	1.3	1233920
15	100	10	0	\N	1.1	6872064
11	103	4	1.2	\N	1.2	3262464
149	178	9	0	Current reality military modern about table. Cold answer difference purpose language huge.	0.6	6490112
1	543	6	0	Particular meeting develop various.	1.2	323584
129	52	4	0.7	Go become nature go.	1.1	2471936
25	607	4	1.6	Guy military throw beyond herself explain eye. Family card term region throw live.	1.2	1032192
83	491	4	1.1	\N	1.3	2269184
78	258	10	0	\N	1.2	7909376
126	380	10	0	\N	1.3	7792640
179	475	4	2.1	Kitchen whether rate.	1.5	2384896
156	323	10	0	\N	0.5	3253248
1	554	4	0.8	\N	0.7	3423232
41	507	6	0	\N	1.9	7698432
50	220	9	0	Service window day manager meet.	1.9	6473728
37	360	4	0.8	\N	1.0	4634624
107	486	4	1.1	\N	1.7	6439936
108	534	9	0	\N	1.4	3411968
123	548	4	2.0	\N	1.6	1007616
149	180	4	2.6	Professional street store pattern investment land factor often.	0.6	455680
105	422	8	0	\N	1.2	3128320
83	507	4	1.5	Minute nothing they suffer answer bad.	2.0	3375104
43	190	4	2.7	\N	2.0	3284992
20	108	1	0	\N	0.7	6825984
131	256	1	0	\N	0.8	1306624
142	24	8	0	\N	1.7	4141056
10	596	4	2.6	\N	1.1	5031936
150	554	1	0	\N	1.3	2309120
120	389	5	0	Minute want party choose air. Control serious mind PM thought might perform.	1.1	5861376
133	425	4	2.3	\N	0.5	7157760
80	50	4	2.9	Early serve outside because whom risk.	1.2	7689216
140	13	5	0	\N	1.1	1466368
131	258	4	0.8	\N	1.2	1229824
172	496	3	0	\N	1.7	5724160
117	361	5	0	\N	0.6	281600
95	593	4	1.4	Responsibility resource while represent sport suffer this.	1.3	581632
88	1	9	0	Participant result art system.	1.3	6686720
11	110	4	0.8	Risk once sit situation poor resource various. Spring foot page foreign mention town.	0.6	1762304
68	628	8	0	Always tell project writer.	1.5	3589120
52	505	4	1.2	\N	0.5	1103872
119	621	4	2.3	\N	1.2	3343360
123	551	5	0	\N	0.6	2033664
23	281	9	0	\N	1.3	6814720
41	502	9	0	\N	1.0	4840448
3	39	4	2.5	Politics assume four by could.	1.1	1843200
73	50	4	0.3	\N	1.4	6960128
117	363	3	0	\N	1.7	4445184
74	628	4	2.4	Lawyer live main own.	0.9	6696960
16	371	4	2.5	\N	1.0	4209664
146	130	4	1.8	Relate instead list number.	0.7	7158784
158	56	4	2.3	Ready none nice draw fund information air.	1.8	5134336
31	571	4	1.9	\N	1.3	8061952
140	1	4	1.7	\N	0.9	5738496
126	371	8	0	Coach kitchen account you figure season customer machine.	0.6	2145280
33	477	4	2.4	\N	1.6	8121344
146	135	8	0	\N	1.4	2444288
3	54	10	0	\N	1.0	808960
31	579	10	0	Hair opportunity full agent growth.	1.2	6841344
81	21	10	0	Yard compare central course camera those.	1.1	7768064
179	485	1	0	Item recent concern finally eight local government.	1.2	6245376
88	16	4	0.9	Them life head rather.	1.5	7324672
169	491	4	1.1	\N	1.6	2242560
102	413	7	0	\N	1.5	330752
152	363	4	2.4	Good least seat. Machine card expert meeting hour magazine.	0.9	5705728
42	530	9	0	Road ability apply although because both manager.	0.8	1760256
164	466	4	1.2	Wish data third event.	1.5	8197120
168	105	4	1.2	\N	1.7	6474752
3	57	1	0	Guess fill consider small improve.	1.2	1702912
15	96	7	0	Identify identify not. A popular gas those accept.	0.7	4244480
50	221	7	0	It challenge look apply present baby.	0.7	239616
128	332	4	0.2	Example human eight story series structure.	0.7	784384
23	273	4	1.7	\N	0.6	7339008
128	334	6	0	\N	0.9	385024
180	378	10	0	\N	1.7	1294336
31	582	6	0	Positive material there situation social conference quality. Mrs Mrs former moment.	0.6	3604480
185	59	4	2.5	Why himself scene meeting your.	1.1	3966976
108	514	4	1.7	\N	1.0	2314240
34	102	4	1.8	Break pull stand data human story yes.	1.2	2288640
187	239	5	0	Name bag sort.	1.5	7361536
131	254	10	0	\N	0.5	3655680
80	60	4	1.6	\N	1.1	5021696
102	416	4	1.1	\N	1.7	5041152
105	410	4	2.7	\N	1.7	5673984
64	298	4	0.8	Reach fact free officer stop.	0.5	5911552
120	381	5	0	Power sell operation hold. Agency themselves draw impact could cup wish many.	2.0	4878336
144	582	4	1.3	Send buy mother our sure always surface.	0.8	292864
115	341	1	0	\N	1.9	7150592
162	608	4	1.9	Seat six occur professional hope.	0.9	1184768
177	414	4	2.1	Success skin another six. Arm society according check cover.	1.2	4150272
31	564	4	1.9	Lead necessary opportunity every morning pressure chance.	1.7	5796864
180	371	4	2.5	Shoulder social enjoy social.	0.8	696320
151	120	10	0	Win alone family.	0.9	2151424
76	148	4	1.9	Else issue sometimes section.	1.8	2109440
176	339	4	2.0	\N	1.8	7096320
185	53	4	2.6	Wait book argue Democrat he blue work.	0.7	1773568
146	156	7	0	\N	1.8	2392064
143	490	4	1.0	\N	1.6	2401280
12	247	10	0	\N	0.6	1519616
115	336	4	2.1	Strategy part someone teach.	1.3	5987328
129	47	4	2.9	\N	2.0	6951936
22	20	4	1.6	Day senior morning power course. Garden quickly window generation situation however.	1.7	5078016
172	506	4	2.1	Coach need tough prove image star able.	0.7	1821696
3	60	4	1.6	Off point report three save story.	0.7	8233984
74	629	4	1.3	\N	1.2	2071552
172	491	9	0	\N	1.9	6691840
38	236	4	1.0	\N	0.6	2350080
185	66	8	0	Idea follow similar mention.	0.7	5377024
50	224	7	0	Clearly mean perhaps hospital chance light.	1.0	1204224
73	54	5	0	\N	1.3	3579904
121	178	3	0	Whose know mouth pick protect receive. Born huge show top send time.	1.5	2802688
33	473	4	1.3	\N	1.8	3503104
10	593	4	1.4	Their hour all artist what.	0.8	5543936
27	563	9	0	\N	1.7	1640448
184	569	4	1.1	\N	1.1	356352
150	548	6	0	Idea wrong discover somebody.	1.5	7861248
20	103	3	0	Ground story onto range green score. Style them close someone green.	1.6	7073792
52	494	5	0	\N	1.1	2436096
162	615	9	0	\N	1.2	3137536
58	597	5	0	\N	1.5	2847744
59	441	5	0	\N	0.9	6428672
41	499	8	0	Tend wonder left of city situation story.	1.7	4372480
53	490	1	0	\N	0.7	6392832
174	200	4	2.3	\N	0.9	2484224
62	175	6	0	\N	1.6	3401728
146	142	4	1.9	Into remain trip body cost physical. Crime draw project wall fact but.	1.3	161792
163	219	4	1.8	Card study other bill black value budget term. Recognize central commercial thus PM police catch.	0.6	1636352
158	68	4	2.9	Whole source conference between oil democratic make.	1.3	7532544
129	44	4	1.4	Let kind risk never east skill.	1.8	3451904
166	411	8	0	\N	0.7	3336192
90	614	8	0	Free arm pattern structure.	0.8	5671936
152	356	3	0	\N	1.2	6747136
30	334	4	0.2	Final them simply need issue.	1.6	5670912
23	293	4	1.0	Administration contain above year face community. Serve western morning serve.	1.3	3772416
58	592	4	0.6	Conference less kitchen line talk. Law we he board serve class.	1.2	6200320
129	60	5	0	Great enough address bill. Water pick goal general strategy.	1.0	958464
73	62	4	1.5	\N	1.0	1123328
175	241	4	1.4	\N	1.2	3064832
90	613	3	0	\N	1.7	6770688
162	609	4	1.7	\N	1.6	3806208
69	404	4	2.9	Pressure either tend war party subject.	0.9	6748160
146	162	4	1.3	Budget add not candidate cover.	1.7	290816
149	174	5	0	\N	0.7	2750464
159	351	4	0.1	\N	1.1	7961600
56	98	6	0	\N	1.4	5019648
48	429	6	0	Guess hit push unit within management buy.	1.9	1392640
68	618	1	0	\N	1.9	5805056
44	622	4	2.7	Cause my authority debate citizen. Voice security continue study often some that.	1.5	7567360
74	623	7	0	Work down leg cause cost born three. Interesting different describe specific.	1.3	2215936
161	223	4	2.9	Beyond light their draw perhaps house.	1.9	3564544
50	227	8	0	Should admit executive. Stuff once half successful field.	1.6	7528448
129	58	4	2.8	Pass similar last people.	1.1	2801664
47	113	7	0	\N	1.3	2294784
186	338	10	0	Before team major field increase myself summer.	1.7	915456
179	484	4	2.0	Safe affect entire majority.	0.9	3396608
11	108	4	0.1	Suffer such year of floor.	1.1	3672064
96	587	4	2.2	\N	0.6	8261632
21	299	5	0	Account also family.	1.3	1808384
50	226	4	1.8	\N	0.9	5827584
10	595	4	2.4	\N	1.8	3145728
65	104	3	0	Month green present add their deal.	2.0	1140736
161	227	7	0	Bar method tell share tough already white.	2.0	3906560
43	188	4	1.6	Interview stand tax notice. Meet staff agree young he.	1.0	4832256
117	359	4	2.4	Reduce conference anyone against country. Economic guy need American organization.	0.7	1983488
7	311	10	0	Them dream partner year professional happen specific light.	1.5	3932160
73	47	8	0	Tend region wish particular opportunity. Technology population pick thousand plan mission.	0.7	3464192
132	108	9	0	\N	0.7	2526208
149	182	3	0	Three same truth remember protect both.	1.9	2564096
156	325	1	0	Participant surface month true in inside. Ball these then exactly.	1.3	7336960
161	220	4	1.8	Share letter fine.	0.8	3099648
83	502	6	0	Structure beautiful respond.	0.9	5163008
136	323	4	1.6	Year less reveal two better.	0.9	2017280
1	541	10	0	On two create keep everybody his performance.	0.6	4583424
95	601	4	2.9	Ten evidence start film purpose other few.	1.8	8130560
165	276	4	1.0	Finally national be candidate campaign.	1.2	6621184
108	521	5	0	Learn sell social maybe owner road.	0.9	3462144
77	614	4	1.0	\N	0.6	1909760
143	497	3	0	\N	1.8	5092352
59	430	4	1.1	\N	1.2	270336
143	513	4	1.7	Yeah ready whether itself example according.	0.9	4165632
169	507	4	2.6	Stuff mention although response human enjoy. Scientist control hotel.	1.2	765952
104	182	1	0	Stay strong reality realize interview.	1.3	5913600
25	614	5	0	\N	1.5	300032
109	473	4	1.3	\N	1.1	3996672
84	126	7	0	Approach describe state city activity media own protect.	2.0	1971200
169	504	8	0	News board minute science hair exactly play computer.	1.1	3585024
144	577	7	0	Onto apply alone short clearly peace hold. Pressure compare sing should base indeed.	0.9	6284288
152	354	4	2.1	Environmental value design. Reduce lawyer PM born.	1.6	8156160
57	368	5	0	Network that industry make.	1.1	5309440
59	433	6	0	\N	1.8	246784
176	343	3	0	Whom foot sea woman cut world road mean.	1.2	1689600
104	172	4	1.9	\N	1.5	5147648
178	330	10	0	Which new rock discuss.	1.0	6891520
104	186	9	0	\N	1.6	6518784
24	596	6	0	\N	1.4	2391040
175	248	7	0	\N	0.6	563200
48	443	9	0	\N	1.6	7734272
16	380	4	1.5	Choose doctor need still.	0.6	2704384
28	614	4	1.0	Law point specific imagine movie history couple.	0.6	3458048
98	290	8	0	\N	1.4	2472960
108	535	4	2.2	Cover me do main affect gun.	1.8	7648256
75	203	7	0	\N	1.5	7731200
125	449	4	1.2	Child power no state dark quality never rule. Recently expert bar foot game wind.	0.7	4292608
42	516	3	0	\N	1.9	8216576
145	326	5	0	\N	1.0	3990528
165	292	5	0	\N	1.6	6519808
41	491	4	1.1	Employee rest gun individual will benefit figure. Summer under war try travel despite local.	0.8	488448
146	155	4	1.2	Past these member campaign past style production.	1.4	1397760
150	546	10	0	\N	0.9	5721088
20	107	4	2.3	\N	1.1	1525760
3	66	4	0.9	\N	0.8	646144
17	356	4	1.6	Relationship mind term. Vote newspaper lose another.	0.6	3265536
50	217	4	2.0	\N	1.7	5057536
185	65	4	1.0	\N	1.1	6914048
91	435	7	0	\N	0.8	7539712
169	488	4	2.0	Thing process technology fish trial.	1.6	4068352
17	358	4	2.2	Consider pass actually blue.	1.1	3306496
1	560	4	1.4	\N	1.6	5151744
119	619	4	0.3	Ever admit this improve economy him.	1.0	3952640
48	442	5	0	Glass soon two set book whatever hope.	0.7	5429248
179	468	4	2.2	\N	1.1	5673984
137	602	4	2.0	\N	0.8	3893248
12	265	4	2.7	\N	0.5	6299648
140	12	3	0	\N	1.6	6297600
145	322	1	0	\N	1.7	6147072
76	162	5	0	Community option tonight word. Fish camera public yet final.	1.0	8127488
75	201	4	1.7	\N	1.3	5100544
58	594	7	0	\N	0.5	333824
27	566	7	0	\N	0.8	6931456
3	65	8	0	Available media tree watch thank training.	1.0	3611648
40	117	4	2.9	Chair inside political during.	0.8	1466368
128	330	10	0	\N	1.7	4413440
16	374	5	0	\N	1.9	1222656
136	316	5	0	\N	1.0	7749632
62	172	4	1.9	Second build nearly measure go.	0.6	3595264
107	474	6	0	Exist ground thing environment size it wait dinner.	1.2	2735104
62	174	4	0.8	\N	1.2	635904
25	611	4	2.3	\N	0.9	5208064
116	177	4	1.3	Believe mother their live young road.	0.8	2360320
18	599	4	2.8	When consumer reality camera alone believe type.	1.9	2444288
104	183	9	0	Within and none war section threat beyond.	0.8	6808576
126	369	7	0	About admit travel apply moment voice reflect. Hand success increase pretty young put play.	1.4	6780928
43	189	9	0	\N	1.7	835584
31	568	7	0	\N	1.0	7724032
70	188	4	1.6	\N	0.9	6178816
121	181	1	0	\N	1.4	6367232
134	321	7	0	\N	0.7	4659200
179	486	7	0	\N	1.8	4236288
1	544	4	2.4	Despite whom require relate. Hit for picture happen among protect what.	0.7	2985984
182	466	4	1.2	\N	1.3	8061952
53	508	4	0.4	Camera nation manage case popular learn race.	0.9	8290304
74	620	4	2.8	Myself down strategy summer necessary that. Face discuss theory free.	0.6	2453504
16	364	4	1.3	\N	1.8	6450176
46	266	7	0	Nation each hard form.	1.2	7759872
131	249	4	1.0	\N	1.2	1533952
130	614	4	0.3	\N	1.5	7908352
161	225	4	1.5	Role Republican during matter outside in bed. National minute explain along.	1.3	7120896
171	237	4	1.5	When prevent heart.	1.4	4119552
134	325	4	1.0	\N	1.0	226304
42	539	4	2.0	Him water fish cut others read amount certain.	0.8	1162240
102	415	4	2.5	Nice alone detail let.	0.6	5242880
3	52	6	0	Must social have price material stage president.	0.7	7503872
80	51	4	1.8	Line bar imagine receive. Practice suggest best beyond others purpose throughout.	1.4	961536
46	268	3	0	\N	1.2	5427200
57	378	10	0	\N	1.1	3539968
143	512	4	0.3	Blue TV course write future finish. Year result edge model.	1.8	7800832
1	553	3	0	Speech opportunity change central participant already increase.	0.6	7194624
78	241	10	0	Senior whatever two win discuss.	0.8	7950336
73	59	4	2.5	Interesting store head form tend wind official.	1.4	1122304
12	241	4	1.4	\N	1.8	5652480
59	444	7	0	Ground go head.	0.6	858112
27	573	8	0	Quite read lose also high although.	1.5	3128320
80	40	4	1.1	\N	0.8	6989824
14	273	7	0	Present turn sing season action TV.	1.9	6907904
103	288	4	2.9	\N	1.7	1438720
16	376	4	1.1	Top their east stand nation trade relationship. Former across reality here.	1.0	6932480
143	509	1	0	\N	1.3	6234112
146	137	7	0	\N	1.9	3026944
125	458	9	0	Force leader water dog these how kitchen. Similar result cultural.	0.6	4496384
53	489	4	1.9	Also take bring born.	1.1	3088384
185	40	6	0	Analysis agent part bag expert.	1.7	1524736
40	112	4	2.8	\N	1.5	811008
86	267	10	0	Between organization analysis red better. Pretty business window issue attack wonder we loss.	1.9	1813504
175	256	4	1.7	Sport bring large fire second believe without style.	0.5	804864
91	438	3	0	Read help say.	1.6	1131520
167	481	4	2.3	Many recently they exactly pretty work school floor. Together seek resource situation long four.	1.7	6748160
4	449	8	0	Organization black source tend.	0.6	1024000
65	106	4	1.4	\N	1.9	1309696
63	222	4	2.2	Center exist young decide song wonder.	1.4	6557696
73	46	9	0	Decide size fear possible customer structure.	1.7	5368832
136	318	4	1.1	\N	1.8	4569088
156	324	4	2.6	\N	1.0	2459648
178	334	3	0	\N	1.2	3130368
80	42	4	2.9	\N	1.4	6748160
11	107	4	0.3	\N	1.0	3094528
176	341	4	2.4	Issue interesting outside evidence bed then speak international.	1.2	3857408
152	353	10	0	\N	1.8	7021568
42	521	8	0	\N	0.8	720896
87	628	4	2.4	\N	1.0	1089536
37	363	4	2.4	\N	1.9	3676160
80	65	4	1.0	\N	1.1	1460224
109	478	8	0	Understand either which experience.	0.7	6848512
145	328	4	1.5	\N	1.8	2144256
120	398	4	0.4	\N	1.2	8187904
167	468	10	0	Personal above imagine able. Factor keep nature enjoy.	0.9	3519488
176	340	4	2.0	\N	1.8	1614848
146	165	4	0.6	Couple help financial still large.	1.0	3994624
133	426	4	2.0	\N	1.3	5495808
118	337	4	1.6	\N	1.8	3066880
83	506	4	2.1	Day man community scene environment scene present. Involve small protect last by company inside.	1.0	6403072
149	181	4	1.7	\N	1.3	4255744
119	618	4	2.0	Mouth tell coach miss such need. Win economy woman where big serious.	1.3	6508544
123	550	4	1.3	\N	1.8	4879360
3	63	4	0.3	\N	1.6	4813824
177	409	4	2.8	Tree administration lay can maintain son. Beyond soldier may detail computer next leave source.	1.2	7554048
37	361	9	0	\N	1.0	1381376
58	593	4	0.7	\N	1.7	3973120
80	53	4	2.6	Understand enter movement home run cell about system. Although past let result.	1.8	4291584
107	482	4	0.1	\N	1.2	8123392
6	332	4	2.4	\N	1.8	1449984
120	384	7	0	Nature question involve personal.	1.1	5244928
47	117	4	1.8	\N	1.5	3577856
114	436	4	2.9	Include various act bank over amount administration.	0.9	4295680
186	335	5	0	Into lot stage executive use loss military. Strong later good game couple fill require million.	1.7	7434240
105	411	10	0	Success interesting big vote red clearly on. Anything walk huge contain several plan protect.	1.4	4030464
179	471	4	2.8	\N	1.9	937984
169	497	8	0	\N	0.7	4967424
184	577	3	0	\N	0.8	4147200
183	308	4	1.2	\N	0.6	6402048
104	179	7	0	\N	0.7	4493312
71	322	4	1.3	\N	1.0	6992896
165	277	4	1.4	\N	0.9	5457920
3	41	4	2.7	Well soldier father business article race write.	1.5	1931264
57	366	4	2.4	\N	1.4	3196928
16	379	3	0	Loss role so voice despite risk item.	1.0	1259520
56	99	1	0	\N	1.8	5414912
60	356	4	1.6	\N	1.8	3036160
120	386	4	0.3	\N	1.2	1426432
106	296	7	0	\N	0.8	5664768
121	173	1	0	Minute property with research high none especially arrive.	1.7	7061504
134	324	7	0	Thus dog ever move heart both next enter. Speech final such tonight hand this somebody affect.	1.6	2493440
74	625	4	2.1	This project food true.	0.9	6915072
176	342	1	0	\N	1.8	351232
121	183	4	1.1	Tax gun small.	1.7	1696768
134	317	4	2.8	Various commercial keep meeting. Economic to onto start ok picture light.	1.4	3357696
185	35	1	0	Detail voice happen man send anything but.	1.8	3191808
78	250	4	1.1	\N	1.8	825344
107	469	4	2.8	\N	1.8	737280
167	486	4	1.1	Ok environment television.	1.4	1201152
184	572	10	0	Staff daughter than fly sport resource.	1.0	5572608
139	357	4	1.5	\N	1.4	271360
18	596	4	0.3	\N	1.8	7516160
27	584	4	1.4	Pretty can us offer many study common.	0.9	1032192
39	123	4	1.1	\N	1.3	824320
185	51	4	1.8	However identify develop race line action right measure.	0.7	1553408
95	595	5	0	\N	0.7	1659904
2	426	8	0	Ago minute trip without one.	2.0	6184960
58	595	4	0.7	Natural receive our anyone raise at. Arm leg quality will huge focus.	1.6	7084032
102	412	7	0	World recent reduce individual evening.	1.1	2783232
108	530	9	0	Physical until ask.	1.6	6749184
172	501	4	1.0	\N	1.8	3534848
14	291	4	1.4	\N	1.7	1105920
129	42	8	0	Reveal whole recognize house necessary.	1.1	5321728
169	496	4	0.6	\N	1.6	5774336
185	47	4	2.9	Again mention skill listen win.	1.4	1853440
125	456	4	1.4	High million window management.	1.4	4717568
126	372	10	0	\N	1.0	3056640
120	401	4	2.4	\N	0.6	8247296
4	453	4	1.2	Not particular coach before strong series assume.	1.4	1006592
174	208	4	2.2	\N	1.5	2285568
103	285	4	2.5	\N	0.9	7447552
41	505	4	1.0	\N	1.5	5038080
35	216	8	0	Least this agent teach see level.	1.8	1537024
88	20	9	0	\N	1.4	1519616
60	363	5	0	\N	1.5	2566144
93	454	4	2.7	\N	1.4	7797760
42	531	6	0	Certain civil term safe various degree.	0.9	5640192
57	364	4	1.3	\N	1.5	3718144
180	374	7	0	\N	1.2	1077248
158	41	4	2.5	Rise life without audience lose own.	1.3	3876864
59	436	10	0	\N	1.2	5918720
3	32	4	1.6	\N	1.2	4109312
180	380	4	1.5	\N	1.1	6256640
118	343	4	2.1	\N	1.3	1574912
80	64	3	0	Perform crime eight statement design force cover.	1.7	4552704
1	562	4	1.2	\N	1.4	8069120
15	97	1	0	Court about dog.	1.7	2144256
17	353	5	0	Trip around one.	1.6	4333568
40	116	10	0	Eye market interesting suggest. Movie sister number.	1.6	6731776
116	182	1	0	Understand try season include we. Poor value music maybe community sell claim.	0.6	1310720
17	359	4	2.6	Interview ago into station hair. Your local red.	1.8	2291712
108	527	4	0.7	\N	1.4	4305920
143	503	4	1.8	Economy glass drive leader according daughter.	1.8	599040
10	594	1	0	\N	1.4	6850560
85	333	1	0	\N	0.7	5016576
\.
COPY submit_results (submit_id, score, status) FROM STDIN;
141	0	9
169	24.300000000000004	9
85	0.5	8
128	1.5999999999999999	10
184	22.800000000000004	10
155	6.5	5
54	5.6	6
98	16.6	10
52	21.099999999999998	10
122	9.9	8
151	15.1	10
81	6.0	10
172	17.6	10
164	9.6	10
72	6.500000000000001	7
3	42.7	10
20	8.5	8
14	21.099999999999998	10
106	2.8	10
94	15.700000000000001	10
100	4.2	4
161	11.9	10
132	2.3	10
149	19.4	9
103	28.2	8
173	1.7	4
23	18.8	9
108	18.0	10
18	17.2	6
121	17.0	10
148	0	3
146	26.6	10
12	19.299999999999997	10
89	9.3	9
61	9.4	10
99	8.0	4
123	23.8	10
114	27.400000000000006	8
19	2.0	4
110	4.1	4
147	1.8	6
26	14.299999999999999	10
71	16.0	10
143	19.400000000000002	8
158	53.199999999999996	10
168	6.7	10
160	6.8	10
62	17.200000000000003	9
154	9.4	9
79	6.1	10
66	4.8	10
140	12.5	10
75	11.899999999999999	10
139	11.5	9
142	6.6	9
115	14.5	10
5	4.4	10
124	8.6	7
47	6.8999999999999995	10
170	2.1	4
2	0	9
117	13.700000000000001	8
150	25.599999999999998	10
6	4.6	5
60	12.2	10
145	12.900000000000002	8
37	11.100000000000001	10
107	15.099999999999998	8
21	5.8999999999999995	10
4	10.599999999999998	9
105	17.599999999999998	10
104	11.3	10
109	21.500000000000007	8
1	17.1	10
88	14.1	10
76	43.6	10
36	3.8000000000000003	10
78	29.599999999999998	10
189	0	5
131	20.400000000000002	10
31	30.199999999999996	10
156	10.2	10
163	8.4	9
73	34.900000000000006	10
101	11.8	10
181	1.3	4
10	17.599999999999998	6
48	23.400000000000002	10
159	1.6	8
86	2.0	10
59	10.7	10
11	6.3	10
97	5.5	6
29	0	8
50	9.0	9
92	2.3	4
119	14.3	10
27	17.3	10
57	16.6	10
185	42.599999999999994	10
55	3.8000000000000003	10
135	4.0	10
134	15.599999999999998	7
176	14.1	10
69	6.699999999999999	6
166	14.899999999999999	9
16	15.100000000000001	9
15	2.5	10
74	15.999999999999998	10
171	12.1	5
53	20.599999999999994	10
17	20.0	6
102	18.900000000000002	10
77	9.2	6
167	23.900000000000002	10
46	2.5	10
25	13.2	10
22	25.9	8
133	4.3	4
56	3.4	7
38	13.499999999999998	9
96	2.3000000000000003	8
84	8.0	8
82	7.4	9
120	10.299999999999999	10
63	13.899999999999999	10
8	3.3000000000000003	7
130	9.999999999999998	9
58	7.8	7
34	8.0	10
49	8.4	9
35	12.600000000000001	9
182	10.899999999999999	6
157	15.4	8
90	6.9	9
24	10.6	7
129	43.199999999999996	10
144	25.599999999999998	9
178	3.8	10
136	11.399999999999999	9
87	7.800000000000001	10
126	17.1	10
\.
