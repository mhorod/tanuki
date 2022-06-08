SET search_path TO tanuki;
COPY users (login, name, surname, password_hash, email) FROM STDIN;
williamrocha	Mark	Butler	$2b$12$EiF8z0.BWoYj59lZrjhdr.hMQP5hn.4mzhGuBTQxlJLNrTx9sWRv6	morenoerica@example.com
cheryljohnson	Robert	Bowman	$2b$12$ha38nCYZSDLphCoyhKlG3ev0Odcpp8k1OxAnTsrCgAMpWGK52XP7O	ericpalmer@example.com
caseychristina	Joy	Odom	$2b$12$H2M18XBlPqoq0QOm/u1zouKyAGps2XxF7oGI6.G/iYRChiuo8RCnO	lopezjaime@example.org
pbowen	David	Morrow	$2b$12$qKLsf9V.d5xqTjtIYnqlW.zRRBmaFQuwTGQJnPyuvCDswF.KOFL0m	nbenson@example.net
jwatts	Valerie	Ellis	$2b$12$l61r.7q.yriEODsut97SG.t9UQXIo0Fg4Y/kqRh.frL0HyswLFB9C	slowery@example.org
scottmelissa	Angie	Garrett	$2b$12$zoJbkAHF2B9R84UoadKb1uVIYlNFFuc12eY8GxduJojadNVpJElkq	ymacdonald@example.net
daniellegarcia	Jacob	Black	$2b$12$RJoKZ9ewPmX5LxSJ8wvk3.ovw/P8Pk7eQoo.AHp5th9cs8ylo16Qu	barreravincent@example.com
earl85	Jeff	Moore	$2b$12$GZ0Ccp8BhEtHow9hrDUyWOsWyvwWEV1T1TezVVfJsu2M8H0nHLkI.	lstein@example.com
beckybarnett	David	Jackson	$2b$12$HWpnaClkcylIKISUjjd3U.SPgi88l15NO/gWn465Iw1EofITm7HWe	jamesjones@example.net
nicholasho	Jordan	Gonzalez	$2b$12$HuvGYhzpP7FOHGdDcOlRu.b6mc7bV5/HC4fPPWRqLqaa43vtEnl3a	laraluke@example.org
admin	A0	D	$2b$12$guI56lG3QgKsuLsYqBkPTe3P4lIaKefQQI9LwiOeAgzk/AzBTSPL6	administracja@tanuki.pl
admin1	A1	D	$2b$12$mz3DkdrbtG.COEwyApLjweDrNyVUUKkrn26PuRZxCo761a9UzvjKG	administracja@tanuki.pl
admin2	A2	D	$2b$12$7/3LjJvG9syP.OYU1Jac5utYPxupwTeCwNhyfOGFKQtdPvImmYSB2	administracja@tanuki.pl
admin3	A3	D	$2b$12$1Lcerk1me24NwqFKFA5KR.o5mBg.H41UE6D3BxywJF7jxLYFsXXLG	administracja@tanuki.pl
admin4	A4	D	$2b$12$NaA18J7I0FO1HnDlQVNjYeuYkai4V.cBXjtT0LnKDd2M6bPDDlQui	administracja@tanuki.pl
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
Cause her event summer hard.	By cultural.	True
Seem interest little contain.	Clear some.	False
General idea company both.	Figure mind.	True
Congress seek bar certainly.	Include.	True
Spring happen leg no with.	Positive.	False
Ahead professor red certainly.	Pull.	True
By single old agreement author.	Simple.	True
Several blue information red.	Indeed safe.	True
Baby fish seat early voice guy.	Difference.	True
Crime over middle meet.	Pattern.	True
\.
COPY permissions_for_contests (name, description) FROM STDIN;
MANAGE	Allows user to edit contest and manage participants
SUBMIT	Allows user to view problems and sending submissions
\.
COPY contest_permissions (user_id, permission_id, contest_id) FROM STDIN;
10	2	3
2	1	6
2	2	5
4	2	7
3	2	1
5	2	4
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
9	1	5
4	2	2
2	2	9
5	2	8
6	2	4
8	2	6
9	1	7
9	2	6
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
1	2	10
8	2	1
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
7	2	3
9	2	5
6	1	4
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
3	2	2
1	2	9
6	2	1
8	2	3
6	2	10
1	1	1
7	2	7
9	2	9
5	1	9
10	2	6
2	2	8
1	2	2
4	2	10
3	2	4
6	2	3
8	2	5
9	2	2
1	1	3
2	1	2
2	2	1
10	2	8
4	2	3
2	2	10
3	2	6
5	2	9
6	2	5
8	2	7
10	2	1
9	1	8
2	2	3
10	2	10
4	2	5
3	2	8
6	2	7
8	1	10
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
Smile take improve imagine.	A	1	/problems/dummy	False	0	0.4	2021-08-04, 16:55:14	2022-07-09, 22:28:13	False	1	14336
Think tell sound benefit.	B	1	/problems/dummy	False	1	0.0	2021-09-20, 07:47:02	2021-11-18, 12:25:33	True	2	97280
Protect leave great.	C	1	/problems/dummy	True	2	0.0	2021-06-23, 07:02:11	2021-08-21, 16:46:40	False	1	77824
Myself serious visit billion.	D	1	/problems/dummy	True	3	0.2	2021-07-25, 07:11:48	2023-01-28, 09:48:21	False	3	43008
Voice off few economy.	E	1	/problems/dummy	True	4	0.2	2022-04-27, 08:58:59	2023-01-15, 00:01:58	False	1	83968
Challenge nothing collection.	F	1	/problems/dummy	True	5	0.4	2021-07-27, 11:57:40	2021-12-17, 20:51:23	True	3	73728
Start have discover change.	G	1	/problems/dummy	False	6	0.3	2021-09-17, 14:27:10	2023-05-27, 21:26:34	False	1	20480
Top popular good music.	H	1	/problems/dummy	False	7	0.4	2021-09-26, 16:49:11	2023-03-22, 18:05:50	True	1	32768
Kid story wife main.	I	1	/problems/dummy	False	8	0.1	2021-07-18, 00:24:55	2022-07-13, 04:12:18	True	3	69632
After quality oil seat.	J	1	/problems/dummy	True	9	0.0	2021-11-06, 07:59:46	2023-02-27, 15:43:53	True	3	97280
Side way plan always.	A	2	/problems/dummy	True	0	0.0	2021-12-27, 16:52:07	2023-05-27, 11:20:46	True	1	93184
Pretty poor last doctor task.	B	2	/problems/dummy	True	1	0.4	2022-05-26, 05:24:30	2022-12-24, 02:25:46	True	1	84992
Economic bad party involve.	C	2	/problems/dummy	True	2	0.3	2022-06-01, 08:13:41	2023-04-05, 18:51:41	True	1	26624
Cold lot position investment.	D	2	/problems/dummy	False	3	0.4	2021-06-29, 22:37:01	2022-02-13, 13:49:53	True	3	9216
Page edge field fight as new.	E	2	/problems/dummy	True	4	0.3	2021-12-06, 17:49:54	2022-12-14, 14:48:50	True	1	70656
Own ground kind culture.	F	2	/problems/dummy	True	5	0.4	2022-04-13, 04:41:42	2022-11-21, 14:15:22	False	2	83968
Decade benefit treatment.	G	2	/problems/dummy	True	6	0.2	2022-01-01, 16:05:07	2023-04-16, 22:47:56	False	3	80896
Near cause speak pick seat.	H	2	/problems/dummy	True	7	0.1	2021-06-21, 23:45:07	2021-07-04, 04:35:15	True	3	66560
Along mind turn kitchen.	I	2	/problems/dummy	False	8	0.0	2022-04-04, 14:41:28	2022-07-09, 18:11:08	True	1	83968
After create fear goal.	A	3	/problems/dummy	False	0	0.4	2021-12-13, 12:49:22	2022-03-09, 23:17:30	True	3	58368
Well pull fear only.	A	4	/problems/dummy	True	0	0.4	2023-03-10, 19:44:26	2023-06-07, 10:37:47	True	1	57344
Treat tell behavior matter.	A	5	/problems/dummy	False	0	0.0	2022-03-07, 04:37:18	2022-07-18, 12:13:18	True	2	8192
Open history side entire.	B	5	/problems/dummy	False	1	0.1	2021-10-16, 19:48:35	2022-04-12, 22:35:08	True	1	24576
Challenge improve season.	C	5	/problems/dummy	True	2	0.1	2022-04-15, 20:37:51	2022-06-06, 22:00:36	True	3	18432
Financial drug nice.	D	5	/problems/dummy	True	3	0.1	2021-07-23, 05:07:24	2023-06-03, 21:41:22	True	3	92160
Series family yes couple.	E	5	/problems/dummy	False	4	0.1	2021-12-02, 13:18:29	2022-08-08, 14:05:07	False	2	95232
Return school crime control.	F	5	/problems/dummy	False	5	0.0	2022-06-10, 09:32:52	2022-06-17, 02:06:25	True	2	70656
Plant shake candidate work.	G	5	/problems/dummy	True	6	0.0	2021-08-02, 19:21:45	2021-08-30, 17:29:39	False	3	46080
Interview ago case evening.	H	5	/problems/dummy	False	7	0.1	2022-02-14, 05:30:25	2022-03-30, 06:02:46	False	2	63488
Design social two industry.	I	5	/problems/dummy	True	8	0.2	2021-07-10, 00:39:50	2021-12-10, 19:52:33	True	1	47104
Until attorney animal help.	A	6	/problems/dummy	True	0	0.3	2022-11-17, 02:27:32	2023-03-19, 01:11:25	True	1	35840
Capital send trouble sort.	B	6	/problems/dummy	False	1	0.3	2021-09-11, 14:09:11	2022-11-19, 20:53:30	True	1	12288
Manage ten author none kind.	C	6	/problems/dummy	True	2	0.4	2022-07-01, 22:24:25	2022-12-06, 09:26:12	True	2	87040
Business name him.	D	6	/problems/dummy	False	3	0.3	2022-10-19, 17:18:57	2022-12-09, 09:58:21	True	1	33792
Trial force everybody green.	E	6	/problems/dummy	False	4	0.0	2021-08-24, 02:02:57	2022-11-16, 08:23:35	False	1	31744
Whether minute year.	F	6	/problems/dummy	True	5	0.2	2021-09-17, 16:02:44	2022-06-14, 19:12:21	True	1	38912
Bar prepare believe its.	G	6	/problems/dummy	False	6	0.1	2022-05-20, 04:37:42	2023-01-20, 22:32:16	True	1	7168
Reveal sort tax heart.	H	6	/problems/dummy	False	7	0.1	2022-03-06, 16:09:32	2022-10-05, 02:54:10	False	1	52224
Above grow truth western.	A	7	/problems/dummy	True	0	0.4	2022-02-02, 18:10:03	2022-10-03, 13:26:52	False	2	98304
What not new investment by.	B	7	/problems/dummy	False	1	0.0	2021-08-08, 14:55:01	2022-04-25, 08:24:27	True	1	68608
Light peace paper goal.	C	7	/problems/dummy	False	2	0.2	2022-04-11, 17:28:07	2023-01-21, 21:35:02	False	1	38912
Mission probably item item.	D	7	/problems/dummy	True	3	0.1	2021-07-03, 21:04:56	2021-09-02, 20:56:20	True	2	13312
White hundred cover radio.	E	7	/problems/dummy	False	4	0.3	2021-07-19, 01:55:54	2021-09-16, 14:09:01	True	2	44032
Use good per year many.	F	7	/problems/dummy	True	5	0.0	2022-02-20, 02:52:03	2022-12-28, 10:35:59	True	1	96256
Now past product occur us.	G	7	/problems/dummy	False	6	0.2	2022-02-22, 12:06:17	2023-01-30, 20:25:02	True	3	17408
Her organization event dog.	H	7	/problems/dummy	False	7	0.0	2022-08-05, 03:45:53	2022-12-19, 19:30:04	True	1	23552
Movie huge bring its develop.	I	7	/problems/dummy	False	8	0.3	2021-08-25, 20:43:29	2022-12-26, 20:15:48	True	1	37888
Send wish loss response.	J	7	/problems/dummy	True	9	0.4	2023-01-19, 15:57:34	2023-01-29, 22:11:58	True	3	28672
Per than wife here than.	A	8	/problems/dummy	True	0	0.0	2022-11-09, 19:33:09	2022-12-11, 21:25:16	True	2	56320
Really staff ground road.	B	8	/problems/dummy	False	1	0.2	2022-01-06, 22:39:07	2022-07-31, 03:58:02	False	3	96256
Claim dream leg avoid.	C	8	/problems/dummy	False	2	0.1	2022-01-29, 11:34:48	2022-12-13, 10:49:30	True	1	67584
Something land yeah by TV.	D	8	/problems/dummy	False	3	0.4	2021-07-02, 23:20:16	2022-09-10, 18:49:51	True	2	46080
Black throw whose sense.	E	8	/problems/dummy	True	4	0.1	2021-06-11, 11:48:20	2021-07-27, 07:53:32	True	3	98304
Old say enter deep.	F	8	/problems/dummy	False	5	0.4	2022-04-01, 15:03:39	2023-03-20, 21:18:43	False	1	75776
Source brother general.	G	8	/problems/dummy	True	6	0.1	2021-10-15, 19:02:42	2023-01-27, 09:45:41	True	3	6144
Choice through hot simply.	H	8	/problems/dummy	False	7	0.0	2022-07-27, 09:24:35	2023-01-03, 01:31:27	True	2	26624
Far feel despite very.	I	8	/problems/dummy	True	8	0.0	2022-02-07, 04:13:40	2022-09-04, 14:22:47	False	2	68608
Bad thousand behind.	J	8	/problems/dummy	True	9	0.1	2022-03-07, 09:33:56	2023-02-01, 09:03:55	True	2	66560
Yes black day.	A	9	/problems/dummy	True	0	0.4	2021-06-22, 15:17:52	2021-09-28, 20:54:39	False	3	20480
Nice memory day coach PM.	B	9	/problems/dummy	True	1	0.4	2022-02-10, 08:54:41	2022-10-12, 17:10:50	False	1	84992
Natural business direction.	A	10	/problems/dummy	True	0	0.4	2021-12-06, 01:13:43	2022-04-16, 00:21:53	True	1	37888
Wife often kitchen force.	B	10	/problems/dummy	False	1	0.0	2022-05-19, 07:03:54	2022-06-29, 21:10:08	True	1	98304
Program floor time thus.	C	10	/problems/dummy	True	2	0.1	2022-01-27, 08:54:33	2022-11-08, 02:59:10	True	3	38912
That practice single size.	D	10	/problems/dummy	True	3	0.2	2022-08-26, 16:07:47	2023-05-25, 10:04:19	False	1	17408
Start adult collection chair.	E	10	/problems/dummy	False	4	0.2	2022-08-16, 07:47:09	2023-01-06, 22:18:52	True	2	65536
Tree low raise stand amount.	F	10	/problems/dummy	True	5	0.0	2021-12-09, 04:03:40	2023-01-15, 19:12:24	True	1	43008
Book difficult wide.	G	10	/problems/dummy	False	6	0.2	2022-08-21, 18:45:02	2022-10-30, 03:33:22	True	3	11264
Serve know early major.	H	10	/problems/dummy	True	7	0.1	2022-01-01, 04:13:07	2022-11-11, 09:51:11	True	3	31744
Middle list present.	I	10	/problems/dummy	False	8	0.3	2021-09-28, 17:06:40	2021-11-17, 01:51:19	False	2	90112
\.
COPY problem_languages (problem_id, language_id) FROM STDIN;
53	5
64	5
58	1
34	1
50	6
5	1
42	2
65	6
66	5
57	2
68	2
40	4
18	1
55	4
56	3
17	5
8	2
19	2
28	5
30	2
46	4
24	1
35	1
6	4
16	6
21	2
62	3
55	6
32	7
13	3
35	3
7	5
56	7
47	4
60	7
9	5
51	4
24	5
25	4
63	4
39	5
53	4
62	7
54	3
63	6
22	7
3	3
14	3
32	2
66	4
44	1
1	5
35	7
39	7
20	3
34	2
37	7
28	4
4	4
41	7
42	6
10	1
33	3
15	6
7	2
18	2
34	4
45	4
12	1
23	1
69	7
9	2
51	1
13	2
48	5
62	4
64	1
29	1
63	3
51	3
50	5
41	2
26	1
2	1
25	3
48	7
23	5
14	2
59	1
27	5
61	7
43	1
30	1
25	5
68	3
31	2
23	7
67	7
36	1
59	3
27	7
52	6
19	3
44	2
46	5
48	2
49	1
22	1
21	3
58	6
47	3
19	5
33	4
42	7
11	1
2	7
57	7
39	1
15	1
38	3
49	3
31	6
53	3
50	4
17	1
8	7
66	3
15	3
29	2
26	3
\.
COPY submits (source_uri, user_id, problem_id, language_id, submission_time) FROM STDIN;
/submitted/dummy	1	44	1	2010-08-05, 08:40:29
/submitted/dummy	1	59	3	2022-04-14, 15:46:02
/submitted/dummy	1	13	3	2005-08-28, 19:16:15
/submitted/dummy	1	14	2	1997-11-16, 07:24:12
/submitted/dummy	1	49	3	2002-08-14, 02:36:29
/submitted/dummy	1	8	7	2013-08-16, 19:35:29
/submitted/dummy	1	53	3	2018-12-29, 23:11:26
/submitted/dummy	1	10	1	2009-03-22, 19:21:36
/submitted/dummy	1	55	6	1997-03-09, 14:20:56
/submitted/dummy	1	41	7	2001-08-05, 00:51:25
/submitted/dummy	1	22	1	2017-09-14, 14:08:16
/submitted/dummy	1	18	1	2005-02-16, 11:49:38
/submitted/dummy	1	68	2	1992-09-02, 00:01:57
/submitted/dummy	1	4	4	2005-03-29, 02:55:03
/submitted/dummy	1	51	1	1998-01-18, 14:52:36
/submitted/dummy	1	54	3	2011-05-19, 12:03:14
/submitted/dummy	1	64	1	2004-06-02, 08:06:05
/submitted/dummy	1	45	4	2020-11-14, 15:05:48
/submitted/dummy	1	45	4	2010-10-10, 18:51:47
/submitted/dummy	1	5	1	2006-06-28, 15:26:14
/submitted/dummy	1	58	6	2000-12-21, 06:28:13
/submitted/dummy	1	3	3	2020-08-25, 16:05:41
/submitted/dummy	1	27	7	2012-04-21, 02:56:01
/submitted/dummy	1	4	4	1997-06-28, 04:08:25
/submitted/dummy	1	8	2	2015-09-27, 22:18:51
/submitted/dummy	1	27	5	1998-07-23, 03:41:06
/submitted/dummy	1	2	1	2011-12-19, 12:57:37
/submitted/dummy	1	10	1	1994-06-16, 05:53:24
/submitted/dummy	1	14	3	2000-11-03, 05:51:37
/submitted/dummy	1	44	2	2006-09-08, 08:35:29
/submitted/dummy	1	42	2	1995-11-06, 08:30:44
/submitted/dummy	1	61	7	1995-06-27, 00:12:16
/submitted/dummy	1	43	1	1993-07-29, 13:24:50
/submitted/dummy	1	54	3	2006-11-03, 04:12:43
/submitted/dummy	1	66	4	2015-11-14, 03:23:12
/submitted/dummy	2	51	1	1998-12-07, 22:01:03
/submitted/dummy	2	16	6	2012-09-17, 00:50:53
/submitted/dummy	2	63	4	2015-05-14, 06:05:27
/submitted/dummy	2	47	3	1994-08-07, 05:37:39
/submitted/dummy	2	27	7	2002-03-19, 06:03:17
/submitted/dummy	2	13	2	2000-10-07, 13:13:12
/submitted/dummy	2	40	4	1995-01-09, 14:26:20
/submitted/dummy	2	5	1	1996-12-04, 10:09:48
/submitted/dummy	2	5	1	2008-02-03, 06:16:26
/submitted/dummy	2	46	5	2017-06-10, 06:22:37
/submitted/dummy	2	60	7	2009-12-29, 13:52:47
/submitted/dummy	2	53	4	2003-11-17, 14:52:27
/submitted/dummy	2	66	4	2019-08-30, 15:38:56
/submitted/dummy	2	61	7	1995-04-25, 13:28:17
/submitted/dummy	2	5	1	2002-03-25, 10:22:27
/submitted/dummy	2	20	3	2008-05-28, 06:42:52
/submitted/dummy	2	65	6	2016-07-18, 07:27:41
/submitted/dummy	2	32	7	2005-08-24, 22:57:41
/submitted/dummy	2	39	1	2006-06-02, 10:46:10
/submitted/dummy	2	25	5	2000-02-17, 13:39:13
/submitted/dummy	2	62	3	2015-05-15, 21:13:48
/submitted/dummy	2	30	2	2014-12-10, 05:37:22
/submitted/dummy	2	31	2	1993-02-04, 08:20:53
/submitted/dummy	2	26	1	1993-11-08, 00:07:04
/submitted/dummy	2	20	3	2002-05-10, 20:42:41
/submitted/dummy	2	25	4	1996-03-23, 01:00:57
/submitted/dummy	2	66	5	2016-08-17, 15:34:35
/submitted/dummy	2	12	1	2021-05-24, 04:11:19
/submitted/dummy	2	18	1	2008-12-05, 22:58:29
/submitted/dummy	2	21	3	1994-06-30, 23:58:18
/submitted/dummy	2	17	5	2015-07-09, 00:31:16
/submitted/dummy	2	41	7	2021-04-08, 00:29:26
/submitted/dummy	2	15	3	2009-12-17, 02:46:10
/submitted/dummy	2	11	1	2010-09-21, 09:31:09
/submitted/dummy	2	52	6	2013-07-31, 05:22:21
/submitted/dummy	2	40	4	2019-10-25, 23:51:22
/submitted/dummy	3	62	7	2021-07-06, 04:36:02
/submitted/dummy	3	49	3	2005-08-24, 06:38:41
/submitted/dummy	3	12	1	2000-10-17, 15:19:07
/submitted/dummy	3	14	3	1997-07-23, 20:27:54
/submitted/dummy	3	33	4	2002-02-25, 19:51:11
/submitted/dummy	3	1	5	2017-12-10, 07:16:00
/submitted/dummy	3	69	7	2021-11-21, 23:46:15
/submitted/dummy	3	30	2	1997-04-22, 09:27:09
/submitted/dummy	3	11	1	2008-10-23, 19:16:46
/submitted/dummy	3	56	3	2007-04-04, 01:19:54
/submitted/dummy	4	36	1	1992-10-08, 18:51:44
/submitted/dummy	4	56	3	1993-10-13, 04:41:07
/submitted/dummy	4	17	1	2015-08-21, 03:52:14
/submitted/dummy	4	62	7	2005-10-06, 06:18:05
/submitted/dummy	4	64	5	2010-05-01, 03:21:05
/submitted/dummy	4	53	4	2008-01-15, 01:54:01
/submitted/dummy	4	60	7	2016-02-26, 03:17:01
/submitted/dummy	4	34	2	2014-10-27, 11:55:49
/submitted/dummy	4	33	3	2002-12-06, 21:34:53
/submitted/dummy	4	13	2	2001-04-26, 14:31:43
/submitted/dummy	4	31	2	2022-01-09, 02:28:06
/submitted/dummy	4	36	1	1993-09-17, 02:41:13
/submitted/dummy	4	65	6	2002-05-22, 11:53:34
/submitted/dummy	5	59	3	2009-12-11, 19:20:04
/submitted/dummy	5	38	3	2006-08-25, 03:43:10
/submitted/dummy	5	18	2	2013-06-08, 18:36:31
/submitted/dummy	5	64	5	2022-04-25, 09:28:10
/submitted/dummy	5	30	1	2003-11-19, 03:21:02
/submitted/dummy	5	15	1	2001-05-04, 11:42:36
/submitted/dummy	5	66	3	1997-12-11, 12:59:02
/submitted/dummy	5	58	6	2014-06-14, 04:20:00
/submitted/dummy	5	13	2	1998-04-05, 16:26:20
/submitted/dummy	5	18	1	2007-01-09, 17:05:23
/submitted/dummy	5	60	7	1997-08-30, 18:10:14
/submitted/dummy	5	17	1	1997-04-09, 11:56:24
/submitted/dummy	5	55	6	2018-05-01, 09:25:51
/submitted/dummy	5	41	7	1995-01-16, 20:24:37
/submitted/dummy	5	57	2	2003-12-07, 17:47:00
/submitted/dummy	5	21	2	2012-01-20, 10:25:50
/submitted/dummy	5	50	5	2001-04-05, 16:26:03
/submitted/dummy	5	34	1	1999-08-20, 10:12:05
/submitted/dummy	5	27	5	2021-08-28, 13:39:47
/submitted/dummy	5	49	1	2015-03-19, 10:37:06
/submitted/dummy	5	29	1	2008-08-07, 11:42:01
/submitted/dummy	5	35	3	2007-04-16, 18:43:48
/submitted/dummy	5	32	7	2011-08-11, 03:12:24
/submitted/dummy	5	48	2	1992-08-20, 14:01:06
/submitted/dummy	5	2	1	2013-09-18, 11:38:37
/submitted/dummy	5	9	5	2008-04-04, 05:54:04
/submitted/dummy	5	38	3	2020-12-16, 15:05:16
/submitted/dummy	5	48	5	1999-09-10, 00:28:22
/submitted/dummy	5	53	5	1995-05-31, 10:08:25
/submitted/dummy	5	53	4	1995-07-03, 04:52:10
/submitted/dummy	5	59	1	2006-10-31, 10:16:02
/submitted/dummy	5	66	4	1999-11-23, 05:51:18
/submitted/dummy	5	35	7	2001-06-26, 14:51:24
/submitted/dummy	5	63	3	1994-11-19, 12:06:49
/submitted/dummy	5	25	5	2014-09-11, 12:09:52
/submitted/dummy	5	59	1	1994-05-28, 07:18:47
/submitted/dummy	5	37	7	2001-04-15, 05:13:53
/submitted/dummy	5	30	2	2002-10-18, 09:16:21
/submitted/dummy	5	20	3	2001-01-13, 08:33:37
/submitted/dummy	5	64	5	2013-09-11, 17:32:34
/submitted/dummy	5	3	3	2002-02-13, 21:23:17
/submitted/dummy	5	32	7	2009-01-31, 04:00:43
/submitted/dummy	5	41	7	2014-10-07, 08:09:51
/submitted/dummy	5	2	7	2001-04-20, 20:04:05
/submitted/dummy	5	57	2	2018-08-18, 18:32:38
/submitted/dummy	5	31	6	1996-05-16, 18:11:41
/submitted/dummy	5	45	4	2016-04-22, 20:55:09
/submitted/dummy	5	24	1	2018-08-02, 13:23:23
/submitted/dummy	5	25	3	1993-09-02, 22:00:25
/submitted/dummy	5	55	4	2000-12-17, 11:13:17
/submitted/dummy	6	67	7	2017-12-07, 20:18:10
/submitted/dummy	6	62	3	2010-12-18, 20:08:36
/submitted/dummy	6	36	1	1999-03-06, 19:37:52
/submitted/dummy	6	66	4	1996-02-22, 03:59:14
/submitted/dummy	6	37	7	1993-04-22, 08:01:13
/submitted/dummy	6	13	2	1999-06-24, 03:04:17
/submitted/dummy	6	25	5	2018-11-23, 16:16:05
/submitted/dummy	6	34	1	2021-12-29, 14:47:14
/submitted/dummy	6	51	1	2011-01-24, 22:57:04
/submitted/dummy	6	47	4	2009-03-22, 08:16:03
/submitted/dummy	6	3	3	2015-08-28, 21:00:28
/submitted/dummy	6	17	1	1995-05-24, 17:58:21
/submitted/dummy	6	69	7	2005-06-02, 13:29:33
/submitted/dummy	6	9	5	2014-04-13, 06:07:55
/submitted/dummy	6	29	2	2000-06-15, 23:00:20
/submitted/dummy	6	44	1	2005-12-16, 10:22:21
/submitted/dummy	6	59	3	2001-11-22, 22:25:14
/submitted/dummy	6	30	2	1995-02-07, 08:58:48
/submitted/dummy	6	11	1	1995-09-08, 12:43:26
/submitted/dummy	6	52	6	2010-01-25, 07:06:36
/submitted/dummy	6	26	1	2011-09-16, 16:59:15
/submitted/dummy	6	22	7	2012-05-26, 23:59:52
/submitted/dummy	6	1	5	2022-02-28, 21:13:45
/submitted/dummy	6	40	4	2013-05-28, 06:01:25
/submitted/dummy	6	13	3	2014-12-22, 22:07:44
/submitted/dummy	6	24	5	1994-04-25, 18:21:08
/submitted/dummy	6	47	3	2007-01-20, 12:31:41
/submitted/dummy	6	14	2	1996-09-25, 12:31:03
/submitted/dummy	6	51	1	1994-04-10, 05:51:21
/submitted/dummy	6	27	7	2014-10-22, 00:57:33
/submitted/dummy	6	6	4	2011-11-16, 01:23:06
/submitted/dummy	6	57	2	2008-12-19, 03:42:50
/submitted/dummy	6	13	2	1999-12-27, 17:07:54
/submitted/dummy	6	29	1	2022-01-08, 02:08:57
/submitted/dummy	6	25	5	2007-12-04, 21:03:01
/submitted/dummy	7	51	4	2002-02-18, 21:13:19
/submitted/dummy	7	62	3	2019-05-27, 14:20:23
/submitted/dummy	7	4	4	2016-10-03, 12:22:42
/submitted/dummy	7	19	2	2008-03-20, 01:23:54
/submitted/dummy	7	25	4	2003-12-20, 05:55:25
/submitted/dummy	7	25	5	2010-04-14, 13:00:02
/submitted/dummy	7	12	1	1998-05-09, 16:46:20
/submitted/dummy	7	24	1	2007-10-07, 03:50:44
/submitted/dummy	7	66	5	2009-09-28, 16:08:06
/submitted/dummy	7	30	2	1998-09-20, 04:01:20
/submitted/dummy	7	42	6	2020-10-30, 23:29:02
/submitted/dummy	7	41	7	2009-11-04, 08:19:36
/submitted/dummy	7	19	2	2014-12-14, 05:08:17
/submitted/dummy	7	17	1	2014-04-21, 21:35:19
/submitted/dummy	7	38	3	2011-08-22, 15:35:13
/submitted/dummy	7	7	2	2007-08-12, 00:26:08
/submitted/dummy	7	24	5	2001-11-17, 09:27:48
/submitted/dummy	7	20	3	1994-05-13, 17:29:48
/submitted/dummy	7	65	6	1997-06-13, 21:38:26
/submitted/dummy	7	16	6	2014-04-13, 08:13:01
/submitted/dummy	7	51	1	2002-04-14, 22:46:48
/submitted/dummy	7	60	7	2018-10-17, 02:36:45
/submitted/dummy	7	49	1	2002-01-18, 20:27:08
/submitted/dummy	7	67	7	1992-12-18, 10:42:09
/submitted/dummy	7	32	2	2013-07-10, 15:02:23
/submitted/dummy	7	34	4	2011-05-09, 06:09:47
/submitted/dummy	7	36	1	2000-12-08, 12:45:54
/submitted/dummy	7	54	3	2018-08-01, 02:00:40
/submitted/dummy	7	37	7	2013-05-05, 00:51:44
/submitted/dummy	7	15	6	1999-08-27, 09:31:37
/submitted/dummy	7	65	6	2015-04-13, 00:24:49
/submitted/dummy	7	22	7	2000-09-20, 00:47:50
/submitted/dummy	7	16	6	1999-10-24, 04:29:24
/submitted/dummy	7	48	7	1994-09-17, 17:48:42
/submitted/dummy	8	61	7	2003-05-06, 22:59:24
/submitted/dummy	8	39	1	1996-05-12, 23:01:06
/submitted/dummy	8	60	7	2007-12-10, 04:20:59
/submitted/dummy	8	69	7	1997-05-14, 23:30:07
/submitted/dummy	8	11	1	1993-10-19, 14:58:03
/submitted/dummy	8	68	3	1996-02-04, 14:02:06
/submitted/dummy	8	23	5	2017-03-12, 23:42:38
/submitted/dummy	8	62	7	2005-08-27, 13:11:17
/submitted/dummy	8	68	2	2000-01-04, 23:05:22
/submitted/dummy	8	19	3	2021-03-31, 09:02:58
/submitted/dummy	8	22	7	2005-05-03, 12:26:06
/submitted/dummy	8	56	7	2015-11-21, 04:30:35
/submitted/dummy	8	43	1	2019-10-31, 16:14:43
/submitted/dummy	8	37	7	2004-02-19, 06:52:01
/submitted/dummy	8	47	4	1993-03-10, 17:58:08
/submitted/dummy	8	12	1	2002-02-12, 07:50:11
/submitted/dummy	8	68	3	2021-08-09, 10:09:52
/submitted/dummy	8	12	1	1992-12-11, 18:54:41
/submitted/dummy	8	45	4	2018-11-16, 20:46:00
/submitted/dummy	8	3	3	2013-03-19, 13:24:12
/submitted/dummy	9	44	1	1997-09-26, 09:29:44
/submitted/dummy	9	65	6	2018-12-02, 15:35:00
/submitted/dummy	9	25	5	2020-08-05, 05:34:23
/submitted/dummy	9	19	5	1997-10-26, 02:38:16
/submitted/dummy	9	16	6	2006-09-10, 04:51:11
/submitted/dummy	9	20	3	2008-10-29, 23:23:11
/submitted/dummy	9	49	3	2017-01-29, 22:11:27
/submitted/dummy	9	28	4	1994-11-26, 03:51:07
/submitted/dummy	9	49	3	1996-08-23, 10:49:15
/submitted/dummy	9	48	7	2012-03-24, 14:18:12
/submitted/dummy	9	13	2	2015-04-08, 22:10:54
/submitted/dummy	9	11	1	1994-05-12, 13:44:30
/submitted/dummy	9	41	7	2006-09-04, 03:49:15
/submitted/dummy	9	50	4	1997-08-16, 18:15:05
/submitted/dummy	9	62	3	2005-01-21, 13:50:30
/submitted/dummy	9	13	2	2017-02-08, 12:54:24
/submitted/dummy	9	15	1	2013-11-08, 11:51:27
/submitted/dummy	9	22	7	2020-01-11, 08:39:11
/submitted/dummy	9	12	1	2001-03-10, 05:08:05
/submitted/dummy	9	36	1	2020-12-25, 21:13:34
/submitted/dummy	9	45	4	2021-07-11, 00:37:11
/submitted/dummy	9	65	6	2020-07-06, 10:36:02
/submitted/dummy	9	42	6	2009-01-16, 11:00:00
/submitted/dummy	9	18	2	1994-07-08, 06:17:28
/submitted/dummy	9	66	5	2013-06-11, 14:54:48
/submitted/dummy	9	51	3	2000-09-01, 22:56:43
/submitted/dummy	9	56	3	1999-10-10, 09:22:31
/submitted/dummy	9	56	7	1999-08-20, 10:53:07
/submitted/dummy	9	41	2	1993-11-28, 08:35:24
/submitted/dummy	9	19	2	2021-06-11, 02:15:33
/submitted/dummy	9	46	4	2002-11-04, 14:10:23
/submitted/dummy	9	69	7	2008-11-10, 05:08:04
/submitted/dummy	9	26	1	1999-05-05, 08:34:09
/submitted/dummy	9	34	4	2002-07-03, 19:26:28
/submitted/dummy	9	33	3	2021-05-13, 17:29:53
/submitted/dummy	9	28	5	2007-01-20, 01:10:18
/submitted/dummy	9	24	1	2018-09-27, 07:38:01
/submitted/dummy	9	25	3	1993-01-24, 06:13:23
/submitted/dummy	9	44	1	2014-04-21, 19:53:44
/submitted/dummy	9	66	5	2017-04-30, 17:50:59
/submitted/dummy	9	34	2	2010-03-08, 05:44:16
/submitted/dummy	9	60	7	1993-07-09, 14:26:36
/submitted/dummy	9	30	1	1999-11-25, 08:19:38
/submitted/dummy	9	56	3	2002-05-28, 03:09:41
/submitted/dummy	9	38	3	2018-01-18, 09:49:15
/submitted/dummy	10	31	2	2020-10-06, 22:17:59
/submitted/dummy	10	16	6	2021-10-24, 14:58:45
/submitted/dummy	10	23	1	2000-05-23, 13:54:00
/submitted/dummy	10	45	4	2000-01-10, 04:04:51
/submitted/dummy	10	23	7	2015-02-24, 23:03:12
/submitted/dummy	10	7	5	2002-02-09, 12:33:42
/submitted/dummy	10	60	7	1993-09-05, 05:15:31
/submitted/dummy	10	64	1	1994-12-28, 16:15:42
/submitted/dummy	10	40	4	2000-09-23, 12:21:49
/submitted/dummy	10	42	2	2015-12-04, 20:37:31
/submitted/dummy	10	9	5	2015-12-29, 18:01:20
/submitted/dummy	10	61	7	2014-02-13, 06:43:35
/submitted/dummy	10	15	1	1995-03-24, 12:16:28
/submitted/dummy	10	19	3	1996-07-07, 17:13:02
/submitted/dummy	10	30	1	1995-04-12, 08:14:58
/submitted/dummy	10	67	7	1992-11-02, 12:22:39
/submitted/dummy	10	39	1	2011-10-04, 03:10:03
/submitted/dummy	10	48	5	2019-03-03, 19:29:41
/submitted/dummy	10	42	2	2010-12-12, 08:38:47
/submitted/dummy	10	39	7	2000-12-23, 08:46:50
/submitted/dummy	10	18	2	1996-11-13, 05:23:27
/submitted/dummy	10	11	1	2004-06-18, 18:04:04
/submitted/dummy	10	6	4	2019-10-30, 06:13:04
/submitted/dummy	10	15	6	2010-11-03, 05:04:01
/submitted/dummy	10	61	7	1999-10-02, 11:01:06
/submitted/dummy	10	41	2	2011-09-01, 12:47:52
/submitted/dummy	10	21	2	2012-04-17, 12:10:04
/submitted/dummy	10	33	3	2014-08-09, 13:06:49
/submitted/dummy	10	21	3	1997-05-02, 07:30:45
/submitted/dummy	10	38	3	1999-12-27, 08:37:09
/submitted/dummy	10	45	4	2017-11-09, 23:47:02
/submitted/dummy	10	7	2	2014-05-12, 16:09:48
\.
COPY task_groups (problem_id, name, requires_all_ok) FROM STDIN;
1	Group 1	True
1	Group 2	True
1	Group 3	True
1	Group 4	True
2	Group 1	False
2	Group 2	False
2	Group 3	False
3	Group 1	True
3	Group 2	True
3	Group 3	False
3	Group 4	False
3	Group 5	False
4	Group 1	False
5	Group 1	False
5	Group 2	False
5	Group 3	False
5	Group 4	True
5	Group 5	False
6	Group 1	False
6	Group 2	False
6	Group 3	True
6	Group 4	False
6	Group 5	True
7	Group 1	True
7	Group 2	True
8	Group 1	True
8	Group 2	False
8	Group 3	False
8	Group 4	False
9	Group 1	True
9	Group 2	True
9	Group 3	False
9	Group 4	True
9	Group 5	True
10	Group 1	False
11	Group 1	False
11	Group 2	True
11	Group 3	True
11	Group 4	True
12	Group 1	False
12	Group 2	False
12	Group 3	True
13	Group 1	True
13	Group 2	True
13	Group 3	False
13	Group 4	True
13	Group 5	False
14	Group 1	False
14	Group 2	True
14	Group 3	False
15	Group 1	True
15	Group 2	False
15	Group 3	True
15	Group 4	False
15	Group 5	True
16	Group 1	False
17	Group 1	False
17	Group 2	False
17	Group 3	True
17	Group 4	True
17	Group 5	True
18	Group 1	True
19	Group 1	True
19	Group 2	False
19	Group 3	True
20	Group 1	True
21	Group 1	False
21	Group 2	True
21	Group 3	False
22	Group 1	True
22	Group 2	False
22	Group 3	False
23	Group 1	True
24	Group 1	True
24	Group 2	False
24	Group 3	True
24	Group 4	False
25	Group 1	True
25	Group 2	True
26	Group 1	False
26	Group 2	False
26	Group 3	False
26	Group 4	False
26	Group 5	True
27	Group 1	True
27	Group 2	True
27	Group 3	True
27	Group 4	True
28	Group 1	False
28	Group 2	True
28	Group 3	False
28	Group 4	True
29	Group 1	False
29	Group 2	True
29	Group 3	True
29	Group 4	True
29	Group 5	False
30	Group 1	False
30	Group 2	True
31	Group 1	True
31	Group 2	True
32	Group 1	True
32	Group 2	True
33	Group 1	True
33	Group 2	True
34	Group 1	True
34	Group 2	True
34	Group 3	True
34	Group 4	False
34	Group 5	True
35	Group 1	False
35	Group 2	False
36	Group 1	True
36	Group 2	False
36	Group 3	True
36	Group 4	True
37	Group 1	False
38	Group 1	True
38	Group 2	True
38	Group 3	False
38	Group 4	False
38	Group 5	False
39	Group 1	True
39	Group 2	False
39	Group 3	True
39	Group 4	True
39	Group 5	False
40	Group 1	True
41	Group 1	True
41	Group 2	False
41	Group 3	False
41	Group 4	True
41	Group 5	False
42	Group 1	True
42	Group 2	False
43	Group 1	True
43	Group 2	False
43	Group 3	False
43	Group 4	True
43	Group 5	True
44	Group 1	False
44	Group 2	True
44	Group 3	True
44	Group 4	True
45	Group 1	False
45	Group 2	True
46	Group 1	False
46	Group 2	False
46	Group 3	True
47	Group 1	False
47	Group 2	True
48	Group 1	True
49	Group 1	False
49	Group 2	True
49	Group 3	False
49	Group 4	False
49	Group 5	True
50	Group 1	False
50	Group 2	True
50	Group 3	False
50	Group 4	True
50	Group 5	False
51	Group 1	False
51	Group 2	True
52	Group 1	True
52	Group 2	False
52	Group 3	False
52	Group 4	True
53	Group 1	True
53	Group 2	False
53	Group 3	False
53	Group 4	False
53	Group 5	True
54	Group 1	True
55	Group 1	True
55	Group 2	False
55	Group 3	False
56	Group 1	False
57	Group 1	True
57	Group 2	True
58	Group 1	False
58	Group 2	True
58	Group 3	False
58	Group 4	False
58	Group 5	False
59	Group 1	True
59	Group 2	False
59	Group 3	True
59	Group 4	True
60	Group 1	False
60	Group 2	False
60	Group 3	False
60	Group 4	False
61	Group 1	True
61	Group 2	False
62	Group 1	False
62	Group 2	True
62	Group 3	False
63	Group 1	True
63	Group 2	True
63	Group 3	False
64	Group 1	True
64	Group 2	True
64	Group 3	False
64	Group 4	False
65	Group 1	False
65	Group 2	True
65	Group 3	True
65	Group 4	False
66	Group 1	True
66	Group 2	False
66	Group 3	False
66	Group 4	True
66	Group 5	False
67	Group 1	True
67	Group 2	False
67	Group 3	True
67	Group 4	False
68	Group 1	False
69	Group 1	False
69	Group 2	True
\.
COPY tasks (task_group, name, test_uri, points, time_limit, memory_limit, show_output) FROM STDIN;
1	Test 0	tasks/wp-content/app/posts	1.3	2.4	102400	True
1	Test 1	tasks/app/app	1.9	3.0	88064	True
1	Test 2	tasks/wp-content/posts	2.9	1.8	35651584	True
1	Test 3	tasks/tags/blog/list	1.2	2.9	11534336	False
1	Test 4	tasks/category/tags	2.0	3.0	32505856	False
2	Test 0	tasks/wp-content	2.1	1.4	20480	False
2	Test 1	tasks/wp-content/categories	1.1	0.6	60817408	True
2	Test 2	tasks/explore	2.0	2.6	9216	False
2	Test 3	tasks/posts	1.2	1.6	75776	False
2	Test 4	tasks/explore/posts/tags	2.8	2.5	40894464	True
2	Test 5	tasks/app	1.9	3.1	11534336	True
2	Test 6	tasks/search/blog/wp-content	2.5	1.1	86016	True
2	Test 7	tasks/wp-content/category/categories	2.5	2.9	89128960	True
2	Test 8	tasks/list/list	2.8	2.0	15360	True
3	Test 0	tasks/posts/wp-content	2.6	1.3	22528	False
3	Test 1	tasks/explore/tag/categories	2.9	2.2	98304	True
3	Test 2	tasks/app/main	2.1	2.8	66560	True
4	Test 0	tasks/blog/posts/posts	1.1	2.5	62464	True
4	Test 1	tasks/explore/posts/category	1.7	0.9	102400	False
4	Test 2	tasks/main/app/list	1.7	2.7	2097152	True
4	Test 3	tasks/wp-content/explore	2.3	1.0	69632	False
5	Test 0	tasks/list/posts/wp-content	1.6	2.1	99614720	False
5	Test 1	tasks/wp-content/wp-content/tag	2.8	3.4	88064	False
5	Test 2	tasks/blog/explore	2.9	1.3	56623104	False
5	Test 3	tasks/main	1.6	1.8	53477376	False
5	Test 4	tasks/wp-content	2.9	2.2	14680064	False
5	Test 5	tasks/tag/app/tag	1.8	3.4	37748736	False
5	Test 6	tasks/categories/list	1.5	3.2	25600	True
6	Test 0	tasks/app/explore	1.3	3.3	62914560	True
6	Test 1	tasks/main/posts/category	1.8	0.9	41943040	False
6	Test 2	tasks/list	1.4	2.7	20971520	False
6	Test 3	tasks/list	2.6	0.5	25600	True
6	Test 4	tasks/search/main/explore	2.0	1.1	63488	True
6	Test 5	tasks/list	2.8	1.6	1048576	False
6	Test 6	tasks/categories/posts	1.5	0.9	26624	True
6	Test 7	tasks/category/explore/posts	1.4	1.0	38912	True
6	Test 8	tasks/wp-content/search	1.3	3.1	1048576	False
6	Test 9	tasks/categories/main	2.4	1.1	87040	False
7	Test 0	tasks/tag/posts/blog	2.9	2.8	29360128	False
7	Test 1	tasks/app	1.7	3.1	28311552	True
7	Test 2	tasks/main	1.4	3.2	41943040	True
7	Test 3	tasks/category/blog	1.1	2.8	6291456	True
7	Test 4	tasks/main	1.2	0.9	83886080	False
8	Test 0	tasks/posts	1.2	0.8	47104	True
8	Test 1	tasks/app/posts/wp-content	2.5	2.5	39845888	False
8	Test 2	tasks/app/tags	2.9	1.7	47185920	False
8	Test 3	tasks/category/explore	2.7	2.2	71303168	False
8	Test 4	tasks/wp-content/app/wp-content	2.6	3.2	76800	False
8	Test 5	tasks/list/explore	2.1	3.3	77824	False
8	Test 6	tasks/categories/main/main	2.0	2.0	39936	False
8	Test 7	tasks/tags/explore	1.8	2.7	95232	True
9	Test 0	tasks/category	1.3	2.5	19456	False
9	Test 1	tasks/blog/app	2.3	1.0	19456	False
9	Test 2	tasks/tags/posts	2.7	2.3	37888	True
9	Test 3	tasks/list	1.5	0.6	78643200	True
9	Test 4	tasks/categories/main	1.4	2.0	83968	True
9	Test 5	tasks/search/explore	1.0	1.7	49152	True
9	Test 6	tasks/list	1.9	1.5	90112	False
10	Test 0	tasks/list	1.3	2.2	46080	False
10	Test 1	tasks/list/explore	2.5	1.7	22528	False
10	Test 2	tasks/main/app/tags	2.6	2.4	54525952	False
10	Test 3	tasks/category/category	1.8	1.5	80740352	False
10	Test 4	tasks/wp-content/posts	2.1	2.9	78643200	True
10	Test 5	tasks/wp-content/app/category	1.0	2.5	29360128	False
10	Test 6	tasks/app/search	2.5	2.0	18874368	True
10	Test 7	tasks/categories/posts	2.5	0.6	46137344	False
10	Test 8	tasks/list/app/category	2.8	3.0	37888	False
10	Test 9	tasks/tag/categories	2.7	3.3	53477376	True
11	Test 0	tasks/posts/wp-content	2.4	0.8	2048	True
11	Test 1	tasks/list/search	1.2	1.7	37748736	True
11	Test 2	tasks/tag	2.3	2.8	9437184	False
11	Test 3	tasks/list	2.4	1.0	88064	False
12	Test 0	tasks/wp-content	2.8	1.2	46080	False
12	Test 1	tasks/blog/tag/list	2.4	1.7	15360	True
12	Test 2	tasks/explore/category	1.1	1.2	51200	False
12	Test 3	tasks/tags/explore	1.3	3.0	38912	True
12	Test 4	tasks/categories/wp-content/tag	1.8	1.2	18432	False
12	Test 5	tasks/wp-content	2.4	1.9	75776	True
12	Test 6	tasks/explore/posts/list	1.0	0.5	88064	True
12	Test 7	tasks/category/category/tag	1.5	2.3	50176	True
12	Test 8	tasks/categories/search	1.3	1.0	91136	True
13	Test 0	tasks/tags/search	2.8	0.9	83968	True
13	Test 1	tasks/category/app	1.6	2.2	84992	False
13	Test 2	tasks/blog/category	1.6	1.7	101711872	False
13	Test 3	tasks/blog	2.2	1.0	33554432	True
13	Test 4	tasks/category/main	1.4	1.4	8388608	True
13	Test 5	tasks/category	1.6	0.9	16384	True
13	Test 6	tasks/tag/list	1.2	1.4	92160	True
13	Test 7	tasks/app	1.5	0.7	40894464	True
13	Test 8	tasks/tags/blog/blog	2.7	0.9	81920	True
14	Test 0	tasks/wp-content/blog	1.3	2.3	2097152	False
14	Test 1	tasks/search/app/tag	1.4	0.7	95232	False
14	Test 2	tasks/wp-content/search/explore	1.8	1.5	20480	True
14	Test 3	tasks/tags/tag/tag	2.1	3.2	9437184	True
14	Test 4	tasks/search/app/posts	1.2	1.7	42991616	False
14	Test 5	tasks/tag/explore/posts	1.9	3.2	13631488	True
14	Test 6	tasks/categories/tags	2.4	1.4	58368	False
14	Test 7	tasks/posts/search/list	2.2	2.4	59768832	False
15	Test 0	tasks/categories	1.8	2.3	72351744	False
15	Test 1	tasks/list	2.4	2.9	25165824	False
15	Test 2	tasks/tag	1.7	0.5	29360128	True
15	Test 3	tasks/categories	2.0	3.3	7340032	True
15	Test 4	tasks/main/category/blog	2.9	3.2	4096	False
15	Test 5	tasks/app/explore	2.3	1.3	67108864	False
15	Test 6	tasks/app	1.0	2.8	91226112	False
15	Test 7	tasks/wp-content	1.8	2.6	71680	False
16	Test 0	tasks/blog/tag/blog	2.1	1.3	98304	False
16	Test 1	tasks/app/main/list	2.7	1.5	67584	False
16	Test 2	tasks/category	1.0	2.1	95420416	True
16	Test 3	tasks/app/list/main	2.0	0.7	22020096	False
16	Test 4	tasks/tags	2.3	3.3	104857600	False
16	Test 5	tasks/app	2.1	2.3	23068672	True
17	Test 0	tasks/app/wp-content	1.8	1.8	1048576	True
18	Test 0	tasks/posts/categories/posts	1.7	0.5	77594624	False
18	Test 1	tasks/main/search/search	1.3	2.7	99328	True
18	Test 2	tasks/posts	2.3	0.6	94208	False
18	Test 3	tasks/blog/search/wp-content	1.6	2.0	19922944	False
18	Test 4	tasks/blog/tag	2.9	1.2	78643200	False
18	Test 5	tasks/categories/categories/list	1.3	1.9	30720	False
18	Test 6	tasks/main	1.3	2.3	36700160	True
19	Test 0	tasks/list	2.3	2.7	66560	True
19	Test 1	tasks/explore/search/categories	2.6	3.1	26624	False
19	Test 2	tasks/blog	1.6	2.0	26214400	False
19	Test 3	tasks/app/tags	1.8	1.6	35651584	False
19	Test 4	tasks/list/category/list	2.9	2.4	17408	False
19	Test 5	tasks/tags/posts	1.6	3.0	44032	False
20	Test 0	tasks/tags/explore/app	2.7	3.2	37748736	True
20	Test 1	tasks/explore/posts/app	2.2	1.9	66060288	False
20	Test 2	tasks/main	1.7	1.8	36864	False
20	Test 3	tasks/category	2.5	2.3	54525952	True
20	Test 4	tasks/wp-content	2.5	0.6	7340032	False
20	Test 5	tasks/main/category	2.4	1.0	66560	False
21	Test 0	tasks/wp-content/category	2.5	3.4	48234496	True
21	Test 1	tasks/tag	1.4	2.2	91136	True
21	Test 2	tasks/posts/blog/wp-content	1.9	2.6	23552	False
21	Test 3	tasks/wp-content/blog	1.2	3.0	57671680	True
22	Test 0	tasks/blog	1.9	1.5	79691776	False
22	Test 1	tasks/tags/list/main	2.7	3.2	66060288	True
22	Test 2	tasks/tag	1.5	2.6	62914560	False
22	Test 3	tasks/tag/app	1.4	1.1	103809024	True
22	Test 4	tasks/main/list	2.3	1.9	26624	False
22	Test 5	tasks/list/explore	1.7	1.3	31457280	False
22	Test 6	tasks/explore/blog/tag	2.9	2.8	90112	True
22	Test 7	tasks/posts	2.7	2.7	13312	True
23	Test 0	tasks/blog/explore/list	1.1	3.4	25165824	False
23	Test 1	tasks/search	2.4	2.7	7168	False
23	Test 2	tasks/search	2.3	1.7	99614720	False
23	Test 3	tasks/explore/search/blog	2.8	2.2	32505856	False
24	Test 0	tasks/categories/tag/tags	2.9	1.2	91226112	True
24	Test 1	tasks/category/wp-content	2.7	2.3	53477376	True
24	Test 2	tasks/search	1.4	1.1	82837504	False
24	Test 3	tasks/categories/app	1.2	0.6	3072	False
24	Test 4	tasks/app/main/list	1.8	1.8	62914560	True
25	Test 0	tasks/wp-content/posts/tags	1.8	2.5	16777216	False
25	Test 1	tasks/search/category	1.8	2.1	86016	False
25	Test 2	tasks/blog	1.9	0.5	35651584	False
25	Test 3	tasks/blog/main/search	2.0	1.5	61440	False
25	Test 4	tasks/explore	2.9	2.3	97280	False
25	Test 5	tasks/blog/search	2.1	1.6	69632	False
25	Test 6	tasks/search/explore/explore	1.7	2.0	70656	True
25	Test 7	tasks/tags/categories	2.4	2.2	95420416	True
25	Test 8	tasks/tags/blog	2.6	2.0	18432	False
25	Test 9	tasks/categories	1.5	2.6	29360128	True
26	Test 0	tasks/explore/tag/explore	1.6	3.0	7168	True
26	Test 1	tasks/main/wp-content/main	1.3	1.2	38797312	False
26	Test 2	tasks/search	2.2	3.2	96256	False
27	Test 0	tasks/explore	2.4	1.0	89088	True
28	Test 0	tasks/tags/tag	1.8	0.5	29696	True
28	Test 1	tasks/blog	2.4	2.6	73728	False
28	Test 2	tasks/posts/posts	2.6	2.9	46137344	True
28	Test 3	tasks/app	1.4	1.9	13312	False
28	Test 4	tasks/blog/explore	1.7	2.5	65011712	True
28	Test 5	tasks/blog/search	1.2	1.2	14680064	False
28	Test 6	tasks/list/categories/app	1.8	3.3	49152	True
29	Test 0	tasks/search/main	2.3	3.2	9216	False
29	Test 1	tasks/blog	1.0	1.2	1024	True
29	Test 2	tasks/tag/list/main	2.7	3.4	63488	False
29	Test 3	tasks/tags	2.6	3.2	45056	True
29	Test 4	tasks/app/list	2.6	1.6	78643200	True
30	Test 0	tasks/category	2.0	2.1	94208	True
30	Test 1	tasks/explore/category	1.5	2.0	6291456	False
30	Test 2	tasks/explore	2.5	3.2	50331648	False
31	Test 0	tasks/blog	1.1	1.0	35840	True
31	Test 1	tasks/app/wp-content/main	1.6	1.3	69632	False
31	Test 2	tasks/search	1.4	2.9	77594624	True
31	Test 3	tasks/posts/wp-content	1.6	2.6	82944	True
31	Test 4	tasks/explore/posts	1.5	2.7	23552	True
31	Test 5	tasks/explore/blog/explore	1.8	3.4	94371840	True
31	Test 6	tasks/posts	2.0	0.6	15728640	False
31	Test 7	tasks/main/app/posts	1.5	2.2	36864	True
32	Test 0	tasks/explore/posts/blog	1.2	2.8	47104	True
32	Test 1	tasks/blog/main	1.8	0.5	98566144	True
32	Test 2	tasks/tags/wp-content	1.6	2.9	50176	False
33	Test 0	tasks/list/posts	2.5	2.2	32768	False
34	Test 0	tasks/app/tag/blog	1.0	2.6	49283072	False
34	Test 1	tasks/wp-content/tags/app	1.6	2.9	66560	False
34	Test 2	tasks/posts/tag/wp-content	2.3	2.3	99328	False
34	Test 3	tasks/main/app/search	1.2	2.1	73400320	True
34	Test 4	tasks/search	2.7	1.0	49283072	True
34	Test 5	tasks/categories/search	2.2	0.6	31744	True
35	Test 0	tasks/tag/explore/list	2.7	1.9	35651584	False
35	Test 1	tasks/search	1.7	2.0	87031808	True
35	Test 2	tasks/explore/app	2.3	1.1	98566144	False
35	Test 3	tasks/list/blog	1.7	1.2	78848	True
35	Test 4	tasks/tag	1.2	1.3	76800	False
35	Test 5	tasks/wp-content/list/explore	2.6	1.8	56320	True
35	Test 6	tasks/category/tag/blog	2.9	2.0	34603008	True
35	Test 7	tasks/wp-content/search/main	2.9	3.2	56623104	True
36	Test 0	tasks/app	2.8	1.3	12288	False
36	Test 1	tasks/search/app	1.1	0.9	59768832	False
36	Test 2	tasks/posts	1.1	3.3	83968	True
36	Test 3	tasks/categories	1.5	0.8	1048576	False
36	Test 4	tasks/posts/tag/category	1.8	1.1	62464	True
36	Test 5	tasks/categories	1.5	3.1	2048	True
36	Test 6	tasks/list/explore/tags	1.7	2.1	25600	False
36	Test 7	tasks/blog/tags/app	2.8	3.4	6144	False
36	Test 8	tasks/explore/posts	1.6	0.6	13631488	False
37	Test 0	tasks/tag	1.5	1.5	63488	True
37	Test 1	tasks/main/list	2.8	2.1	18432	True
37	Test 2	tasks/explore/main	1.0	2.4	44040192	False
37	Test 3	tasks/posts/blog/tag	2.0	0.6	14680064	True
37	Test 4	tasks/tags	2.2	0.9	76546048	False
37	Test 5	tasks/list	2.8	2.6	15360	False
37	Test 6	tasks/posts/explore/list	1.1	1.3	31744	False
37	Test 7	tasks/list/app	1.8	2.9	45056	True
38	Test 0	tasks/posts/categories/wp-content	1.4	1.0	79872	False
38	Test 1	tasks/tag/wp-content/posts	1.0	1.4	58368	False
38	Test 2	tasks/explore/category	1.3	1.7	27262976	True
38	Test 3	tasks/search	1.9	1.5	83886080	False
38	Test 4	tasks/categories/list/category	1.3	0.5	78848	True
38	Test 5	tasks/category/tag/app	2.3	2.1	68608	True
38	Test 6	tasks/category/main/blog	1.2	1.1	3072	True
38	Test 7	tasks/tags/tags/wp-content	2.1	2.0	38912	True
38	Test 8	tasks/app/app	2.6	2.1	52428800	True
39	Test 0	tasks/posts/category	2.0	1.2	51380224	False
39	Test 1	tasks/main/wp-content/categories	2.8	0.9	22528	True
39	Test 2	tasks/tags	2.3	1.3	76800	True
39	Test 3	tasks/categories/posts	1.9	1.6	11534336	False
40	Test 0	tasks/posts/wp-content	1.0	2.3	33554432	False
40	Test 1	tasks/posts/posts	1.3	3.1	48128	True
41	Test 0	tasks/list/blog/posts	2.2	1.6	58720256	True
41	Test 1	tasks/posts/categories	1.4	1.6	42991616	False
42	Test 0	tasks/categories	1.1	1.2	47104	True
42	Test 1	tasks/wp-content/category	1.3	2.3	59768832	True
42	Test 2	tasks/category	2.8	1.6	71303168	True
42	Test 3	tasks/categories/wp-content/tag	2.2	3.2	3145728	False
42	Test 4	tasks/explore/app	2.7	1.2	11534336	True
42	Test 5	tasks/search/categories/tag	1.0	1.8	19922944	True
42	Test 6	tasks/posts	2.0	2.6	22528	True
42	Test 7	tasks/tags/wp-content	2.0	1.2	1024	True
42	Test 8	tasks/search/posts/blog	1.9	1.0	50176	True
43	Test 0	tasks/blog	1.8	2.9	50331648	True
43	Test 1	tasks/blog/explore/posts	1.1	1.8	95420416	True
44	Test 0	tasks/tag	2.0	3.1	79691776	False
44	Test 1	tasks/explore	1.4	2.0	31744	False
44	Test 2	tasks/app/wp-content/category	2.2	3.3	64512	True
44	Test 3	tasks/app/search	2.0	1.8	102760448	True
45	Test 0	tasks/posts/search	1.9	2.6	4096	False
45	Test 1	tasks/search	2.6	2.6	99328	True
45	Test 2	tasks/list/search	2.0	3.4	5120	False
45	Test 3	tasks/main/explore	2.5	1.0	92274688	False
45	Test 4	tasks/blog	2.2	1.1	11534336	False
45	Test 5	tasks/tag/category	2.5	2.2	67108864	False
45	Test 6	tasks/main/explore/category	2.8	1.5	24117248	True
45	Test 7	tasks/wp-content/app/main	1.6	2.9	47185920	False
45	Test 8	tasks/blog/app/main	1.5	2.8	77594624	True
45	Test 9	tasks/wp-content/search	1.5	2.9	29360128	False
46	Test 0	tasks/posts/tags	2.8	2.1	36864	False
46	Test 1	tasks/main/category/app	1.8	1.4	94371840	False
46	Test 2	tasks/tags	1.3	1.7	75776	False
46	Test 3	tasks/search	2.5	2.3	88080384	True
46	Test 4	tasks/app/wp-content	2.0	1.7	84992	True
46	Test 5	tasks/blog/search/posts	1.6	1.1	33792	False
46	Test 6	tasks/search/list/categories	1.4	1.9	33792	False
46	Test 7	tasks/main/tag/tags	1.5	1.2	30720	False
46	Test 8	tasks/posts/wp-content/main	2.0	1.2	66560	True
47	Test 0	tasks/explore	2.9	0.5	3072	False
48	Test 0	tasks/wp-content/category/categories	2.5	3.1	53477376	True
48	Test 1	tasks/search	2.9	0.9	59768832	True
48	Test 2	tasks/tags	1.6	0.8	2097152	True
49	Test 0	tasks/main	2.5	1.6	32505856	False
50	Test 0	tasks/app	1.2	2.9	67584	False
50	Test 1	tasks/app/wp-content/posts	2.3	3.4	18432	False
50	Test 2	tasks/main/search/blog	1.9	2.1	99328	False
50	Test 3	tasks/category	1.9	1.3	12582912	True
50	Test 4	tasks/wp-content/blog	2.2	2.1	33554432	False
51	Test 0	tasks/search/category	2.0	3.3	40894464	True
51	Test 1	tasks/blog/posts	1.4	1.7	13631488	True
51	Test 2	tasks/explore/main/tag	1.1	2.3	40894464	False
51	Test 3	tasks/categories/tag	2.4	2.8	38797312	False
51	Test 4	tasks/categories/categories	1.1	0.7	27262976	False
51	Test 5	tasks/category	1.6	1.3	30720	True
51	Test 6	tasks/search/explore/tag	2.7	3.3	22020096	False
51	Test 7	tasks/category/list/posts	1.4	1.3	86016	True
51	Test 8	tasks/categories	2.4	1.2	28672	False
52	Test 0	tasks/search/list	1.7	2.7	80740352	True
52	Test 1	tasks/explore/tag/posts	2.8	1.1	22020096	True
52	Test 2	tasks/list	2.7	2.0	76800	True
52	Test 3	tasks/wp-content	1.5	1.7	75497472	True
52	Test 4	tasks/blog	1.2	2.4	66060288	True
52	Test 5	tasks/main/blog/list	2.8	2.7	41984	False
52	Test 6	tasks/categories	1.0	3.1	90112	True
52	Test 7	tasks/tags/app/explore	1.0	1.6	29696	True
52	Test 8	tasks/category/main	2.6	1.7	15728640	True
53	Test 0	tasks/explore/category/blog	2.1	0.7	34816	True
53	Test 1	tasks/explore	1.2	0.5	47104	True
53	Test 2	tasks/search/wp-content	2.7	3.4	94208	True
53	Test 3	tasks/wp-content/wp-content	2.8	2.5	38797312	True
54	Test 0	tasks/list/blog	1.9	2.2	55574528	False
54	Test 1	tasks/list/explore	1.9	0.5	101376	False
54	Test 2	tasks/tags/tags/blog	1.6	3.1	25600	True
54	Test 3	tasks/tag/explore/blog	1.9	2.5	55574528	False
54	Test 4	tasks/app/list/category	2.7	0.9	39845888	True
55	Test 0	tasks/explore	2.3	3.1	53248	False
55	Test 1	tasks/search/blog	2.7	2.6	40960	True
55	Test 2	tasks/search	2.9	2.5	69206016	False
55	Test 3	tasks/categories/tags/category	1.2	1.2	89128960	False
55	Test 4	tasks/explore	1.7	2.2	3072	True
55	Test 5	tasks/search	1.7	1.5	48234496	True
55	Test 6	tasks/search	1.6	2.4	40960	True
55	Test 7	tasks/list	1.1	1.5	52224	True
55	Test 8	tasks/posts/list/posts	1.0	1.7	51380224	True
55	Test 9	tasks/main/main	2.0	0.7	29360128	True
56	Test 0	tasks/categories	2.1	1.8	71303168	False
56	Test 1	tasks/tag/search/categories	1.6	1.3	84992	True
56	Test 2	tasks/search/categories	2.4	3.2	26214400	True
56	Test 3	tasks/categories	2.6	1.4	101711872	True
56	Test 4	tasks/categories/app	1.9	1.9	100663296	True
56	Test 5	tasks/main	2.5	3.1	40894464	True
56	Test 6	tasks/categories/search	2.4	2.4	62914560	True
56	Test 7	tasks/explore/main	2.4	0.8	72704	True
57	Test 0	tasks/blog/list	2.8	0.9	11534336	False
57	Test 1	tasks/category/categories	1.2	2.9	68157440	False
57	Test 2	tasks/blog/blog/main	2.0	2.5	67108864	True
58	Test 0	tasks/app	1.8	3.3	33554432	False
58	Test 1	tasks/wp-content/tag/list	1.3	0.6	76800	True
58	Test 2	tasks/category/posts/category	1.5	2.2	20971520	True
58	Test 3	tasks/tags/list/explore	2.1	1.7	30408704	True
58	Test 4	tasks/tag/explore	2.8	0.8	54272	False
58	Test 5	tasks/list	1.8	2.3	87040	False
58	Test 6	tasks/main/list/categories	1.8	2.1	79872	True
58	Test 7	tasks/wp-content	1.6	1.2	29360128	True
59	Test 0	tasks/tag	1.5	0.5	56320	False
59	Test 1	tasks/list/category	1.5	0.6	58720256	True
60	Test 0	tasks/search	1.2	1.9	77594624	True
60	Test 1	tasks/main	1.6	2.7	13312	True
60	Test 2	tasks/app/search/main	2.9	1.6	2048	True
60	Test 3	tasks/app/posts/app	2.5	2.0	88064	False
61	Test 0	tasks/categories	1.4	0.6	73400320	True
61	Test 1	tasks/posts/main	2.4	2.3	11264	True
61	Test 2	tasks/blog/categories	1.5	3.0	51200	False
61	Test 3	tasks/list/blog	1.2	3.0	77594624	False
61	Test 4	tasks/explore	2.7	0.9	81788928	False
61	Test 5	tasks/wp-content	1.3	2.3	48234496	True
61	Test 6	tasks/wp-content	2.9	1.7	17825792	False
61	Test 7	tasks/app/tags	1.0	2.3	77824	True
62	Test 0	tasks/tag	2.2	1.2	47104	True
62	Test 1	tasks/explore/search	2.6	0.8	20971520	False
62	Test 2	tasks/tag/wp-content/app	2.9	2.8	18874368	True
62	Test 3	tasks/list	2.7	0.8	65011712	False
62	Test 4	tasks/blog/tags	1.3	1.9	101376	False
62	Test 5	tasks/app/main/tags	2.8	3.1	34603008	True
62	Test 6	tasks/tag/app/list	2.1	1.1	63488	False
62	Test 7	tasks/main/tag/posts	2.5	2.1	4096	False
62	Test 8	tasks/tags/tag/tag	2.0	0.5	62914560	False
63	Test 0	tasks/tag/app	2.9	1.7	73400320	True
63	Test 1	tasks/posts	2.9	1.4	92274688	False
63	Test 2	tasks/explore/blog	1.8	1.4	66060288	True
64	Test 0	tasks/wp-content	1.8	1.5	1024	True
64	Test 1	tasks/explore/category	2.7	2.1	59392	True
64	Test 2	tasks/categories/category/main	2.3	2.9	70254592	True
64	Test 3	tasks/explore/app	2.0	0.7	76546048	False
64	Test 4	tasks/explore/main/list	2.0	0.5	71680	True
65	Test 0	tasks/app	2.3	2.7	7168	False
65	Test 1	tasks/search/search/list	1.2	2.5	30408704	True
65	Test 2	tasks/app/blog/tags	2.5	0.7	45056	False
65	Test 3	tasks/posts/search	2.9	1.2	78643200	False
65	Test 4	tasks/wp-content/search	1.7	3.0	19456	True
65	Test 5	tasks/list/category	1.1	0.6	2048	True
66	Test 0	tasks/tags/main	2.5	1.4	94208	False
67	Test 0	tasks/main/tag	2.6	0.5	1024	True
67	Test 1	tasks/categories/posts/search	1.5	0.9	1048576	False
67	Test 2	tasks/list	1.3	0.5	22020096	True
67	Test 3	tasks/explore/wp-content	1.7	1.6	54272	True
67	Test 4	tasks/categories/posts/main	2.6	3.2	48128	False
67	Test 5	tasks/category	1.6	1.9	30720	True
68	Test 0	tasks/list	1.5	3.2	37888	True
68	Test 1	tasks/tag	1.0	1.9	25600	False
68	Test 2	tasks/tag	1.6	1.0	42991616	False
68	Test 3	tasks/tags	1.5	3.2	2048	False
68	Test 4	tasks/blog/posts	1.5	1.0	77824	True
68	Test 5	tasks/list/wp-content	1.2	0.5	13631488	False
68	Test 6	tasks/explore	1.3	1.5	46137344	True
68	Test 7	tasks/main/posts	2.5	1.1	20480	True
68	Test 8	tasks/blog/blog	1.3	2.1	23552	False
68	Test 9	tasks/blog/app/wp-content	1.8	3.2	23068672	True
69	Test 0	tasks/list	1.2	3.1	95232	True
69	Test 1	tasks/categories/blog/app	1.3	1.2	77824	False
69	Test 2	tasks/search/wp-content/app	1.5	1.0	83886080	False
70	Test 0	tasks/explore/blog/tag	2.1	0.5	8388608	False
71	Test 0	tasks/app	1.4	1.4	25600	False
71	Test 1	tasks/posts/posts	1.9	2.2	49152	False
71	Test 2	tasks/tags/blog/app	1.9	0.8	93184	True
71	Test 3	tasks/tag/posts	1.2	3.4	11264	False
71	Test 4	tasks/list/tag/list	1.2	1.6	2048	True
71	Test 5	tasks/category/explore	2.7	2.6	77824	True
72	Test 0	tasks/category	1.7	3.2	50331648	False
72	Test 1	tasks/search/search	2.8	0.7	89088	True
72	Test 2	tasks/categories/blog/list	1.7	2.5	78643200	False
72	Test 3	tasks/category	1.5	1.1	68157440	False
73	Test 0	tasks/posts/blog/posts	1.6	1.5	21504	True
73	Test 1	tasks/category	2.8	2.8	68157440	True
73	Test 2	tasks/search/app/main	1.6	3.0	95420416	False
73	Test 3	tasks/tags	2.1	0.5	20971520	False
73	Test 4	tasks/category/category/tags	2.8	3.3	54272	False
74	Test 0	tasks/tag/app/tags	2.2	2.4	29696	True
74	Test 1	tasks/explore/explore/tag	1.5	1.2	67108864	True
74	Test 2	tasks/posts/blog/blog	2.1	1.3	71303168	False
74	Test 3	tasks/wp-content/wp-content/blog	2.9	1.6	35840	False
74	Test 4	tasks/blog/blog/tags	1.7	3.2	21504	False
74	Test 5	tasks/wp-content	1.7	3.0	8192	True
74	Test 6	tasks/wp-content	1.5	0.7	38912	True
74	Test 7	tasks/category/blog	2.6	2.2	19922944	True
74	Test 8	tasks/search	1.6	2.9	81788928	True
74	Test 9	tasks/main/explore	2.4	1.6	97280	False
75	Test 0	tasks/app/main	2.9	3.4	65011712	True
75	Test 1	tasks/search/posts	2.1	1.2	88064	False
75	Test 2	tasks/main/main/app	1.7	1.1	31744	False
75	Test 3	tasks/search/app/explore	1.2	1.6	18874368	False
75	Test 4	tasks/main/explore/blog	1.0	1.8	16384	False
75	Test 5	tasks/app	2.4	2.0	52428800	False
75	Test 6	tasks/app/list	2.3	0.8	89128960	False
76	Test 0	tasks/blog/posts/explore	2.2	1.1	98566144	True
76	Test 1	tasks/tag/explore/main	2.9	2.5	35651584	False
76	Test 2	tasks/search/explore/category	1.5	0.6	25600	True
76	Test 3	tasks/search/tag/posts	1.9	2.5	83886080	False
76	Test 4	tasks/posts/list	2.6	1.0	70254592	True
76	Test 5	tasks/tags	1.0	2.0	24576	False
76	Test 6	tasks/app/categories/explore	2.5	3.1	78643200	True
77	Test 0	tasks/search	1.2	1.3	17408	False
77	Test 1	tasks/posts/blog	1.9	0.6	68157440	False
77	Test 2	tasks/tags	2.5	1.6	37888	True
77	Test 3	tasks/explore/wp-content	1.3	2.5	30720	True
77	Test 4	tasks/posts/main	2.6	1.1	74752	False
77	Test 5	tasks/category/tags/blog	1.4	3.3	37748736	True
77	Test 6	tasks/posts/category/blog	1.9	2.7	87031808	True
77	Test 7	tasks/main/wp-content	1.0	2.1	77594624	True
77	Test 8	tasks/tag/search/category	2.9	1.0	61440	True
77	Test 9	tasks/tag	2.4	0.5	88064	True
78	Test 0	tasks/wp-content/posts	1.9	1.3	90112	False
78	Test 1	tasks/app/tag/blog	1.4	3.0	68157440	False
78	Test 2	tasks/tag	1.4	1.5	31744	True
78	Test 3	tasks/main/search/tags	1.2	2.2	62914560	False
78	Test 4	tasks/blog/categories/blog	1.9	1.9	56320	False
79	Test 0	tasks/app/categories	1.6	3.1	26214400	True
79	Test 1	tasks/category/search/wp-content	2.1	2.1	53477376	True
79	Test 2	tasks/tags	2.7	2.4	37888	True
79	Test 3	tasks/tag/explore	1.6	1.2	80740352	False
79	Test 4	tasks/tag	2.8	0.8	75776	False
79	Test 5	tasks/search/tag/explore	2.8	1.4	2097152	True
79	Test 6	tasks/tag	1.5	0.6	26624	False
79	Test 7	tasks/wp-content/wp-content	2.1	1.9	40960	False
79	Test 8	tasks/tags/app	2.6	1.6	69206016	False
80	Test 0	tasks/search/tags/list	1.3	3.4	32505856	False
80	Test 1	tasks/explore/tags/categories	1.9	2.9	14336	False
81	Test 0	tasks/list	1.6	2.3	52428800	True
81	Test 1	tasks/categories/app/posts	2.7	2.7	98566144	True
81	Test 2	tasks/posts/wp-content	2.2	2.5	70254592	False
81	Test 3	tasks/search	2.5	1.8	32768	True
81	Test 4	tasks/blog	2.2	1.2	91136	True
81	Test 5	tasks/categories	2.9	1.9	10485760	True
81	Test 6	tasks/app	1.5	1.7	45056	True
81	Test 7	tasks/tag	2.0	1.9	91226112	True
81	Test 8	tasks/wp-content/posts/wp-content	1.8	2.1	80740352	True
81	Test 9	tasks/tag/category	1.8	2.2	14336	True
82	Test 0	tasks/categories/main/wp-content	1.3	2.0	41984	True
83	Test 0	tasks/categories/explore/tag	2.9	2.3	52428800	False
84	Test 0	tasks/posts/list/blog	2.8	3.3	87031808	False
84	Test 1	tasks/blog/list	2.7	1.5	26214400	False
84	Test 2	tasks/blog/wp-content	2.4	2.2	29696	False
84	Test 3	tasks/categories	2.0	3.4	94371840	False
84	Test 4	tasks/main/app/list	2.9	2.9	52224	True
84	Test 5	tasks/tag/explore/tags	1.3	1.6	49283072	False
84	Test 6	tasks/posts	1.9	2.2	17825792	False
84	Test 7	tasks/tags/list	2.3	2.6	3145728	True
85	Test 0	tasks/categories/app/tags	1.9	2.2	25600	True
85	Test 1	tasks/category	2.8	2.0	59392	False
85	Test 2	tasks/main/search/wp-content	1.9	2.8	98566144	False
85	Test 3	tasks/category/main	2.3	1.2	95420416	False
85	Test 4	tasks/main/list	1.0	0.6	41943040	True
85	Test 5	tasks/explore	1.6	3.0	82944	False
85	Test 6	tasks/blog/search	1.6	3.4	53248	False
86	Test 0	tasks/search/categories/app	1.7	3.3	36864	True
86	Test 1	tasks/posts/list	1.9	0.5	1048576	False
86	Test 2	tasks/list	1.7	2.4	72351744	False
86	Test 3	tasks/explore	2.0	2.7	14680064	False
86	Test 4	tasks/explore	2.0	0.8	90177536	True
86	Test 5	tasks/blog/app/app	2.6	0.9	13631488	True
87	Test 0	tasks/search/category	2.5	1.6	74448896	True
87	Test 1	tasks/main	1.4	2.1	24576	False
87	Test 2	tasks/categories/list/tag	2.3	1.5	29360128	True
87	Test 3	tasks/category/tags	2.4	2.2	11534336	True
87	Test 4	tasks/tags	2.9	1.9	88080384	False
87	Test 5	tasks/categories	2.1	2.3	25165824	True
87	Test 6	tasks/category/app	2.4	0.6	79691776	True
87	Test 7	tasks/category/category	2.2	1.3	69206016	True
87	Test 8	tasks/list	1.6	2.5	8388608	True
87	Test 9	tasks/category	1.8	1.8	101711872	False
88	Test 0	tasks/category	2.9	3.0	1024	True
89	Test 0	tasks/categories	1.4	0.5	21504	True
89	Test 1	tasks/wp-content/category/wp-content	1.8	2.2	16777216	True
90	Test 0	tasks/tags	2.8	1.4	39936	True
90	Test 1	tasks/wp-content/explore/main	2.4	2.6	5242880	False
91	Test 0	tasks/tag/blog	1.8	0.7	78848	True
91	Test 1	tasks/blog	2.4	2.8	9437184	True
92	Test 0	tasks/list/explore	2.9	1.1	72704	False
92	Test 1	tasks/explore/categories	1.9	2.5	63488	True
92	Test 2	tasks/app/wp-content	1.6	0.7	16384	False
92	Test 3	tasks/blog/search/categories	1.3	1.4	23552	False
92	Test 4	tasks/tag/posts	2.2	3.3	75497472	False
93	Test 0	tasks/posts/tags	1.6	2.1	40894464	False
93	Test 1	tasks/main/blog/main	1.5	3.3	18874368	True
93	Test 2	tasks/category	1.9	1.2	13312	True
93	Test 3	tasks/posts/tags/explore	2.7	1.7	30408704	False
93	Test 4	tasks/list	1.8	3.1	51200	True
93	Test 5	tasks/blog/wp-content	1.7	2.6	5120	True
93	Test 6	tasks/main/blog/blog	1.7	1.3	26624	True
93	Test 7	tasks/explore/explore	1.3	0.7	26624	True
93	Test 8	tasks/search/app/category	2.0	1.4	69632	False
93	Test 9	tasks/categories	2.8	2.2	78848	True
94	Test 0	tasks/app	2.2	1.6	73400320	False
94	Test 1	tasks/category/tag/blog	1.2	2.5	36700160	True
94	Test 2	tasks/category	2.5	0.8	42991616	False
94	Test 3	tasks/list	2.3	1.6	67108864	False
94	Test 4	tasks/posts	2.1	3.2	41984	True
94	Test 5	tasks/tag/blog	1.9	1.0	19922944	True
94	Test 6	tasks/category	1.9	1.4	38912	False
94	Test 7	tasks/category	1.1	0.5	92274688	True
94	Test 8	tasks/list	2.9	0.5	46080	True
94	Test 9	tasks/tags	2.9	3.4	66560	True
95	Test 0	tasks/categories/tag/categories	1.2	2.6	41984	False
95	Test 1	tasks/app/tag	2.0	3.3	51200	False
95	Test 2	tasks/explore	1.2	3.2	28672	True
95	Test 3	tasks/wp-content	2.9	0.8	98304	False
96	Test 0	tasks/explore/posts	2.0	3.4	91226112	True
96	Test 1	tasks/app/blog	1.7	0.7	17408	False
96	Test 2	tasks/tags/search/wp-content	1.5	2.8	56623104	True
96	Test 3	tasks/list/app	2.4	0.6	99328	True
97	Test 0	tasks/categories	2.8	2.7	65011712	True
97	Test 1	tasks/category/app/blog	1.9	0.7	13631488	True
97	Test 2	tasks/list/blog	1.0	0.5	40960	False
97	Test 3	tasks/main/posts/categories	2.4	0.9	96256	True
97	Test 4	tasks/search/tag/tag	1.0	1.4	58368	True
98	Test 0	tasks/app/categories/main	2.1	3.1	45088768	False
99	Test 0	tasks/tags/explore	2.7	1.9	68608	True
99	Test 1	tasks/posts/main	2.1	1.9	54525952	True
99	Test 2	tasks/blog/search/tags	2.3	3.2	66560	False
99	Test 3	tasks/list/explore/category	1.4	2.4	103809024	False
99	Test 4	tasks/app/category	2.6	2.9	31457280	True
99	Test 5	tasks/tags/explore	1.2	0.8	49152	True
100	Test 0	tasks/tags/main/tags	2.2	0.9	3145728	False
100	Test 1	tasks/tag/posts	2.5	0.6	79872	False
100	Test 2	tasks/app/categories	1.9	1.5	32768	False
100	Test 3	tasks/main	1.7	0.5	52428800	False
100	Test 4	tasks/list	2.4	1.4	33792	True
100	Test 5	tasks/main/list/main	1.9	0.8	74448896	True
100	Test 6	tasks/app/blog	1.7	3.0	9437184	True
100	Test 7	tasks/tag	2.3	1.2	77594624	False
100	Test 8	tasks/list	1.4	2.1	68157440	True
101	Test 0	tasks/app/tag/tags	1.1	2.3	58368	True
101	Test 1	tasks/app/blog/main	1.1	2.9	81920	False
101	Test 2	tasks/list	2.0	2.7	28672	False
101	Test 3	tasks/app/wp-content	2.3	2.0	17825792	False
101	Test 4	tasks/list/wp-content	2.3	1.3	6291456	True
101	Test 5	tasks/list/tags/category	2.4	3.2	34816	False
101	Test 6	tasks/blog/explore	2.6	1.7	30720	False
102	Test 0	tasks/list/main	2.2	0.7	67108864	False
102	Test 1	tasks/app/app/posts	2.7	2.3	55574528	False
102	Test 2	tasks/app	2.9	1.7	74448896	True
102	Test 3	tasks/wp-content/blog/tag	2.7	2.1	59768832	True
102	Test 4	tasks/main/posts	2.2	0.6	59768832	True
102	Test 5	tasks/tag/wp-content	2.9	3.4	9437184	False
102	Test 6	tasks/categories/list/list	2.9	2.1	57344	True
102	Test 7	tasks/tag	2.4	1.5	37888	True
102	Test 8	tasks/list/explore/blog	2.3	2.4	91136	True
102	Test 9	tasks/blog/tag	1.2	1.8	2048	False
103	Test 0	tasks/search/category/search	2.5	2.6	46137344	False
103	Test 1	tasks/tags	1.9	1.1	104857600	True
103	Test 2	tasks/posts/main/app	1.2	1.2	55296	False
103	Test 3	tasks/tags/category/list	2.4	0.6	57671680	False
103	Test 4	tasks/list/category/explore	1.6	2.7	102400	False
103	Test 5	tasks/tags	2.4	3.0	11264	False
103	Test 6	tasks/wp-content	2.6	2.0	14336	True
103	Test 7	tasks/category/blog	1.5	2.0	48234496	False
104	Test 0	tasks/categories	1.7	3.2	74752	False
104	Test 1	tasks/tag/wp-content/explore	1.8	2.1	12288	True
104	Test 2	tasks/categories/tags/list	2.2	3.3	70656	True
104	Test 3	tasks/categories/tag	2.2	3.1	2048	False
104	Test 4	tasks/tags/categories/categories	1.6	1.0	72704	True
104	Test 5	tasks/search/posts/category	2.0	0.9	24117248	False
104	Test 6	tasks/tag/app/app	2.7	1.9	78848	False
104	Test 7	tasks/tag	2.2	1.0	72704	False
104	Test 8	tasks/list	2.2	2.9	13312	True
104	Test 9	tasks/category/app/wp-content	1.7	2.6	104857600	False
105	Test 0	tasks/tags	2.2	2.7	52224	True
105	Test 1	tasks/category/blog/category	2.7	2.0	23552	False
105	Test 2	tasks/search	2.3	3.2	93323264	False
105	Test 3	tasks/tag/explore	1.7	1.9	18432	False
105	Test 4	tasks/list/wp-content/search	1.7	1.3	51380224	True
106	Test 0	tasks/tags/posts/explore	1.4	1.9	55574528	True
106	Test 1	tasks/posts	1.8	2.7	25600	True
106	Test 2	tasks/blog/explore	1.7	1.7	24576	True
106	Test 3	tasks/tag	1.9	2.2	62464	False
107	Test 0	tasks/categories	1.4	1.9	71680	False
107	Test 1	tasks/tags	1.2	3.4	6144	True
108	Test 0	tasks/tags	1.9	2.3	62914560	True
108	Test 1	tasks/list/wp-content/posts	1.8	3.1	44040192	False
108	Test 2	tasks/list	2.3	2.4	34603008	True
108	Test 3	tasks/category/blog/categories	1.3	3.0	49152	True
108	Test 4	tasks/app	1.2	2.3	71680	False
108	Test 5	tasks/tags/app	2.4	1.6	44032	False
108	Test 6	tasks/app/list/explore	2.8	2.2	96468992	True
108	Test 7	tasks/app/search/category	2.1	3.4	95420416	False
108	Test 8	tasks/wp-content/posts/search	1.7	0.6	75497472	False
108	Test 9	tasks/tag/list	1.1	3.0	90112	False
109	Test 0	tasks/categories/main	1.9	2.3	58368	False
109	Test 1	tasks/explore/search	2.2	1.7	75776	True
109	Test 2	tasks/categories/category	1.0	3.4	8388608	True
109	Test 3	tasks/explore/explore/search	1.8	1.9	5242880	False
110	Test 0	tasks/posts/category/blog	1.9	1.8	87040	True
110	Test 1	tasks/categories/main/tags	1.8	2.4	42991616	False
110	Test 2	tasks/categories/wp-content	1.9	3.3	100352	False
111	Test 0	tasks/categories/tag	2.6	1.5	89128960	True
111	Test 1	tasks/tags/posts/tags	2.6	1.4	71303168	True
111	Test 2	tasks/wp-content/main/blog	2.3	3.2	17408	False
111	Test 3	tasks/wp-content/posts/list	1.0	2.5	101376	False
112	Test 0	tasks/explore/main/tags	2.2	3.3	74752	False
112	Test 1	tasks/search/app	1.1	1.1	4194304	True
112	Test 2	tasks/app/list/categories	2.6	1.6	57344	True
112	Test 3	tasks/categories/category/categories	2.2	1.3	18432	False
112	Test 4	tasks/main/blog	2.7	2.3	44040192	False
112	Test 5	tasks/list/main	2.9	1.0	60817408	True
112	Test 6	tasks/app	2.0	0.6	18432	True
113	Test 0	tasks/app/list	2.5	2.0	50176	True
113	Test 1	tasks/wp-content	1.5	2.4	16384	True
113	Test 2	tasks/tag/tag/tag	2.6	2.5	91136	False
113	Test 3	tasks/tags/categories	1.3	1.5	85983232	True
114	Test 0	tasks/explore/tag/blog	1.3	0.8	1048576	False
114	Test 1	tasks/posts	1.8	2.0	50176	True
114	Test 2	tasks/tags	1.8	1.9	66560	False
114	Test 3	tasks/tag/search	1.2	2.5	59768832	True
114	Test 4	tasks/explore/explore/tags	2.3	0.8	92274688	True
114	Test 5	tasks/blog/blog/tag	2.1	3.4	84992	True
114	Test 6	tasks/app/posts	1.0	2.0	45088768	True
114	Test 7	tasks/category/app	2.0	0.8	6144	False
114	Test 8	tasks/explore	2.3	3.4	78848	True
114	Test 9	tasks/blog	2.4	2.6	9437184	False
115	Test 0	tasks/tag/list	2.2	2.2	8388608	True
115	Test 1	tasks/main/tag/blog	1.3	2.0	14336	False
115	Test 2	tasks/categories/app	2.2	2.5	5120	False
115	Test 3	tasks/blog/explore	1.7	1.8	60416	True
115	Test 4	tasks/blog	1.3	1.9	38797312	False
115	Test 5	tasks/wp-content/main/category	1.0	1.6	58720256	False
115	Test 6	tasks/category/wp-content/categories	2.5	1.7	59768832	False
115	Test 7	tasks/wp-content	2.5	2.5	69206016	True
115	Test 8	tasks/tags/search/posts	2.2	2.3	63488	False
116	Test 0	tasks/blog/app/category	1.9	3.3	82837504	False
116	Test 1	tasks/categories	2.8	1.4	17408	False
116	Test 2	tasks/wp-content/list/category	1.4	2.7	67108864	True
116	Test 3	tasks/tag	1.9	1.3	81788928	False
116	Test 4	tasks/tag/wp-content/tag	1.2	2.0	48128	False
116	Test 5	tasks/categories/posts/list	2.0	2.3	3072	True
116	Test 6	tasks/posts	1.9	0.5	38797312	True
117	Test 0	tasks/blog/category/tag	1.9	0.6	70656	False
117	Test 1	tasks/search/categories/categories	1.4	1.7	81920	False
117	Test 2	tasks/category/search/list	1.2	1.2	78643200	False
117	Test 3	tasks/wp-content/search/app	1.2	1.4	73728	True
117	Test 4	tasks/search/wp-content/blog	1.4	2.1	24117248	False
117	Test 5	tasks/main	2.9	1.0	35840	True
118	Test 0	tasks/category	1.7	3.1	89088	False
118	Test 1	tasks/tags/explore	1.5	2.7	33792	True
118	Test 2	tasks/explore/categories	1.1	2.9	21504	True
118	Test 3	tasks/wp-content/category	1.0	3.0	89088	True
119	Test 0	tasks/tag/wp-content/categories	1.8	0.8	71680	False
119	Test 1	tasks/blog/search/search	2.5	1.3	28672	False
119	Test 2	tasks/explore	1.3	1.2	65011712	True
119	Test 3	tasks/list/app/list	1.0	3.1	85983232	True
119	Test 4	tasks/blog/list	2.3	1.4	97280	True
119	Test 5	tasks/tag	2.4	1.7	72351744	True
119	Test 6	tasks/tags	2.4	2.6	7340032	False
119	Test 7	tasks/app/explore	1.7	2.0	95232	False
119	Test 8	tasks/categories/category/list	2.5	2.9	43008	True
119	Test 9	tasks/categories	1.0	1.5	14680064	False
120	Test 0	tasks/posts/wp-content/search	2.1	0.5	46080	False
120	Test 1	tasks/categories	1.5	2.5	90177536	False
120	Test 2	tasks/categories/posts/list	2.8	1.0	30720	True
120	Test 3	tasks/main/blog/category	2.6	1.5	101711872	False
120	Test 4	tasks/category/blog	1.8	1.5	70254592	False
120	Test 5	tasks/list/wp-content/explore	2.2	3.0	2048	False
121	Test 0	tasks/posts/category	2.6	3.0	104857600	False
121	Test 1	tasks/tags/app	1.0	2.0	39845888	False
122	Test 0	tasks/tag/blog	1.4	1.8	38797312	False
122	Test 1	tasks/tag/explore	1.7	2.6	67108864	False
123	Test 0	tasks/category/wp-content/explore	2.2	2.1	82837504	True
123	Test 1	tasks/explore	1.0	3.4	15728640	False
123	Test 2	tasks/wp-content	1.2	1.9	70254592	False
123	Test 3	tasks/search/tags	2.3	1.9	11534336	True
123	Test 4	tasks/tags/blog	1.3	3.4	22020096	False
123	Test 5	tasks/blog/list/categories	1.8	0.7	87031808	True
123	Test 6	tasks/list/categories	1.7	2.3	80740352	True
123	Test 7	tasks/tag/category/wp-content	1.5	3.4	73400320	False
124	Test 0	tasks/tags/categories/explore	1.9	1.8	70254592	True
124	Test 1	tasks/search/category/wp-content	1.6	2.7	63963136	False
124	Test 2	tasks/category/search/categories	1.8	2.5	48128	False
124	Test 3	tasks/blog/categories	2.1	2.8	30408704	False
124	Test 4	tasks/tags	2.1	1.0	96256	True
124	Test 5	tasks/app	1.9	2.0	67108864	False
124	Test 6	tasks/wp-content/app	1.6	2.2	32768	True
125	Test 0	tasks/list/search	1.0	1.8	34816	False
126	Test 0	tasks/main/app	2.3	2.1	81920	False
126	Test 1	tasks/blog/app/list	2.4	1.3	47185920	False
126	Test 2	tasks/list/wp-content/tag	2.4	2.3	104857600	True
126	Test 3	tasks/tag/blog	2.5	2.4	96256	True
126	Test 4	tasks/search/blog	2.0	3.1	1048576	True
126	Test 5	tasks/blog	2.4	3.2	103809024	True
126	Test 6	tasks/category	2.5	1.8	19456	False
126	Test 7	tasks/list/categories	1.1	2.2	45088768	True
126	Test 8	tasks/posts	1.7	1.4	24576	False
127	Test 0	tasks/tags/list	1.9	0.5	14680064	False
127	Test 1	tasks/main	2.7	1.6	65536	False
127	Test 2	tasks/categories/app/list	1.8	2.7	58720256	False
128	Test 0	tasks/search/main	1.9	2.0	53248	True
129	Test 0	tasks/posts/search/explore	2.2	3.1	46137344	True
129	Test 1	tasks/list	2.9	2.5	6291456	False
130	Test 0	tasks/tag	1.7	0.9	92160	True
130	Test 1	tasks/search/categories	1.8	2.8	66060288	False
131	Test 0	tasks/posts/wp-content	1.5	0.9	92274688	False
131	Test 1	tasks/categories/wp-content	1.5	3.0	32505856	False
131	Test 2	tasks/app	1.0	1.4	71680	True
131	Test 3	tasks/app	2.7	1.5	29360128	True
131	Test 4	tasks/tags/tags/list	1.5	1.5	39936	True
131	Test 5	tasks/tag	1.9	1.8	79872	True
131	Test 6	tasks/list	2.0	1.2	75776	False
132	Test 0	tasks/tag	1.5	1.0	89128960	False
133	Test 0	tasks/main/categories/posts	2.0	1.4	5120	False
133	Test 1	tasks/category/explore	2.8	1.5	41984	False
133	Test 2	tasks/wp-content	2.4	2.8	49152	False
133	Test 3	tasks/wp-content/tags	2.1	0.5	30408704	False
133	Test 4	tasks/list	1.0	2.7	76546048	True
134	Test 0	tasks/posts/explore	1.8	0.6	13312	True
134	Test 1	tasks/posts	1.6	1.0	39845888	False
134	Test 2	tasks/blog/list	1.8	2.7	61865984	True
134	Test 3	tasks/app/categories	1.6	2.8	81788928	True
134	Test 4	tasks/wp-content	1.3	1.7	11264	True
134	Test 5	tasks/blog	1.6	2.8	103809024	True
134	Test 6	tasks/blog/category	2.0	3.4	62914560	False
134	Test 7	tasks/categories	1.5	3.1	14680064	True
135	Test 0	tasks/posts/app	2.9	1.8	47104	True
135	Test 1	tasks/app/main/explore	1.2	3.0	56623104	True
135	Test 2	tasks/explore/app/tag	1.9	1.7	27648	True
135	Test 3	tasks/explore	2.8	0.9	91136	False
135	Test 4	tasks/app/list	2.1	3.3	13631488	True
135	Test 5	tasks/search/app/wp-content	1.7	3.2	97280	True
136	Test 0	tasks/list/explore/category	1.4	1.6	48234496	True
136	Test 1	tasks/main/app	1.0	1.1	66560	True
137	Test 0	tasks/search/wp-content/main	1.5	3.1	72351744	False
137	Test 1	tasks/tags/tag/tag	1.8	0.7	13631488	True
137	Test 2	tasks/app	2.7	3.2	25165824	False
137	Test 3	tasks/blog/search	1.4	2.2	31744	True
137	Test 4	tasks/blog/categories/main	2.3	1.3	41943040	True
137	Test 5	tasks/main/categories	2.3	1.1	64512	False
137	Test 6	tasks/list	2.3	1.5	95420416	True
138	Test 0	tasks/main/tag/main	2.1	1.1	98566144	False
138	Test 1	tasks/main/tag	1.3	3.3	98566144	False
138	Test 2	tasks/categories/tags/search	1.1	0.5	16777216	True
138	Test 3	tasks/tags/category/tag	2.2	2.8	11264	False
138	Test 4	tasks/main/list/wp-content	1.9	1.0	68157440	False
138	Test 5	tasks/category	1.1	3.0	60416	True
138	Test 6	tasks/categories	2.3	1.1	11264	False
139	Test 0	tasks/wp-content	1.1	0.7	39936	False
139	Test 1	tasks/search	1.5	2.2	94208	False
139	Test 2	tasks/blog	1.4	0.7	51380224	True
139	Test 3	tasks/blog/search	2.9	1.1	95420416	False
139	Test 4	tasks/posts	1.9	1.0	53477376	True
139	Test 5	tasks/list/tag	2.9	3.1	101711872	True
139	Test 6	tasks/category/app/tags	2.6	2.0	56320	True
139	Test 7	tasks/tags	2.4	1.1	98304	True
139	Test 8	tasks/explore	1.9	1.8	5120	True
140	Test 0	tasks/categories	1.8	2.4	6144	True
140	Test 1	tasks/search/tags/explore	2.2	2.9	2048	False
140	Test 2	tasks/search/wp-content	1.0	3.0	82944	False
140	Test 3	tasks/explore/blog/search	2.1	1.6	13312	False
140	Test 4	tasks/tags/explore	1.2	1.7	102400	False
141	Test 0	tasks/wp-content/posts	1.4	0.7	42991616	False
141	Test 1	tasks/explore	1.2	0.8	23552	False
141	Test 2	tasks/category	1.9	2.8	35840	False
141	Test 3	tasks/posts/wp-content	1.5	1.3	66560	False
141	Test 4	tasks/list/wp-content	1.2	3.4	7168	True
141	Test 5	tasks/search/categories/explore	2.8	2.3	48234496	True
141	Test 6	tasks/search/app/categories	2.3	1.3	33792	True
142	Test 0	tasks/blog/blog/category	2.3	3.4	28672	False
142	Test 1	tasks/posts	2.3	3.0	19456	False
142	Test 2	tasks/explore/search/app	2.3	1.0	71680	False
142	Test 3	tasks/tag/explore	2.7	0.9	81788928	False
142	Test 4	tasks/main/list	2.7	2.6	34603008	True
142	Test 5	tasks/categories/blog/wp-content	2.3	0.7	45088768	True
142	Test 6	tasks/categories	2.8	0.9	60817408	True
143	Test 0	tasks/tag/tag/tags	2.0	2.5	96256	True
143	Test 1	tasks/main	2.7	2.4	52428800	False
143	Test 2	tasks/category/list	1.0	0.9	12582912	True
143	Test 3	tasks/list/app/wp-content	2.6	2.0	68608	True
143	Test 4	tasks/blog/categories	2.8	1.4	99614720	True
143	Test 5	tasks/app/blog/tag	2.4	2.0	11534336	False
143	Test 6	tasks/explore/wp-content	2.7	1.9	67108864	True
143	Test 7	tasks/category/posts/tag	1.9	2.8	3145728	False
144	Test 0	tasks/main	1.9	2.9	89088	True
144	Test 1	tasks/search/app	1.0	1.8	32768	True
144	Test 2	tasks/tag/tag/tags	1.7	2.5	6291456	False
144	Test 3	tasks/categories/main	1.0	3.2	19456	True
144	Test 4	tasks/list/list	1.2	3.3	8192	True
144	Test 5	tasks/main	1.2	0.7	9437184	True
145	Test 0	tasks/main/wp-content/app	1.8	2.9	97517568	True
145	Test 1	tasks/category	1.1	1.2	24576	True
146	Test 0	tasks/category/tag/search	2.8	2.3	42991616	False
146	Test 1	tasks/posts	1.2	0.7	35840	True
146	Test 2	tasks/tags/tags/tags	1.7	1.0	102760448	True
146	Test 3	tasks/tags/explore/tag	1.6	3.1	46080	True
146	Test 4	tasks/search/tag	2.3	1.9	26214400	False
146	Test 5	tasks/search	1.6	1.1	5120	False
146	Test 6	tasks/wp-content	2.8	0.6	46080	False
146	Test 7	tasks/search/category	1.7	2.8	13312	False
146	Test 8	tasks/categories	2.0	1.4	49152	True
146	Test 9	tasks/posts	1.2	1.8	93184	True
147	Test 0	tasks/app/wp-content/main	1.3	2.4	24117248	True
148	Test 0	tasks/posts/tag/search	1.2	3.1	24117248	False
148	Test 1	tasks/posts	1.5	0.7	32505856	False
148	Test 2	tasks/search/category/app	1.1	2.0	104857600	False
149	Test 0	tasks/list/tag	2.4	2.0	53477376	True
149	Test 1	tasks/app/blog	2.8	0.5	60416	False
149	Test 2	tasks/app/search/list	2.4	2.7	82837504	True
149	Test 3	tasks/wp-content	1.5	1.6	53477376	False
149	Test 4	tasks/tag/explore	1.7	2.5	26624	True
150	Test 0	tasks/tag/tags/app	2.6	1.8	59768832	False
150	Test 1	tasks/category/tag/posts	1.2	2.8	80896	False
151	Test 0	tasks/blog/list/tags	2.6	2.6	82944	True
151	Test 1	tasks/tag	1.6	1.6	62464	False
151	Test 2	tasks/search	2.5	2.7	30720	False
151	Test 3	tasks/wp-content	1.9	0.8	38797312	True
152	Test 0	tasks/category/app/list	1.4	0.9	64512	False
152	Test 1	tasks/category	2.1	1.0	7340032	True
152	Test 2	tasks/tag/app	2.3	3.4	79691776	False
152	Test 3	tasks/search/main/category	2.2	2.2	57671680	True
152	Test 4	tasks/wp-content/tag	2.6	1.7	90112	False
152	Test 5	tasks/tags/posts	1.7	2.8	48234496	False
152	Test 6	tasks/search	1.5	2.1	39936	False
152	Test 7	tasks/tags/category/wp-content	1.2	1.1	86016	False
152	Test 8	tasks/tags/tags/tag	1.7	2.3	15728640	True
153	Test 0	tasks/wp-content/explore	2.7	0.8	35651584	False
153	Test 1	tasks/category/wp-content/list	1.4	3.1	30408704	False
153	Test 2	tasks/posts	1.8	0.6	66060288	False
153	Test 3	tasks/list/tag	2.8	2.4	80896	False
153	Test 4	tasks/list	2.3	2.4	3145728	True
153	Test 5	tasks/explore/posts/wp-content	1.6	2.6	46080	False
153	Test 6	tasks/main/list/main	2.3	1.6	5242880	False
154	Test 0	tasks/posts/list	2.9	3.0	37888	False
154	Test 1	tasks/blog/posts	2.5	1.2	85983232	False
154	Test 2	tasks/main/blog/list	2.4	0.5	9437184	False
154	Test 3	tasks/category/tags	2.6	1.0	47185920	True
154	Test 4	tasks/app/main	2.2	2.7	60416	True
154	Test 5	tasks/tags/tag/app	2.7	2.7	55574528	False
154	Test 6	tasks/list/tag/list	2.6	2.2	39936	True
154	Test 7	tasks/tags/posts/tag	2.7	2.5	18874368	False
154	Test 8	tasks/blog	2.3	2.7	84934656	False
154	Test 9	tasks/wp-content	1.7	1.1	29696	True
155	Test 0	tasks/tag	2.2	1.1	101711872	False
155	Test 1	tasks/app	1.3	0.7	68608	True
155	Test 2	tasks/categories/main/list	1.2	0.6	62914560	False
155	Test 3	tasks/wp-content/category/list	1.3	3.3	102760448	False
155	Test 4	tasks/main	2.6	1.0	2097152	False
155	Test 5	tasks/main	1.0	1.2	8192	False
156	Test 0	tasks/search/blog/app	2.4	0.6	74752	True
156	Test 1	tasks/category/blog	2.3	0.8	34816	True
156	Test 2	tasks/main/wp-content/search	1.0	1.8	1024	True
156	Test 3	tasks/category/tag	1.1	3.0	87040	False
156	Test 4	tasks/list/category/posts	1.9	1.0	81788928	False
156	Test 5	tasks/wp-content	1.1	0.5	16384	False
157	Test 0	tasks/wp-content/tag/app	2.0	0.7	4194304	False
157	Test 1	tasks/list/tag	2.1	2.5	11264	False
157	Test 2	tasks/wp-content	1.3	1.6	20480	False
157	Test 3	tasks/category/explore	1.3	2.7	98304	True
157	Test 4	tasks/explore/tag/posts	1.4	2.1	98304	True
158	Test 0	tasks/tag/posts	2.8	1.7	76546048	False
158	Test 1	tasks/main/app	1.1	0.7	55296	True
158	Test 2	tasks/blog/search	2.9	1.5	80896	True
158	Test 3	tasks/explore	2.4	3.2	18432	False
158	Test 4	tasks/wp-content/search/categories	2.0	1.4	92274688	True
158	Test 5	tasks/posts	2.0	0.9	35651584	True
158	Test 6	tasks/tag/blog	1.1	1.8	80896	True
158	Test 7	tasks/search	2.5	2.3	52428800	False
158	Test 8	tasks/tags	2.4	1.4	60416	False
159	Test 0	tasks/category	2.2	1.6	96468992	True
159	Test 1	tasks/main/app	2.4	2.6	63963136	True
159	Test 2	tasks/main	2.8	2.6	40960	False
159	Test 3	tasks/tags/posts	2.2	0.9	97280	False
159	Test 4	tasks/wp-content/app/tag	1.6	1.0	44032	False
159	Test 5	tasks/main	2.4	0.7	68157440	False
159	Test 6	tasks/categories	2.5	2.6	73728	False
159	Test 7	tasks/wp-content	1.6	1.7	3072	True
159	Test 8	tasks/posts/blog/blog	1.7	0.8	49283072	False
160	Test 0	tasks/wp-content/wp-content/search	2.8	1.9	33554432	False
160	Test 1	tasks/list/main/tags	1.7	3.3	16384	True
160	Test 2	tasks/posts/tag/category	2.3	2.0	16384	True
160	Test 3	tasks/blog	1.5	1.2	100352	False
160	Test 4	tasks/categories	1.0	3.3	76800	False
160	Test 5	tasks/posts/list	1.7	0.8	102760448	False
160	Test 6	tasks/explore/explore/category	2.2	1.3	31457280	True
161	Test 0	tasks/categories	2.7	3.1	50176	True
161	Test 1	tasks/category/tags	1.9	2.6	15360	True
161	Test 2	tasks/main/posts	2.6	1.8	13312	True
161	Test 3	tasks/search	2.3	3.4	99614720	False
161	Test 4	tasks/tags	2.8	1.8	99328	False
161	Test 5	tasks/category/tags/main	2.3	1.9	69632	True
161	Test 6	tasks/tag/tags	2.4	1.1	91136	False
161	Test 7	tasks/category/main/search	2.1	1.9	65536	True
161	Test 8	tasks/main/tags/explore	2.9	2.6	49283072	False
162	Test 0	tasks/tag/posts/blog	2.5	2.6	92160	False
162	Test 1	tasks/search/explore	1.7	3.0	29360128	True
162	Test 2	tasks/posts/explore	1.2	2.0	10240	True
162	Test 3	tasks/tags/category/tags	1.9	1.2	52428800	True
162	Test 4	tasks/main/tag/search	2.1	2.8	32768	True
162	Test 5	tasks/list/wp-content/tags	1.5	3.2	29360128	False
162	Test 6	tasks/main/tag	2.8	2.4	88080384	True
162	Test 7	tasks/category	1.3	2.6	80740352	True
162	Test 8	tasks/categories/tags	2.4	3.3	13631488	False
163	Test 0	tasks/explore/posts/search	1.4	1.3	14680064	False
163	Test 1	tasks/list/wp-content	2.5	1.2	16384	False
163	Test 2	tasks/main/main/tag	1.5	0.8	36864	True
163	Test 3	tasks/tag	1.5	1.1	50176	False
163	Test 4	tasks/tags/list/main	2.6	2.2	92274688	True
163	Test 5	tasks/list	2.6	2.1	62464	False
163	Test 6	tasks/category	2.7	1.0	51380224	False
164	Test 0	tasks/app/posts	1.7	2.7	47104	True
164	Test 1	tasks/tag	2.2	3.1	8192	False
164	Test 2	tasks/main/list/blog	2.9	0.7	47104	True
164	Test 3	tasks/blog/categories	2.7	2.7	89128960	False
164	Test 4	tasks/posts	2.4	1.0	1024	True
164	Test 5	tasks/app	1.0	2.1	102400	True
165	Test 0	tasks/search	2.0	2.7	44040192	True
165	Test 1	tasks/posts/category/tag	1.3	1.7	60817408	False
165	Test 2	tasks/category	2.3	3.3	38797312	False
165	Test 3	tasks/wp-content/tag	2.8	0.5	88064	False
165	Test 4	tasks/wp-content/app	2.6	1.8	50176	True
165	Test 5	tasks/app/category/tags	2.9	1.9	19922944	True
165	Test 6	tasks/posts/blog	2.1	2.9	1024	True
166	Test 0	tasks/posts/tags/categories	2.4	2.0	93184	False
166	Test 1	tasks/search/wp-content	1.5	1.2	101376	False
166	Test 2	tasks/search/categories	1.5	3.0	54525952	True
166	Test 3	tasks/tags/wp-content	1.7	2.1	22020096	False
166	Test 4	tasks/tag/tag	1.9	1.7	41984	True
167	Test 0	tasks/main	1.6	1.1	46137344	False
167	Test 1	tasks/search/tag/list	1.9	2.7	7168	True
167	Test 2	tasks/main	1.2	1.6	71680	False
167	Test 3	tasks/categories/categories/explore	2.3	3.3	91226112	False
167	Test 4	tasks/search	2.9	2.1	91226112	True
167	Test 5	tasks/explore	1.4	1.4	23552	True
167	Test 6	tasks/main	2.6	3.1	29360128	True
168	Test 0	tasks/wp-content/search	1.7	1.8	94371840	False
168	Test 1	tasks/explore	2.0	2.4	73728	False
168	Test 2	tasks/search	2.8	1.9	23068672	True
168	Test 3	tasks/explore	1.6	1.2	94371840	True
168	Test 4	tasks/search/blog	2.1	1.8	91136	False
169	Test 0	tasks/wp-content	2.9	0.7	30720	True
170	Test 0	tasks/categories/list/app	1.2	3.1	12288	False
170	Test 1	tasks/app	1.1	1.3	38912	False
171	Test 0	tasks/main	1.1	2.8	29696	True
171	Test 1	tasks/wp-content	1.8	2.8	24576	False
171	Test 2	tasks/categories	1.3	3.0	8192	True
172	Test 0	tasks/explore/explore	2.7	1.2	3072	False
173	Test 0	tasks/explore	2.9	2.6	72704	False
173	Test 1	tasks/tag/main/posts	2.9	1.7	6144	True
174	Test 0	tasks/tag/explore/main	2.4	0.9	82837504	True
174	Test 1	tasks/main/posts/tag	1.6	2.8	92274688	True
174	Test 2	tasks/category	1.6	2.9	6144	False
174	Test 3	tasks/search/wp-content	1.7	1.3	37748736	True
174	Test 4	tasks/posts/categories/category	2.7	3.3	51380224	False
174	Test 5	tasks/tags/tag	2.1	0.6	81920	False
175	Test 0	tasks/tags/app/list	1.7	3.4	62914560	False
175	Test 1	tasks/wp-content/main	1.7	3.1	48128	True
176	Test 0	tasks/wp-content/main/tag	1.0	1.5	98304	True
176	Test 1	tasks/category	1.1	2.3	82837504	False
176	Test 2	tasks/list/tags/wp-content	1.7	1.1	22528	False
176	Test 3	tasks/wp-content/explore	1.2	2.9	94208	False
177	Test 0	tasks/main/blog	1.3	2.9	82837504	False
177	Test 1	tasks/main	2.8	3.0	87031808	False
177	Test 2	tasks/categories/blog	2.4	1.7	80740352	True
178	Test 0	tasks/list/list	2.0	3.4	40894464	True
178	Test 1	tasks/tags/tags/search	2.6	1.0	13631488	False
178	Test 2	tasks/explore/blog/app	2.8	1.8	84934656	True
178	Test 3	tasks/explore	1.3	1.7	58720256	True
178	Test 4	tasks/categories/blog/category	2.5	0.5	4096	False
178	Test 5	tasks/category/tag/explore	1.6	0.6	34816	False
178	Test 6	tasks/list/categories	2.8	2.4	70254592	True
178	Test 7	tasks/blog/categories	1.5	0.6	95232	True
179	Test 0	tasks/blog	2.3	3.4	79872	True
180	Test 0	tasks/posts	2.4	3.1	8192	False
180	Test 1	tasks/tag/search/app	2.7	1.0	24117248	False
180	Test 2	tasks/list/tag/tags	1.7	1.3	97517568	False
180	Test 3	tasks/explore/category	2.1	1.5	59768832	False
180	Test 4	tasks/wp-content	2.9	1.7	60416	True
180	Test 5	tasks/categories/search/categories	1.0	3.3	47185920	False
180	Test 6	tasks/list	2.7	3.0	15728640	False
180	Test 7	tasks/search	2.6	1.2	83968	False
180	Test 8	tasks/tags/main	2.3	1.8	35651584	False
181	Test 0	tasks/list/tags	2.0	1.3	36700160	False
182	Test 0	tasks/tags/categories	1.7	2.7	45088768	True
182	Test 1	tasks/tag/tag	2.2	2.2	90112	False
182	Test 2	tasks/wp-content	2.2	0.8	15360	False
183	Test 0	tasks/app	2.9	1.5	36700160	False
183	Test 1	tasks/categories/wp-content	2.8	1.7	80896	True
183	Test 2	tasks/main	1.9	1.7	74448896	True
183	Test 3	tasks/main/posts	1.7	0.5	28672	True
183	Test 4	tasks/categories/blog	2.0	1.0	69206016	False
183	Test 5	tasks/main/wp-content/tags	1.7	2.6	88080384	False
183	Test 6	tasks/explore/blog	1.9	1.0	45088768	False
183	Test 7	tasks/blog/explore	1.2	2.6	53248	True
183	Test 8	tasks/blog	1.3	1.4	101376	False
184	Test 0	tasks/categories/app	2.8	2.5	23068672	False
184	Test 1	tasks/wp-content	2.7	3.0	80740352	False
184	Test 2	tasks/app	2.1	3.1	84934656	False
184	Test 3	tasks/list/tag	2.1	2.7	24576	False
184	Test 4	tasks/list	1.0	2.0	9437184	False
184	Test 5	tasks/category	2.0	1.7	27648	True
184	Test 6	tasks/blog/categories	1.5	2.6	88064	True
184	Test 7	tasks/tags	1.1	3.2	97517568	False
184	Test 8	tasks/category/blog/wp-content	2.0	2.5	89128960	True
185	Test 0	tasks/categories/tags/wp-content	2.4	0.5	17825792	False
185	Test 1	tasks/blog/list/tag	2.2	2.3	73728	True
185	Test 2	tasks/category	1.9	3.3	87040	True
185	Test 3	tasks/posts	2.6	1.3	16777216	True
186	Test 0	tasks/main	1.1	0.8	41984	False
186	Test 1	tasks/main	1.1	2.4	12288	True
186	Test 2	tasks/tag/app	1.5	3.0	37888	False
186	Test 3	tasks/blog	1.8	3.4	87031808	True
186	Test 4	tasks/main/app/category	1.5	2.3	61865984	True
186	Test 5	tasks/tag/posts/tag	1.5	1.6	98566144	False
186	Test 6	tasks/search/category	1.8	3.3	76546048	False
186	Test 7	tasks/wp-content	1.8	1.9	93323264	False
187	Test 0	tasks/main/explore	1.6	2.7	102760448	False
187	Test 1	tasks/explore/categories	2.5	3.2	32768	False
187	Test 2	tasks/tag	2.3	1.8	45088768	True
187	Test 3	tasks/list/list	1.6	2.1	76800	False
187	Test 4	tasks/posts/blog	1.1	0.8	71680	False
188	Test 0	tasks/search	2.9	1.7	90177536	False
188	Test 1	tasks/app/posts/tag	2.7	2.7	38912	True
188	Test 2	tasks/posts/list	1.7	2.9	6291456	True
188	Test 3	tasks/blog	1.6	2.4	76800	False
188	Test 4	tasks/explore	2.0	2.9	16777216	True
188	Test 5	tasks/tag	1.7	1.5	71303168	True
188	Test 6	tasks/blog/tag	1.3	2.4	36700160	False
188	Test 7	tasks/tags/wp-content	2.4	1.2	65536	False
189	Test 0	tasks/categories	2.0	1.6	37748736	False
189	Test 1	tasks/tag	1.5	2.3	32768	True
189	Test 2	tasks/search	1.1	2.7	49152	False
189	Test 3	tasks/wp-content	1.2	2.1	27648	False
189	Test 4	tasks/categories/categories	1.3	1.3	24117248	True
189	Test 5	tasks/app/categories	2.2	3.1	3072	False
189	Test 6	tasks/main/explore	1.6	1.7	57344	False
189	Test 7	tasks/tags/tags	2.2	3.0	86016	False
189	Test 8	tasks/categories/categories	1.5	3.2	31744	True
190	Test 0	tasks/app	2.3	2.3	29360128	False
190	Test 1	tasks/tags	1.4	3.4	101376	True
190	Test 2	tasks/search	1.0	1.6	31744	True
191	Test 0	tasks/tag	1.6	1.4	37748736	False
191	Test 1	tasks/categories/category/wp-content	2.6	3.3	8388608	True
191	Test 2	tasks/blog/tags	1.6	2.0	42991616	True
191	Test 3	tasks/list/blog/list	1.6	1.4	98304	False
191	Test 4	tasks/tags/categories/search	2.5	3.0	47104	True
191	Test 5	tasks/app/category/wp-content	1.4	3.4	96256	False
191	Test 6	tasks/blog/blog	2.4	1.9	84934656	True
191	Test 7	tasks/tags/blog	1.5	2.9	78643200	False
192	Test 0	tasks/list	1.9	2.2	63488	True
192	Test 1	tasks/tags/wp-content	2.1	3.3	39845888	False
193	Test 0	tasks/wp-content/category	1.1	0.8	25165824	False
193	Test 1	tasks/list/explore	1.8	2.1	12288	False
193	Test 2	tasks/tag/blog/tag	1.1	2.5	98304	False
193	Test 3	tasks/main	1.8	2.4	93323264	True
193	Test 4	tasks/search	2.7	2.0	15728640	True
193	Test 5	tasks/category/tag/categories	1.8	2.7	65011712	True
193	Test 6	tasks/list	1.3	1.6	77824	True
193	Test 7	tasks/tag/categories	2.3	0.8	37888	True
193	Test 8	tasks/tags	1.9	1.8	9216	False
193	Test 9	tasks/list	1.4	0.9	65536	True
194	Test 0	tasks/app/blog/list	1.2	2.2	33792	True
194	Test 1	tasks/tag	2.9	1.7	39936	False
195	Test 0	tasks/explore/categories	1.5	1.7	99328	False
195	Test 1	tasks/app/blog/list	1.2	2.0	65536	True
196	Test 0	tasks/main	1.3	3.3	52224	False
196	Test 1	tasks/explore/wp-content/categories	1.6	2.5	72704	False
196	Test 2	tasks/main/wp-content/app	2.3	3.4	87031808	True
196	Test 3	tasks/categories/posts/blog	1.6	1.9	35651584	False
196	Test 4	tasks/blog	2.8	2.9	15360	False
196	Test 5	tasks/category/search	2.3	0.6	21504	True
196	Test 6	tasks/main/posts/explore	1.6	3.3	34816	False
196	Test 7	tasks/search/wp-content	2.8	0.8	57671680	False
196	Test 8	tasks/categories/posts/main	1.4	1.1	13631488	False
196	Test 9	tasks/main/explore	2.6	0.7	14336	True
197	Test 0	tasks/posts	1.3	1.1	33792	False
197	Test 1	tasks/tag/category	2.5	0.6	90112	True
197	Test 2	tasks/list/blog	2.3	3.1	70254592	True
198	Test 0	tasks/categories/posts	2.2	2.0	83968	False
198	Test 1	tasks/list/main	2.6	2.2	17825792	False
199	Test 0	tasks/categories/tags/categories	2.1	3.2	50176	True
199	Test 1	tasks/tags/wp-content	2.2	1.4	1048576	False
199	Test 2	tasks/list	2.5	1.6	27262976	True
199	Test 3	tasks/app	2.2	2.0	62914560	True
199	Test 4	tasks/app/main/main	1.5	2.0	60817408	True
199	Test 5	tasks/explore/blog	1.2	1.3	1024	False
199	Test 6	tasks/categories/category	2.1	2.5	89088	True
199	Test 7	tasks/blog/categories	2.3	0.7	54272	False
199	Test 8	tasks/blog/categories	2.5	3.0	53477376	False
199	Test 9	tasks/posts	1.0	1.0	83886080	True
200	Test 0	tasks/wp-content/category	1.2	1.7	33554432	True
200	Test 1	tasks/search/list/posts	2.6	3.4	45088768	False
200	Test 2	tasks/posts	2.6	1.3	11534336	True
200	Test 3	tasks/wp-content/wp-content	1.2	0.6	34816	True
201	Test 0	tasks/search/posts/wp-content	2.5	1.1	84934656	False
202	Test 0	tasks/tags/search	1.3	0.8	68157440	True
202	Test 1	tasks/search/search/list	2.1	2.7	91136	False
202	Test 2	tasks/tags	2.2	2.8	91136	False
202	Test 3	tasks/categories/main	1.1	1.6	34816	True
202	Test 4	tasks/main/list	1.9	2.8	60416	False
202	Test 5	tasks/categories/tags/tags	2.1	1.4	48128	True
202	Test 6	tasks/category	2.9	1.6	62914560	False
203	Test 0	tasks/main/tag	2.7	3.3	67584	True
203	Test 1	tasks/blog	2.9	2.2	64512	False
203	Test 2	tasks/categories	2.1	1.2	91226112	True
203	Test 3	tasks/posts/wp-content/category	1.4	3.4	84934656	False
203	Test 4	tasks/category/posts	1.1	1.5	36864	False
204	Test 0	tasks/posts/tags/tags	1.6	1.7	25600	False
204	Test 1	tasks/wp-content/tag/app	1.0	1.8	39845888	False
204	Test 2	tasks/explore/tag/category	1.1	2.3	21504	False
204	Test 3	tasks/category/tag/explore	2.8	0.5	72351744	False
204	Test 4	tasks/main/list/categories	2.9	0.9	54272	False
205	Test 0	tasks/main/app/posts	2.5	1.9	21504	False
205	Test 1	tasks/blog/blog/tags	2.9	1.6	43008	True
205	Test 2	tasks/category/tag/wp-content	1.2	2.6	21504	True
205	Test 3	tasks/category	2.4	0.8	97280	True
205	Test 4	tasks/app/blog	2.0	1.6	30408704	True
205	Test 5	tasks/list/app/search	1.1	3.3	71303168	True
206	Test 0	tasks/list/search	2.8	0.6	23068672	True
206	Test 1	tasks/app/category/main	2.8	2.1	2097152	True
206	Test 2	tasks/blog/wp-content	2.4	2.4	101711872	False
206	Test 3	tasks/explore/posts/app	2.6	3.2	30720	False
206	Test 4	tasks/tag/app	2.8	0.5	87040	True
206	Test 5	tasks/category/list/posts	1.9	3.2	26214400	False
207	Test 0	tasks/explore/category/posts	2.8	1.5	9437184	True
207	Test 1	tasks/search	1.1	3.1	44032	False
208	Test 0	tasks/main/main/list	2.5	3.2	15728640	False
208	Test 1	tasks/explore	2.5	3.0	103809024	True
208	Test 2	tasks/tag/main/wp-content	1.3	3.3	76546048	False
208	Test 3	tasks/blog/tag/search	2.2	2.4	93323264	True
208	Test 4	tasks/wp-content	1.8	2.9	32505856	False
208	Test 5	tasks/app/wp-content	2.9	2.3	1024	False
208	Test 6	tasks/wp-content/main/blog	2.7	2.4	100352	False
208	Test 7	tasks/explore/posts	1.9	2.2	48234496	True
209	Test 0	tasks/main	2.6	1.7	68157440	True
209	Test 1	tasks/explore/app/explore	1.9	1.6	28672	True
209	Test 2	tasks/app/posts	2.2	3.0	27648	True
209	Test 3	tasks/category	2.5	0.6	13312	False
209	Test 4	tasks/explore/main	2.8	2.3	97280	False
209	Test 5	tasks/blog/search	1.6	2.0	78848	True
209	Test 6	tasks/explore	1.6	1.1	30720	False
209	Test 7	tasks/main/posts/posts	1.2	3.4	84992	False
210	Test 0	tasks/list	1.7	0.8	49152	False
211	Test 0	tasks/tags/search	1.1	2.5	37888	True
211	Test 1	tasks/list	2.9	0.5	81788928	True
212	Test 0	tasks/categories/posts/blog	1.9	0.9	34816	True
212	Test 1	tasks/list/tags	1.7	2.2	63963136	False
212	Test 2	tasks/list	1.3	2.0	95420416	True
212	Test 3	tasks/main/tags	1.6	1.6	58720256	False
212	Test 4	tasks/blog/posts/blog	1.1	2.6	45088768	True
213	Test 0	tasks/list/posts	2.9	2.0	58368	True
213	Test 1	tasks/wp-content/tags	1.3	3.4	5120	False
213	Test 2	tasks/tag/search	1.4	0.9	36700160	False
213	Test 3	tasks/category	2.1	0.5	99328	True
213	Test 4	tasks/tag/search	1.9	3.3	24576	False
213	Test 5	tasks/tag	2.9	3.4	11534336	False
213	Test 6	tasks/tag/tags	2.3	0.9	51200	False
213	Test 7	tasks/wp-content	2.0	1.3	52224	True
214	Test 0	tasks/wp-content	2.7	1.9	28672	True
214	Test 1	tasks/categories	2.9	1.5	24117248	True
214	Test 2	tasks/category	2.7	0.7	1048576	False
214	Test 3	tasks/tag/explore/blog	1.7	2.5	30720	True
214	Test 4	tasks/list/tags/category	2.3	2.2	36864	False
214	Test 5	tasks/main/category	2.7	1.6	37888	False
214	Test 6	tasks/tag/explore	1.8	2.6	5120	False
214	Test 7	tasks/main	1.2	3.2	14680064	False
215	Test 0	tasks/app/app/tags	1.1	1.2	19922944	True
215	Test 1	tasks/search	2.8	1.5	29360128	False
215	Test 2	tasks/explore/tags	1.6	0.6	5120	False
215	Test 3	tasks/category/list/app	2.9	0.9	30408704	True
215	Test 4	tasks/posts/category	2.7	0.5	90177536	False
215	Test 5	tasks/wp-content/wp-content	2.2	0.9	56623104	False
215	Test 6	tasks/search	2.4	2.1	60817408	False
215	Test 7	tasks/posts/main	1.8	1.6	101376	True
216	Test 0	tasks/blog/posts	2.9	1.1	63963136	False
216	Test 1	tasks/app	1.1	2.2	2097152	True
216	Test 2	tasks/categories/blog	1.1	2.8	72704	False
216	Test 3	tasks/wp-content	1.3	2.1	59392	True
216	Test 4	tasks/posts/app/list	1.5	1.7	35840	True
216	Test 5	tasks/wp-content/wp-content/posts	1.4	3.4	65011712	False
216	Test 6	tasks/tag/tags	2.4	1.1	1048576	False
216	Test 7	tasks/list	1.0	1.0	63963136	False
216	Test 8	tasks/main/app	1.7	2.6	72351744	False
216	Test 9	tasks/categories/posts	1.4	3.3	81920	False
217	Test 0	tasks/category	1.5	2.1	70254592	True
217	Test 1	tasks/blog/list/tags	1.6	0.6	38912	False
217	Test 2	tasks/posts/explore	1.2	1.1	5120	True
217	Test 3	tasks/posts/categories	2.5	2.7	66060288	True
217	Test 4	tasks/tag	1.7	1.5	14680064	False
218	Test 0	tasks/wp-content	1.8	2.7	59768832	False
218	Test 1	tasks/tag/main/list	1.2	2.2	82944	True
218	Test 2	tasks/posts	1.8	2.1	29696	True
218	Test 3	tasks/wp-content/main/search	1.6	2.3	102760448	True
218	Test 4	tasks/main/tag	1.4	1.2	35651584	True
218	Test 5	tasks/app	2.7	2.9	57671680	False
219	Test 0	tasks/search/posts/posts	1.9	1.3	47185920	False
220	Test 0	tasks/search/search	2.7	1.2	69632	False
220	Test 1	tasks/blog/search	1.8	2.9	82944	False
221	Test 0	tasks/category/search	2.5	2.2	94208	True
221	Test 1	tasks/tags	2.6	1.1	10240	True
221	Test 2	tasks/explore	2.3	2.8	85983232	False
221	Test 3	tasks/tag/tags	1.2	2.6	22020096	True
221	Test 4	tasks/wp-content/list/blog	1.4	2.7	14680064	True
\.
COPY task_results (submit_id, task_id, status_id, points, summary, execution_time, used_memory) FROM STDIN;
308	685	5	0	Along compare politics book among apply edge. Spring pay hard rock these deep.	1.7	7043072
174	494	4	1.9	Check wonder realize end condition mention.	1.1	796672
113	499	4	2.5	Suffer write yourself data statement can top concern.	1.0	7837696
272	813	1	0	\N	0.7	4414464
44	119	4	1.3	\N	1.2	1531904
3	263	3	0	Minute machine result wide land.	0.7	7635968
41	272	5	0	Member develop event author eat science.	1.7	6157312
184	455	4	1.6	Act young whole none adult teacher face go.	0.9	4738048
87	975	3	0	\N	0.6	1113088
163	216	4	0.7	\N	1.7	2908160
119	23	4	2.8	Candidate really recognize table response.	1.8	1051648
257	357	9	0	Establish government tonight cover reveal important white different.	1.4	1828864
119	42	4	1.1	\N	1.5	8026112
15	938	3	0	\N	1.2	1274880
156	341	3	0	Enter item return daughter director accept argue nearly.	1.2	4365312
254	830	4	1.1	\N	1.9	6212608
150	274	3	0	\N	1.2	7246848
106	334	9	0	Wind every campaign even often.	1.3	6458368
148	1174	4	1.7	Turn southern indicate also. Situation away fish modern.	1.6	8173568
11	407	4	1.7	Over film such.	0.8	4163584
36	943	8	0	Everyone forward morning dinner care. Ask network place approach fly beautiful.	1.5	776192
249	256	4	1.3	Language community method water ten feel drive social.	0.8	4310016
53	591	4	0.5	Parent about worker lawyer.	1.3	3236864
101	1180	4	1.6	\N	1.8	4318208
113	502	4	1.4	\N	1.2	7854080
126	1175	4	1.1	Along music result throw thousand.	0.8	6717440
92	573	5	0	\N	1.4	3684352
209	309	4	1.9	\N	1.9	3733504
279	570	5	0	\N	1.2	7325696
48	1185	4	2.1	Enough tonight discuss shoulder. Of sign manager care less.	0.8	8053760
115	528	4	0.8	Beautiful discuss evening seat everybody situation.	0.9	5902336
200	938	8	0	\N	1.4	2547712
209	288	4	1.4	Since big shoulder step maybe company. College before president.	1.5	1498112
300	213	10	0	\N	1.9	4381696
91	253	1	0	\N	0.6	4895744
225	997	5	0	Debate collection new star.	1.5	6013952
136	589	6	0	\N	1.8	1152000
200	941	4	2.7	\N	1.7	838656
43	113	4	1.8	\N	1.4	5654528
95	1069	4	1.5	I garden provide fund seek.	1.4	4035584
142	449	5	0	\N	0.8	5004288
196	420	5	0	Election western condition fear necessary. Talk live year quite.	1.6	4169728
23	508	4	1.8	\N	1.4	502784
28	203	9	0	\N	1.4	7436288
17	1136	4	2.1	Sense fire interesting onto. Task respond probably.	1.7	5862400
6	171	6	0	\N	1.4	1697792
167	4	4	1.2	\N	0.9	4647936
178	526	4	1.7	\N	0.5	7661568
51	380	4	2.5	Policy reach certain oil yes reflect when.	0.6	1457152
31	759	4	0.2	Still water executive even.	0.8	3898368
62	1197	4	1.2	Data fight stop soldier because matter government.	0.8	3505152
146	1106	6	0	\N	0.7	4445184
204	578	4	2.7	Painting expect assume west week do voice however. Meeting stage similar suggest time high church.	1.1	6423552
55	452	4	1.4	\N	0.6	5352448
206	665	3	0	\N	1.0	7459840
44	103	6	0	Give newspaper institution way.	1.2	2907136
186	246	7	0	\N	0.6	3088384
229	251	4	1.9	These after chair study matter range east. Kid live although yeah company little candidate explain.	1.7	547840
41	257	4	2.0	Personal cultural wonder player professor forward.	1.3	3411968
221	1098	3	0	\N	0.5	5100544
206	670	5	0	\N	0.9	5585920
63	240	4	1.0	Heart success sound miss animal social. Particular situation win radio upon.	1.3	5447680
114	871	4	0.6	Finally reflect key.	0.9	4795392
280	327	4	2.6	Receive behind myself financial experience.	1.0	4299776
291	318	4	0.7	\N	1.5	7021568
193	341	9	0	\N	1.6	4935680
98	1135	4	2.2	Method response hot speech use participant physical. Baby allow take hope himself arrive body.	1.0	6595584
156	349	7	0	\N	1.2	2430976
254	827	4	0.5	\N	0.6	6206464
150	256	4	2.2	\N	1.7	5441536
205	627	4	1.1	\N	1.4	5421056
77	9	3	0	\N	0.9	5424128
98	1133	5	0	\N	1.4	6331392
147	656	10	0	Wear hard imagine. Task field ground decision.	1.1	7241728
308	683	9	0	\N	1.1	1220608
112	618	9	0	Note identify write expect goal.	2.0	492544
293	555	9	0	\N	1.9	6295552
303	1095	5	0	\N	1.2	3592192
284	157	3	0	\N	1.9	2751488
258	1184	8	0	Home somebody care forget these computer.	1.0	3565568
90	595	6	0	\N	1.4	6222848
93	651	4	1.1	\N	0.6	7404544
39	844	8	0	Appear couple should debate fund.	1.0	2223104
278	684	3	0	\N	1.1	8079360
44	101	4	1.7	\N	1.4	1806336
194	695	7	0	Medical pattern thousand serve involve.	0.7	8196096
291	302	7	0	\N	1.3	6684672
53	588	9	0	\N	1.3	6381568
134	1129	4	2.2	Knowledge message term according find PM church benefit.	0.7	5624832
240	888	4	2.1	\N	1.9	6048768
20	92	4	1.4	\N	1.9	3024896
165	478	4	2.8	\N	1.3	2510848
61	455	4	0.0	\N	0.6	5164032
209	300	4	1.0	\N	1.7	5906432
129	450	5	0	Customer wear account right.	1.1	374784
75	283	1	0	Media take special evidence.	0.5	2266112
115	533	4	1.5	Fear since structure attention.	1.1	3900416
55	454	4	1.9	Free nation degree current series.	1.8	457728
291	288	4	1.4	\N	1.1	3043328
104	360	4	2.7	\N	0.5	6052864
77	6	4	2.1	\N	1.5	6363136
142	426	4	2.9	Agree community or whole way.	1.5	3650560
135	60	8	0	\N	0.6	4814848
38	1118	4	2.1	White thousand along determine cover.	1.5	4960256
210	1152	4	2.4	Management response name own already letter another meeting.	1.0	1092608
95	1067	4	1.6	Often in others finally thought majority agency.	1.1	4809728
33	764	4	1.4	Of exactly foreign nothing.	0.7	5890048
273	1177	4	1.9	\N	1.4	2583552
38	1115	4	2.2	\N	1.3	3615744
186	241	4	0.6	Little perform exactly question ok.	1.2	4405248
111	908	4	1.6	\N	1.6	7782400
3	272	9	0	City accept live agent high cause network memory.	1.6	8250368
68	316	4	2.9	\N	1.3	2258944
44	115	4	1.3	Middle Congress themselves production old.	0.8	3961856
75	286	9	0	Author continue high old product. Fill reason difference federal community.	1.8	2472960
138	23	4	2.8	Cultural draw and far fact.	1.8	732160
135	49	9	0	Side be difficult among Republican.	1.8	2983936
4	283	4	2.3	\N	1.3	4497408
41	258	4	0.8	\N	1.9	6411264
165	473	10	0	\N	1.4	2790400
256	756	4	2.0	Tend half decision beautiful eight loss staff.	1.9	1434624
281	414	4	1.2	Cultural other development popular current thus.	1.3	3861504
98	1148	5	0	\N	1.5	5632000
27	33	4	2.0	Support someone against TV management somebody military level.	1.2	2397184
55	462	10	0	\N	1.9	5472256
43	100	7	0	Edge plant fire provide.	1.8	6453248
142	444	1	0	Understand TV west difference decide agent.	0.8	1928192
299	357	4	0.8	\N	0.5	546816
276	558	6	0	Film idea morning hotel itself size.	0.8	8037376
300	235	4	2.0	Able receive your however future offer.	1.1	4419584
310	158	10	0	\N	1.2	5711872
140	572	4	2.0	\N	0.6	387072
193	347	10	0	Now worry age have ahead western.	1.8	1779712
265	1228	4	2.7	Husband adult experience everything per about conference. Television although new.	0.9	738304
244	273	4	1.6	Image night determine brother already wide.	0.8	2093056
258	1179	9	0	\N	1.9	787456
187	417	1	0	Response task physical television debate.	1.4	1100800
91	273	4	1.6	Rise office second investment sense agent.	1.8	1225728
255	1153	4	2.6	Pretty including where themselves common measure despite.	0.5	267264
291	296	5	0	Somebody attorney wait debate official space.	0.5	7798784
147	665	4	2.5	\N	1.8	776192
190	759	1	0	\N	1.9	5598208
41	256	4	2.2	\N	0.8	2592768
187	442	8	0	Eye too coach.	2.0	836608
111	919	4	0.9	Difficult lot region. Spend most hand total street entire well.	0.6	6921216
152	631	4	1.8	\N	1.7	3954688
280	325	8	0	Sit thing season whatever.	1.3	4676608
179	456	6	0	Trade get them check adult art each.	1.9	4747264
99	560	4	1.2	\N	1.5	7898112
111	899	8	0	\N	0.7	5632000
33	773	4	2.1	Table care party shake bed.	1.8	4377600
129	461	7	0	\N	1.4	4405248
152	611	10	0	\N	1.0	3889152
121	684	4	0.9	Yeah establish help.	0.9	4272128
264	841	4	0.5	Table if consider morning trip central analysis. Across when response body eat after.	1.9	1082368
247	929	3	0	\N	1.5	4455424
17	1140	10	0	Reality must do difference.	0.8	196608
17	1148	8	0	\N	2.0	5676032
174	505	9	0	Or quite consider data collection some.	0.9	6620160
286	1137	9	0	Church term goal expect physical upon stuff.	0.8	761856
202	871	4	2.6	\N	1.7	7051264
252	246	4	2.2	\N	0.8	7402496
92	568	7	0	Rest shoulder important open south human my. Where commercial red boy say want.	0.8	3652608
125	1060	4	1.5	Open yard onto year.	1.2	5465088
105	1092	6	0	Mean range hold well stuff fly able peace.	1.2	6670336
114	863	4	1.6	\N	1.4	5136384
117	593	4	1.4	Evidence star have professional now network ability. Rich low system.	1.2	1971200
134	1145	4	2.9	\N	0.7	7571456
10	745	1	0	\N	1.1	5449728
130	1047	9	0	\N	0.7	6355968
209	303	4	0.3	\N	1.0	7732224
15	940	4	0.8	\N	1.1	3860480
191	746	6	0	\N	1.2	1176576
262	739	4	0.2	\N	0.7	6482944
229	247	4	2.7	\N	0.6	3573760
101	1186	3	0	Born talk attorney every many still various type.	1.3	2512896
180	945	4	2.7	Traditional service such become.	1.9	6255616
85	1097	4	0.7	\N	0.7	6126592
205	629	4	1.8	\N	1.2	197632
279	574	4	2.3	Then style shake bar fill.	1.2	7434240
297	763	4	1.6	Language country mission. Serve bed significant early over Congress market.	1.1	3880960
245	232	7	0	\N	1.9	1453056
150	262	1	0	\N	1.7	6991872
136	591	4	0.8	Follow clearly recently his several.	0.6	7136256
93	664	4	1.4	\N	0.6	756736
56	1111	4	2.6	\N	1.0	2581504
172	278	4	2.5	Determine product in technology chair attack prove.	0.7	1127424
179	458	4	0.7	Parent tax likely building.	0.9	3547136
2	1061	4	2.0	\N	0.9	5728256
285	1075	4	0.6	Expert him answer.	1.4	203776
306	606	3	0	\N	1.3	2449408
68	290	4	2.4	Sound not prevent choice. Middle experience with heart best picture.	0.8	6795264
272	810	7	0	\N	1.5	2807808
174	492	4	1.6	\N	0.9	2904064
53	586	4	1.2	Reality past hundred continue.	1.1	1249280
271	457	4	2.7	\N	1.5	2325504
186	247	6	0	\N	0.8	1119232
35	1188	4	1.4	\N	1.7	4110336
105	1085	3	0	\N	1.9	3738624
215	715	10	0	\N	0.6	6051840
205	611	4	1.0	\N	2.0	8183808
252	242	7	0	\N	1.4	7842816
210	1156	8	0	\N	1.3	6491136
200	944	4	2.9	\N	1.9	3080192
114	865	4	2.9	Game it bed dream.	1.3	1740800
187	424	1	0	\N	1.6	5601280
258	1183	1	0	Hit bed adult stock detail ahead sign.	1.3	5764096
102	1015	4	1.7	Wall stuff war pull bad.	0.6	3273728
26	505	4	2.4	\N	1.2	1333248
233	75	4	0.9	Anything third forward collection.	1.5	1070080
29	280	4	1.6	\N	1.7	2563072
247	899	4	2.5	\N	1.0	866304
88	1074	10	0	Under cost after without general ten player difficult.	0.9	6107136
37	328	3	0	\N	0.8	7745536
264	836	4	1.5	\N	1.0	4375552
146	1097	4	1.3	\N	0.6	3020800
244	271	6	0	Worry system figure task city. Service air network debate TV.	0.7	3654656
286	1142	4	2.8	Raise current sit part.	0.5	8239104
226	774	4	1.3	Worry prevent seat political defense culture.	2.0	6718464
305	398	4	0.4	\N	1.3	4170752
1	803	4	2.3	\N	1.2	7206912
111	917	4	2.7	Trial social high strategy Mrs artist.	0.6	6604800
118	856	9	0	\N	0.9	2499584
3	256	4	2.2	\N	1.3	5997568
117	592	3	0	Spend once kind none film song.	1.0	716800
116	635	4	2.3	\N	1.4	5873664
65	397	5	0	Throw ability include. Financial my book opportunity.	1.5	5216256
46	1070	10	0	\N	0.6	1779712
279	576	4	2.6	\N	1.0	5010432
27	41	4	1.4	Sometimes behind baby attention carry hair pass fast. Little grow able defense shoulder film.	1.7	3459072
17	1142	7	0	\N	0.9	3070976
88	1072	4	0.2	Record decision sport play sing air child. Off same agree speak certainly daughter professor.	1.2	4183040
250	303	4	1.0	\N	0.7	2293760
155	60	4	2.5	\N	1.9	4387840
125	1051	7	0	American cell into.	0.7	1858560
67	733	4	2.2	Sort enjoy program box.	2.0	6215680
260	1003	4	1.5	Wide try success establish back out ok.	0.9	4732928
244	263	4	2.4	\N	0.7	3863552
202	860	4	1.8	\N	1.3	4041728
310	155	6	0	\N	1.4	2911232
270	443	4	1.3	Get morning friend up military.	1.5	5350400
126	1190	3	0	Region production process must. General everybody tend sister.	1.8	3596288
70	952	4	2.6	\N	0.7	1591296
244	276	4	2.0	Inside describe rule myself either dinner commercial this.	1.1	6717440
212	327	4	2.6	\N	1.8	2941952
44	109	4	1.0	\N	1.0	5721088
220	413	4	1.6	Ask modern beat candidate movie seem pretty.	0.6	4471808
190	757	9	0	Both answer early mouth letter understand.	0.9	4655104
275	1070	6	0	\N	0.9	4609024
295	711	10	0	\N	0.5	5613568
69	211	4	1.1	Fast team down have family staff family. Expect along item ago door that detail.	1.7	2255872
101	1184	4	1.4	\N	1.3	4992000
77	18	1	0	Provide protect another record bill.	1.7	1044480
100	299	4	1.5	Force any quality fall decision. Short call police art quality society possible.	0.9	3544064
43	118	4	2.5	Image use business painting week. Fine although popular recent lawyer wish.	1.9	7533568
160	797	4	1.4	\N	1.2	4202496
135	73	4	2.8	Personal next act international later debate early.	1.0	2755584
260	996	6	0	\N	1.9	7393280
245	236	4	1.1	Every modern actually wife only go.	1.9	5616640
58	575	4	2.4	Provide tough long thank provide number can.	1.3	212992
297	754	4	1.3	\N	1.6	3103744
170	429	4	1.2	Become loss hospital suggest affect three attorney.	0.5	1494016
155	45	4	2.5	\N	1.5	4110336
135	50	8	0	\N	1.9	7110656
111	922	4	2.3	Prevent describe school star million American paper.	1.7	2257920
134	1138	4	1.1	\N	1.3	3943424
243	855	8	0	\N	1.0	8078336
96	697	1	0	\N	1.9	5088256
100	307	4	2.7	\N	0.6	6720512
100	308	10	0	That under run lay life.	0.6	7686144
231	244	4	1.3	\N	0.8	6106112
301	127	4	2.7	Just scientist according every at long play.	1.5	5933056
255	1157	1	0	\N	0.6	1850368
108	743	1	0	\N	1.3	2735104
218	212	4	1.5	\N	1.7	7059456
241	517	4	1.9	\N	1.7	1562624
270	435	4	1.5	Cultural natural material safe appear many.	1.1	1989632
250	301	9	0	\N	0.8	8048640
108	736	4	1.8	Lot religious such personal through.	1.5	2595840
41	260	5	0	Give food old state.	0.7	2285568
234	798	4	1.2	Leave movement it note crime policy arm. Pull scene here organization know couple.	1.6	5013504
272	803	4	2.3	\N	0.6	1702912
247	931	9	0	Daughter have spring may successful a.	1.5	4230144
205	613	4	1.9	Skin office agent you forward chance.	1.3	3220480
173	935	4	0.6	\N	1.4	1677312
24	89	4	1.5	\N	1.6	6589440
264	840	5	0	\N	1.6	2062336
268	608	4	1.7	White could blood defense message yes social.	1.0	2550784
194	699	4	2.2	You soon time we sure answer.	0.9	3676160
42	732	6	0	\N	1.3	6135808
298	717	3	0	\N	0.7	6045696
138	40	8	0	\N	0.8	5867520
66	349	4	1.4	Rather draw standard story left candidate brother. Fill decade region everyone admit rule.	1.7	7406592
258	1181	4	1.1	\N	1.6	2977792
226	765	4	1.0	\N	0.9	4617216
272	812	4	2.3	Care mind ahead cost. Simply get may team mention degree artist positive.	0.8	1854464
305	391	4	1.5	\N	1.7	7866368
196	417	8	0	\N	1.7	2972672
75	285	5	0	\N	0.8	6432768
126	1180	1	0	\N	0.6	1036288
169	258	4	1.9	\N	0.8	6661120
73	858	4	2.7	Open first physical open.	1.3	4791296
23	495	5	0	Western eat first development.	2.0	4106240
91	256	4	2.2	Certainly maybe brother rich stock evening science.	0.7	3769344
270	424	4	1.6	Word class far energy player yeah of.	1.9	5414912
80	227	9	0	Thought relate model movement kid man trouble.	1.2	604160
66	344	1	0	\N	1.2	6369280
259	935	4	1.4	\N	1.5	7550976
114	887	4	1.8	\N	1.2	4360192
111	915	4	1.0	Born address dog right.	1.6	240640
240	862	4	2.3	\N	2.0	2997248
289	196	4	1.6	\N	1.2	3494912
130	1058	8	0	\N	1.7	2532352
92	575	9	0	Film practice could author upon will. Child event under morning figure nor represent.	0.7	5902336
278	692	4	2.5	\N	0.9	7829504
95	1043	4	1.8	\N	1.1	2665472
256	755	8	0	Serve mean sea upon church wall hard. Affect personal into Mr yeah.	1.9	4191232
105	1071	10	0	Moment bag who purpose although answer.	1.8	4555776
23	496	4	2.0	Fear painting industry care. Rich have wife.	1.3	4192256
52	1156	4	1.5	Others suddenly agree man probably institution time. Trouble edge executive on forget.	0.6	3980288
305	382	3	0	\N	1.6	4033536
279	562	4	2.5	Network performance father.	1.0	7264256
234	797	3	0	\N	1.3	2777088
295	717	7	0	Order along create road. Nor sound treat although positive maybe article.	1.0	5221376
75	281	4	1.5	Up kind show rule public.	1.8	269312
302	306	9	0	\N	0.7	1382400
182	86	4	0.4	\N	1.0	332800
19	825	4	1.2	Their several computer former.	1.4	7544832
201	1076	4	1.6	\N	1.7	675840
82	651	4	0.0	Modern against value religious.	1.2	6343680
138	42	5	0	Get alone understand their base partner century.	0.7	4684800
167	16	4	2.9	Front lay bar commercial he left president.	1.0	5913600
176	1011	4	0.1	\N	1.1	6322176
268	599	9	0	Improve notice group case.	1.9	4590592
189	560	3	0	\N	1.0	129024
254	828	4	2.3	\N	1.6	2312192
128	1114	5	0	\N	1.1	5485568
110	396	4	1.8	\N	1.3	4137984
140	568	1	0	\N	1.6	7360512
216	1074	4	2.6	Source item clear apply wonder player new.	1.2	1466368
202	866	10	0	\N	0.9	2920448
111	931	6	0	Admit control decision decide happy.	1.0	555008
140	561	4	2.2	While such beat western low.	1.0	493568
180	936	4	2.5	Rather out debate word thousand argue artist if. Thank visit born put simple whether author plant.	1.0	4357120
307	387	4	1.5	Relationship fall mouth reveal our whatever protect marriage.	1.9	4957184
59	473	5	0	\N	1.7	3823616
179	454	5	0	\N	0.7	7794688
35	1190	7	0	\N	1.4	1796096
72	1098	4	1.6	Anything begin author TV method direction may.	1.1	5998592
243	852	4	0.9	Government difficult study look natural leg.	0.6	5431296
48	1193	3	0	\N	0.8	4226048
150	257	6	0	Second check second door.	0.8	5680128
271	452	5	0	\N	1.5	6749184
22	66	8	0	\N	1.4	1721344
88	1079	7	0	\N	0.8	7612416
263	368	4	1.8	\N	1.6	4039680
38	1121	9	0	Time professor detail society.	1.4	3023872
240	871	4	2.6	\N	1.5	7262208
270	445	6	0	\N	0.6	6705152
233	50	3	0	Seek pay open letter.	1.9	2360320
12	360	4	2.7	\N	1.7	5853184
177	252	8	0	Owner fact senior state. Teacher serious question message including sport.	1.9	7037952
182	88	9	0	\N	1.7	1878016
183	373	4	1.9	Weight to know perhaps power also.	0.9	6520832
103	260	4	2.0	Day because attack education specific project culture.	0.6	5088256
190	761	7	0	\N	1.2	3627008
299	362	4	2.8	\N	1.8	322560
272	809	4	2.7	Option past cost under let. Send poor somebody night occur.	1.6	5547008
178	539	9	0	\N	1.2	5958656
270	448	3	0	Million onto believe.	0.5	1911808
112	622	4	2.8	\N	0.7	6294528
193	351	4	1.5	Especially total determine ability.	1.5	5171200
249	276	4	2.0	Write could act.	0.8	5640192
156	344	8	0	Meeting live different suddenly study benefit. Feel one provide four business them special.	1.9	4357120
19	823	7	0	Down fly window side tend. Although animal eight someone every.	1.9	4020224
1	811	4	2.6	\N	0.6	7246848
195	159	3	0	\N	1.7	964608
212	324	4	2.1	\N	1.2	7672832
89	614	3	0	Sign sister shoulder raise example financial beat miss.	1.4	3459072
53	583	4	0.7	\N	1.5	6261760
182	85	4	2.2	Say able part main too only.	1.3	7279616
106	341	4	0.2	Themselves mother whatever bed here force off.	1.5	5018624
105	1091	8	0	\N	0.6	3402752
91	252	10	0	\N	1.3	3568640
174	487	6	0	Keep any into respond deep worker which instead.	1.6	2369536
91	266	1	0	\N	0.7	8040448
25	172	6	0	Window even many.	1.2	3101696
58	571	4	0.2	Fill under anything bag.	1.4	3974144
224	408	4	2.5	Could himself worker cup miss section.	0.9	6043648
145	1224	4	1.6	Decide step guess buy.	0.7	1995776
110	398	5	0	Hear tax run dream both produce mention.	1.9	5550080
109	1008	10	0	\N	0.7	1251328
308	697	1	0	\N	1.3	3956736
101	1196	4	1.8	Kid once indicate speech task.	0.8	4245504
22	60	4	2.5	\N	1.7	7608320
53	593	4	2.6	Management fish that raise face next rest. Create rather prepare red moment four.	1.0	6272000
159	536	3	0	Cultural hotel he see rather consider.	0.7	2508800
286	1136	3	0	Reach I up impact.	0.6	144384
242	882	10	0	Business yes grow against we.	0.9	7627776
110	381	4	2.6	The federal water society.	1.8	7513088
150	252	4	0.9	Fire number capital food. Modern particular material manage win identify.	1.7	5648384
111	913	7	0	\N	1.4	6289408
1	806	4	1.5	\N	0.7	1635328
55	460	1	0	\N	1.9	6769664
157	1231	4	2.5	Far class financial name physical card who such.	0.7	5796864
18	823	4	1.1	\N	0.8	3932160
169	276	8	0	\N	0.5	921600
266	464	10	0	Born manage true general word.	1.0	6258688
275	1078	9	0	Start happen floor.	1.9	1710080
250	318	3	0	\N	1.5	2225152
218	235	10	0	Prove tend during next gas continue throw public.	0.5	272384
126	1179	5	0	Consumer show smile interview kid miss step.	1.2	5406720
111	930	5	0	Page mind each president end house nation increase.	1.7	6665216
102	1027	1	0	\N	1.9	5424128
2	1062	6	0	\N	0.7	1796096
34	983	4	1.6	\N	0.9	6500352
46	1080	4	0.8	Ten prevent former cell. Cell live suddenly over economy happen.	0.9	2217984
117	583	10	0	\N	1.6	7925760
210	1163	7	0	Ready likely owner course raise must brother.	0.9	4773888
151	461	4	1.5	Argue oil watch everyone story. We start nothing everything certainly until drop.	0.8	1812480
306	605	3	0	\N	0.6	6041600
70	961	8	0	\N	1.3	6506496
95	1050	8	0	\N	0.6	7449600
33	767	4	1.8	\N	0.6	4340736
143	452	7	0	\N	0.9	4655104
4	282	4	1.2	Physical director focus man bad fish.	1.6	8214528
201	1081	1	0	\N	1.3	266240
155	47	4	2.7	\N	1.6	3474432
95	1058	4	1.7	\N	0.5	1872896
247	904	10	0	Of vote government yes.	0.7	2503680
190	752	4	1.8	\N	1.6	5723136
203	1210	4	1.5	\N	1.6	4858880
103	255	4	1.4	Business he already blood policy many task.	1.3	1977344
269	516	4	2.9	\N	1.0	6962176
52	1158	8	0	Health people specific oil concern foreign provide.	1.9	6397952
89	611	5	0	Discuss there necessary knowledge north.	1.2	113664
187	416	3	0	\N	0.6	4043776
163	219	10	0	\N	1.4	7865344
33	788	3	0	East future between effect manager learn character.	1.5	314368
224	410	9	0	Long care yourself back.	0.9	4198400
85	1103	9	0	Artist a audience bar point.	0.7	7558144
286	1141	7	0	Service walk nation writer student yes low.	1.4	2435072
300	229	3	0	Well thus job remember.	1.2	3098624
170	430	4	0.4	\N	1.5	7561216
68	305	10	0	\N	0.9	5320704
10	746	4	2.8	Everything others surface school how miss.	1.4	1123328
135	76	4	1.0	\N	0.7	6853632
110	392	8	0	Experience official door middle.	0.9	6408192
130	1060	4	2.4	\N	1.3	5403648
68	302	9	0	\N	1.0	8057856
80	215	4	1.3	As pretty kind four.	1.2	4971520
280	324	9	0	Financial establish you our. Unit could human long agency leader early.	1.9	2251776
2	1050	5	0	Half table western wish particularly.	1.3	5174272
11	400	4	2.1	Season final eat cause they any.	1.0	2224128
160	800	4	2.3	\N	1.2	6789120
184	462	8	0	Wait region structure through mother foot.	1.6	7394304
262	748	5	0	Probably key capital institution. Local while simply blood four.	1.2	4942848
194	702	4	1.2	Hand today everything.	0.7	5517312
226	784	10	0	\N	0.9	6887424
120	193	10	0	Media relate whatever less new sometimes me.	1.3	2113536
127	641	3	0	\N	1.9	4566016
141	825	4	1.2	Name station compare old training senior.	0.6	3068928
73	859	4	1.4	\N	1.7	894976
23	507	8	0	Arm thing herself report beat.	1.0	7480320
256	761	4	2.8	Minute whether eight somebody less president. Through my similar along perform ever design.	0.6	1189888
278	699	4	1.6	Person approach wind become must.	0.8	3271680
304	741	4	1.5	\N	1.6	6201344
90	603	4	2.2	\N	1.4	1993728
82	666	10	0	Event wrong gas TV service. Attention network it help.	0.9	5991424
111	912	4	2.3	Character civil subject ready one.	1.6	539648
223	375	4	1.2	\N	1.6	4776960
227	678	4	1.3	\N	0.7	1507328
220	411	4	0.4	Cost today able.	1.7	5170176
235	1166	4	2.6	Job hot newspaper industry interview conference near.	1.0	3578880
68	296	1	0	Idea black store need.	1.2	5796864
177	270	4	1.3	The professor act art sense whom.	1.0	2284544
134	1147	1	0	\N	1.9	4865024
22	77	4	1.8	\N	1.8	2832384
94	1157	4	1.1	Picture experience after say treatment station.	0.6	6998016
292	368	4	1.8	\N	1.6	7885824
245	235	4	2.0	\N	1.3	7628800
285	1077	10	0	Leg reveal year even movement particular.	2.0	479232
122	850	4	2.1	\N	1.6	3095552
273	1175	4	1.1	\N	0.9	5229568
103	265	4	1.6	Table ten political somebody owner model either. Church whom technology source key third all.	1.3	3284992
10	740	4	2.7	Use among might take.	1.6	3173376
126	1193	4	1.7	Court book way.	1.8	5521408
209	310	7	0	\N	1.3	7067648
103	271	4	2.5	Model improve right charge approach add relationship officer.	1.3	1355776
33	768	4	2.7	War pick stock coach dream.	1.0	1249280
276	557	4	2.3	Police blue so direction increase player without drop.	0.5	5712896
240	887	3	0	\N	1.3	7331840
301	129	4	1.7	Region speech often local still industry position. Artist control weight.	0.6	7119872
294	1218	4	1.2	High together attention surface short leader three article. City hold adult high method evidence.	1.4	6118400
242	859	1	0	Age point budget fill. Child dog partner friend.	1.8	6571008
134	1128	8	0	\N	1.5	1916928
285	1076	4	0.8	Tree system traditional home medical of. Beat defense can growth baby sometimes.	1.5	2592768
134	1148	4	2.0	Almost sort since realize ahead four west.	1.6	7392256
117	589	3	0	Including political behind process final manage.	0.6	6098944
247	930	3	0	Ten should reduce imagine travel art travel.	1.1	1009664
178	538	8	0	Ball mean live.	1.7	5843968
195	160	5	0	\N	1.7	395264
116	633	5	0	Air almost let method other power huge.	1.2	5400576
142	425	4	2.4	\N	1.6	8208384
72	1111	4	2.6	Both raise fund meeting let individual Democrat. Letter strategy prevent go.	1.3	3861504
146	1103	5	0	Morning smile culture practice rate know decade different. Read bank common form good activity seven which.	0.5	7542784
115	527	1	0	\N	1.2	3188736
223	366	4	2.9	\N	1.1	163840
294	1200	4	1.6	Bring region short become body.	1.5	6153216
221	1105	4	1.4	\N	1.4	1446912
73	878	5	0	\N	1.3	103424
250	319	1	0	\N	0.8	2613248
306	600	1	0	For each shoulder so both.	1.4	5299200
84	342	4	1.2	\N	0.9	1446912
52	1170	4	2.8	Even avoid interesting mind. Learn business tax teacher from.	1.9	6625280
106	343	4	1.5	\N	0.6	6289408
155	57	6	0	Agent guy part property.	1.3	6023168
240	876	9	0	\N	2.0	5923840
156	336	4	1.3	\N	1.9	1632256
114	864	4	1.1	Sell choose degree international.	0.6	6936576
210	1170	4	2.8	\N	1.1	3259392
296	853	4	2.6	Executive difference partner.	1.3	6096896
1	799	4	2.8	\N	1.9	1581056
246	736	4	0.7	\N	0.8	6803456
156	354	4	1.3	Character inside word network our teacher choice.	0.7	2955264
102	1039	4	2.6	Store laugh network.	1.4	1139712
17	1145	4	2.3	\N	1.0	2257920
2	1066	9	0	\N	0.6	410624
93	646	3	0	\N	1.3	8141824
30	813	4	2.4	\N	1.6	352256
77	10	4	2.8	\N	0.6	4704256
204	588	3	0	Movie agency church. Next option glass.	1.6	2352128
163	222	4	2.2	\N	0.9	4312064
226	779	10	0	\N	1.5	4787200
30	819	4	1.0	\N	0.8	6449152
181	1106	4	2.6	\N	0.6	3951616
21	1038	4	1.9	Trade coach common picture raise wide.	2.0	2024448
15	937	4	1.3	College group us day beyond.	1.7	6638592
245	215	6	0	Pretty good trouble in man business chance. Continue support prevent whatever game campaign trouble.	1.7	4114432
160	802	4	2.3	All game such choose law director attorney.	1.8	5025792
82	653	8	0	Difference training magazine brother eye painting whole.	1.2	2392064
151	460	4	2.8	\N	0.5	4931584
146	1101	7	0	Ten direction without.	0.8	1370112
250	288	4	1.2	\N	1.7	4626432
210	1166	4	2.6	\N	0.9	5337088
238	324	8	0	\N	1.2	2772992
201	1079	7	0	\N	1.3	1266688
164	957	4	0.2	\N	1.0	2984960
22	63	4	2.1	Especially writer one order year.	0.5	300032
95	1054	3	0	\N	1.6	3762176
177	267	7	0	Foot Congress war wind.	1.7	3013632
204	591	4	1.6	\N	0.7	2832384
30	805	5	0	\N	1.2	2675712
193	352	10	0	Soldier laugh will action student design various.	1.5	1300480
82	647	10	0	\N	1.1	6049792
274	620	9	0	Trip employee glass low.	2.0	5108736
248	1105	3	0	Necessary stage body employee significant investment reach.	1.7	347136
62	1191	4	1.9	Floor picture structure picture war off degree. Along allow answer similar.	0.8	3210240
161	1065	1	0	Argue agency soldier stop. Generation southern hard choice.	1.9	2266112
20	91	4	1.3	Ok continue decide. Head nor school scientist of more.	0.5	4040704
247	896	4	2.0	Information another pretty decision senior my.	0.6	3312640
193	356	4	1.0	\N	1.7	3297280
115	551	4	1.0	Phone east glass wrong place.	1.7	881664
198	1167	3	0	Political one fast medical force wall.	0.6	6021120
295	729	4	1.9	\N	0.6	5532672
304	739	4	1.0	Important as notice change add himself.	0.6	4761600
70	969	5	0	Knowledge thus than first my officer want really.	1.7	5456896
226	792	4	2.1	Look accept look worker level.	1.0	251904
302	291	3	0	\N	1.1	7789568
113	489	6	0	Without discuss talk people.	1.4	4766720
147	664	6	0	\N	0.9	3515392
82	664	4	2.5	Standard church stop off far letter wish book. Fast series final scene around trade scientist.	1.5	1832960
136	587	4	2.5	Cultural each itself will. Quickly section song cup both itself.	1.6	3491840
279	565	10	0	Movie community return fear least Mr account.	0.5	794624
301	131	7	0	\N	0.9	966656
95	1042	6	0	\N	1.6	7618560
175	131	4	2.5	Mrs deep participant list interest key painting.	1.6	7264256
155	53	1	0	Administration some soon offer time about field.	1.3	2131968
250	316	1	0	Mind beat during stop.	1.0	1813504
145	1202	4	2.7	\N	1.9	1430528
306	603	7	0	\N	1.1	5994496
127	640	6	0	Forward impact particular memory health.	1.8	5736448
159	528	10	0	Buy create because exactly behavior.	1.1	1697792
143	462	8	0	Term term indicate hard follow.	0.9	3489792
298	716	4	2.1	Way talk alone pretty TV wall worry.	2.0	1390592
206	667	7	0	\N	1.9	2233344
147	662	4	0.4	My nice role team rest public wonder.	1.6	2000896
298	722	1	0	\N	1.9	5391360
198	1170	4	2.8	True hour front fly among. Leg nor enjoy if.	0.7	467968
102	1033	4	1.5	Player own almost field wall. Deep show accept real reflect.	0.9	2331648
112	624	4	1.7	\N	0.9	2278400
155	78	3	0	\N	1.2	175104
183	376	8	0	Skill two option example daughter voice site. Speak really lose young get cell career throughout.	1.6	2199552
291	322	9	0	Special plan test decision hospital mean police move.	0.6	3086336
80	237	4	2.3	\N	1.2	5959680
67	739	4	1.0	Against east lose itself often.	1.7	2497536
185	457	5	0	Design staff likely force.	0.8	2173952
247	916	10	0	\N	2.0	2586624
203	1209	10	0	Alone listen eat strategy structure set find.	1.6	8120320
148	1195	5	0	Each single popular dream lead.	0.7	3255296
87	978	1	0	Hand by people room actually indicate.	1.1	4847616
93	648	3	0	Get we indicate of could.	1.3	1166336
301	126	4	1.6	\N	1.4	304128
305	392	4	0.1	Role discussion reality identify full.	2.0	5326848
180	947	1	0	Fact high bed. American should eight action just national.	0.8	2245632
95	1051	4	1.6	Teach five second carry.	1.2	8055808
107	993	4	1.3	\N	1.2	3892224
132	560	3	0	Cause central service despite top.	0.8	825344
2	1059	4	1.3	\N	1.5	6434816
47	978	3	0	Reach first color.	0.8	6773760
201	1072	8	0	Behind bed family fast reduce air still.	0.5	8135680
212	328	9	0	\N	1.8	3964928
20	111	4	2.3	Garden to watch dog local and any. Name the member provide new significant.	0.8	5553152
102	1021	1	0	Responsibility law fund.	1.7	5289984
223	369	4	1.8	\N	1.0	5125120
288	762	10	0	\N	1.5	1628160
62	1194	8	0	\N	1.3	687104
218	227	7	0	Your fish walk part something lose benefit.	1.4	5936128
267	624	7	0	\N	1.8	3889152
201	1071	4	1.4	\N	1.0	1358848
136	584	4	2.4	\N	1.1	7881728
292	378	3	0	Defense establish throw party. Cold development wife beat animal anyone.	1.8	7529472
101	1182	4	2.4	Weight check near research cost trial soon.	1.1	2065408
12	361	4	1.3	Door visit under sound game.	2.0	7906304
210	1158	4	2.5	Response ability enough win write.	1.4	1359872
190	758	4	2.4	Draw low at might.	1.7	4980736
10	742	4	1.9	\N	0.9	4758528
152	620	4	1.2	\N	0.9	6345728
73	871	4	2.6	Successful look compare shoulder month trade.	1.2	1997824
305	386	8	0	Region great light ten industry natural continue.	1.7	2810880
205	622	4	2.8	\N	1.1	3230720
175	148	9	0	Somebody cell public fear say fear. Range my walk town fire actually.	1.9	5154816
21	1028	4	2.7	Must certainly his program yeah information.	1.5	2541568
47	972	8	0	\N	1.0	2976768
275	1091	6	0	\N	2.0	5511168
307	394	1	0	\N	1.4	3841024
255	1161	4	2.2	\N	1.1	5939200
95	1053	4	2.9	\N	0.6	6939648
177	261	8	0	\N	0.9	1197056
120	181	4	1.5	\N	0.9	704512
198	1157	8	0	\N	1.3	6503424
6	170	4	2.6	Charge research follow per space perform toward. Risk different mother build much recently whom it.	0.8	5084160
70	971	9	0	\N	0.7	3297280
214	1096	4	1.0	Consumer least plant whose movement night.	1.0	8180736
172	286	10	0	Keep try gas along animal again agent act.	1.9	5573632
77	4	4	1.2	\N	1.8	1235968
47	979	8	0	\N	1.3	6074368
228	848	1	0	Local dog per finish.	1.8	437248
70	968	7	0	\N	0.8	2250752
14	86	4	0.7	Upon new agree account.	1.7	4498432
61	463	4	2.6	Really fall community any reflect.	0.8	4482048
163	234	4	2.6	\N	1.8	4679680
259	941	4	2.7	\N	1.3	3091456
202	884	4	1.1	\N	1.0	4615168
121	685	4	2.5	White most look read where need film.	1.9	2648064
23	488	9	0	Relate return arm sometimes perform still.	1.7	3197952
5	865	10	0	Wind bad every.	1.2	3287040
178	524	4	2.7	Apply it message table fire scientist commercial.	1.3	2469888
233	72	4	2.4	Small box who least never eight. Paper unit back will.	1.9	6754304
300	232	1	0	\N	1.3	172032
115	532	5	0	Purpose bar action difference short prepare floor director.	0.8	1284096
244	266	4	1.5	Suddenly manager unit explain especially movie. Section agency hear focus.	0.6	5381120
23	491	1	0	Less state organization eye relationship watch.	0.9	7526400
73	887	6	0	Whole down author by.	1.0	321536
2	1051	4	1.6	\N	1.6	968704
234	812	4	2.8	\N	1.7	4999168
65	385	5	0	\N	0.5	2793472
267	623	6	0	\N	1.0	6438912
268	606	4	1.4	Visit room hard change brother add.	0.6	1848320
143	457	4	2.7	\N	1.4	5113856
206	671	4	0.8	Carry laugh material rock former perhaps.	1.1	730112
280	330	8	0	Particularly foreign policy statement city team.	1.1	7463936
303	1094	1	0	\N	1.9	6690816
166	401	1	0	General assume reveal customer maintain like.	1.0	2094080
125	1062	4	1.2	\N	1.7	403456
245	213	3	0	Moment free maintain impact later. Drive never quality product upon later.	1.8	1311744
119	30	4	1.8	\N	1.0	4293632
5	887	4	1.7	\N	1.3	3415040
2	1042	10	0	Heavy religious peace federal including parent lawyer quickly.	0.7	4665344
192	378	4	1.7	\N	1.2	5468160
201	1074	1	0	Force hard information whom according among. Outside choice lead soon.	2.0	576512
114	858	5	0	Fast represent difficult guy may center.	2.0	2139136
126	1178	4	1.7	Avoid the help lay feeling discover wall.	0.9	4386816
15	935	6	0	Strategy growth daughter what authority bring.	1.7	7480320
150	253	10	0	\N	1.7	7630848
310	151	4	1.4	\N	0.7	2249728
100	303	4	1.0	\N	1.9	5423104
286	1128	3	0	\N	1.7	728064
50	117	4	1.6	Role consumer reveal.	1.0	7009280
301	144	10	0	Drug front defense candidate. Report them ago right agreement.	0.6	4646912
134	1142	4	2.8	\N	1.7	2465792
170	433	4	0.9	\N	1.8	836608
111	923	7	0	\N	1.3	5068800
255	1170	4	2.8	\N	0.9	2065408
53	587	4	2.5	Million deep model should skill. Air majority office knowledge loss.	1.5	5314560
270	436	4	1.9	Another just recognize parent receive something experience.	0.6	7182336
154	844	10	0	\N	1.2	2410496
114	878	4	1.3	Performance national sometimes describe less.	1.4	3859456
91	257	4	2.0	School stay car operation article make fly.	0.7	7974912
125	1048	8	0	\N	1.8	1609728
306	608	6	0	\N	1.6	6285312
150	260	4	2.0	\N	0.7	3472384
52	1154	4	2.8	\N	0.6	1428480
40	489	4	2.3	\N	1.0	5323776
100	288	8	0	\N	1.8	6322176
54	707	7	0	\N	1.5	8087552
96	701	7	0	\N	0.7	4722688
268	595	7	0	\N	1.8	314368
263	379	1	0	\N	1.3	3651584
267	622	8	0	\N	0.8	2169856
205	631	4	0.5	Carry leg assume explain free I foreign.	1.4	2627584
122	855	4	1.5	\N	1.2	2966528
68	297	4	2.8	\N	1.1	6003712
284	154	4	1.8	\N	1.9	5944320
111	900	5	0	\N	1.1	4088832
1	821	3	0	\N	1.4	3089408
145	1203	4	2.2	Red attack machine community book.	1.9	4184064
150	259	9	0	\N	1.8	4234240
159	544	3	0	That probably avoid become course perform.	1.0	5489664
275	1075	4	1.6	Of sing street deep hold couple decade.	1.0	5507072
301	123	1	0	\N	1.3	4674560
153	944	1	0	\N	0.6	4574208
46	1076	5	0	Cell base still foreign middle study. Protect yes year firm computer position space.	1.2	7331840
74	248	4	0.8	A look we song it road size.	2.0	1680384
297	750	4	1.8	So course truth.	1.6	7980032
255	1168	9	0	\N	1.8	7437312
208	676	4	0.9	Race article politics material face establish benefit strategy.	0.9	6012928
97	358	4	2.6	\N	0.7	1961984
202	861	4	2.8	\N	1.8	2818048
257	362	4	0.4	Grow specific economy Democrat executive they.	1.3	2820096
59	477	4	0.7	Around friend remain already reality form policy.	1.1	8243200
52	1172	1	0	\N	1.0	1486848
229	248	4	1.0	\N	1.1	2703360
301	133	4	2.1	\N	0.8	3990528
58	562	4	2.5	Your side appear throw.	0.6	1812480
203	1206	5	0	\N	1.3	534528
61	459	1	0	\N	1.6	2065408
127	637	4	2.2	Natural different raise office.	0.5	4659200
7	978	4	2.7	Open administration soldier serious agree above.	1.9	4519936
164	962	4	1.2	\N	1.0	8258560
294	1213	4	1.0	Ever financial together keep especially buy.	1.2	4614144
50	113	4	1.8	\N	1.3	1390592
112	611	1	0	Someone measure tree single suffer.	0.9	5688320
225	996	10	0	\N	0.9	7371776
223	377	4	2.9	Why because lot baby provide deal follow.	1.7	2111488
159	530	4	2.8	\N	1.6	6134784
5	879	5	0	\N	0.6	6331392
73	862	4	2.3	\N	0.9	2311168
203	1215	4	1.4	Foreign almost black how.	1.7	3207168
189	554	4	2.1	\N	1.5	400384
240	860	4	1.8	Center sing million yeah.	1.3	2229248
203	1224	4	0.6	\N	1.4	3759104
24	86	4	1.3	Listen everyone trouble perhaps situation manager.	1.0	6166528
95	1064	4	1.2	Adult help both ready.	2.0	6001664
233	51	4	1.8	\N	1.8	2101248
85	1108	1	0	Tv across class leg. More agent both.	2.0	6063104
2	1046	4	1.8	\N	0.8	5075968
57	555	10	0	\N	1.0	5890048
85	1109	5	0	\N	0.6	7785472
19	831	1	0	\N	0.6	1372160
144	993	4	1.3	\N	0.8	8210432
280	326	7	0	\N	1.3	2822144
288	754	6	0	\N	1.8	2479104
158	198	4	0.9	\N	1.7	343040
53	579	5	0	People our attention eight long citizen middle.	1.2	6199296
138	24	4	2.9	\N	0.9	3224576
57	556	4	1.9	Small brother thus big yet.	1.5	7117824
5	873	4	2.3	Camera clearly change positive reduce risk.	1.9	6835200
162	555	4	2.7	Reflect couple suffer language media control.	1.5	5488640
244	277	10	0	Collection third administration over individual.	1.0	3713024
69	235	4	2.0	Send show gas.	1.0	260096
43	111	4	2.3	\N	0.7	3697664
81	1003	9	0	\N	1.3	4851712
94	1167	9	0	None difference action moment response couple voice.	1.9	1973248
234	819	4	1.0	\N	1.4	6174720
284	150	4	2.7	\N	1.9	3674112
125	1045	1	0	Focus change situation when require miss whole. Again wrong follow nothing toward ground political.	1.9	2217984
73	877	4	1.2	\N	1.7	2560000
216	1071	4	1.4	\N	0.8	6368256
246	747	4	2.4	\N	1.8	8115200
78	1232	3	0	Final training those foreign various few.	0.5	7046144
244	264	6	0	\N	1.0	7162880
56	1104	8	0	Church mind feel voice boy performance realize. Three consider cold arrive.	1.4	242688
238	327	4	2.6	\N	0.6	5921792
132	554	4	1.2	\N	1.2	451584
151	454	5	0	\N	1.5	7101440
146	1104	7	0	\N	1.2	8103936
93	665	9	0	Important top more member share recent.	0.5	1257472
70	965	9	0	\N	0.9	7143424
58	561	6	0	Safe discussion near view. See across identify dog.	1.1	2387968
308	693	4	1.0	\N	1.5	900096
186	244	4	1.3	\N	1.3	548864
215	723	4	2.5	Among situation pick.	1.5	6370304
223	370	3	0	\N	1.2	1284096
155	69	4	2.4	Mission garden design figure side certainly they.	1.8	5699584
91	261	9	0	Generation over should so.	1.3	3599360
206	673	4	1.9	\N	1.5	2505728
153	937	1	0	\N	0.8	5487616
196	441	4	1.1	\N	0.7	2152448
52	1168	4	2.2	\N	1.6	6131712
28	207	6	0	Offer discussion difference many approach form.	1.4	2822144
106	332	9	0	\N	1.0	3612672
43	115	4	1.3	Try get various onto. Hand represent why especially.	1.3	356352
255	1172	9	0	\N	0.7	5439488
242	890	8	0	Large even herself successful during suddenly. Instead may hope child series range.	0.6	5600256
202	883	4	0.9	Have worker high some member program seem.	1.6	1124352
126	1188	9	0	Single with drop apply buy leg. Behavior street about interesting discussion.	1.1	226304
255	1154	4	2.7	Old among skin option east central. Lot everyone likely design respond.	1.2	7927808
249	270	4	1.3	\N	0.6	659456
77	14	4	2.8	Budget defense pretty myself change hour medical. White environment great star.	1.0	6553600
194	690	4	0.7	Pretty red southern movie detail question move.	1.5	7627776
216	1077	4	2.5	Talk black as effect turn help suggest under.	0.9	223232
236	461	6	0	\N	1.6	5060608
148	1182	4	2.2	Factor campaign group.	1.6	923648
264	835	4	1.2	Mr detail tax dark give another tonight.	1.0	1880064
43	109	10	0	\N	0.9	4686848
26	509	4	2.9	\N	1.1	1482752
7	979	7	0	Site true finish born. Mission thousand ever see religious each become.	0.9	6450176
215	713	1	0	Window window could such light purpose nature.	1.2	2031616
93	669	5	0	Car agent office.	0.6	1204224
121	693	7	0	\N	1.3	4619264
31	756	4	1.6	\N	1.5	4504576
129	463	10	0	Center later unit institution class.	1.6	3098624
44	107	4	0.1	Middle produce economy.	1.0	5975040
141	822	4	0.4	\N	1.3	6728704
102	1034	4	1.1	Central act skill window man senior try.	1.9	5857280
258	1176	4	2.9	\N	1.6	4227072
175	124	4	1.8	Fund occur race determine yeah.	1.7	1487872
3	260	4	2.0	Miss hope that read. Simple commercial show she listen.	1.8	1160192
187	426	4	2.9	Sometimes increase red challenge.	1.8	7748608
247	918	10	0	Space argue suddenly.	1.8	135168
302	297	4	2.8	Office night miss above wish.	1.0	6801408
218	223	4	0.8	Mother down worker gas local.	1.8	4865024
295	708	4	1.3	With however that finally become Republican analysis.	1.2	3197952
159	538	4	1.1	Skin pattern none gas. Only inside fast true trade box scientist hear.	0.7	2566144
263	367	4	2.9	\N	0.7	4685824
73	870	10	0	Base live young a industry point report.	1.2	4057088
147	653	4	1.1	Computer it at against social. Hit produce positive kitchen none building home.	1.8	2477056
162	557	1	0	Local need call rise office cultural production fine.	1.2	7620608
92	563	6	0	\N	1.7	3139584
119	33	4	2.0	Play cost ball successful easy trouble political.	1.7	6290432
107	995	7	0	\N	0.8	627712
249	262	4	2.2	Drop pick mind yet above most argue.	0.9	1793024
158	185	4	1.4	\N	0.7	1486848
90	602	4	2.2	Deal rock itself daughter herself garden relationship. Fact fight try as head wall officer.	2.0	804864
250	292	4	0.1	\N	1.1	1142784
209	297	10	0	Truth in enough.	0.6	1325056
294	1209	10	0	Customer tonight rich hold. Thought most model account politics food third.	1.0	2847744
53	580	5	0	\N	1.8	260096
98	1144	4	0.2	Employee present point. Opportunity recognize without easy.	1.4	6701056
100	314	4	0.7	\N	0.9	5522432
68	306	3	0	Walk key concern.	1.2	5039104
29	279	4	2.9	\N	1.2	6072320
88	1086	4	1.8	\N	1.5	7183360
191	739	4	1.0	\N	1.2	6733824
76	598	4	1.7	\N	0.7	556032
44	113	10	0	Tend term education let whole.	1.6	1056768
8	205	4	1.2	\N	1.9	300032
135	70	4	1.2	\N	0.7	5870592
21	1016	4	2.2	\N	1.9	7496704
115	536	4	1.9	\N	0.5	5282816
296	849	7	0	Popular poor positive picture successful vote.	0.7	2868224
156	337	4	1.5	Civil ten agency father outside international.	0.7	4310016
234	809	4	2.7	\N	0.7	7009280
231	245	4	2.8	\N	1.9	3046400
178	537	4	1.9	\N	1.9	5912576
95	1060	9	0	Prevent feel business or sure whether use beautiful. Enough by suggest quality pay speech.	1.4	8194048
206	654	4	1.0	Meet operation young.	1.6	2555904
268	603	4	2.2	\N	1.1	2285568
282	824	3	0	\N	0.9	4101120
274	631	4	1.8	House number compare. Throughout media pass social truth become meet.	1.7	6708224
257	360	6	0	\N	1.3	4135936
250	302	5	0	\N	1.3	7782400
310	162	4	2.6	\N	1.5	5349376
142	431	4	2.4	Agreement individual hotel while.	1.8	5496832
242	887	4	2.0	\N	1.4	4826112
36	945	5	0	Up movie wonder.	1.2	539648
101	1197	4	1.2	\N	1.4	1953792
232	829	4	0.8	Cut green experience although watch since section.	0.9	2977792
66	350	4	2.4	It myself history popular laugh change you.	1.3	6416384
222	1227	4	0.9	That set not dog.	1.5	4804608
89	626	4	1.9	\N	0.9	3702784
137	740	3	0	Take end ground seat though power.	1.2	5241856
125	1068	3	0	Increase attorney police soldier agency go.	2.0	5899264
308	682	4	1.1	Beyond investment city action effort theory.	1.5	4861952
221	1104	9	0	Goal city mind.	1.8	1280000
242	879	3	0	Indeed appear economy alone anything his trial.	1.3	7378944
191	737	4	1.5	Professor step do board.	1.7	2516992
276	560	4	1.2	\N	0.6	1085440
62	1175	6	0	\N	1.9	4037632
20	96	4	1.5	\N	1.6	6928384
126	1196	10	0	Avoid option case list.	0.7	7915520
156	342	4	0.3	List sign stand method.	1.1	7627776
43	95	9	0	Develop own million scene couple trouble who sound.	1.8	6838272
114	884	4	1.1	\N	1.3	7375872
5	859	4	1.4	Mind may far population she set avoid.	0.6	3678208
289	188	7	0	Avoid group nor significant population very one.	1.9	1977344
286	1139	7	0	\N	1.3	4219904
206	659	4	1.3	Local relate little say he.	1.1	6502400
172	282	6	0	\N	0.6	4456448
212	329	4	2.5	Which account future attorney go.	0.9	6095872
303	1096	4	1.2	\N	1.4	736256
121	689	7	0	\N	1.7	7852032
201	1075	4	1.4	\N	1.0	4951040
143	451	4	1.4	\N	1.0	621568
216	1070	9	0	Challenge partner if yard old us.	0.5	1750016
205	624	4	1.7	Employee case raise tell company.	0.8	3403776
236	460	4	1.5	Late interview board teacher edge hour despite actually.	1.5	5325824
196	422	4	1.5	My sing walk prepare down follow.	1.6	4435968
163	232	4	1.2	Speech area friend all mission without ask.	0.7	4713472
147	646	4	1.8	\N	1.2	5183488
41	268	5	0	Difficult such character strong indicate. Wind return her project explain.	1.2	8115200
180	943	3	0	\N	1.6	7531520
301	122	4	2.6	\N	1.4	8076288
36	939	10	0	\N	0.9	1267712
277	999	4	1.3	\N	1.8	1057792
140	576	4	2.6	Buy behavior whose enjoy.	1.2	1668096
75	278	10	0	Him term bank here clear.	0.7	403456
80	228	4	1.3	\N	0.5	5074944
69	219	4	2.8	Part when relate act brother page.	1.3	7989248
174	495	4	1.7	\N	0.9	2063360
99	556	4	2.1	Opportunity south threat. Receive type whatever choose.	1.6	800768
7	972	7	0	Task citizen mention page foot. Dream draw cell seven.	1.5	7677952
157	1233	4	1.2	Put whether just television view exist require for. Prevent specific next level record measure create mind.	1.9	463872
295	722	1	0	\N	0.8	2340864
224	400	10	0	\N	0.5	5344256
12	359	4	1.6	\N	0.8	3618816
86	1140	4	0.9	Leave look former because.	1.0	2145280
281	413	4	1.6	\N	1.5	2420736
94	1152	5	0	\N	1.8	567296
243	849	3	0	Stand clearly possible hold.	0.6	3549184
240	865	1	0	\N	0.6	506880
267	625	6	0	Cut couple bit third.	0.5	5104640
9	992	4	1.2	\N	1.6	4180992
54	721	4	2.4	\N	0.8	1208320
110	391	4	1.5	\N	0.8	6206464
33	790	4	1.0	\N	0.6	7874560
77	7	4	1.1	His education fall raise probably police who conference.	2.0	3018752
29	278	4	2.5	Difference soldier more assume on yet new.	0.9	4891648
57	557	3	0	Home watch baby that sign knowledge early. Prevent all soldier all history eight.	1.8	2677760
46	1071	4	1.4	\N	1.9	567296
35	1197	4	1.2	Time join performance in.	1.5	1185792
88	1077	4	2.0	\N	1.4	6598656
5	889	6	0	\N	1.3	7969792
82	649	4	1.8	Free practice big memory mention.	0.9	1874944
288	750	4	0.2	New late open very room offer manage.	0.6	4945920
102	1017	3	0	\N	0.5	4509696
126	1184	4	1.4	\N	1.0	5063680
209	292	9	0	\N	1.8	781312
106	339	8	0	Heavy yeah treat more story war follow truth. Book mother ahead production no actually tough.	1.1	2115584
107	994	7	0	\N	1.9	7027712
167	7	5	0	Past area its home south.	1.0	2969600
90	601	7	0	\N	0.5	2795520
113	501	7	0	\N	1.3	3364864
109	1005	4	2.4	Thing from take door support.	1.0	7717888
89	615	10	0	\N	1.7	6846464
27	39	5	0	Pull move business game onto.	0.8	451584
135	72	1	0	Far moment area role. World laugh choose late allow.	1.2	8112128
103	252	4	1.8	\N	0.8	5805056
302	296	9	0	\N	1.7	2148352
217	1229	5	0	\N	0.6	1338368
1	796	9	0	Those red push floor finish account almost.	1.6	5286912
211	400	4	0.3	\N	0.8	7878656
156	346	4	1.3	Blood responsibility officer another treat program wonder meet.	0.9	7246848
167	18	3	0	\N	1.1	5415936
240	886	3	0	\N	0.7	1411072
95	1048	7	0	\N	1.1	5648384
284	163	5	0	\N	1.4	5924864
279	561	4	2.2	Tend all amount then now article those parent. Staff air bank chair new free.	1.9	2869248
193	334	4	2.0	\N	0.7	1411072
245	216	5	0	\N	1.3	6013952
294	1215	4	1.4	\N	0.6	7274496
307	393	4	0.9	Glass material spend cup clearly fish test.	1.8	7993344
161	1053	10	0	\N	0.9	465920
93	661	4	1.7	\N	0.6	7947264
100	306	4	0.0	Grow subject stand tend goal color.	1.4	3535872
141	828	3	0	\N	1.9	7265280
300	224	4	1.1	Fall agent great Mr free effect enough. Remain wife a same arm house.	1.3	3779584
279	575	4	2.4	Blood most month lawyer save middle girl.	1.4	2585600
38	1122	4	1.2	Hot travel sit I.	0.7	3692544
279	568	7	0	\N	1.5	7283712
304	737	4	1.5	Item course for stop manager.	1.4	7964672
22	54	4	2.7	\N	1.4	2736128
96	681	1	0	\N	1.7	2459648
161	1059	5	0	Image kitchen bag decision break indicate middle.	1.9	2130944
90	607	4	1.0	\N	1.5	4251648
252	245	4	2.8	\N	1.5	3398656
249	257	10	0	\N	1.5	8102912
209	304	8	0	\N	1.5	1307648
184	459	5	0	Law dog audience too sure south. Market thing ok ok amount at record.	1.1	7659520
142	439	8	0	Energy couple loss per agent our.	1.2	6157312
175	122	4	1.0	\N	1.9	4219904
114	875	5	0	\N	1.8	931840
218	215	4	0.0	Recognize keep then hear statement agreement great.	1.3	5977088
121	700	4	2.6	Information fly system century market.	1.0	617472
185	451	7	0	Night talk table scientist mother interesting.	1.3	8062976
139	1007	4	1.7	Add deep ten until forward already.	1.8	4085760
142	445	4	1.4	If their develop road whole almost.	1.2	7620608
1	795	4	0.6	Very ago past word real her.	0.8	4831232
21	1019	4	2.8	\N	1.4	5960704
86	1127	4	1.3	Cell scene serve we buy. Before husband teach suddenly light inside its.	1.2	5573632
155	65	4	1.8	Land mind actually box result ask.	0.9	666624
244	253	4	1.1	\N	1.1	4711424
194	680	1	0	Mother table region camera.	1.2	5139456
203	1213	10	0	\N	1.0	6050816
90	605	3	0	Scene same hundred line include.	1.4	3956736
138	27	4	1.8	Site statement job product.	1.2	5323776
104	359	6	0	\N	0.9	3582976
43	102	4	2.0	Account statement source pattern not interest. Stock case act.	0.8	4500480
115	525	4	1.7	\N	0.9	2200576
268	600	4	1.3	\N	0.5	1392640
189	557	4	2.3	\N	1.5	1122304
43	97	4	2.4	Different ten remain pressure.	0.8	277504
70	964	4	1.2	Offer conference economic light fill manager.	1.1	815104
5	869	7	0	\N	0.8	8224768
300	234	4	2.6	Region sport if feel continue. Bit life practice high guy support.	0.9	8152064
240	859	10	0	Bill third ago member skill expert.	1.9	1468416
237	379	4	0.9	\N	1.5	5075968
159	523	9	0	\N	1.6	1251328
226	791	10	0	Tell time can first tax.	1.4	2176000
26	507	1	0	Would either professional white parent.	1.3	7054336
233	58	4	1.9	\N	1.4	4613120
275	1084	6	0	\N	1.8	5444608
25	173	3	0	Type month style still society room bed data. Drug have play go go threat explain.	1.4	3278848
82	673	10	0	\N	1.0	4682752
145	1219	4	2.5	Friend team think issue.	0.7	1734656
77	19	4	1.7	Against significant south eight among.	1.7	5129216
40	505	4	2.4	Generation true deep project main song north.	0.7	525312
31	757	10	0	Garden speech movie lot into. Include drug quickly special nor hold news someone.	1.2	1915904
306	607	7	0	\N	1.8	3514368
69	213	10	0	\N	0.5	978944
247	919	4	2.6	\N	1.7	196608
40	502	1	0	Charge how director.	0.5	5346304
235	1173	8	0	Consider consider friend today.	1.4	5655552
50	108	4	2.7	\N	1.4	6867968
136	594	4	1.5	\N	0.7	2439168
79	559	4	2.6	Rise hold yard without under.	1.4	4803584
43	104	7	0	\N	0.9	3899392
310	149	7	0	Few sense parent nothing artist notice wish. Natural candidate goal certain trip.	1.9	7923712
237	375	4	1.2	\N	1.9	6846464
177	269	4	1.8	Begin present decision event total.	1.8	2459648
38	1123	4	0.9	End available speak close.	1.5	5563392
84	344	4	1.5	\N	1.7	4747264
308	680	4	1.7	Certain together across deep bag newspaper deal miss. Decision knowledge involve everything.	0.7	7130112
196	423	4	2.6	\N	1.6	7494656
241	520	3	0	Method anyone response report eye firm role.	0.9	1887232
218	226	5	0	Leave behind shake he pressure environmental.	1.7	4503552
193	345	4	0.2	\N	1.2	5695488
185	456	5	0	\N	1.3	3077120
159	548	4	2.4	Quite entire cold.	0.8	1988608
289	193	9	0	They house weight name seven number.	1.4	4485120
109	1011	8	0	Soldier foot buy reflect company avoid office start. Lose everyone reach one quality give response boy.	0.8	614400
153	941	4	2.7	\N	1.4	7984128
40	490	4	1.0	Her thought tree attention ever instead.	1.1	4400128
159	531	4	2.2	\N	1.8	6705152
117	579	9	0	Have act whole cultural.	0.8	2771968
233	47	1	0	Whether decade goal.	1.9	2923520
291	315	4	2.7	Conference himself machine.	1.2	5891072
206	644	10	0	Wear the respond idea bad energy someone.	0.7	1232896
288	760	4	1.9	\N	1.8	5218304
233	64	4	0.0	\N	1.3	3291136
22	55	4	1.5	Lay least sit age.	1.6	6560768
115	553	9	0	\N	1.0	574464
81	996	4	0.6	Senior two different probably better ever health.	1.6	4040704
3	266	9	0	Live decision ever professional.	1.5	1297408
233	48	1	0	\N	1.7	5689344
265	1232	3	0	Example record weight himself public land full. Compare pull answer mother natural strategy.	1.6	6822912
243	853	4	2.6	Whose region fire civil second difficult stay.	1.0	4523008
41	261	4	2.5	Could show mission court special while.	0.6	5958656
209	316	5	0	\N	1.4	2966528
100	319	1	0	Seem PM left left. Want staff possible plant.	1.0	858112
221	1107	4	1.3	\N	2.0	2064384
102	1036	1	0	Front national way kind scene director.	1.8	7657472
206	658	4	2.2	\N	1.8	6795264
35	1189	3	0	Hundred describe hold strong modern old. Operation worry into.	1.9	2706432
20	99	4	1.8	Area body set how same.	1.1	3049472
73	889	4	1.3	\N	1.2	2226176
77	11	8	0	\N	1.3	6022144
291	304	1	0	\N	0.9	2112512
59	481	4	2.0	\N	0.6	8253440
2	1057	6	0	\N	1.2	4506624
309	826	4	0.6	\N	1.0	1464320
247	906	4	1.5	\N	1.9	224256
263	369	4	1.8	Increase this discussion over. Under course as still.	1.5	2865152
113	494	4	1.9	One note attention.	1.3	2535424
293	554	4	2.1	\N	0.6	5293056
170	421	4	0.0	\N	1.3	1996800
113	497	4	0.9	\N	0.9	4242432
178	553	4	0.7	\N	0.9	488448
176	1008	9	0	Person responsibility leader around budget move safe. Western Mr must law.	1.7	5698560
150	269	4	1.8	Free respond anything especially.	1.9	5963776
135	52	4	1.3	Allow person beyond loss power perhaps area.	1.1	212992
164	952	9	0	\N	1.0	7030784
105	1082	4	0.5	\N	1.5	7525376
156	347	4	1.3	Myself green market represent customer.	0.5	1058816
188	1184	3	0	\N	1.8	5101568
54	713	1	0	Before present analysis treatment anything.	0.8	2151424
298	731	9	0	\N	1.1	5458944
61	462	10	0	Window play majority performance culture. Week manage term fire.	0.8	8270848
105	1074	4	0.8	\N	0.5	2992128
297	760	4	1.0	Better current seek deal leg strategy religious.	1.7	6156288
194	689	4	2.4	Commercial writer almost.	0.6	4332544
152	630	3	0	Old newspaper tonight approach way enough.	0.6	1315840
112	620	4	1.2	\N	1.3	3292160
35	1177	5	0	Rich operation because.	0.7	899072
193	348	4	2.5	These spend power woman different. Organization later turn however picture executive politics.	0.8	740352
66	343	4	1.5	Natural number beautiful star PM environment.	1.4	5320704
253	673	6	0	\N	0.8	242688
158	188	8	0	\N	0.9	4185088
59	478	4	2.8	\N	0.5	4865024
289	195	3	0	Both knowledge own soon.	1.6	8004608
50	115	4	1.3	Suggest interesting six standard address item.	0.7	4752384
300	216	4	2.8	Energy class environmental business professional.	1.5	7718912
68	309	10	0	\N	1.8	3512320
5	888	4	1.0	Maintain concern rather morning simple carry simply. Listen over I religious many from.	1.8	2401280
134	1144	4	2.5	\N	1.9	5399552
224	402	4	1.9	\N	0.9	1350656
115	542	4	2.0	System mother painting answer there lay they. Industry task argue beat training glass measure enough.	0.7	6428672
167	5	6	0	Arrive well another yes such.	1.7	214016
73	867	4	0.0	Summer form will with American behind trial. Night stuff visit peace travel he.	1.8	108544
86	1129	6	0	Sport key model himself civil value. President whole while third how tell near.	1.0	2396160
147	668	9	0	Nation war bed economy.	1.6	3212288
17	1146	4	1.2	Will lawyer raise loss bank should. Effect together line so education.	1.0	195584
56	1102	4	0.9	Budget store turn his month.	1.7	1419264
142	443	9	0	Until plan director.	0.5	5937152
237	378	10	0	Unit voice avoid opportunity lot read hit. Successful in more experience red.	1.5	6851584
84	354	10	0	\N	1.9	3636224
142	440	3	0	\N	0.9	8230912
111	902	4	2.4	\N	1.4	7449600
257	358	4	2.6	Receive idea even here probably.	0.8	7631872
22	52	4	0.8	\N	1.9	1438720
113	490	4	0.6	Economy music picture world.	1.0	2284544
100	290	7	0	Ready special individual sea.	1.6	968704
93	655	6	0	Thank spend police stand.	1.1	4750336
210	1150	7	0	\N	0.8	4381696
68	303	4	1.0	\N	1.1	2580480
268	598	5	0	\N	0.7	4553728
193	349	10	0	\N	0.9	6989824
67	741	4	1.4	Evening prove nearly record trouble total. Husband here road truth task training information discussion.	0.9	315392
147	672	4	2.0	Unit section eat.	1.7	2006016
80	224	4	0.3	Partner today million account.	1.1	726016
181	1097	4	1.3	\N	1.3	7200768
118	851	3	0	Edge once outside outside.	1.8	2314240
163	209	5	0	\N	0.6	7884800
170	442	4	2.5	Middle his plant generation safe theory agree. At kitchen suffer marriage.	1.8	6716416
93	668	5	0	Cultural soldier toward street high something note grow. President tree pretty should.	1.5	1932288
155	59	4	1.3	The result training.	1.9	6482944
203	1222	4	1.2	\N	1.1	561152
82	644	9	0	\N	1.4	7014400
194	698	4	1.8	Pull something eat car.	0.9	6845440
2	1054	4	2.7	\N	1.7	1274880
56	1099	4	2.3	\N	1.2	711680
245	217	3	0	Benefit head him central increase.	0.6	6307840
143	463	8	0	\N	1.8	3100672
242	886	4	1.1	\N	1.8	8282112
223	368	4	1.8	\N	0.7	4455424
127	638	4	1.1	\N	1.1	7431168
184	450	9	0	\N	1.6	2581504
142	447	8	0	Decision author partner behind energy cold sing.	1.5	2446336
207	985	6	0	\N	0.8	1018880
34	986	4	2.1	\N	0.7	3578880
19	833	1	0	Cultural star how become week account.	1.2	4895744
268	596	4	1.8	Speech any do ball.	1.3	6194176
170	449	4	2.4	\N	1.2	6464512
16	984	6	0	Section conference treat trade teacher word speech.	0.9	3712000
302	315	4	1.3	\N	0.5	6643712
193	339	8	0	Activity still crime chance more.	2.0	3182592
22	80	7	0	Up whole cost than note reality not take.	1.1	7230464
63	249	4	2.0	Father study bill growth would.	1.9	7092224
124	980	4	2.9	Three only page piece instead type eye.	1.1	3727360
258	1193	7	0	Mind world information property sound.	1.5	4061184
151	458	9	0	\N	1.2	8178688
64	363	4	1.5	\N	0.6	7483392
272	798	5	0	Wear him risk sport might use. Ready design nothing so energy truth value.	0.5	4464640
54	714	4	1.8	\N	1.8	5752832
206	647	6	0	Against two policy impact above.	1.9	6670336
262	738	8	0	Best week sit its nothing reach.	0.9	2201600
33	791	4	1.0	\N	1.2	6866944
215	731	1	0	\N	0.8	5827584
202	872	4	2.7	\N	1.4	6595584
70	967	8	0	City wonder value condition quite author. Form according stand what need.	1.8	3138560
211	402	9	0	Keep small region theory these rate should.	1.0	1698816
267	631	6	0	Despite hit whose responsibility month.	1.8	5232640
40	507	8	0	Involve however sense market read girl.	1.4	1180672
204	585	4	0.9	\N	1.2	6894592
301	128	4	2.2	Be by they compare. Card ability fund way interesting born age.	1.8	3303424
6	172	7	0	Bank security different example.	1.0	6204416
252	249	4	1.7	\N	1.0	6308864
145	1225	4	1.4	Red pull fish.	1.3	3344384
96	682	4	1.1	Baby receive serious our condition magazine continue.	1.4	4905984
286	1135	4	2.9	Black put catch food true.	1.9	7138304
308	684	4	1.7	Also necessary various.	1.6	868352
147	670	8	0	\N	1.4	5866496
253	664	5	0	\N	1.5	5968896
297	753	5	0	\N	1.6	6797312
308	691	4	1.7	\N	1.8	1524736
22	74	9	0	\N	1.7	3788800
69	225	10	0	Also finish capital success.	1.1	198656
209	314	4	2.3	Together reflect evidence young late about raise.	1.3	4907008
112	632	4	1.9	\N	1.5	5820416
125	1040	4	1.1	Through my should. Some purpose perform new stay treat law Congress.	0.5	1985536
236	454	7	0	\N	1.9	1202176
250	320	3	0	\N	1.9	1601536
31	762	4	2.1	Behind bit back already husband significant near.	1.5	3003392
202	865	4	2.9	World social question six. Run contain structure full.	0.6	3309568
71	732	1	0	\N	1.7	2460672
66	348	4	2.5	Among trade should business various.	1.9	3377152
88	1078	4	1.4	Attack building system central appear.	1.8	451584
209	305	7	0	\N	1.2	425984
235	1150	4	2.8	Thus specific cost stand.	1.1	6974464
185	460	6	0	Clearly tough enter program.	1.4	377856
1	817	4	1.0	\N	1.2	7422976
188	1185	5	0	\N	1.7	2404352
96	702	4	0.8	\N	1.8	568320
297	758	4	2.9	Growth social difficult minute pull notice.	0.6	6445056
180	940	4	2.6	Us particular apply politics after commercial little. Occur expect everything partner.	1.5	556032
188	1182	3	0	Direction pass various. Onto represent perhaps cup.	0.8	1805312
182	90	4	2.7	Your show show health. Light wall seem impact next guess human.	1.6	3787776
20	110	9	0	\N	0.9	1012736
22	71	7	0	\N	0.6	7388160
3	254	5	0	\N	0.9	2775040
22	61	4	2.6	\N	1.7	3092480
289	186	9	0	\N	2.0	3492864
107	991	4	1.3	Wide particular loss record sing go idea.	0.7	4056064
270	433	4	2.2	\N	1.5	5467136
87	979	10	0	Age set enjoy ahead act scene important parent.	0.9	7103488
52	1155	5	0	\N	1.0	6379520
305	396	5	0	Teacher marriage know threat itself rest.	1.9	872448
155	76	4	0.4	\N	1.6	6363136
26	496	4	1.5	\N	2.0	4390912
29	281	5	0	Data member drug want successful year drug affect.	1.2	120832
295	723	9	0	\N	1.8	899072
163	226	4	1.4	\N	1.6	7133184
112	610	4	1.4	\N	1.7	7734272
253	670	4	0.1	Along already country positive.	1.5	5103616
246	740	4	1.6	Agent hope at art. Bring after quite up image daughter.	1.8	6482944
255	1156	9	0	\N	0.7	7109632
302	294	4	1.4	She suffer money follow here different. When person hot moment experience.	1.1	3207168
269	514	1	0	\N	0.7	3078144
23	499	4	2.5	Offer between his type measure force. Model four between allow family.	1.4	7806976
194	684	4	1.8	Probably statement policy fear kind reflect right Congress.	0.9	7715840
176	1012	4	2.6	Value sure must whose this true.	1.3	3414016
278	695	4	1.5	\N	0.9	5287936
162	558	8	0	\N	0.9	5612544
185	453	4	1.0	\N	1.4	2411520
159	527	7	0	From event return experience offer gas along. Traditional drop common direction environment coach.	1.6	4984832
166	406	5	0	\N	0.9	8229888
245	221	4	2.0	Strong positive cost.	0.9	6829056
270	420	4	1.7	\N	1.6	415744
101	1177	4	1.9	\N	1.0	5340160
270	425	7	0	\N	1.0	1691648
116	634	10	0	Fact rock within.	1.6	3445760
94	1150	4	2.8	Offer city child trip unit reach notice.	1.1	1499136
293	557	4	2.3	\N	1.9	4691968
6	179	4	2.6	Hour system road.	1.4	8134656
69	222	4	2.2	\N	0.6	1595392
200	942	4	1.7	Better really set on.	1.5	1129472
256	750	4	1.8	Evidence easy sure major choose plan. Responsibility financial concern sit would team.	1.2	1629184
170	432	4	2.3	Education both threat deep establish accept action. Bit word room type happen.	0.8	3246080
113	508	4	1.8	Fight upon then.	1.6	6483968
80	225	4	1.8	\N	1.7	407552
233	54	4	2.7	\N	1.2	2367488
30	804	10	0	North avoid he nor establish. Study fall night.	1.8	3510272
65	388	5	0	\N	1.0	7657472
93	663	4	1.0	Feeling pattern none land much go.	0.6	2584576
23	497	8	0	\N	1.1	1380352
245	229	4	1.9	\N	1.8	3185664
58	569	4	1.4	Floor four among start wall option.	1.7	2052096
185	452	3	0	Exactly particular president difficult once.	1.2	4439040
215	711	5	0	\N	1.2	2017280
266	475	4	1.8	\N	0.9	4331520
161	1048	4	0.5	Thing six cultural ok. Lead system itself.	1.3	3785728
80	223	4	2.8	Easy those know hard doctor.	0.7	3487744
101	1175	6	0	\N	2.0	8044544
159	534	9	0	Generation tell can skin them down. Drug although radio stage.	0.8	5768192
240	885	4	1.3	Understand actually while green.	0.9	6047744
76	595	8	0	\N	1.5	420864
175	147	9	0	Kitchen son always actually listen kitchen. Student structure weight leg arrive out perhaps single.	1.5	5817344
10	743	6	0	Deal prevent stage that.	0.7	2581504
242	870	10	0	Result since authority indicate bad front. Fill maybe need place.	0.6	2859008
55	453	4	1.2	Seat week none sign degree.	1.3	2427904
97	365	4	1.7	Perhaps involve agent rise chair item cover.	1.0	7228416
58	565	4	2.1	\N	1.0	6497280
44	111	4	2.3	Provide little plan ball Republican ago dark.	1.9	6847488
93	666	10	0	\N	0.9	3345408
119	29	4	1.3	At each consumer.	0.6	2158592
23	494	4	1.9	Hard consumer better case be rich.	0.7	527360
29	282	8	0	\N	1.8	4040704
308	694	6	0	Big training than society.	1.4	5197824
9	994	3	0	Help sort hotel main end toward sell land.	1.6	7820288
55	458	4	1.6	\N	0.9	336896
242	885	4	1.2	\N	0.6	7738368
70	954	9	0	Glass back then nothing.	1.9	1515520
111	914	4	1.0	Magazine grow ask.	1.7	3638272
249	265	4	0.9	\N	1.4	3649536
120	196	4	1.6	Arm avoid while during. Enjoy style senior.	0.5	2759680
300	215	4	1.7	Trouble paper skill mother would.	0.7	1693696
40	488	6	0	Democratic energy however machine international.	1.1	8124416
215	718	4	1.6	\N	1.2	557056
80	214	4	1.5	\N	1.7	1246208
159	539	4	2.9	\N	1.9	1999872
205	628	4	1.0	\N	1.5	4895744
281	412	4	1.8	\N	1.1	6663168
128	1115	4	0.4	\N	1.8	5144576
274	623	4	2.1	Serve fast middle ever.	1.1	6932480
187	441	4	1.9	\N	1.9	5105664
224	403	5	0	\N	0.8	6721536
221	1097	4	1.3	Necessary oil doctor catch production once.	0.9	7186432
100	296	4	1.7	\N	1.2	7612416
135	51	4	1.8	\N	1.2	6241280
158	196	4	1.6	Prevent word point little where sit meeting lot.	1.7	3890176
84	343	4	0.2	\N	0.8	7867392
62	1188	4	2.3	First live scene media.	1.7	5381120
80	229	4	1.9	\N	1.9	3252224
145	1216	9	0	Second project beat minute media name position manage.	1.3	3228672
183	367	4	2.7	That something professor majority industry help. Agreement your few.	1.4	8125440
8	201	4	2.7	Late community though hot water conference network shake. Field fish sing sport hold.	1.1	634880
225	998	3	0	\N	1.0	2877440
295	709	7	0	\N	1.8	2069504
245	220	4	1.0	Pull must dark.	1.9	883712
218	225	4	0.0	\N	1.3	6476800
300	219	10	0	Science prevent by to significant prevent.	0.7	3912704
142	424	10	0	Day those talk six early.	1.6	1988608
78	1228	4	2.7	Professional process in same. Near position news address.	1.7	4369408
19	829	10	0	\N	1.4	1135616
70	949	10	0	\N	1.7	2710528
160	801	4	1.1	\N	0.8	1461248
262	749	4	1.0	\N	1.4	2032640
88	1083	1	0	Month of history town yard guy provide allow.	1.1	1083392
244	268	1	0	\N	1.3	5444608
148	1191	10	0	\N	0.6	5327872
199	328	7	0	\N	1.3	5193728
296	854	8	0	Program difficult cause none media step.	1.2	4048896
182	87	4	0.9	Security pay son knowledge analysis require rate. Message guy management expect.	1.1	7831552
16	982	9	0	Modern really stand.	1.0	6287360
203	1202	10	0	Attention form society determine strategy.	0.9	5488640
285	1090	4	1.2	\N	1.0	3979264
93	658	4	2.0	\N	0.6	3961856
38	1116	4	1.5	\N	1.0	1566720
301	136	4	1.2	None size loss catch. Military author act clear number bring.	1.0	7968768
213	850	3	0	\N	1.2	225280
198	1165	8	0	\N	1.2	1747968
151	459	4	0.4	\N	1.3	2810880
151	462	4	2.1	Teacher too anything whose. Next seat trip group financial character read position.	1.3	5784576
191	740	4	2.7	Miss serious anyone car bank official fill.	0.6	3941376
206	657	7	0	Live nearly economy election perform smile both. Food social top effect.	1.8	6775808
72	1107	4	0.7	\N	1.7	4481024
240	875	4	1.2	\N	0.9	7497728
298	714	4	1.8	\N	1.0	669696
266	476	4	1.3	Across dream food low open eight might. Class late whose involve gas stuff.	1.8	2372608
184	457	4	1.7	\N	0.9	2146304
155	52	6	0	\N	1.2	458752
5	886	4	1.1	\N	1.7	2655232
247	933	4	1.3	\N	1.8	7614464
69	210	4	0.3	\N	1.8	1104896
86	1149	4	1.1	\N	1.8	1625088
48	1192	4	2.6	Statement nearly add sometimes cost no.	0.5	5580800
86	1141	8	0	Maybe increase anything health see develop day.	1.2	4994048
112	631	3	0	Challenge hour enough bag.	0.8	749568
43	110	4	2.0	\N	0.5	2864128
243	851	4	2.3	Produce support finally dog parent he dog.	1.1	4382720
64	357	4	0.4	Pm along perform speech kid brother property.	0.7	490496
137	734	4	2.9	\N	0.7	3112960
159	553	8	0	\N	1.8	3750912
110	382	7	0	\N	1.9	1590272
298	727	4	1.1	\N	1.1	6627328
117	585	4	2.3	Sit person attention he receive reduce.	1.8	7881728
98	1140	3	0	Until together various clearly action impact camera. Fast out hair thus send.	1.3	698368
144	990	4	1.1	High finally win worry get executive.	1.7	4545536
201	1085	4	1.1	Research way talk whose surface.	0.9	7150592
306	599	10	0	\N	0.7	6757376
30	794	9	0	\N	1.3	4111360
69	218	6	0	\N	1.6	5823488
268	605	4	2.2	\N	0.6	3591168
23	509	5	0	\N	1.1	946176
134	1149	4	1.1	Organization usually idea condition. Significant our information more truth none much.	1.2	1950720
10	738	1	0	Number Congress door state. Soon physical person add.	1.6	5278720
89	632	4	1.2	Carry already sing staff. Us particular address scene I.	0.7	6383616
140	573	4	2.3	Middle ready special but.	1.8	229376
198	1164	4	2.7	\N	1.7	134144
54	710	4	0.1	\N	1.5	6160384
26	504	4	2.1	\N	1.2	5798912
27	34	4	2.2	\N	0.6	4723712
211	407	4	1.7	Even seek item crime consider art school. Western major worker skin better begin.	1.7	4706304
127	643	4	2.0	\N	1.7	5179392
43	117	7	0	\N	1.2	2663424
100	291	4	1.1	\N	1.4	4149248
310	152	7	0	Paper argue time end century data.	1.1	742400
12	364	9	0	\N	1.1	4290560
177	258	9	0	Western much get change suggest.	1.1	7953408
142	417	1	0	\N	1.4	8022016
278	689	4	0.7	\N	2.0	1050624
53	592	10	0	\N	1.9	5355520
35	1175	10	0	Here kid movement amount account create.	0.6	4117504
126	1192	4	1.2	Blood face follow drug practice.	1.0	1315840
28	205	1	0	\N	0.9	1600512
146	1110	3	0	May team who theory senior.	0.6	2010112
56	1101	4	2.8	Institution make before visit along where fight debate. Official education house lot worry compare specific movie.	1.2	2340864
82	655	10	0	\N	0.5	4204544
49	1094	3	0	Line message while teacher bit when.	0.6	192512
123	979	9	0	\N	1.6	8144896
118	852	6	0	Trial education close church attention themselves.	0.7	2112512
292	369	4	1.8	Order age amount so.	0.9	3026944
67	743	10	0	Bank night senior only.	1.0	5934080
160	809	4	2.7	Account produce understand though.	1.1	3460096
50	93	1	0	Interview week country reach process send represent.	0.9	1234944
148	1177	4	1.9	\N	1.2	7687168
218	233	5	0	\N	1.5	5181440
170	444	4	0.6	Mind bill tend such at medical.	1.9	1842176
250	291	4	1.1	\N	0.7	7118848
44	104	4	2.3	System blue each just finally.	0.9	3428352
169	262	4	2.2	Behind color during hear real. Base husband feel prepare.	1.6	4509696
242	867	4	2.4	\N	1.6	742400
84	352	4	0.9	\N	1.7	5343232
285	1081	4	1.9	Daughter probably risk government concern learn third if.	0.9	7947264
177	256	4	2.2	\N	0.6	4911104
148	1181	10	0	Movie across party world animal of character kitchen.	1.4	995328
41	276	4	1.9	\N	0.8	957440
58	567	4	0.3	\N	1.0	7456768
295	726	4	2.5	Edge throughout role strong place individual here.	1.8	7791616
40	504	9	0	\N	1.5	558080
157	1228	4	2.7	\N	1.6	3351552
234	802	4	0.9	\N	1.2	3877888
179	452	4	1.4	First like investment one.	1.4	3713024
161	1068	10	0	Avoid memory fish make future enter.	1.4	6551552
235	1152	4	2.4	\N	0.6	1514496
155	54	4	0.9	Girl school arm also low collection letter.	1.9	3217408
92	565	5	0	Reduce four person parent.	1.5	4199424
23	502	5	0	Threat central together behavior develop food.	1.0	2209792
6	175	5	0	\N	1.4	6471680
156	340	5	0	\N	0.6	2069504
141	833	4	1.2	\N	0.7	2638848
266	483	8	0	\N	1.0	1870848
2	1047	4	1.8	\N	1.4	7665664
94	1161	3	0	Their around Mrs chair one.	0.7	5309440
215	705	5	0	Shake evening return easy most Republican civil.	1.8	842752
245	233	1	0	\N	1.9	1267712
248	1101	9	0	Weight reality station think central bag technology.	1.3	5106688
5	860	4	1.8	\N	0.5	7944192
164	960	4	1.6	Maybe across public face cell.	1.8	4356096
300	210	4	1.1	Cell activity next to.	1.3	5860352
196	446	4	1.6	\N	1.0	6832128
38	1117	4	1.2	Compare discuss American dinner well exactly. Card range soldier.	1.3	5313536
85	1100	1	0	Mission view financial. Political two last participant father customer of interesting.	1.2	2095104
105	1083	10	0	\N	1.5	1013760
229	250	7	0	Short certainly food inside himself organization close whom.	1.7	2237440
123	972	4	2.9	This church upon power pass off.	0.5	1583104
165	483	5	0	\N	1.2	1985536
53	581	1	0	Billion blood attention range.	0.9	7704576
54	717	8	0	\N	1.6	5124096
77	21	4	2.3	\N	0.7	2676736
160	815	4	1.9	Should father note pass seat.	1.8	2280448
262	743	4	2.0	\N	0.9	2514944
21	1018	3	0	\N	1.2	6554624
265	1233	4	1.2	\N	1.8	5999616
171	846	4	1.6	\N	1.1	510976
156	339	4	2.8	Commercial night force range view many.	1.4	3367936
185	462	4	0.8	Good create prepare arrive develop.	1.1	4314112
119	34	4	2.1	Everything process money crime.	0.6	7110656
9	993	4	1.3	Middle either impact voice those that. Source say key conference.	1.3	5610496
130	1045	3	0	\N	0.6	3058688
255	1158	4	2.5	\N	1.4	6536192
209	323	4	1.9	Certain place can yes statement air.	1.6	6575104
136	593	4	2.6	\N	1.2	3831808
235	1168	1	0	Themselves scene center close.	0.8	4177920
50	101	6	0	Consumer foreign indicate per dog car cut.	0.9	6352896
20	115	5	0	Body defense nor tax professional store possible.	0.6	2608128
167	2	5	0	View hundred late natural number.	0.9	4007936
82	672	7	0	\N	1.0	5088256
31	750	7	0	\N	1.2	3628032
4	281	4	2.5	Memory meeting military likely address well.	1.3	6780928
27	43	9	0	\N	1.5	1503232
153	947	4	0.5	\N	0.6	123904
110	385	9	0	\N	1.0	2494464
33	766	4	0.2	Once thought dinner audience peace cover remember them.	1.5	7200768
30	797	4	1.5	\N	0.7	1758208
95	1066	3	0	\N	0.8	3010560
161	1049	9	0	\N	1.5	4496384
111	904	4	2.2	Those again imagine use serious. News media off early teach.	1.9	6374400
147	649	4	1.8	\N	1.1	766976
226	785	8	0	\N	1.9	7014400
54	723	4	2.5	Sure key learn personal. Must home east gas first could seven.	1.7	1425408
135	47	6	0	\N	0.6	7761920
74	245	7	0	\N	0.9	6889472
130	1050	4	1.8	Property mission trip whom.	1.5	5073920
137	745	1	0	Throughout water safe citizen. Push by hard blue.	0.7	5916672
236	463	3	0	Into identify state population finish determine dinner.	0.7	5203968
150	268	1	0	\N	1.4	4608000
20	120	4	0.8	\N	1.6	7755776
169	274	4	1.4	\N	0.5	7492608
98	1136	1	0	Hard might federal right art way.	1.5	5337088
108	740	3	0	\N	0.9	5433344
132	555	5	0	\N	1.0	4842496
187	431	6	0	\N	0.7	3615744
250	315	4	1.2	Drop body approach certainly upon campaign.	1.5	5369856
289	191	4	1.1	\N	1.8	7081984
159	533	10	0	\N	1.0	7115776
204	594	4	1.5	Word mention bit many.	0.6	457728
106	356	4	1.0	Thing system computer anything call his.	0.8	1529856
99	555	4	2.7	Hair history both difference.	1.3	6892544
68	310	4	1.1	\N	1.7	3479552
17	1143	4	2.9	\N	0.8	2136064
95	1062	1	0	Few decision wonder talk evening product term.	0.7	6346752
126	1182	4	2.9	Project report cup even herself his.	1.6	3188736
178	545	6	0	Stay ok ahead serious woman impact purpose.	1.0	4028416
59	475	7	0	\N	0.7	5612544
48	1178	5	0	\N	1.1	8081408
190	760	9	0	May price such than dinner often finish. Race look myself two mention author.	1.0	4981760
174	490	4	1.0	Improve place price field.	1.2	1135616
294	1216	4	1.5	Understand base candidate.	1.9	4446208
91	260	4	1.7	\N	1.7	1564672
294	1220	1	0	\N	1.2	4061184
252	241	4	2.2	\N	1.4	6509568
73	861	4	2.8	Indicate think since million.	1.5	6439936
206	661	4	1.7	Child book ground culture somebody before cost. Likely card art black region.	1.3	794624
205	615	7	0	\N	1.9	1630208
218	228	9	0	Couple public see hour class.	0.8	5188608
10	734	4	0.8	Rule audience economy team weight money item. Few politics her else participant customer strong.	1.1	2284544
282	832	3	0	Table character wear still sort run technology quite.	1.5	7779328
52	1166	7	0	Last vote condition indeed nothing home.	1.9	6581248
104	361	9	0	Down front finally team positive company skin.	1.0	3529728
253	650	4	1.8	Together office write trade state.	1.6	1124352
158	191	1	0	Pattern apply note provide avoid there.	1.5	1645568
300	233	4	2.1	Pm action lay tax low.	0.8	5572608
191	748	4	2.1	\N	1.0	4067328
95	1040	5	0	Son tend fast.	0.7	3278848
1	812	6	0	Person his admit condition color. Another again want particularly wait account surface.	1.1	1722368
135	67	5	0	Mr industry board consider think data. Century rock window result voice everything.	1.5	1463296
10	744	4	1.0	Ready drive capital.	1.0	1019904
253	654	4	1.0	\N	0.6	3305472
273	1192	8	0	\N	0.9	1150976
211	403	4	1.9	Quality stop woman develop about.	1.4	6298624
290	1096	4	1.2	First soon apply real must fast.	0.8	2317312
48	1189	4	0.7	Large language much. Difference we form write radio significant shoulder.	1.9	3287040
30	798	10	0	\N	1.0	5592064
216	1092	4	1.4	\N	0.7	4180992
266	472	4	0.7	\N	2.0	821248
106	347	3	0	\N	1.1	5741568
87	972	4	2.9	Paper American not speak. Threat never avoid with under.	1.2	5665792
296	850	7	0	\N	0.8	1572864
291	319	4	1.7	Production knowledge special. Put generation bag.	0.6	592896
61	451	10	0	Standard ago fact final fund store because.	0.7	4227072
125	1050	4	2.3	\N	0.9	5630976
183	370	4	2.7	Way mouth together site talk.	1.8	2324480
226	777	4	1.9	\N	0.9	1801216
263	372	9	0	\N	1.4	3890176
68	289	4	1.1	Public measure traditional both TV.	1.0	2477056
206	656	5	0	Open professional daughter agent. Whose white modern maintain those.	0.8	188416
226	783	6	0	Spring late seek table have. Vote attorney one reveal term hundred.	0.8	4026368
111	897	10	0	\N	2.0	3987456
79	555	4	2.7	\N	0.6	5140480
82	657	9	0	\N	1.1	2034688
278	694	8	0	My beyond computer yard partner.	1.3	1507328
178	550	9	0	\N	0.9	1811456
181	1100	4	1.6	Around room or where water positive important.	1.7	8185856
175	125	4	2.9	\N	1.4	493568
209	306	6	0	\N	1.9	4785152
12	363	7	0	\N	1.9	8083456
94	1165	4	1.9	\N	1.8	1106944
67	742	6	0	Sister former herself.	0.6	971776
155	48	9	0	\N	1.3	7570432
25	169	4	2.4	Spring poor actually important leg attention page trip.	1.9	369664
30	809	4	0.6	Bill lawyer her consider southern soldier. End design rather sister similar decade.	1.7	196608
157	1229	4	0.9	Drop behavior either operation rest finally cup. Certainly sport little sister not politics may.	0.5	4514816
226	768	10	0	\N	1.7	887808
146	1107	4	1.3	\N	0.9	698368
96	703	6	0	\N	2.0	6435840
2	1044	4	1.5	Meet benefit development everybody first say himself. Cause feeling main entire operation once.	1.5	6473728
54	726	4	2.5	\N	1.0	8228864
265	1230	4	0.8	\N	1.8	5168128
93	649	4	1.8	\N	1.9	7888896
158	181	1	0	Next ago bar. Role dog shake front throughout leg.	1.9	7372800
101	1189	4	2.0	Citizen performance artist.	1.8	1261568
35	1178	4	1.7	\N	0.8	3621888
58	572	7	0	\N	1.5	6985728
147	648	8	0	\N	0.9	4093952
233	81	10	0	\N	1.2	8062976
35	1187	9	0	\N	1.8	5979136
160	794	4	1.4	\N	0.6	3395584
198	1155	8	0	\N	1.8	3491840
196	424	5	0	Mouth build important religious PM animal.	0.9	3732480
266	481	1	0	\N	0.8	4934656
147	652	10	0	Project side another thus live.	0.5	1161216
130	1065	7	0	Dog Republican area kid research grow.	1.3	3316736
165	464	4	1.3	\N	0.7	287744
155	66	4	2.5	Class figure month personal around man skin. Owner could when economic address pressure leg nation.	1.6	1357824
194	697	7	0	\N	0.6	7344128
47	976	4	1.8	Time want under himself sense know near.	1.4	2597888
301	148	5	0	\N	1.6	6746112
19	827	4	1.6	\N	1.7	6455296
114	886	4	1.1	\N	0.7	6943744
272	801	4	2.3	\N	1.5	6680576
53	585	5	0	\N	2.0	443392
199	331	10	0	Find way responsibility spring between.	1.0	6452224
56	1105	1	0	\N	1.3	3794944
80	220	7	0	\N	1.5	1033216
224	407	6	0	Pattern blood husband.	0.8	3744768
244	272	4	1.0	Relate seek serve wear full.	0.6	6556672
93	645	5	0	\N	0.5	1563648
196	444	4	2.6	Road condition model start house.	0.7	4884480
202	864	1	0	\N	1.9	973824
163	214	4	1.5	Wall material who fire.	1.9	2576384
121	680	4	1.7	Country kitchen me compare.	1.6	335872
243	856	7	0	Then dream wall oil.	0.8	4727808
235	1153	7	0	\N	1.5	4013056
114	872	1	0	\N	1.1	7248896
203	1221	4	0.7	Capital behavior amount.	0.8	5628928
108	746	10	0	\N	0.7	1442816
100	295	10	0	\N	1.7	7991296
91	263	7	0	However produce item culture six.	1.4	3888128
58	574	4	0.3	\N	1.9	3610624
270	426	4	2.9	\N	0.5	3860480
294	1225	4	1.4	\N	1.0	3238912
275	1080	6	0	Hard practice policy doctor.	1.6	653312
159	522	6	0	\N	1.2	2041856
302	304	8	0	\N	1.5	1286144
7	980	4	2.9	But begin seat care.	1.6	3216384
202	891	1	0	Board build there leg leader rise about. School finish action anyone beautiful.	1.2	6254592
20	106	10	0	Large want high paper turn pick too situation. All you official fear.	1.8	7081984
110	389	4	0.1	\N	1.8	5766144
110	390	4	1.5	\N	1.2	1047552
193	354	8	0	\N	1.5	3425280
26	501	9	0	\N	1.5	7152640
159	525	9	0	Market suffer citizen attack moment seem.	2.0	6298624
209	295	5	0	Ready product city now with wall common.	1.8	1630208
291	292	4	1.6	Behavior very tonight article leader season town relationship.	2.0	4472832
32	1095	5	0	Figure would remember. Where resource reach too term.	1.3	2434048
240	880	5	0	\N	1.0	4725760
218	214	4	1.5	\N	1.9	1223680
284	158	8	0	\N	1.0	7977984
36	935	9	0	Nice probably feeling expect religious.	1.5	3213312
103	261	9	0	\N	0.8	6727680
271	461	4	1.0	\N	1.1	6412288
138	30	4	0.7	Improve morning some power region national herself.	0.6	5133312
114	869	4	2.2	Foreign organization whole late whatever arrive.	1.7	6582272
117	582	3	0	\N	1.0	1925120
242	869	4	0.7	Major enter worker half bill much.	1.9	4544512
137	746	10	0	\N	0.6	3714048
58	576	3	0	Effect office national alone science deep expect.	0.8	5505024
93	659	4	1.3	\N	0.8	8207360
211	405	4	1.2	Simply director put attack tough section after.	0.7	5471232
165	472	7	0	Area key black environmental hit.	1.8	1719296
282	827	3	0	\N	1.6	6476800
307	392	9	0	Read everyone voice authority these clear inside. Develop stand would government board social.	1.3	6241280
190	753	4	0.9	Pick write boy environment.	1.1	8103936
307	396	5	0	\N	0.7	2619392
161	1064	3	0	\N	1.0	5307392
200	935	4	1.4	Behavior local future daughter should.	0.8	2646016
235	1171	3	0	\N	1.1	3979264
54	709	6	0	\N	1.5	1718272
177	257	4	2.0	\N	1.9	2613248
115	530	10	0	\N	0.8	5891072
18	827	5	0	Million personal charge six.	0.8	1028096
134	1134	6	0	\N	1.0	5025792
285	1080	4	1.5	\N	0.5	5177344
195	150	4	2.7	Himself accept language which administration draw.	1.0	1523712
22	70	4	1.2	\N	1.8	1959936
45	842	7	0	Main three yet oil.	1.4	5508096
291	317	5	0	\N	1.3	730112
174	507	6	0	Example sort red. Space finally compare without fund.	0.9	5722112
285	1078	5	0	Entire edge better somebody on.	1.3	7317504
69	233	4	2.1	There rate important stay western hospital. Pressure actually Democrat determine.	1.3	7481344
204	592	4	2.4	\N	1.9	1253376
31	763	1	0	For study politics spring likely.	0.9	4434944
233	74	4	2.4	\N	1.9	2987008
22	51	4	1.8	\N	1.5	5817344
1	798	4	1.2	We five million analysis wait run painting.	1.6	3822592
120	184	5	0	\N	0.7	939008
30	816	6	0	\N	1.7	5207040
196	421	5	0	\N	1.5	3001344
126	1185	3	0	Little about production or result.	1.2	3108864
177	254	10	0	\N	0.7	4034560
166	407	10	0	\N	1.6	6649856
274	621	9	0	Activity street house by.	1.6	959488
68	294	4	1.4	\N	1.5	4256768
206	646	4	2.6	Four finally song reach huge offer newspaper politics.	1.0	3661824
274	628	8	0	Rest drive perhaps behind lawyer small. Loss toward arrive process beautiful cause recently now.	1.6	1086464
17	1137	6	0	Tonight pull concern should. Red office magazine politics account third.	2.0	6326272
159	550	8	0	Scene dark why food thing learn imagine.	0.8	5137408
300	222	8	0	\N	0.7	3840000
164	959	5	0	\N	1.6	7072768
36	936	4	2.5	Box account answer professional bed prepare.	1.9	1094656
148	1176	4	2.9	\N	1.0	7344128
295	704	4	2.2	Begin less there message special huge.	1.1	5971968
164	961	3	0	\N	1.5	458752
169	275	4	1.5	\N	0.6	1474560
240	891	5	0	\N	1.5	4847616
156	351	4	1.5	\N	1.2	8046592
245	223	4	2.7	Personal manage your win young west box.	1.0	6714368
59	484	4	1.9	Represent experience indeed.	1.9	2396160
134	1139	4	1.6	Public reach must ability trouble military.	0.8	1544192
81	999	4	0.1	\N	0.6	1235968
298	704	5	0	\N	0.5	3690496
95	1059	3	0	Two remember cultural develop.	1.5	4275200
70	963	4	2.3	\N	1.6	1032192
148	1178	8	0	\N	1.4	6355968
76	600	4	2.0	Require production a no idea. Answer describe today school.	1.0	4442112
215	709	4	1.8	Democrat around beat hope.	1.4	2714624
66	335	4	1.8	\N	0.9	248832
215	726	4	0.2	\N	1.1	509952
298	709	9	0	Professor medical education war forward three.	0.5	2479104
282	831	4	1.7	\N	0.5	5621760
82	667	4	1.9	Long how present expert.	1.0	601088
305	381	3	0	\N	1.3	2119680
178	551	4	1.0	\N	1.0	7227392
302	321	4	1.1	\N	0.8	6947840
181	1111	4	2.6	\N	0.8	574464
193	355	4	2.9	Claim natural mission card still step draw talk.	1.1	3867648
141	826	8	0	\N	1.6	8172544
235	1151	1	0	Forget network later spend short. Drop occur writer.	1.2	5622784
288	752	4	1.8	Them what civil trial fast carry seven.	1.5	3721216
305	397	9	0	Who tree mission generation.	0.6	160768
77	17	4	0.8	Painting should provide lot.	0.6	1011712
159	532	4	1.2	Nature myself owner way voice.	1.8	726016
72	1110	5	0	Together force debate wish trip lot. Challenge admit message provide may production.	1.4	4805632
231	241	9	0	Condition subject mission.	2.0	8206336
18	830	6	0	\N	1.8	2376704
258	1191	3	0	Item door see quality high smile without.	1.8	7671808
300	236	4	2.8	Own church part.	0.9	1900544
88	1092	9	0	\N	2.0	1917952
22	78	7	0	Red about base about well sure.	2.0	259072
174	498	4	0.8	\N	1.2	2614272
155	81	4	1.3	\N	1.9	6313984
36	937	10	0	\N	1.9	1340416
245	227	4	1.0	Across level could. Second either region establish message.	1.8	535552
259	943	4	2.2	\N	1.6	7254016
233	63	4	1.0	\N	2.0	3567616
83	1001	4	0.2	\N	0.5	1105920
130	1066	4	2.2	Meet medical ground group morning. Pull require north finish point rule argue.	1.5	6714368
238	329	4	1.7	\N	0.6	3289088
206	662	4	1.3	Purpose natural already central.	1.1	2760704
278	702	4	1.4	Deep address health series animal.	1.7	2337792
138	25	3	0	Happy might question artist system.	1.4	7853056
128	1118	4	2.1	\N	2.0	6602752
66	354	4	0.8	\N	0.6	2453504
252	240	7	0	Care argue lawyer modern. Bit number scene receive pay dog.	1.7	2899968
283	413	8	0	Wear suggest bag. Thousand difference prevent cell financial which property.	1.9	845824
203	1205	4	1.8	Pretty director true final speak economic machine.	1.6	7132160
155	75	4	0.2	\N	1.1	4477952
173	940	8	0	\N	1.8	4948992
192	373	5	0	Deep yet fight network. Bank recently others including be budget condition.	1.4	3120128
148	1190	6	0	Drug generation teach scientist have.	1.1	4185088
41	254	6	0	\N	0.8	7886848
33	785	5	0	Produce while any night country bill certainly. Today industry take bag third through practice.	1.8	5289984
251	410	6	0	\N	0.8	2728960
27	25	1	0	Happy mother medical.	1.4	7238656
108	734	9	0	\N	1.3	3743744
121	683	6	0	Pull bad instead probably imagine these.	1.8	4173824
100	312	5	0	\N	1.4	6061056
204	589	9	0	Catch little source bad score affect allow.	1.4	1286144
106	338	5	0	\N	1.6	2114560
89	618	4	2.3	\N	1.4	6284288
38	1120	3	0	\N	1.2	7087104
8	203	4	2.3	Rather child do cut.	0.7	905216
231	248	10	0	Gas crime improve.	1.5	8204288
214	1095	8	0	\N	1.4	5886976
201	1078	9	0	Maybe oil especially start. Knowledge by produce.	1.1	4827136
273	1178	4	1.7	\N	1.0	7074816
77	2	4	1.9	\N	1.1	3545088
125	1043	4	1.8	Sport region owner loss. Available read poor probably second.	1.2	1174528
65	391	3	0	\N	1.4	2260992
93	654	4	1.0	\N	1.4	2030592
257	364	6	0	\N	1.0	7589888
161	1055	9	0	Teacher ball system stage hit far land.	1.2	5907456
169	266	4	1.5	Mr phone investment study ok agreement.	1.1	5938176
62	1181	4	1.1	\N	1.4	6112256
55	457	4	2.7	\N	1.3	1271808
135	68	6	0	\N	1.2	4639744
202	890	4	0.7	\N	0.5	5965824
266	482	5	0	\N	1.8	577536
225	1000	4	2.5	Between people soldier treatment. Star produce one huge tax.	1.4	967680
89	631	7	0	Anyone on both significant still share understand. Gun represent course growth a happen.	1.9	2936832
135	77	4	1.4	\N	0.8	1657856
200	946	1	0	\N	1.5	1532928
94	1160	4	1.3	Church sit cover offer nation.	1.9	6773760
211	408	4	2.8	\N	1.7	6438912
134	1143	4	2.9	\N	1.2	3415040
68	292	5	0	Care clearly almost run.	1.8	2156544
96	683	7	0	Approach enough about require dark crime.	1.0	276480
53	578	4	2.7	Left once compare use education.	0.7	7600128
130	1051	6	0	Thousand back then program very relate.	0.7	4774912
134	1140	4	1.0	\N	1.7	4579328
68	322	4	1.0	\N	1.1	2173952
183	379	7	0	That appear get pattern campaign idea manager. Family effort send for today.	0.7	7293952
88	1081	4	1.9	\N	1.5	5783552
247	926	5	0	Trip market happy follow audience.	1.3	6238208
231	247	7	0	\N	0.7	4293632
259	945	4	2.7	Attack card wife whatever create happy. Ten measure tell raise show.	0.9	1263616
80	209	4	0.5	\N	1.1	3275776
203	1219	4	2.5	New more rise.	1.9	6887424
210	1153	4	1.5	\N	1.5	1484800
119	40	7	0	List church social level.	0.8	6259712
102	1014	4	2.0	And strong this simple. Later late guess economic fish.	0.6	5363712
143	460	4	2.8	\N	0.7	6128640
203	1203	4	2.2	Example represent claim then.	1.5	2040832
187	418	3	0	\N	1.4	4674560
1	800	4	1.2	Nature boy dark identify forward page relationship. Thus positive read special up.	1.5	2041856
142	448	1	0	\N	1.5	8089600
205	626	4	0.4	Including instead information officer occur teacher student.	1.7	6638592
57	554	4	0.5	Indicate central success read why field station. Road television soon.	1.8	7519232
95	1045	4	0.8	Save thank strong stay parent.	1.0	4848640
263	374	8	0	Than always will build.	1.4	2839552
218	224	4	0.6	Question door us financial.	1.6	7426048
50	110	5	0	\N	1.6	8090624
245	234	4	2.6	\N	1.7	1543168
280	328	4	1.9	Investment choose add teach change owner environment. President better truth camera.	1.4	5862400
152	618	4	1.6	Black term indeed new.	1.0	4121600
48	1186	4	1.9	\N	0.9	3523584
20	93	4	1.8	Affect industry article indicate.	0.9	1555456
309	828	9	0	\N	1.3	6236160
95	1044	1	0	\N	0.6	5392384
173	945	1	0	Buy fund road indeed idea miss game. Day concern move style individual become.	0.5	7476224
159	535	4	2.1	Make drop structure nearly central science generation.	1.4	3228672
2	1048	4	1.6	\N	1.3	4159488
245	237	4	1.3	\N	1.7	448512
191	738	4	1.5	\N	1.5	5356544
73	880	4	1.0	\N	1.9	6993920
308	687	4	0.5	\N	1.6	7910400
305	390	1	0	Report ask movie everybody difficult our arrive.	1.4	5805056
301	121	4	2.3	Whole side radio. Still price always determine sound miss set.	1.8	3509248
204	584	4	2.4	\N	0.5	7715840
216	1072	4	0.8	They on stock difficult course memory weight a.	1.3	1264640
216	1086	4	1.3	\N	1.6	7084032
192	374	4	2.3	\N	0.9	6659072
89	630	4	0.4	\N	1.7	4865024
240	872	4	1.4	Until very modern explain become edge study. Decade policy raise around.	0.7	5710848
298	711	4	0.4	Role threat so skill letter. Senior line in table study certain because.	1.2	3842048
117	587	9	0	\N	1.2	6176768
196	436	4	1.9	Keep ahead statement yard.	0.9	1000448
198	1163	10	0	Bar since medical keep become world.	1.4	5725184
218	231	4	2.3	Remain upon down. Far education add where present keep.	1.1	3171328
272	802	4	2.3	Response ok tax security son woman painting everyone. Person live hundred process beyond best education.	0.7	4455424
202	868	7	0	Foreign beautiful information suddenly item try challenge.	1.6	1780736
119	27	10	0	\N	1.2	1507328
301	125	1	0	Behavior inside follow teacher late work include.	1.2	5380096
105	1076	4	0.3	Also dog work be central Republican clearly.	1.0	1815552
206	668	4	2.6	Price forget sign same fact outside me.	1.1	4491264
170	425	4	2.4	\N	0.8	2344960
249	269	4	1.8	Exist situation board in sing treat.	0.9	6986752
27	36	4	0.4	\N	0.8	3135488
221	1101	8	0	Last law seat under.	0.6	2621440
147	654	3	0	\N	1.4	7553024
73	874	1	0	\N	0.7	7871488
174	499	5	0	\N	1.1	6439936
304	742	8	0	\N	1.6	1316864
274	615	8	0	\N	1.5	3787776
145	1221	4	0.7	Along system team decade Mrs receive.	2.0	6416384
308	702	4	1.4	\N	1.6	484352
308	699	7	0	\N	0.6	513024
305	387	4	0.9	Enough very professor practice perform line team.	0.7	3462144
150	255	4	1.4	\N	1.0	2741248
305	395	4	1.3	Themselves but avoid board change.	1.5	4916224
14	87	4	1.5	Air PM get good cup.	1.5	3229696
31	753	4	1.6	\N	1.6	1490944
129	454	4	1.9	It concern according meeting international system.	1.7	3515392
233	73	6	0	Father project provide name around military.	1.3	4924416
118	854	6	0	Other debate in accept when thank guess.	0.8	7251968
130	1049	10	0	Phone group school read age fear. Reach power agree everybody cultural part.	1.2	7119872
15	947	3	0	\N	1.0	2335744
259	946	5	0	Set bed administration question perform.	1.8	444416
100	323	8	0	\N	1.2	3657728
96	689	9	0	\N	1.2	3378176
258	1197	4	1.2	Daughter natural example ball those lose.	0.7	7646208
278	680	4	1.7	Value apply source eye oil run use.	0.6	2180096
155	46	4	2.9	Opportunity yourself across address since occur.	1.7	5276672
309	831	4	1.7	Upon nice hospital both market PM.	1.9	4911104
270	417	3	0	\N	1.2	1739776
274	611	4	1.8	\N	1.2	7853056
211	404	8	0	\N	0.5	1161216
45	838	9	0	\N	1.9	7993344
195	155	1	0	Continue service accept boy thing now day.	1.9	4636672
277	1001	7	0	\N	0.6	7611392
113	504	4	2.1	Against worker ready brother collection subject cold.	0.7	7081984
158	190	3	0	\N	1.3	5981184
117	578	4	2.7	National sing democratic alone near high pattern.	0.7	714752
196	434	4	2.9	\N	1.6	844800
246	746	9	0	Good into prepare vote around class. Usually during color receive set argue behind.	1.4	3421184
160	818	1	0	Sure hundred modern action wrong risk industry.	0.9	3595264
233	56	8	0	\N	1.9	5600256
193	340	4	1.8	Set admit perhaps forget movie every decision. Hear lose suddenly yourself.	1.6	374784
3	273	4	1.2	Dark degree dog third. Manager couple can safe.	1.3	5305344
125	1044	4	1.5	\N	0.7	2379776
128	1112	10	0	\N	1.8	5536768
306	602	4	2.2	\N	1.2	963584
298	724	9	0	Third whole serious today simply weight.	1.8	2503680
198	1154	7	0	\N	1.4	6577152
11	410	3	0	\N	0.8	7601152
147	647	4	1.3	\N	1.4	4124672
194	683	4	0.5	\N	0.6	1426432
128	1126	4	2.5	\N	1.2	3940352
194	681	4	1.5	\N	1.0	4452352
250	311	4	1.6	Team young bit building end exactly. Far believe left value particular.	1.2	7618560
65	390	3	0	Whether and outside to goal scientist break. There effort medical material few care mission four.	1.8	6218752
209	294	4	1.4	\N	1.2	2461696
96	690	4	2.4	Reason class should goal should.	1.9	7040000
137	748	1	0	\N	1.6	5126144
47	973	4	1.2	Alone room series board east campaign.	0.9	8060928
261	1000	4	2.5	\N	1.0	3261440
233	67	4	2.8	\N	1.5	3103744
253	661	4	1.7	\N	0.7	7543808
291	321	8	0	Perhaps stage may.	1.0	7574528
300	221	10	0	\N	0.7	7189504
103	257	4	2.0	Cold together training development.	1.7	883712
310	160	4	1.7	Mind man mother international start. Fill Republican career side.	0.7	5352448
256	758	4	2.9	\N	1.8	6619136
89	623	4	2.1	Thought all research data.	1.5	7321600
155	62	4	1.8	\N	1.8	1908736
245	230	4	1.3	\N	0.8	4566016
157	1234	5	0	Test without up would marriage skill artist.	1.1	4392960
250	305	6	0	\N	0.7	4584448
92	562	4	1.9	Home perform conference carry.	0.7	3825664
160	813	4	1.9	Assume happen truth without total.	0.7	532480
130	1067	1	0	Because letter produce small sometimes.	1.1	5325824
44	105	3	0	Young sign process.	1.7	3211264
196	427	4	1.4	Industry pay bed way successful ago idea. Forward head fact throw success why low.	1.8	4889600
135	64	4	1.0	\N	1.3	6342656
253	647	6	0	\N	1.6	2499584
203	1211	4	1.4	Ability experience some imagine owner song. Quickly provide investment.	0.7	1122304
130	1068	4	2.2	\N	0.7	816128
16	983	4	1.6	Check require sing letter area suffer present outside.	1.5	5703680
272	804	6	0	Challenge third majority but type rather. Water over road heart.	1.0	3407872
293	560	4	0.6	Into pull feeling reality.	0.9	2725888
130	1057	4	0.1	\N	0.9	5387264
30	799	7	0	\N	1.7	7564288
105	1070	4	2.3	Customer paper kind office property.	1.5	1302528
249	271	4	2.5	\N	0.8	3713024
160	796	1	0	Become career trade toward son reveal enough activity.	1.2	1218560
295	720	4	2.3	\N	1.1	2414592
198	1162	5	0	\N	1.0	382976
147	655	7	0	Team election often once some whom now.	0.6	2741248
145	1213	9	0	Challenge in car white image show.	0.8	7938048
286	1144	4	2.5	Color message allow share.	1.4	7337984
273	1189	4	2.0	Campaign act former.	1.8	4009984
181	1103	4	0.3	\N	1.3	7752704
148	1175	4	1.1	Up perhaps data.	0.7	4687872
286	1127	4	1.3	\N	0.6	7740416
298	729	6	0	\N	0.9	3650560
52	1159	4	2.5	Message along style phone already despite form hear.	0.6	4368384
98	1128	4	2.1	Appear TV thousand station or.	1.7	2761728
218	234	4	1.9	Former find fall film.	1.3	646144
106	354	3	0	Miss seek hot computer. Outside fall series else season several religious.	1.6	1810432
44	106	6	0	Sometimes return event change use something network management.	1.6	6910976
65	399	8	0	Kitchen sing Mrs foreign usually walk.	1.9	5006336
17	1129	6	0	\N	1.3	5126144
196	447	4	1.0	Information listen sound operation recent.	1.3	7244800
95	1052	4	1.1	\N	1.7	1721344
61	450	4	0.3	Particular physical perhaps special knowledge more. Offer conference head campaign ability fill cause.	0.7	481280
26	508	3	0	\N	1.1	1385472
242	862	4	2.3	Ok forward imagine in without face entire.	0.9	3064832
189	556	8	0	\N	1.4	2031616
270	437	4	2.6	\N	0.9	414720
30	812	4	2.8	\N	1.2	5578752
18	828	1	0	Star visit interest alone.	1.9	7371776
247	901	6	0	History simple high man ground.	1.2	4995072
47	974	4	1.1	\N	1.7	1700864
130	1040	8	0	\N	0.8	6035456
20	107	7	0	Catch quality democratic town two investment.	1.9	4531200
76	607	3	0	\N	0.6	4916224
248	1097	4	1.3	\N	1.7	4889600
295	727	7	0	\N	1.2	7826432
155	56	4	1.4	Night staff pick.	2.0	2225152
34	984	4	1.7	\N	0.6	4988928
119	28	8	0	\N	0.6	2014208
273	1183	9	0	\N	1.6	3656704
150	254	9	0	Approach already itself something speech offer message spend. Truth they collection financial treatment.	1.4	7473152
175	137	4	1.9	Story including house ask body.	0.9	4099072
66	342	4	1.6	\N	1.1	7065600
245	209	6	0	Western them consumer something think.	1.5	7595008
27	42	4	1.1	Expect quality guy quite protect wonder.	2.0	6016000
202	886	7	0	Majority major number center.	1.7	6681600
20	108	4	2.2	Practice water quite.	2.0	2336768
163	237	4	2.3	Him despite morning the house before.	1.4	3053568
153	938	10	0	Science natural serve south front. Senior with let citizen health our.	0.5	1218560
120	198	4	1.2	Animal feeling event exist.	0.5	4371456
163	235	4	2.0	Edge never involve hair require.	1.0	8014848
267	611	1	0	Management article minute expert scene nation.	1.7	3001344
130	1046	4	1.8	\N	1.6	3428352
270	441	4	1.9	Effect too outside need yard.	1.5	6750208
35	1194	6	0	Real phone develop less prepare face.	1.5	7406592
138	35	6	0	\N	1.4	1062912
236	455	4	1.6	\N	0.5	806912
25	164	7	0	\N	1.7	3007488
156	355	7	0	Indicate leg shoulder fall meeting lay challenge.	1.7	1110016
284	152	4	1.2	Increase reflect rise wish former old system. Reflect low most dinner now.	1.2	2635776
137	736	3	0	\N	0.7	4267008
162	556	4	1.7	This occur crime with perform. Foot support garden think often short forward.	0.9	6539264
269	511	4	1.1	\N	1.5	8216576
50	118	8	0	If gun reach let against camera make.	1.1	1926144
114	879	4	1.0	Finish relationship continue mission drive none.	1.5	2539520
206	649	4	1.8	\N	0.6	6759424
129	453	4	0.8	\N	1.8	2013184
31	754	4	1.3	\N	0.6	7486464
152	617	4	1.8	Least base woman traditional speech.	2.0	4486144
250	297	4	2.8	Matter memory beyond box room hospital. Major maybe space Republican.	1.5	5842944
5	868	1	0	Possible miss road shake part former.	1.6	4013056
73	882	4	2.3	\N	1.8	1851392
278	698	4	1.8	\N	1.0	904192
68	288	4	0.9	Rate threat people best require start.	1.2	6715392
174	506	6	0	Out yet increase news respond. Front score dog than develop.	1.3	5376000
156	335	4	1.2	\N	0.8	1119232
119	32	4	2.6	\N	1.1	2016256
218	218	4	1.5	Involve outside writer manage.	1.1	316416
299	363	4	2.1	Prevent star there event late. Crime more raise movement resource kid treatment.	1.2	771072
203	1220	4	1.7	\N	0.9	7848960
295	728	4	1.7	Also follow military eye owner listen teach. Town million figure join stand doctor.	0.5	5856256
105	1079	6	0	Middle determine once maintain attention four war. Conference join person yet security something.	1.4	2294784
55	459	4	2.7	Party range seem others job century. Food thank whom itself year material early try.	1.1	331776
46	1083	4	1.1	\N	1.5	5733376
82	652	4	2.3	Treatment system power much certainly.	1.0	7888896
102	1032	6	0	Describe thought officer size increase. During history allow suggest southern she.	1.3	3376128
3	257	4	2.0	\N	1.4	6966272
235	1170	4	2.2	\N	2.0	768000
229	249	6	0	Page might similar.	1.6	3016704
33	775	4	1.1	\N	1.3	7685120
176	1007	4	1.7	\N	1.3	4031488
298	713	1	0	Whose task apply take.	1.0	3868672
216	1084	4	0.1	Tax practice whole politics police set.	1.2	5228544
30	806	4	2.3	\N	1.9	1184768
305	388	9	0	Red coach teach let college gas little.	1.3	5275648
89	628	4	1.0	Purpose treat drop top half loss east. Data book we pull drug.	1.6	2129920
275	1087	9	0	Report property great fine a. Window newspaper explain standard might.	1.5	431104
272	819	8	0	Training operation war civil thing hear peace pay. Fly trade bit skill everything wish.	1.5	5795840
82	658	4	2.2	\N	1.9	8035328
70	951	4	1.2	Rich need stock authority picture.	1.1	2523136
245	219	8	0	Computer six family arm trouble behind policy.	0.7	6989824
223	378	4	1.7	\N	1.2	5588992
270	421	10	0	\N	1.5	379904
184	451	4	1.1	Usually together themselves book clear clearly.	1.6	297984
226	769	8	0	Mind price appear finish cold society look.	2.0	6971392
77	3	4	2.9	Ball reality bad quickly either positive. Him power test day serve sell.	1.5	7182336
144	995	6	0	\N	1.1	3041280
209	320	4	1.6	Military amount message purpose attorney ready. Serve training action.	0.7	4720640
135	53	4	2.3	\N	0.8	1886208
184	458	4	0.8	\N	1.0	684032
302	308	9	0	\N	1.4	2284544
245	218	1	0	Third anything provide example including.	0.8	6443008
148	1197	4	1.2	\N	1.1	3562496
271	455	4	1.6	Recent new end.	1.9	6098944
255	1150	5	0	\N	1.0	4763648
130	1043	4	1.8	\N	0.8	8121344
101	1178	1	0	\N	0.6	2678784
159	526	4	1.7	Stuff your relate quite break shoulder call.	1.0	5656576
21	1020	5	0	Actually television because ever already voice. Worry behavior like cover popular know provide threat.	1.3	6452224
87	973	3	0	Something control challenge hard trade visit.	1.6	7961600
216	1089	4	1.3	\N	1.3	3560448
234	806	8	0	More maybe whose low consider amount no.	1.8	1483776
249	255	9	0	Three chance then meet federal particular close.	2.0	6262784
78	1234	4	1.4	Raise happen reach hold.	0.8	5216256
178	543	4	1.2	Beyond successful it food white nature.	1.6	3127296
88	1076	4	1.6	\N	1.8	8212480
278	686	4	0.6	Knowledge anything social good find throughout another. Form goal dinner wish return everything collection sign.	1.1	5135360
289	183	4	1.1	\N	1.5	4456448
299	358	7	0	Quality fly politics matter meet score.	0.5	6925312
166	403	4	1.9	\N	0.7	1632256
160	807	4	2.8	Law provide during house money. Than strategy attention rather upon.	1.4	5785600
98	1129	4	2.2	\N	0.5	2836480
254	826	8	0	\N	1.6	7270400
187	443	6	0	Own despite on audience night smile maybe organization.	1.9	5460992
295	719	4	1.0	Field great ever true movie hotel.	0.7	1942528
169	255	3	0	Decide political guess people. Feeling second large blue.	0.7	2590720
287	732	10	0	\N	1.6	1466368
272	806	4	2.3	Road become parent leave.	1.8	363520
196	416	4	2.2	Trade meet federal realize school many seat detail.	1.7	5185536
121	690	4	2.4	\N	1.1	5185536
102	1029	4	2.1	Ok against appear agent product. Here style challenge vote ready as.	1.3	5960704
142	421	4	1.7	\N	2.0	766976
237	368	4	1.8	A particular apply able always role leg. Bar beat fast unit call last draw.	0.7	7346176
163	210	10	0	\N	0.7	3970048
62	1187	4	2.9	Act seven project arm.	1.2	1652736
1	801	4	2.3	Know rate happy now share.	0.7	6682624
159	524	4	2.7	\N	1.4	6147072
262	741	4	1.5	\N	0.9	7573504
292	379	6	0	Must whose clearly article exist.	1.5	6697984
66	347	4	2.9	\N	1.5	6183936
18	831	3	0	Above travel commercial popular final idea. Major increase win everyone.	0.5	6374400
31	761	4	2.8	\N	1.7	3357696
59	474	4	1.0	Rich decide quite exist owner. Last notice develop professional poor.	1.6	5529600
40	509	4	2.9	\N	1.4	6034432
245	228	4	1.3	\N	1.5	7138304
272	816	6	0	Marriage organization provide owner see.	1.0	7060480
215	730	4	2.7	Country church suddenly our.	0.5	6433792
195	163	4	1.5	Involve national discover.	0.9	1258496
57	558	6	0	\N	1.4	5311488
5	870	8	0	Material own night ground.	1.5	7660544
44	98	10	0	\N	1.2	4871168
125	1056	4	0.5	\N	1.7	7370752
113	488	4	1.9	\N	1.2	3190784
218	209	1	0	Land toward top lead state. Matter effort good prevent ground between ever peace.	0.9	4349952
80	210	4	1.1	\N	0.8	1249280
174	504	4	2.1	There success resource alone never. Up city necessary important chair expect term throughout.	1.8	1766400
163	224	4	0.1	Your key around check low.	0.9	6322176
169	265	4	0.5	Newspaper matter successful big pick page why. Now fire word worker need mouth mission field.	1.6	4455424
246	734	1	0	Firm ever require name how north.	1.4	3454976
103	264	4	2.8	Response instead mission task.	0.7	7901184
17	1130	4	1.1	\N	1.0	3277824
138	32	4	2.6	\N	1.8	7987200
41	252	4	1.7	\N	1.7	5601280
171	843	4	2.6	Cup find shake need soon.	0.6	3175424
183	374	4	2.3	\N	0.6	6988800
101	1192	8	0	\N	1.3	5218304
11	402	4	1.9	Mention hard understand trouble out group.	1.5	8171520
102	1025	10	0	Computer strategy those leader image hotel full.	0.7	4661248
142	446	4	1.9	Somebody cultural people.	0.7	1941504
136	579	4	1.7	Meet step rock receive determine summer.	0.9	5479424
198	1160	3	0	\N	0.7	713728
158	193	6	0	\N	0.6	6365184
194	692	9	0	Matter of dinner red. If answer condition cup clear issue present.	1.0	1688576
44	100	8	0	\N	0.9	3907584
129	452	4	1.1	Week simply federal street television.	0.8	6821888
280	329	8	0	Will factor over wait party site.	1.9	7228416
274	624	7	0	\N	1.2	3816448
44	96	9	0	\N	0.8	5508096
190	755	4	1.6	\N	1.0	5756928
23	503	1	0	\N	1.7	5141504
56	1100	5	0	Woman though attorney box.	0.5	1425408
174	496	4	1.4	Free billion decide city create individual meet especially.	1.6	8003584
65	398	4	1.3	Decide establish same stay value baby magazine.	0.6	8048640
160	812	9	0	Fear court more statement staff simply arm.	1.2	4895744
300	225	10	0	\N	1.7	4104192
247	898	9	0	Situation one large same miss standard stock. Left box third pay more community.	1.5	1607680
279	573	4	0.5	\N	1.6	7854080
50	116	4	2.3	Keep thank painting hard environmental.	1.5	6027264
233	60	4	2.5	\N	1.8	5842944
264	842	6	0	\N	1.7	2038784
187	423	8	0	Live during hold character.	1.3	2211840
123	980	4	2.9	Indicate oil customer mission.	0.7	2792448
300	223	4	2.8	\N	1.2	4202496
202	879	5	0	Our so result only admit.	1.8	1068032
48	1181	4	1.1	\N	0.8	1569792
185	461	4	0.0	\N	1.0	2893824
140	565	4	2.4	\N	1.5	4971520
272	807	3	0	Place see senior race investment mention. Scientist civil agree store bed side teacher.	1.9	2649088
68	312	4	1.9	Rise believe car raise but education.	0.9	2859008
298	708	4	1.3	\N	0.8	2264064
2	1060	4	2.4	\N	1.7	6811648
101	1190	4	2.7	\N	1.4	1995776
23	493	7	0	\N	1.2	7937024
44	91	1	0	\N	0.9	6561792
66	332	4	2.5	Wonder quickly cover floor claim.	1.2	6512640
252	244	4	1.3	\N	1.2	968704
278	687	4	0.8	Rich ask year player.	1.6	340992
81	1001	1	0	\N	0.8	7555072
279	566	4	1.9	Himself money food. Yourself important police customer out debate under apply.	1.2	4600832
194	701	7	0	Establish enough cup tax difficult only.	1.2	3944448
138	22	8	0	Standard rather three receive party.	1.5	5662720
126	1176	3	0	Young difference action radio certain none. Federal wear could control center court dinner.	1.1	1768448
119	43	3	0	\N	1.2	6504448
291	311	10	0	\N	1.5	1733632
174	501	6	0	\N	1.8	3752960
105	1073	4	1.6	With set him money control.	1.9	3923968
170	447	7	0	\N	0.9	5855232
17	1131	4	1.9	\N	2.0	8185856
52	1171	10	0	\N	1.4	5841920
100	305	4	2.1	Manager force fact. Maintain event consider anything education.	0.8	820224
194	694	3	0	\N	0.6	1900544
208	674	9	0	\N	1.8	6721536
5	883	3	0	Start push community everyone.	0.8	2014208
73	868	7	0	\N	0.7	2200576
76	603	1	0	\N	1.6	2012160
103	258	5	0	Scene should week down education term.	1.8	2758656
175	127	6	0	Particularly seven blood within those charge. Involve you deal collection.	1.6	4586496
180	939	7	0	\N	1.6	4014080
146	1105	6	0	\N	1.0	629760
244	252	4	1.3	\N	0.8	5999616
273	1179	3	0	\N	1.7	4591616
266	470	4	2.2	\N	1.7	2400256
27	31	5	0	Stop what media one whole heavy stage. Character water heavy sure probably sort system establish.	1.7	6078464
95	1068	4	0.3	\N	2.0	3023872
62	1186	4	1.9	\N	1.8	8210432
114	861	5	0	Money cost record town forget.	1.7	4390912
62	1193	4	1.7	Science use few simple produce woman.	0.5	4978688
196	442	1	0	\N	1.2	2819072
24	82	8	0	\N	2.0	350208
46	1075	4	1.6	Table religious role school.	1.7	3665920
41	263	4	2.5	Control see religious local section gun necessary. Drug available join course range example different.	0.8	5311488
249	259	4	0.8	Activity learn music serve fund civil mouth.	1.7	1158144
30	820	3	0	\N	0.7	7450624
119	26	4	1.9	\N	1.1	7030784
310	161	4	2.4	\N	1.3	358400
117	591	4	1.3	\N	1.7	2368512
167	14	4	2.8	\N	1.2	1872896
146	1109	8	0	\N	1.6	5159936
294	1224	4	0.5	\N	0.6	1982464
130	1061	6	0	After ball real.	0.7	2998272
295	721	4	2.4	\N	1.1	2450432
112	630	4	1.9	Lot speech newspaper.	1.6	2569216
164	970	7	0	Oil remember toward almost story cup.	0.6	960512
22	79	8	0	\N	0.8	3665920
231	249	10	0	Like executive mouth military part role few science.	0.6	7692288
234	800	10	0	\N	1.8	6144000
103	269	9	0	Economy assume true human.	1.0	4603904
102	1038	4	1.9	President water American plant guy much in. Pay prepare he.	1.2	5287936
123	976	4	1.8	\N	0.9	576512
152	627	10	0	\N	1.6	6564864
177	259	7	0	Play modern identify chair present.	1.1	4273152
154	846	9	0	\N	1.9	2076672
275	1086	9	0	\N	1.8	103424
175	138	4	2.7	Sign summer inside fall show both.	1.8	6590464
308	688	4	0.1	\N	1.1	1546240
126	1181	4	1.1	Baby heavy sure cell.	1.1	3212288
298	715	1	0	Drug list news buy organization other pressure treatment.	0.7	5055488
159	537	6	0	Support bad reflect strong.	1.7	6898688
73	890	5	0	Much skin case speak ask foot tax.	1.2	7797760
114	874	6	0	\N	0.7	1439744
117	594	7	0	Upon interview star last one.	0.6	3931136
188	1187	4	2.4	Federal example daughter music ask career.	0.6	2825216
93	670	4	1.9	\N	1.1	2103296
176	1009	1	0	Home investment through.	1.7	7678976
175	142	9	0	Factor clearly modern financial newspaper activity environmental. It change cut rather program even think own.	1.5	7063552
115	539	4	2.9	\N	1.7	4725760
296	851	4	2.3	\N	1.3	7415808
246	743	4	2.0	Boy physical now tax person moment.	1.0	4349952
131	678	4	0.3	\N	1.5	6586368
84	341	7	0	\N	1.6	3351552
258	1186	4	1.9	\N	2.0	6561792
255	1151	8	0	Act heart amount recent television. Outside ahead detail thing.	0.6	4274176
94	1168	4	2.2	For international eight role throughout stand vote.	1.4	7202816
150	272	4	2.0	Need prepare spring standard not.	1.6	2722816
220	414	4	2.1	\N	2.0	3630080
236	453	4	0.7	Wind guess eight center.	0.6	7416832
76	609	3	0	Candidate national politics avoid receive his goal.	1.1	1498112
62	1196	4	1.8	Option own any summer want year.	1.3	7018496
135	44	4	0.4	\N	0.7	1423360
100	313	4	2.7	\N	1.3	7720960
253	666	1	0	Realize pay administration. Leave life know whose Mrs each.	1.4	6400000
194	687	4	1.0	\N	0.9	2391040
201	1092	4	1.4	\N	0.5	207872
237	367	6	0	Her management purpose simply end. Account attorney yourself such doctor.	0.7	6827008
135	58	9	0	\N	1.9	6737920
99	557	4	0.9	Face democratic if spring reveal attention give build.	0.6	6907904
165	476	5	0	\N	1.9	3100672
54	722	4	0.2	Range safe again sister threat evidence more.	0.7	1316864
227	676	4	1.1	\N	1.6	3000320
237	372	6	0	\N	1.2	8260608
98	1137	4	1.4	Tough term choose cell.	1.5	4921344
89	613	4	1.0	\N	2.0	1718272
209	307	4	0.7	Happy central explain significant writer staff history out.	0.8	3696640
263	378	4	1.7	\N	1.9	2344960
247	914	6	0	\N	1.4	5219328
5	881	8	0	\N	1.8	1698816
309	824	10	0	\N	0.6	6090752
246	737	8	0	\N	1.8	376832
26	493	4	1.7	\N	1.2	3760128
33	780	4	0.0	\N	1.1	4749312
209	313	9	0	\N	1.4	7320576
27	35	4	1.5	Operation consider up.	1.8	8213504
261	998	4	2.8	\N	0.9	987136
69	232	4	1.2	Between marriage foot including store.	0.9	6481920
149	679	4	2.9	Create network follow sister enough read ok.	1.0	6738944
90	597	5	0	\N	1.1	7273472
272	797	1	0	Important fear kid.	1.7	246784
165	470	9	0	\N	1.4	6474752
292	376	4	2.5	\N	0.8	8024064
82	669	4	1.4	North loss case very ready quality.	0.8	4815872
101	1179	3	0	\N	1.3	7933952
88	1089	4	1.3	\N	0.8	1941504
156	356	4	1.0	\N	1.3	3809280
152	615	4	1.1	\N	1.5	7676928
155	63	4	0.8	\N	1.3	7392256
102	1037	6	0	Nice unit analysis rather involve last assume.	1.1	7347200
72	1109	8	0	Third pressure professional property or.	1.8	2829312
41	255	10	0	\N	1.6	7983104
291	289	4	1.1	Wrong between religious whom population exist side.	1.9	5537792
181	1101	4	2.8	\N	1.8	8186880
143	455	7	0	Without actually book each. Notice his star sometimes play how.	1.3	2279424
21	1036	4	1.8	\N	0.8	7960576
187	434	4	1.0	Body minute outside team key.	0.6	5909504
21	1035	10	0	\N	2.0	1453056
297	751	4	1.6	\N	1.0	1808384
240	879	4	1.1	Provide high somebody during whole success offer mother.	0.5	4022272
271	462	5	0	\N	0.8	2965504
134	1132	4	2.1	\N	1.1	5236736
267	617	4	1.8	Serve green itself all far.	1.1	413696
30	815	4	1.0	\N	1.2	5660672
308	698	4	1.8	\N	1.7	2451456
206	669	9	0	\N	1.2	4428800
197	380	4	2.5	\N	1.5	1333248
17	1149	4	0.2	Hard partner produce authority thing interest.	1.4	7040000
254	833	7	0	Seat several store series image although by.	1.6	6746112
255	1152	3	0	\N	0.7	2660352
130	1054	4	0.3	\N	1.9	6192128
183	371	7	0	\N	1.3	6091776
29	284	10	0	\N	0.9	2608128
64	364	4	0.5	Necessary with road go. Measure Congress interesting draw remember language activity line.	1.7	7718912
255	1159	9	0	Hundred believe thus.	1.0	3828736
45	839	4	2.8	\N	0.8	6594560
201	1084	4	0.7	Base sometimes trip generation heart dark.	1.5	1874944
5	867	4	2.4	Total decade difficult memory.	1.8	7714816
22	50	4	2.0	Arrive understand buy. Late home talk animal wide news.	1.5	231424
20	119	9	0	Remain book official instead necessary. Test off respond item ready television officer.	1.0	7242752
148	1194	4	1.7	\N	1.5	600064
161	1056	4	1.6	Manager character still four.	1.4	4420608
30	814	4	2.7	Weight population begin.	0.8	334848
269	520	4	2.2	\N	1.4	882688
79	558	4	1.4	\N	1.6	7991296
123	973	4	1.2	Team condition major any.	1.9	7197696
302	298	6	0	\N	1.8	4849664
205	621	3	0	\N	1.5	7379968
265	1231	10	0	\N	1.8	1786880
83	998	1	0	Degree become onto often news modern support.	0.8	5300224
3	255	4	1.4	\N	1.4	4579328
226	790	3	0	Ten real yourself practice.	1.1	3917824
277	997	4	1.3	\N	1.7	8276992
266	474	4	1.8	Sense movie wonder wonder red.	1.0	5088256
43	112	4	2.1	Heavy try training already tree size to.	2.0	495616
100	297	4	2.8	\N	1.5	5238784
122	857	4	0.2	\N	1.3	5520384
47	977	4	1.3	Establish decide sing color. Congress certainly move while too.	1.8	3905536
198	1156	5	0	Partner travel only describe land place. Stock son against go.	1.9	2178048
54	706	4	0.1	\N	0.6	7726080
302	311	4	1.6	\N	1.1	3292160
130	1069	1	0	\N	0.8	3554304
184	453	8	0	Little base body trip. Everybody street mind medical.	1.3	5646336
269	513	4	2.4	\N	1.8	7846912
93	657	4	2.4	Same hope beyond official economic.	1.8	6338560
17	1134	4	2.7	\N	1.0	3690496
110	383	4	1.3	\N	1.7	978944
116	643	10	0	\N	0.6	1846272
164	964	4	0.3	\N	0.8	4496384
70	950	4	2.3	\N	1.5	7962624
144	991	4	1.7	Increase left sing end whom.	1.5	5898240
155	67	4	2.8	At order describe different. Always short education free form pretty project experience.	0.7	2593792
298	710	4	1.7	Later budget series pay may.	1.0	4429824
182	82	4	2.8	\N	0.7	5895168
294	1207	4	1.1	\N	0.7	6665216
186	240	8	0	\N	1.0	4893696
247	900	4	2.1	Less Republican can mouth father group where.	1.0	6009856
58	570	7	0	Institution couple low close sport anything.	1.3	6834176
267	612	4	1.7	Turn continue option represent.	1.8	6476800
260	998	4	2.8	\N	1.7	4483072
61	452	3	0	\N	0.6	4301824
109	1006	4	2.7	System protect how Democrat edge.	1.7	5031936
235	1159	4	2.2	\N	1.1	1872896
247	892	4	1.4	Interest majority mention PM scene. Their hair anyone book reason community.	1.4	3130368
247	909	4	1.7	\N	1.1	3283968
161	1052	4	0.9	\N	0.5	7287808
100	292	4	1.6	Trip gas remain happen.	1.3	1358848
130	1059	4	1.1	\N	1.6	1941504
131	679	4	2.7	Even someone decision ten debate for trouble.	1.4	5169152
140	566	7	0	Among national wait five guy.	0.9	559104
301	130	7	0	\N	0.5	6078464
8	208	4	1.8	Tax say large.	1.9	181248
120	182	4	2.5	\N	1.7	464896
157	1232	4	0.8	\N	1.5	6446080
187	438	8	0	Challenge media care spend unit full.	0.5	244736
233	46	10	0	\N	0.8	7405568
92	574	4	1.3	\N	1.5	3230720
262	737	4	1.5	Clearly player summer early billion what company.	1.1	6380544
290	1094	1	0	\N	1.1	6806528
233	70	3	0	Agree whether improve attention president skin big possible.	0.5	2572288
202	878	4	1.3	\N	1.0	156672
50	111	4	2.3	Situation rock my professor listen near good near.	1.2	880640
265	1234	4	1.4	\N	1.0	7579648
304	745	8	0	\N	1.8	2187264
209	321	10	0	\N	1.2	1829888
159	545	4	0.9	Citizen court necessary opportunity character determine at.	1.7	2918400
169	254	1	0	\N	1.0	615424
170	443	9	0	\N	1.7	7997440
253	669	4	1.4	Life cut design call floor practice must.	1.7	6703104
115	537	6	0	\N	0.8	7174144
120	197	3	0	They Republican morning model partner very friend guess.	1.1	6798336
159	551	4	1.0	War record woman happy break culture clear.	0.8	7547904
128	1122	3	0	\N	1.5	7364608
161	1069	4	0.5	Couple student artist quality. Traditional thought skill friend test.	1.7	3789824
121	682	9	0	\N	1.0	7758848
306	598	8	0	\N	0.6	2008064
40	497	10	0	\N	1.3	364544
201	1082	4	2.1	\N	1.6	5830656
232	822	7	0	\N	0.6	7574528
126	1187	9	0	\N	1.0	1471488
92	564	4	0.7	\N	1.3	5816320
268	609	4	0.6	\N	0.8	7520256
247	905	5	0	\N	1.7	2249728
113	503	8	0	\N	1.3	8156160
153	936	4	0.4	\N	1.3	3974144
109	1007	7	0	\N	0.6	7251968
10	735	3	0	\N	1.5	7884800
190	756	4	0.3	Together both summer after trial thus.	1.8	1063936
21	1021	10	0	\N	1.6	8206336
98	1138	4	1.1	Shoulder investment keep they focus open learn. First citizen force month especially.	0.5	3511296
84	350	3	0	\N	1.6	4401152
282	829	4	1.6	\N	1.9	3659776
107	992	10	0	\N	1.3	6916096
256	757	3	0	Structure tough how understand staff.	1.1	4567040
252	243	4	1.1	Get individual sense mean. Event choice increase example get of make away.	1.9	4933632
43	101	4	1.7	Central mission great relationship process although.	1.6	3253248
177	274	4	1.2	Economy current hand main.	0.8	3875840
115	550	4	1.9	\N	1.3	3154944
62	1177	4	1.9	People great oil.	0.7	439296
226	787	4	2.4	\N	1.2	7884800
308	692	4	2.5	\N	1.7	4813824
112	614	10	0	Teach especially spring order local gas despite.	1.9	1427456
5	884	3	0	Unit once than owner especially back black.	1.6	2619392
91	271	4	2.5	Control beyond receive base.	1.2	5868544
160	806	4	2.3	Seat despite gas newspaper.	1.0	2295808
23	490	9	0	Fly often red church air than.	0.7	5587968
202	867	4	2.4	\N	2.0	4148224
177	273	4	1.0	Back affect buy share goal.	0.6	461824
59	482	4	2.9	\N	0.8	4717568
15	941	9	0	\N	0.8	808960
135	63	4	0.1	\N	1.4	1014784
35	1182	4	2.9	\N	1.5	4400128
277	1000	8	0	Career enter energy. Foreign reach color develop here.	1.8	7366656
250	295	4	2.4	\N	1.6	361472
102	1023	5	0	Product song successful.	0.9	3714048
195	152	4	1.2	Mention rest these anyone. Agree support support land.	1.3	6508544
47	980	5	0	Magazine his treatment. Expect early common industry born.	0.5	4375552
192	375	1	0	Send material resource interview late.	0.7	6294528
60	380	7	0	\N	1.7	1824768
218	219	4	2.8	Cause score onto reason.	1.6	608256
125	1069	4	1.5	Bring economy effect suffer. Cost describe after.	0.8	446464
250	309	4	1.9	\N	1.6	7517184
266	485	4	2.3	Forward tend knowledge much official citizen.	0.9	7208960
108	748	7	0	Well edge mention so project ask.	1.1	2522112
145	1207	4	1.1	Account her your officer. Building perhaps marriage above.	1.6	5686272
69	234	4	1.4	\N	1.8	1780736
266	473	1	0	Test too employee degree reveal base laugh.	1.3	264192
236	452	4	1.4	Century production at interview respond technology join.	1.7	2166784
272	815	3	0	\N	1.6	5304320
196	419	4	2.9	\N	1.2	3634176
180	937	5	0	\N	0.8	2339840
37	330	10	0	Technology voice most at himself begin include.	1.6	1168384
236	459	4	2.8	\N	1.2	6164480
65	384	4	1.7	They receive difficult find.	1.4	1200128
203	1198	4	0.7	Course but health father rest theory.	0.8	2156544
286	1131	4	1.9	\N	1.6	1305600
78	1231	6	0	Could president staff grow fly loss.	1.7	6851584
119	24	4	2.9	\N	0.7	199680
271	456	10	0	\N	0.5	5696512
56	1106	5	0	End both long between. Include attention budget become unit budget.	0.9	7805952
248	1107	6	0	Town my general how police report.	0.8	2304000
65	381	4	2.6	Thing father health four total. Treat question owner conference.	1.6	710656
70	962	1	0	\N	1.6	6377472
50	109	4	1.0	Call move drug certain husband. Say song bad nor design treat industry.	0.6	4751360
22	46	4	2.2	Every member treatment group.	1.7	4448256
304	744	4	0.9	\N	0.5	5045248
40	508	8	0	Crime off lead budget into free.	0.7	998400
152	632	10	0	Have between pass sister top want body pull. Course especially look wish.	1.8	1418240
151	463	3	0	\N	1.2	331776
115	548	3	0	\N	2.0	5602304
20	104	4	2.3	\N	0.8	6812672
142	433	10	0	\N	0.6	372736
141	824	8	0	Small safe structure follow.	0.9	1768448
250	313	4	2.7	\N	1.2	4689920
148	1188	4	2.3	High writer five parent art lawyer.	1.8	1149952
209	299	10	0	\N	1.4	5744640
25	171	1	0	\N	0.5	911360
10	737	4	1.5	Environment other ten would.	0.5	3279872
138	37	1	0	\N	1.6	7364608
103	266	4	1.5	\N	1.3	2089984
233	68	7	0	Help election couple take represent where every remain.	1.8	3616768
289	197	9	0	Country free he several forget arrive agent.	0.5	3827712
22	67	4	1.5	Father everyone wrong information begin. He son technology keep.	0.7	6053888
86	1142	4	2.8	\N	0.8	582656
171	844	1	0	\N	1.9	7831552
1	808	4	1.0	\N	1.6	7420928
128	1113	4	2.2	\N	1.9	7029760
301	132	4	2.4	Hotel manager physical score role out site pass. Sister face general from term long my by.	0.7	4865024
163	230	6	0	Think people pay investment be each former and. Gun partner floor very other protect.	2.0	4228096
35	1193	6	0	\N	0.5	3095552
178	546	4	1.5	Herself serve analysis. Say capital bar whatever artist.	0.7	4766720
21	1031	1	0	\N	1.2	1496064
221	1110	4	2.2	Ever truth question feel his soon concern.	0.8	7334912
285	1083	4	1.1	\N	1.0	7368704
196	432	4	0.6	Physical offer civil about reason.	1.9	4916224
249	254	4	1.9	\N	1.2	564224
152	616	8	0	\N	1.9	2524160
66	351	4	1.5	She to at rise foreign sense.	0.7	316416
232	826	4	1.0	Store ever onto from nation. Community sister without professional.	1.9	4082688
157	1230	3	0	\N	2.0	1910784
167	12	1	0	\N	1.4	1614848
242	877	4	1.2	\N	1.0	5829632
181	1105	4	1.4	\N	1.8	5341184
282	823	3	0	\N	1.9	3277824
6	177	10	0	\N	0.8	6964224
275	1083	4	1.1	\N	1.4	4249600
165	477	4	2.9	So theory which painting.	1.9	1764352
72	1102	9	0	Prepare school room what scientist rest here.	0.6	1392640
193	350	3	0	\N	1.2	6652928
33	769	4	1.4	Thank far great increase.	0.5	1849344
289	182	9	0	\N	1.9	7520256
6	178	4	2.6	Former consider president model whether.	1.3	179200
292	366	6	0	\N	0.7	460800
73	875	4	2.2	\N	1.8	2646016
110	395	3	0	Benefit sound agent boy draw raise court.	1.0	3799040
25	168	4	1.8	Take others event investment term.	1.1	4360192
170	438	3	0	Show small bag policy back. Accept animal save.	1.5	3517440
232	823	10	0	\N	1.9	6449152
175	139	4	0.0	Avoid open top professor memory.	1.1	5297152
57	559	4	0.5	\N	1.8	2461696
72	1097	6	0	\N	1.0	4425728
62	1190	4	2.7	That despite arm live none.	1.2	6185984
68	315	8	0	\N	1.8	7468032
95	1056	1	0	Help the fire choice home develop hit fund.	1.0	2863104
193	353	9	0	\N	1.1	5479424
308	690	4	2.4	\N	2.0	1821696
66	334	4	2.0	\N	1.9	5152768
88	1091	8	0	Difference half improve piece.	1.8	1476608
117	588	6	0	\N	1.5	1426432
298	718	9	0	\N	0.7	2343936
210	1162	4	1.7	\N	0.8	4094976
154	845	4	2.6	\N	0.8	305152
111	932	10	0	Own can person citizen college speak.	1.6	7578624
90	606	7	0	I coach meeting plan work. Strategy receive teacher expert or off activity.	1.2	8165376
271	451	4	1.4	\N	0.9	2586624
202	889	4	1.0	\N	1.0	5112832
175	123	4	0.1	\N	1.5	4066304
270	434	3	0	\N	1.6	2708480
104	363	8	0	Number nearly side loss continue west.	1.7	3965952
59	485	4	2.3	\N	1.6	5181440
69	209	4	2.8	\N	1.6	1866752
155	58	4	1.9	\N	1.7	199680
215	722	4	2.4	Way claim player often piece character mission look.	0.8	297984
85	1101	7	0	Speech thing president. Son compare full million.	1.1	4335616
41	273	5	0	Under machine summer professor.	0.8	2466816
164	969	4	2.8	\N	1.2	4854784
171	848	4	1.9	\N	0.7	7221248
242	876	7	0	Wish tonight fine gas rather citizen respond. Foot available because music group conference.	0.6	5578752
182	84	7	0	Degree note goal create get policy significant.	0.6	4475904
7	974	4	1.1	\N	1.3	8272896
295	712	4	1.8	Standard want southern house sport.	0.6	2803712
137	737	4	1.5	Shoulder media body analysis sister.	1.7	4702208
175	129	1	0	\N	1.8	7804928
148	1192	1	0	\N	1.3	1456128
152	619	6	0	Doctor without financial firm end mean. Reflect avoid with offer good deep behavior.	1.8	102400
209	322	5	0	Instead law surface ahead visit people store factor.	1.1	1164288
147	673	9	0	Want week our admit machine career night.	0.9	2110464
155	49	1	0	Thousand many lead region address economic we.	1.5	4912128
195	157	10	0	\N	1.0	4592640
218	238	9	0	Expert sense impact art get control consider history. Career building board remember owner.	1.9	3045376
196	433	4	0.7	\N	0.6	8040448
174	503	4	2.9	Environmental spring thing.	1.3	8238080
285	1087	4	2.6	\N	0.6	6443008
278	690	4	2.4	\N	0.8	6212608
1	816	4	1.9	\N	1.5	6715392
66	353	4	2.7	\N	1.5	3954688
116	637	4	2.2	Job five imagine type.	1.6	716800
244	255	4	1.4	Computer late see hot appear.	1.0	3555328
138	28	4	1.2	\N	1.9	798720
125	1053	4	1.3	Away social threat even.	1.2	6350848
77	8	5	0	History same material international reveal.	1.5	2648064
94	1155	1	0	Share generation black material son note leave.	1.0	5079040
195	153	4	1.8	\N	1.1	7084032
122	852	4	2.2	\N	0.8	3486720
85	1102	4	0.2	Population truth others cover reduce so. Grow end purpose type.	1.9	790528
90	609	7	0	Project hit also window hit before.	0.8	6830080
140	575	8	0	\N	1.0	1781760
209	311	4	1.6	Stuff record door trip particularly how worker. Position item strategy every.	0.7	8155136
125	1064	4	1.2	Right somebody key theory.	1.5	396288
228	847	4	2.5	\N	0.5	1358848
273	1185	4	2.1	North fill article land chair southern thus.	0.5	2946048
111	903	4	2.8	Us knowledge lawyer interest such employee.	1.0	2095104
154	847	3	0	Sister still degree sing. Once interesting able financial onto floor.	0.5	2862080
136	578	9	0	Put position board few sell clearly could.	1.6	7580672
46	1078	4	1.4	Then explain accept. Have show anything dinner base yeah effect alone.	1.4	7385088
270	440	4	1.2	\N	1.4	3746816
285	1082	4	2.1	\N	1.4	5402624
276	554	4	2.1	Cell how result family laugh response certainly public.	1.9	1878016
9	991	4	1.6	\N	1.3	261120
204	587	3	0	Argue tax manage allow page.	1.8	1030144
96	686	4	1.3	Rate training out describe score.	1.0	6017024
116	636	10	0	\N	1.5	1347584
116	640	1	0	Responsibility set life paper.	1.8	6128640
192	376	4	2.5	Price stock close.	1.4	6574080
231	250	4	2.0	Hotel himself throw add art each.	2.0	7137280
114	873	7	0	Own teacher total guess back show five remember.	1.7	3892224
238	331	4	2.4	Dark make find.	1.3	2091008
274	627	1	0	\N	1.7	280576
242	874	4	1.7	\N	1.6	7986176
136	577	4	2.2	\N	1.7	5439488
96	700	4	2.6	Environmental into treatment prove.	1.1	3838976
102	1026	4	1.2	Care business news upon.	0.9	2449408
35	1186	4	1.9	Wrong property more race.	2.0	4893696
88	1090	4	1.8	Work growth language name miss green accept. Remain culture information several agent staff travel.	1.4	2046976
307	397	3	0	\N	1.2	7232512
244	259	4	2.6	\N	0.5	2013184
234	820	4	1.1	Family several mouth most institution.	1.9	2955264
213	851	4	0.1	\N	1.5	7940096
43	107	4	2.1	\N	1.3	6960128
177	265	1	0	\N	1.1	125952
306	601	7	0	\N	0.5	3703808
40	498	4	0.0	\N	0.9	982016
291	293	4	2.6	\N	1.2	603136
246	739	4	1.0	\N	1.0	3610624
10	739	4	0.1	\N	0.9	5807104
25	177	4	2.7	Painting student pull different plant.	1.0	5608448
113	500	5	0	Occur best explain miss low leg.	1.4	2940928
253	658	6	0	\N	1.3	3808256
3	265	3	0	\N	0.8	6908928
264	838	4	0.5	\N	1.3	2927616
159	529	4	2.0	Life left about reveal notice industry.	0.7	3134464
146	1099	8	0	Everyone structure can. Require will treat.	1.3	1380352
285	1074	4	2.6	\N	1.8	6093824
278	701	4	1.0	\N	1.4	849920
21	1039	5	0	Far risk single as form. Sing conference two your whom especially edge.	1.7	2917376
1	794	4	1.4	\N	1.9	3723264
272	821	4	1.1	Point best choice many in and type war.	1.2	5995520
163	236	4	0.9	Soon discussion her music.	0.7	2254848
307	389	4	0.7	\N	0.9	5619712
80	219	3	0	Arm worker yes seem price.	1.0	1111040
275	1077	9	0	\N	0.5	1095680
305	383	9	0	\N	1.3	542720
21	1025	4	0.4	Fly trade agreement direction beyond name. Remember sit pick work also treatment.	1.8	3083264
69	226	4	1.4	Inside paper wait must rock. Market truth strategy nice over he mean.	0.9	3078144
139	1010	3	0	\N	0.7	635904
167	8	4	2.0	Upon Democrat democratic raise work.	1.2	7279616
23	486	6	0	Teacher reflect inside someone. End argue cup language.	1.4	5465088
111	906	4	2.4	\N	1.0	2301952
119	39	4	0.9	Despite position out industry summer state care.	0.6	861184
142	419	4	2.9	Into I and last risk fill future represent.	1.8	3410944
172	284	4	1.9	Term usually tonight news trade.	1.9	524288
218	222	4	1.5	\N	0.5	1553408
136	592	4	2.4	\N	1.7	5874688
250	290	4	2.4	\N	0.6	5187584
115	549	4	2.8	\N	1.7	7030784
86	1133	4	2.9	Wish simply by also tree spend strong.	1.9	1165312
198	1169	4	1.0	\N	1.3	1208320
88	1084	7	0	\N	1.7	6265856
154	843	4	2.6	\N	1.4	1983488
213	855	3	0	\N	0.5	7890944
275	1073	4	1.6	Yet population assume rule.	1.6	4620288
169	256	4	2.2	\N	1.0	4587520
80	212	5	0	\N	1.7	1399808
242	891	7	0	\N	1.8	2681856
11	409	4	1.7	Sometimes win street imagine.	0.9	6980608
253	672	4	2.0	East news apply plant.	1.9	3142656
191	741	1	0	World forget game ready. White will lay artist environment rather.	0.6	4404224
286	1143	4	0.8	\N	2.0	8267776
170	427	7	0	\N	1.6	2253824
63	244	4	1.3	\N	1.3	388096
270	431	4	2.1	\N	0.7	7759872
247	913	4	1.5	\N	1.1	8135680
62	1180	4	1.6	\N	1.9	1584128
304	735	6	0	These democratic work as international. Us thought certain help carry.	1.0	5795840
223	379	1	0	\N	1.4	4829184
106	333	4	1.2	Couple low nation sister me media likely. Owner environment join late.	1.3	747520
142	430	10	0	\N	0.8	8047616
278	681	4	1.5	\N	1.1	3342336
253	662	7	0	\N	1.0	2085888
97	359	10	0	Show truth glass method resource firm simply between. Station red participant.	1.4	2830336
113	492	4	0.7	\N	1.2	4662272
90	599	4	1.6	\N	0.6	1571840
114	859	4	1.4	\N	0.6	1283072
28	204	4	1.7	\N	0.8	248832
37	329	4	0.4	\N	0.5	161792
93	673	10	0	\N	0.6	7773184
38	1124	4	2.6	Garden candidate memory produce air win support. Well always which cell where effect.	1.5	6231040
80	230	7	0	\N	1.0	5592064
101	1181	4	0.8	\N	1.1	3326976
213	857	4	1.6	Shake prove mouth seek whole computer west to. Moment home program professor.	0.9	1753088
55	456	4	2.1	\N	1.6	1893376
38	1119	10	0	\N	1.5	4816896
130	1053	4	2.9	\N	0.7	8023040
218	230	4	1.3	\N	1.9	4677632
174	502	4	1.8	\N	1.9	8148992
209	319	1	0	\N	0.5	1397760
294	1201	5	0	\N	1.7	999424
295	706	4	1.2	\N	0.7	6979584
46	1091	4	1.9	Anything ready then discuss.	1.1	5530624
135	55	4	1.2	\N	1.2	1719296
5	890	10	0	\N	0.7	1341440
245	210	4	1.1	\N	1.2	4302848
43	105	3	0	Decide environment hot science.	1.3	1371136
178	521	5	0	Assume positive get story until receive forget PM.	1.6	5840896
159	543	4	1.2	\N	1.4	5083136
296	856	8	0	Image red course magazine white. Campaign from head answer several.	1.1	7387136
74	240	4	1.3	Use leg claim soldier company alone.	0.6	4158464
169	271	4	2.5	\N	1.3	804864
270	449	3	0	\N	1.5	4497408
235	1172	4	1.6	\N	1.7	7057408
53	582	4	2.9	\N	0.6	4474880
309	822	4	1.8	Whatever activity soon many.	0.7	2486272
193	343	4	1.0	\N	0.7	8005632
240	882	4	0.8	\N	1.8	5331968
126	1191	4	2.9	Try lay industry same himself worker. Interesting network wind recognize ago son whose say.	0.7	5998592
142	416	4	1.2	\N	0.6	3277824
210	1169	9	0	\N	1.9	3049472
50	100	4	2.4	\N	1.7	5846016
261	999	9	0	\N	1.3	4486144
23	500	5	0	House deal store class.	1.5	8220672
20	116	9	0	\N	0.5	5584896
87	980	5	0	\N	1.6	4888576
72	1103	4	1.6	\N	1.8	2377728
38	1125	4	1.2	Position home agree probably more.	1.2	245760
170	431	4	2.4	We remember so build night.	1.8	7987200
284	149	4	0.8	Very movement leg season sense chance information church. Green dream despite.	1.4	6740992
11	401	4	1.4	Bring bill medical popular. After so investment.	1.4	7574528
170	426	4	1.8	Ready adult try position.	2.0	5773312
239	380	7	0	\N	1.4	8174592
186	245	4	2.8	\N	1.8	6582272
292	372	8	0	\N	0.7	3987456
79	554	4	2.1	Scene occur detail often forward.	1.5	4073472
25	178	4	2.6	Present beyond whole almost recent military material free.	1.1	6447104
147	663	4	1.0	\N	1.9	7056384
267	618	4	2.3	Why president author concern environment ever.	0.8	3567616
155	71	9	0	Grow prove throw there.	1.4	3386368
300	238	4	1.9	\N	1.1	6084608
145	1204	4	2.4	\N	0.9	799744
54	729	4	1.9	Child yeah economic degree air.	1.0	1796096
135	65	7	0	Imagine writer what single girl. Art occur cup reach their.	1.1	356352
160	819	8	0	Respond little writer truth. Person nature power out.	1.5	6482944
138	41	4	0.1	\N	1.1	4925440
267	621	3	0	Report move herself.	1.9	4730880
200	940	3	0	\N	1.0	845824
91	274	6	0	\N	1.1	3681280
95	1047	9	0	\N	0.6	6126592
161	1066	4	2.0	Get agree capital act indicate night dream.	1.5	5927936
114	862	4	1.8	Remember city doctor. Explain attorney culture be figure.	0.5	7383040
52	1152	8	0	\N	1.0	6470656
270	418	5	0	Opportunity always among direction information.	0.8	8117248
263	370	7	0	\N	0.8	1351680
59	467	5	0	Buy structure science they expert again. Assume weight pass society each.	0.9	4461568
163	229	6	0	\N	1.2	1196032
302	318	4	1.7	Tv poor than life accept task edge structure. Apply plant star evidence.	1.3	6764544
158	200	3	0	\N	1.1	5541888
248	1106	4	0.6	Less her benefit very.	1.0	3941376
80	231	3	0	Party painting theory source job white collection.	1.6	5641216
247	921	4	2.8	Defense product recently foot drug take.	1.3	3094528
242	864	4	2.3	People check society. White door single mother whatever college modern.	1.5	4608000
130	1052	4	1.1	\N	1.1	4111360
28	202	4	1.2	\N	0.6	6222848
134	1130	4	1.1	Mention include enjoy something reduce suffer painting.	1.8	280576
274	619	4	1.3	\N	2.0	6125568
117	580	4	2.7	\N	1.2	4925440
25	175	3	0	\N	1.3	7514112
177	255	5	0	Newspaper term order great us.	0.7	7350272
177	253	7	0	Perform will number campaign minute.	1.8	3933184
45	840	5	0	\N	1.9	7218176
248	1102	4	2.0	\N	0.7	6097920
14	90	5	0	Change break population provide. Phone every probably fly capital method fast.	1.2	6051840
286	1130	4	1.1	Street good responsibility third real hair wide.	0.5	1577984
309	830	4	2.8	Agency part nation do.	0.7	2532352
30	811	4	2.6	Beyond choose image use than role around.	1.1	6542336
142	442	4	0.7	\N	1.8	7855104
244	262	3	0	Authority enjoy into prevent must activity prevent red.	1.9	2747392
193	332	9	0	\N	1.5	1125376
50	91	4	1.3	Analysis cup one institution this.	1.8	3308544
69	231	4	2.3	Exactly tree professional ago develop support eat.	1.5	6287360
178	529	5	0	\N	1.1	5992448
106	335	7	0	\N	0.5	5563392
196	438	3	0	Two agent white these firm produce.	0.6	4691968
203	1199	4	2.8	Anyone seven team deep claim.	1.5	7710720
234	813	9	0	Soon door scientist exist end agree occur.	0.9	4129792
145	1209	3	0	Or really green check identify memory. Value fire do hear society too carry.	1.3	5082112
296	857	4	1.7	\N	0.7	7003136
188	1181	4	1.1	\N	1.0	6913024
90	600	4	1.8	\N	1.5	7056384
126	1186	8	0	\N	1.5	6739968
295	716	9	0	\N	1.7	7133184
213	849	9	0	Strategy still much experience continue reduce. Citizen begin left if prepare national.	1.5	4024320
302	299	4	1.5	\N	1.4	6444032
145	1211	6	0	\N	1.8	7297024
255	1155	4	1.9	\N	0.7	3198976
95	1065	4	1.3	\N	1.3	4443136
117	581	4	2.2	\N	1.7	1813504
65	393	9	0	Plant evidence movie two.	0.6	1681408
188	1177	5	0	\N	1.0	1406976
78	1230	4	2.5	Push protect guess school kid apply sign. Organization buy decide side several trial either.	1.4	5108736
294	1211	4	0.5	\N	0.6	7005184
255	1173	4	1.2	\N	0.9	3750912
23	492	4	0.7	Government future technology never stand. Opportunity our apply risk.	1.7	6590464
113	509	10	0	\N	1.9	4660224
243	850	4	2.1	\N	1.3	1818624
192	368	4	1.8	\N	1.0	8134656
120	192	8	0	Color back her technology.	1.0	4880384
191	736	7	0	Product party same enough.	2.0	7115776
102	1019	4	2.6	War defense consumer difficult. Affect allow employee other.	1.7	6240256
204	586	7	0	Ball about responsibility if.	1.6	2932736
160	798	4	1.2	Style against again. Get another include marriage.	1.1	4713472
76	604	4	1.2	Politics almost you should matter member.	1.2	4943872
19	828	4	0.3	\N	1.2	8000512
89	629	1	0	Show figure it true.	1.4	7432192
55	455	4	1.6	Beat part do do shoulder tonight. Certainly ahead either.	1.3	6238208
194	703	9	0	\N	0.6	3623936
175	135	4	1.9	\N	1.5	2556928
201	1090	4	1.1	\N	1.0	5739520
235	1158	5	0	Serve get full fire while.	1.6	4281344
26	494	4	1.9	Purpose father of us.	0.5	4988928
299	361	4	0.8	\N	1.2	450560
241	516	10	0	\N	0.9	3363840
281	415	4	0.3	Economy daughter couple strong network health staff group. Join arm attack report knowledge affect hot.	0.9	4985856
99	558	6	0	Point wall these job money day baby.	1.6	8268800
295	715	6	0	Relationship report play these occur child.	0.6	312320
242	868	3	0	Will successful language.	0.6	4870144
248	1104	5	0	\N	0.6	1821696
3	275	7	0	\N	1.6	4125696
218	221	4	2.0	Certainly item try sign hit him.	1.2	739328
165	475	5	0	Remain large event drug inside own wrong.	1.0	2715648
3	274	6	0	Material area those political build grow drive.	1.0	6411264
91	276	4	2.0	\N	1.4	4547584
68	323	4	2.0	Mission son hair federal.	2.0	1631232
271	454	4	1.9	\N	1.6	3431424
114	889	4	1.3	Contain meet when suggest send season occur.	1.3	1397760
209	318	4	1.7	Choose approach travel trade design short. Yet chance cultural fine likely.	1.6	1029120
209	296	4	1.7	\N	1.0	1789952
178	523	5	0	\N	1.5	1510400
2	1065	4	1.3	Campaign course kitchen.	1.1	4158464
156	348	10	0	Administration enough record know.	0.9	4886528
111	909	1	0	\N	0.6	7774208
106	344	10	0	\N	0.9	1015808
294	1198	9	0	Term hotel day quickly rather knowledge.	1.4	1052672
84	353	9	0	Political field begin Mr staff open us.	0.8	2310144
215	729	6	0	Might carry wind now fly likely why eat.	1.5	7294976
266	484	8	0	\N	1.6	7543808
298	705	7	0	\N	1.7	1620992
155	44	4	1.2	Bed college start general president such. Nor without catch people character.	1.7	6656000
120	185	10	0	Fill parent argue manage.	1.4	5280768
209	301	4	2.8	\N	1.8	1980416
69	215	4	1.7	One find main manager stand role peace mind. Matter picture expect debate everybody specific.	1.8	1636352
203	1200	9	0	Beautiful note owner past amount move thought recent.	0.5	4082688
72	1099	4	2.3	Energy system thing red table want happen feeling.	1.4	7946240
237	377	4	2.9	Lose seven standard note notice.	1.8	2749440
12	358	4	2.2	\N	1.3	2789376
249	253	9	0	Court reach foreign again.	1.6	2971648
84	332	4	2.8	\N	1.3	1488896
100	321	3	0	Executive affect admit safe crime I each.	0.6	7116800
131	676	5	0	Production recognize us stuff site serious here.	0.6	2027520
40	492	4	0.5	\N	1.0	7054336
301	124	4	1.2	Win less woman measure there guess.	1.8	4240384
291	309	4	1.9	Knowledge natural get much.	1.8	5993472
261	1003	9	0	Data dark bank matter hope rule see north.	1.4	5932032
87	976	10	0	Suddenly more fine administration customer act. Into none much onto.	0.6	2704384
137	744	9	0	\N	0.9	5805056
101	1191	5	0	\N	1.3	7866368
5	858	5	0	Entire toward window building plant thousand.	1.4	1255424
250	298	4	2.7	\N	0.7	3513344
135	81	1	0	\N	1.7	3718144
255	1171	5	0	\N	1.4	2320384
167	6	10	0	Letter get section rock couple left development minute.	1.7	6025216
234	814	4	2.7	\N	0.6	4868096
135	78	4	2.1	\N	1.9	6595584
140	569	7	0	\N	1.0	1978368
228	844	4	1.2	Avoid into ball form make happen.	1.5	3118080
258	1182	4	2.9	\N	1.3	6680576
268	602	3	0	\N	1.7	6343680
170	441	10	0	\N	1.1	6401024
25	170	4	0.4	\N	1.1	3518464
26	486	9	0	\N	0.5	7588864
108	735	3	0	\N	1.1	4159488
113	498	4	2.6	\N	1.7	6336512
3	264	4	2.8	\N	1.3	1127424
261	997	6	0	\N	0.6	7885824
240	863	4	1.6	Own commercial expert reason own. Magazine practice page education these home.	0.8	5692416
296	855	3	0	\N	1.7	4202496
210	1167	8	0	\N	0.7	3613696
167	3	7	0	Thought hard none remain.	1.2	5293056
187	433	5	0	\N	1.0	6221824
27	24	1	0	\N	1.9	206848
267	627	4	2.2	Apply apply red them who that.	1.4	5811200
258	1189	1	0	\N	0.9	3784704
185	458	8	0	\N	1.0	3272704
251	402	6	0	Chair audience either woman.	1.8	1175552
100	300	1	0	\N	1.5	6175744
286	1145	3	0	\N	0.7	1959936
66	341	6	0	Cut center buy bed official.	1.8	7896064
204	577	4	2.2	\N	0.7	907264
175	128	4	2.2	Range operation ten he company toward.	1.5	1815552
188	1194	4	2.3	Congress their glass.	0.7	3117056
215	708	1	0	\N	1.1	7403520
226	775	4	1.1	Street word field color why.	1.3	2186240
187	445	4	1.4	East under move. Allow enough century trouble.	1.8	8196096
175	146	6	0	\N	1.8	7692288
4	284	4	1.9	\N	1.3	3735552
148	1184	1	0	\N	1.9	6843392
21	1017	4	0.9	Whole nearly later total discover my approach natural. Wind former hand small record they everybody.	0.9	3282944
17	1128	9	0	Program billion learn policy.	0.6	4872192
201	1080	7	0	Another know hair decide.	1.2	7752704
69	238	8	0	\N	1.6	8112128
203	1201	4	2.9	\N	0.9	5633024
84	340	4	1.8	Leader even pattern. Our represent recently evidence future.	1.5	7145472
145	1201	6	0	Same kind site sometimes.	1.1	7805952
250	323	1	0	Simple happy cell best chair election almost coach.	0.7	4397056
178	534	8	0	Explain beat now here second way personal.	1.5	6965248
250	293	10	0	Authority set network night science.	0.6	3962880
179	453	4	1.2	\N	1.1	4861952
144	989	5	0	\N	1.0	4781056
266	480	4	2.4	\N	0.9	3303424
17	1144	4	2.5	\N	1.9	7628800
117	584	4	2.4	\N	1.2	7118848
172	283	4	0.7	Even not difference.	1.6	7234560
202	859	4	1.4	\N	0.8	5257216
273	1182	4	2.9	\N	1.0	3924992
135	54	4	2.7	Personal coach occur especially particularly clearly.	0.9	7285760
35	1196	9	0	\N	1.1	5907456
78	1229	7	0	Her yet point order.	1.2	5724160
160	817	3	0	Common color partner mention. Majority rate professor picture style public lawyer.	1.6	2542592
169	252	5	0	\N	0.7	2862080
289	189	6	0	Put forget section on by.	1.9	2305024
93	660	4	2.2	\N	1.1	2306048
129	457	4	2.7	\N	1.3	5505024
175	143	4	2.9	\N	1.0	2720768
191	747	4	2.4	To risk without play. Everybody now mouth today environmental research not.	1.0	2006016
294	1205	8	0	Include beat scientist stop less professor.	0.5	4408320
50	92	4	1.4	\N	1.6	4643840
164	958	10	0	Watch magazine notice include simple usually city.	1.9	3122176
38	1126	4	2.5	Follow family standard commercial share under.	1.8	7268352
253	668	4	2.8	Move certainly father provide can member week.	1.3	4168704
188	1197	4	1.2	Among always floor life image west through.	0.7	2989056
236	456	4	2.1	\N	1.7	7133184
94	1158	10	0	\N	0.8	2390016
145	1218	4	1.2	Arrive student drop country. Leave sing him give base child.	1.0	4254720
48	1176	4	2.9	\N	1.6	4268032
37	324	4	0.6	Maintain central white money figure face would. Despite approach agent discussion modern day.	0.8	4021248
53	594	4	1.5	Attention center prevent rate may.	0.8	1133568
12	362	4	2.8	\N	1.2	2893824
196	449	4	0.2	\N	0.8	510976
309	832	4	0.7	Statement about long wonder cover people. Pick cut though a.	1.8	6096896
270	444	8	0	Example air control fact accept. Send the evidence trouble hope little term.	1.9	4018176
112	613	4	1.9	Dream agent watch player pattern third.	0.7	3910656
140	567	8	0	\N	1.8	2791424
270	446	5	0	Answer eat theory.	0.9	963584
21	1015	4	0.5	\N	1.2	2949120
205	616	4	1.9	Ago civil morning single.	0.6	4915200
102	1035	4	2.0	\N	1.0	2038784
243	857	4	1.7	Support main three.	1.8	2640896
253	657	4	2.4	\N	1.8	629760
94	1159	5	0	Peace thought exactly various not.	1.4	480256
305	385	4	2.6	Still support Congress exist describe why.	1.1	3236864
226	776	4	2.2	Mouth may sometimes sure low law. Manager institution present true year side move soon.	1.4	2993152
148	1180	4	0.9	\N	0.8	502784
112	617	4	1.8	\N	1.7	5191680
111	896	10	0	\N	0.5	5702656
96	695	4	1.5	Friend world myself financial animal security.	0.9	488448
54	731	4	1.8	Agree painting if candidate professional happen purpose. Once turn next Mr.	1.8	6080512
7	975	4	0.5	\N	0.6	1025024
176	1010	1	0	Maintain skin mean usually hear available country.	0.7	394240
310	153	4	0.7	\N	0.8	3971072
234	805	4	2.6	\N	0.7	4330496
94	1166	10	0	\N	0.7	5012480
253	644	1	0	Too red agree drop anything. Foreign possible bit election friend.	0.6	6937600
177	263	4	0.3	\N	1.0	5475328
12	365	9	0	\N	0.6	4163584
44	110	4	0.6	\N	1.3	4361216
187	436	4	1.9	\N	1.3	5920768
204	581	4	2.2	Foot traditional interview truth. Plan relate leg fast reality range require.	1.1	7945216
46	1073	4	1.6	\N	1.8	4707328
54	718	1	0	\N	1.5	2504704
66	345	6	0	Hair international spend matter suggest rock anything view.	1.1	7827456
160	795	4	0.4	\N	1.6	2648064
45	834	4	0.6	Sure better commercial ready example next.	0.8	4068352
175	140	1	0	Star medical reality prevent significant.	1.7	4187136
152	629	4	0.9	Leader including look economic environment.	1.0	5085184
17	1141	4	1.1	Life leave feeling cover employee economy focus sense.	1.5	3169280
244	260	4	2.0	\N	0.8	1944576
121	692	4	1.9	\N	1.6	3172352
181	1107	7	0	Involve play law where season system statement from.	1.1	5325824
186	248	6	0	Heavy report smile no myself father lawyer.	1.8	7411712
179	460	3	0	Low now with physical. Heart effect clear process white.	1.6	1636352
155	79	8	0	Ability white president important.	0.8	5665792
198	1171	5	0	Son apply boy sound.	0.6	3682304
216	1075	1	0	Either cover drug space. Strong democratic opportunity entire.	1.9	5964800
251	403	4	1.9	\N	1.5	7385088
201	1086	4	1.8	\N	1.9	900096
233	53	4	2.3	Continue policy commercial play firm.	1.7	2310144
160	820	7	0	Ago entire store none stuff hold. Before family Congress single reveal foot within yard.	1.5	3959808
84	335	4	1.8	Black method while. Page thousand recently ok.	1.9	2188288
10	733	4	2.2	\N	0.8	4350976
114	876	4	1.3	Wrong tonight measure accept. Need start couple grow appear learn.	0.8	5663744
278	697	10	0	Industry bring once lead represent air.	1.8	449536
46	1089	4	0.5	\N	1.0	197632
151	456	4	2.1	Over evidence speak heavy.	1.9	6764544
242	883	8	0	Lose not as level collection.	1.5	4846592
74	251	4	1.3	Behavior future end table.	1.7	3097600
3	259	4	2.6	\N	1.0	2196480
66	352	4	1.2	Recently this range close.	1.5	6261760
245	225	4	1.8	\N	0.6	6180864
250	296	4	1.0	\N	0.8	3863552
43	103	8	0	Talk strategy Republican dark.	1.4	6585344
48	1184	1	0	\N	0.5	2259968
209	291	5	0	\N	1.5	8008704
235	1162	4	1.8	\N	1.9	4619264
99	559	10	0	\N	1.0	8094720
19	822	4	0.4	Try sense trade prove tend central.	1.4	894976
26	497	4	2.0	\N	0.8	623616
270	427	5	0	Away control marriage smile out imagine industry federal.	0.7	6864896
150	271	4	2.5	\N	0.9	4925440
131	675	4	1.4	\N	0.7	2821120
132	558	4	1.4	\N	2.0	638976
147	650	9	0	Region reveal something turn. Herself people which direction form determine help.	1.6	5157888
164	956	4	1.5	Day development apply dark few matter office.	0.9	5263360
63	241	4	2.2	Water standard place receive thing.	1.8	2853888
33	770	4	2.3	Or this industry experience serious about sing.	1.9	1331200
237	369	4	1.8	\N	1.1	6648832
144	988	3	0	\N	1.1	2694144
24	87	7	0	Move sing discuss performance if add pattern. Position budget media ok interesting house.	1.3	1081344
35	1184	4	1.4	\N	1.7	4451328
167	21	4	0.5	Little minute actually else yourself chance.	0.5	2066432
100	289	4	1.1	\N	1.8	1530880
62	1189	4	0.3	Expect it score job president perhaps.	1.8	6112256
183	369	3	0	\N	1.7	2766848
202	880	4	1.0	\N	1.5	2719744
33	779	4	0.4	Event green exist dream sing wish item. Exactly country audience teach.	1.1	2945024
274	629	1	0	Along guess wind nature play.	0.7	4749312
48	1195	1	0	\N	1.5	4684800
253	660	5	0	\N	1.0	2017280
155	73	10	0	Describe character drive around total.	0.6	3480576
25	167	4	0.9	Central finally tough able prevent everybody how.	0.5	6933504
88	1087	4	2.7	\N	1.2	6141952
158	199	4	2.7	Food charge create.	1.5	7351296
33	793	1	0	Note third market southern.	1.4	2198528
269	510	5	0	Plan baby nor town.	1.9	3210240
257	361	4	0.8	\N	0.9	3631104
250	321	4	0.2	\N	1.3	7702528
302	319	9	0	Peace where political check.	0.9	2585600
234	799	4	2.8	Bar determine commercial capital expert dog.	0.9	7667712
138	39	10	0	Anything red care whose successful certainly.	1.2	7924736
90	608	4	0.3	\N	1.1	7081984
145	1222	5	0	\N	1.9	1729536
149	677	6	0	\N	1.9	2686976
174	497	4	2.0	Other pull pay contain large stage add.	0.7	8238080
151	452	5	0	\N	1.3	2144256
1	810	4	1.0	Clearly somebody order the.	2.0	3209216
150	264	3	0	Plant get would yard painting stay reveal.	0.7	2868224
92	571	4	1.1	\N	0.9	7941120
119	25	10	0	\N	1.4	1511424
70	953	4	2.9	\N	1.0	1025024
123	974	7	0	\N	2.0	2784256
34	985	9	0	\N	1.6	4088832
111	907	4	0.4	Important decade kitchen.	1.6	4731904
37	327	4	2.6	In include business citizen. Project fill effect once.	1.1	3188736
167	15	3	0	\N	1.0	6430720
50	104	4	2.3	\N	1.0	2120704
105	1081	4	1.9	\N	1.8	296960
5	861	4	2.8	Part where black south report evidence.	0.5	483328
18	833	4	1.2	Term force hundred table check decision.	1.7	7796736
73	869	4	2.2	\N	1.5	7822336
59	468	1	0	\N	1.4	7876608
33	765	4	1.0	Soldier professional show where.	0.9	1986560
22	64	4	1.0	Police create firm among nearly.	1.2	3598336
63	239	4	1.0	Between happen bag sense.	1.7	4089856
41	266	10	0	\N	1.6	1657856
189	558	4	0.3	Security point go green however. Worry know partner minute window.	1.2	5016576
93	650	9	0	\N	1.2	889856
240	870	4	2.7	Its now training course forget thing. Learn adult trial reason until too free age.	1.6	2438144
270	432	1	0	\N	1.3	7098368
308	695	4	0.6	\N	1.6	5696512
247	922	4	1.2	\N	0.7	5513216
267	630	4	1.9	Wish lose instead day bring ago.	1.8	7464960
294	1226	5	0	Much fact best join church nearly teacher. Mean science guy often beautiful.	1.4	5841920
270	442	4	0.1	Position experience those.	0.9	7750656
140	574	1	0	Personal play bit dark small return short.	1.5	3462144
188	1190	4	2.7	Successful away form peace.	1.8	7771136
255	1165	3	0	\N	0.6	5710848
126	1189	7	0	For foreign ground author prevent. Check read fish development song race tell life.	1.9	4073472
286	1149	4	1.1	Authority seat fear hospital. Almost rather so Congress.	0.6	7214080
232	827	8	0	Teacher pass tonight catch.	1.0	6434816
19	832	6	0	\N	1.8	6241280
221	1111	9	0	Pull defense dream woman sport management.	1.3	7270400
274	618	4	2.3	Rather before born list Congress them behind.	0.8	437248
175	141	5	0	Dream wife true able edge yet better.	1.1	2335744
256	759	4	1.2	Fly sound five happy.	1.2	7767040
215	717	4	1.9	Couple focus institution admit.	1.0	4506624
145	1215	9	0	Political without onto fact expect. Present can from season what.	0.6	4070400
153	946	8	0	History increase forward ahead beautiful product focus.	1.4	3634176
194	688	4	2.3	\N	0.6	7581696
142	427	3	0	Spend employee condition training believe.	0.5	103424
304	738	4	0.2	\N	0.8	2660352
196	440	4	1.2	\N	1.0	4850688
26	498	6	0	\N	1.7	6873088
253	645	4	1.5	\N	1.7	2734080
113	507	4	1.6	\N	0.6	6007808
48	1190	4	2.7	\N	1.2	4574208
199	330	10	0	\N	1.7	5075968
221	1103	4	0.7	Month case before picture because trade together.	0.6	1744896
289	185	4	1.4	\N	0.9	1299456
39	843	4	2.6	\N	1.0	3548160
3	270	4	1.3	Place positive cell however skin future.	1.9	2137088
59	472	5	0	Exactly fund north cell between culture.	1.6	6455296
291	287	4	2.0	\N	1.2	6567936
178	522	4	0.1	\N	0.9	1872896
263	376	4	2.5	\N	0.6	4270080
121	694	4	2.1	Official because talk song your. Probably hand everybody effect.	1.5	2230272
190	754	4	1.3	\N	1.8	1880064
248	1103	4	1.6	Anything despite car seat public.	0.6	4422656
66	339	4	2.8	When know agency follow.	1.2	1238016
41	271	4	2.5	\N	2.0	916480
115	540	4	0.2	Not risk level argue yourself occur.	0.7	5216256
100	315	10	0	\N	0.7	3893248
67	736	3	0	\N	0.8	5076992
218	210	4	1.1	\N	1.4	2355200
44	97	9	0	Music someone art science movement rest star.	1.0	1967104
209	290	4	2.4	Tonight very account almost.	0.8	5453824
93	667	4	0.4	\N	1.1	1912832
83	1000	3	0	\N	1.9	5974016
158	197	8	0	\N	1.1	1250304
14	88	1	0	\N	1.9	7379968
277	996	9	0	Could rock it.	1.1	6201344
250	310	1	0	Operation media myself part care sing.	1.2	5116928
112	626	8	0	\N	1.4	4196352
59	480	3	0	Himself however evening thus thing.	1.2	6701056
242	861	3	0	Art law grow where could scene.	1.1	3433472
11	406	4	2.7	Live before statement season someone serious security.	0.6	7219200
276	555	7	0	Buy eye forget now also sea through.	1.2	5637120
229	240	5	0	Discussion voice fish middle.	0.9	4560896
241	512	4	2.8	Build claim resource us though industry where.	1.2	4952064
300	230	5	0	\N	1.7	229376
96	684	8	0	\N	1.8	2668544
236	451	5	0	Story main tree major address control employee. Picture allow agent partner piece require.	1.6	6802432
173	944	8	0	\N	1.2	4677632
295	705	4	1.0	Environmental election right such natural only blood.	0.6	4175872
96	680	4	1.7	\N	1.6	7467008
209	317	4	1.2	\N	1.9	3769344
249	263	4	2.5	Attention space it often radio similar view. Reveal film true produce nothing far face.	1.8	6884352
128	1123	8	0	\N	0.7	4040704
129	459	4	2.8	\N	1.6	7695360
13	1227	4	1.9	\N	1.3	7804928
20	98	1	0	\N	1.1	2398208
146	1102	4	2.3	Change despite almost hope still.	1.5	934912
237	376	4	2.5	\N	1.7	427008
273	1174	4	1.7	\N	1.6	5640192
128	1124	6	0	Me type item pull nation. Beat however pretty remember increase defense this.	2.0	5383168
64	361	4	1.2	Arm pay it child whatever.	0.7	5286912
169	272	4	2.0	Money wind instead well someone.	0.7	7625728
82	650	3	0	Fine method article start laugh rate somebody.	0.9	1138688
169	253	3	0	Go could social western seven.	0.7	468992
301	143	8	0	Want education modern we threat.	1.6	8133632
202	885	5	0	Smile future spend could. These fact receive study.	1.5	2340864
282	830	4	2.8	Meeting address need protect care sense buy participant.	2.0	1500160
145	1212	4	2.4	Compare defense shoulder evidence analysis it campaign.	1.8	8075264
6	166	4	2.2	Possible yes performance nature break well interesting agency. Truth behind on per outside former.	1.2	4080640
248	1111	4	2.6	Focus soldier especially claim treatment ball box.	1.4	6964224
177	276	10	0	Simply tell major artist mouth guy.	0.9	421888
47	975	6	0	\N	0.8	4235264
18	832	4	2.0	Stay kid address minute industry.	1.3	4426752
232	824	4	2.5	Time take you no.	0.7	2585600
180	941	4	2.7	It read process today authority.	1.2	7828480
88	1075	4	1.6	Table morning wall according training not quality. Rule record air happen single arm Democrat.	1.1	7749632
218	217	8	0	\N	1.6	345088
277	1002	4	0.8	\N	1.6	3578880
187	448	4	1.5	\N	0.5	2379776
37	325	9	0	Bring building coach scene. Hundred respond yet vote.	1.1	3628032
25	166	4	2.2	Trial my cold quality hair.	1.4	6646784
295	731	4	1.8	\N	1.1	4296704
244	257	4	2.0	\N	0.9	7068672
130	1042	9	0	\N	1.5	6605824
209	315	4	2.7	Position heavy sell note heavy forget create. Anyone now discuss father bit.	0.8	5238784
3	261	4	1.7	Source rise arm discussion artist information.	0.6	1041408
116	642	4	2.9	Claim ago act ago wall receive.	1.2	376832
173	938	4	1.5	\N	2.0	840704
113	496	4	2.0	\N	1.9	2390016
112	619	4	1.3	Life today who source much animal range.	1.7	1108992
207	981	4	2.4	Bad heart next. Financial help more Mrs price everybody tough door.	0.8	7784448
249	274	4	1.4	\N	1.2	2620416
244	258	8	0	Create resource name glass way really.	1.5	295936
286	1147	6	0	\N	0.5	502784
27	40	4	1.7	\N	1.6	1928192
275	1081	4	1.9	Money pay democratic other. Information trial anything agent three upon pull develop.	1.4	2024448
125	1061	8	0	\N	1.5	7250944
231	246	4	2.2	Represent both decade money discuss relationship money.	1.6	6458368
304	743	1	0	\N	1.4	3909632
84	347	4	2.9	Important prepare rule method.	1.8	4621312
293	559	3	0	\N	1.7	2098176
188	1179	4	1.3	\N	1.3	3767296
278	696	4	2.8	Discuss treat hope season event cell reach.	0.6	5071872
56	1103	4	1.6	Defense sense record. Forward serve friend different among town.	1.0	5828608
46	1086	4	1.8	\N	1.6	7840768
269	512	4	2.8	\N	0.6	7607296
97	361	4	1.3	Property positive teach. Many end person result could within late.	2.0	7961600
192	370	8	0	\N	0.8	2072576
121	691	4	1.7	\N	1.8	2238464
100	310	6	0	\N	0.8	7250944
120	189	7	0	\N	1.1	6909952
179	462	4	0.5	\N	1.2	2553856
111	894	10	0	Strategy watch issue agree only line best method.	1.6	4535296
163	211	9	0	Almost reality strategy create evidence any. Campaign Mr those five friend serious approach.	0.7	4827136
33	776	4	2.0	\N	0.9	3865600
19	830	4	0.1	Grow painting special set final decision detail. Success under choice our drive energy item.	0.9	1298432
89	627	4	0.3	Trade interesting thank you.	1.0	1324032
194	691	9	0	\N	1.8	1953792
39	847	1	0	Food ability society study media own. Policy husband son organization.	1.2	6119424
302	320	4	1.6	Another seven offer wall entire meeting together seem. Everything sell wear project truth describe reach.	0.6	7284736
40	499	8	0	Section woman major nearly without else hot.	0.9	490496
30	801	4	2.3	Goal I member cell single leave memory return.	1.5	4444160
235	1155	4	1.9	Growth next some however so fund.	0.6	3634176
293	558	4	1.4	\N	1.4	7064576
167	20	1	0	Action growth by wife their.	1.7	5429248
58	564	4	1.1	\N	0.9	4446208
234	803	4	2.3	\N	1.7	5854208
177	260	8	0	\N	1.8	8053760
215	706	4	0.6	Eight alone his company pick information call sea.	1.1	6525952
249	275	4	1.5	Success go apply message.	0.7	1463296
166	410	4	1.5	\N	2.0	5916672
302	293	4	2.7	Spring guess rate create.	1.4	8011776
215	716	6	0	Ball listen bank too three simply. Area Mr notice great general they happen.	0.6	6904832
70	966	4	2.6	Stuff indeed rock character energy to everything. Training country whatever while success tonight.	0.8	4757504
221	1108	4	2.5	\N	1.7	4603904
40	503	8	0	\N	1.7	479232
248	1098	4	1.6	Smile experience network spend fall. Benefit anything in others.	1.3	4299776
68	304	7	0	\N	1.3	492544
272	817	8	0	Certainly three despite hand learn. Wife thus position agency offer cultural.	1.4	3962880
164	965	8	0	Property manager painting.	1.2	3104768
109	1004	4	2.3	\N	2.0	7914496
136	582	4	0.2	\N	1.7	1416192
166	404	4	0.1	Any whom become begin finish market television size. Wear fill property until feel newspaper.	1.7	1354752
100	311	7	0	Behavior player bed pass traditional attorney team.	2.0	3361792
282	826	4	1.7	Five line television pass. But method yes want.	1.3	7200768
158	180	5	0	\N	1.6	4656128
169	259	4	0.5	\N	1.5	1261568
59	476	9	0	Single service design attention follow cultural size.	1.9	1447936
94	1171	5	0	\N	0.7	5056512
43	94	4	1.8	Thousand nature tree reality scene according.	1.9	5852160
247	910	4	2.8	Fight minute agency southern southern quickly.	1.2	1514496
52	1173	10	0	\N	1.6	7324672
106	350	6	0	\N	1.3	4039680
252	247	4	2.7	As write travel market.	0.9	775168
56	1097	4	1.3	\N	0.8	3803136
21	1014	4	2.0	\N	1.8	4054016
86	1132	4	1.7	Suddenly raise design source.	1.8	6738944
272	814	4	2.7	\N	1.2	7931904
250	308	6	0	\N	1.7	5293056
280	331	4	2.4	Two mother contain defense she source.	0.7	5344256
100	322	4	1.0	Capital wife compare suffer sound north.	1.9	2547712
111	924	4	0.1	\N	0.8	6556672
20	97	4	2.4	\N	1.1	1061888
253	665	4	1.1	Beat road knowledge our design husband report yard.	1.5	7699456
309	825	4	1.2	\N	0.8	5988352
264	834	4	1.3	\N	1.1	7881728
145	1217	5	0	Charge reason manager reach his performance easy might.	1.8	3163136
16	985	6	0	\N	1.4	5343232
126	1177	5	0	Similar stuff father apply herself suggest education science.	1.2	7835648
164	949	4	1.3	\N	0.7	3092480
97	362	4	1.5	\N	0.8	8238080
77	13	4	2.5	Down ground large road quite tree street.	0.9	4102144
152	612	10	0	Station beat official.	1.3	2067456
33	771	7	0	Identify quality build fund nothing dream center bring.	1.8	5724160
68	307	4	2.6	\N	1.1	185344
167	11	4	1.9	\N	1.9	5691392
215	719	4	1.0	\N	2.0	1991680
115	531	6	0	\N	1.7	5709824
23	487	4	2.8	Cup art consider perform mean at. Whatever almost cold again.	1.8	7410688
194	685	4	2.5	\N	1.3	1159168
80	218	4	1.3	\N	1.8	4961280
184	456	4	2.1	Article finally board evening wish inside. Much it easy help respond fly.	1.2	6763520
262	744	4	1.5	\N	1.2	7815168
215	707	4	2.3	\N	0.5	6580224
64	359	4	2.1	\N	1.7	3731456
196	443	4	1.3	\N	1.2	1680384
215	710	4	1.7	\N	1.5	5349376
143	456	4	0.2	Too sometimes human necessary show material bit pick.	1.6	8104960
170	420	4	1.5	Herself provide fire.	1.8	271360
108	742	4	1.6	Manager draw show hot lose choose image.	1.3	3881984
181	1108	4	2.5	\N	0.9	2325504
162	560	7	0	So mother bank environmental.	1.9	6400000
150	277	4	2.9	\N	1.5	2184192
223	372	7	0	Husband happen eat scientist bill even.	1.2	3589120
96	685	4	2.5	\N	1.9	6721536
7	973	3	0	\N	1.1	6575104
173	946	6	0	\N	0.5	7240704
160	808	10	0	Enjoy worry chance investment easy population. Civil the set success.	0.8	4770816
191	745	5	0	\N	0.9	613376
112	621	4	2.4	Town argue speech federal support any machine.	1.8	4609024
196	431	4	0.0	\N	1.7	4846592
227	674	4	1.9	All response bar whom huge she.	0.5	3705856
179	463	4	2.6	\N	1.6	3015680
77	15	4	2.6	\N	1.0	6025216
77	5	8	0	Add medical specific.	0.7	644096
233	59	1	0	\N	1.3	2668544
122	851	4	0.7	Method forward candidate throughout. Lot me born.	2.0	5989376
122	854	8	0	Ready cell black road long sea finish.	1.8	2671616
300	212	6	0	\N	0.9	582656
50	94	7	0	\N	1.9	2933760
2	1068	4	1.7	\N	1.4	5146624
121	687	4	1.0	May everything clear physical.	1.9	7647232
161	1042	4	1.5	Firm service measure final.	1.8	1647616
19	824	4	2.8	Thought indeed early white wrong arm region.	1.5	4669440
300	217	10	0	Forget store commercial ground protect.	0.6	3984384
135	74	4	0.1	Win black already surface. Lot top heart television itself dream.	0.7	7666688
244	254	3	0	Significant light of power war beat special.	1.3	937984
261	1002	4	2.8	Simply remain visit morning suggest piece.	0.6	6391808
249	277	4	0.5	\N	1.8	5855232
67	744	9	0	\N	0.8	5534720
210	1161	4	2.2	\N	0.8	7965696
216	1076	4	1.6	\N	0.8	6486016
272	796	4	1.9	Mother win recently travel into. Force manager well break nation magazine.	1.5	4786176
164	971	6	0	\N	0.7	1491968
125	1042	4	1.5	\N	1.0	6248448
40	496	4	2.0	List rate action coach suddenly employee.	1.3	7067648
127	639	4	2.6	\N	1.9	3414016
48	1183	4	1.3	\N	1.5	6385664
211	406	4	2.7	Area police nearly view subject.	1.7	5738496
291	303	4	1.0	\N	1.9	2181120
274	616	4	1.9	Suggest system entire culture pass beautiful.	1.3	7010304
111	893	4	1.1	Office stand make next within create though.	1.7	5394432
240	858	3	0	Respond security car.	1.6	5055488
289	192	9	0	Reality traditional admit room able drug they.	1.2	7948288
160	816	4	1.9	Trade agreement box body know leg more read.	1.9	4783104
233	62	4	1.1	Material small let.	0.8	4457472
246	749	3	0	\N	1.2	7276544
302	313	1	0	Character site bit east program yes again.	0.6	6908928
145	1199	4	2.8	Within place successful movement admit crime.	1.6	1633280
165	481	6	0	\N	1.1	1876992
26	499	4	2.3	Responsibility evening drive expect set wait.	0.9	1121280
30	802	9	0	\N	1.8	3288064
264	839	4	2.8	\N	1.5	6870016
102	1031	7	0	\N	1.0	7279616
274	625	1	0	Government beat itself doctor important fast rule.	0.8	450560
67	747	4	2.4	After easy thousand agree short pull what enough.	1.4	4510720
119	36	4	1.4	\N	0.8	4716544
240	874	1	0	\N	1.2	6154240
247	928	8	0	Point theory entire fact.	1.1	5455872
82	668	4	2.3	\N	1.9	300032
107	989	4	1.0	Sense detail age student interesting develop old. Production some citizen final.	0.6	5753856
135	80	4	0.4	Above herself speech school.	1.8	6259712
234	817	4	1.0	Second attack quality clearly. Material effort face.	1.3	2837504
237	370	4	2.7	Get bad statement society simple.	0.9	1539072
178	525	4	1.8	Understand mind tax reality toward born.	1.8	3699712
58	568	4	1.2	Report contain cultural thus walk join light.	1.5	3585024
295	718	9	0	Rate rich major television federal generation officer.	1.8	2485248
202	887	6	0	\N	1.9	5321728
88	1070	5	0	\N	0.8	3347456
87	974	7	0	First room simply.	1.6	5207040
284	161	9	0	Better keep through seek so impact network.	1.8	3804160
80	216	6	0	\N	1.6	7501824
196	429	4	1.2	\N	0.6	4510720
66	356	3	0	\N	1.0	2501632
294	1223	4	1.8	\N	1.0	8250368
41	269	4	0.3	\N	0.8	3236864
198	1173	4	0.3	\N	0.6	7636992
191	733	4	2.2	\N	2.0	3284992
151	455	8	0	\N	1.4	2342912
164	948	4	2.0	\N	0.5	7830528
274	610	3	0	\N	1.7	6268928
44	116	10	0	\N	1.1	3738624
107	988	10	0	Themselves live every left later soldier.	1.2	1099776
115	526	5	0	Born and million administration down can plan try. Education my conference parent.	1.2	596992
129	451	4	1.4	Notice kind attention produce week.	0.6	3659776
165	484	6	0	Under the you fear success each.	0.8	4157440
250	289	1	0	\N	1.4	8111104
150	263	4	2.5	\N	1.8	3431424
130	1048	5	0	\N	2.0	187392
196	435	4	1.5	\N	1.0	7333888
125	1067	4	1.6	\N	1.9	2418688
277	998	4	2.8	Finish TV apply me.	0.9	2348032
20	112	1	0	\N	1.2	7446528
165	485	5	0	Find camera control pretty left.	1.8	1781760
115	547	4	1.5	Help worker sport interesting peace worry whom claim.	1.9	4469760
259	936	9	0	Situation rather would involve couple physical add.	1.6	3674112
206	651	4	1.2	Minute themselves beyond affect country.	1.4	4644864
129	462	4	2.1	\N	0.5	3129344
22	62	4	1.8	\N	0.6	1211392
306	596	1	0	\N	0.8	4630528
11	408	4	1.0	\N	1.7	8233984
21	1033	8	0	Effort picture blood move who firm.	1.5	254976
286	1138	4	1.1	\N	1.2	4282368
15	943	8	0	Eye garden station summer. Discover hospital best threat magazine.	1.9	111616
46	1085	4	1.1	After board director however debate front civil.	1.3	4420608
191	734	7	0	Ago page effort make security become phone smile. Remain so everyone picture indeed.	1.9	1438720
219	1227	6	0	Benefit people father authority off approach word.	1.7	883712
140	570	4	1.1	Then treatment increase strategy somebody take approach.	0.7	899072
195	149	4	2.9	\N	0.9	1201152
103	275	4	1.5	Miss of we toward must thus. Technology part blood serious than.	1.1	4429824
115	523	4	1.9	\N	1.4	4149248
212	326	4	2.4	Indeed field grow surface.	1.9	2463744
262	733	4	2.2	\N	1.8	1404928
185	454	5	0	\N	0.9	3135488
238	326	4	2.4	\N	1.0	4124672
103	259	4	2.6	Reduce hot stuff entire ok participant particular.	1.7	3427328
120	191	1	0	Care party truth state group cause form.	0.6	8235008
67	745	4	2.0	Camera according hot drive.	1.5	3037184
20	117	7	0	Less color provide particularly father want operation.	1.1	5372928
278	688	4	2.3	Local glass security effect open already adult field.	0.6	6380544
299	365	4	2.0	Environment great car city manager interesting adult.	1.6	7528448
305	389	4	1.6	\N	1.3	4931584
269	517	4	1.7	\N	1.5	3101696
241	518	4	1.6	Thing moment camera statement.	1.8	7376896
203	1214	4	0.2	Return street family realize. Participant fight possible contain.	1.0	1555456
302	295	4	2.4	\N	0.7	3353600
22	59	4	1.3	\N	1.5	3481600
175	126	7	0	Thousand consumer skill hear tax.	1.1	6899712
242	881	4	2.4	\N	1.6	2634752
2	1045	4	1.5	Really one power. Send hand person especially sure case yard.	1.9	7708672
161	1045	8	0	\N	1.8	6141952
304	733	4	2.2	\N	1.3	6452224
151	457	4	2.4	\N	1.1	2940928
193	336	3	0	Describe local pressure leg business mind resource movement.	1.1	856064
95	1057	4	2.0	Hard just cold maybe thus.	1.3	6432768
227	677	3	0	Participant public position official. Learn PM cost produce knowledge cup assume Democrat.	1.1	2139136
166	400	6	0	Hard billion yet something their past.	1.1	7960576
92	566	1	0	Thing many recent modern watch eye south. Financial lead own where eat ball.	1.8	3130368
7	976	4	0.8	Understand thus investment. Rather reduce candidate street couple.	1.5	4447232
232	831	4	0.9	\N	1.0	6072320
247	908	4	1.6	Win approach bit factor create dark.	1.8	2941952
170	416	4	2.2	\N	0.6	3399680
225	1003	4	1.2	\N	1.1	4697088
294	1206	9	0	\N	1.6	4825088
72	1100	4	1.6	\N	1.5	4959232
278	685	4	2.5	\N	1.9	3057664
33	781	5	0	Final event rich year organization property. Class sound player painting late former indeed.	1.5	4941824
218	216	5	0	Development foot finally strategy impact win bag. Guess away try.	0.8	5256192
165	480	10	0	\N	1.6	6008832
77	1	4	1.3	Still guess few our western.	1.8	432128
35	1176	3	0	\N	1.2	5578752
183	375	4	1.2	Wide their space challenge.	0.8	3782656
84	345	4	1.2	\N	0.7	4355072
37	326	1	0	Consumer enter likely could. Official themselves work trip.	0.8	1282048
300	220	5	0	Wear increase such above wrong.	1.8	418816
216	1078	4	1.4	\N	1.5	6232064
207	986	8	0	Building benefit increase edge artist into.	1.4	5613568
259	947	4	1.0	Senior store movement black. Also radio before read peace reveal today.	1.4	6856704
272	818	4	1.7	Force mind operation relationship receive over.	1.7	4084736
174	489	6	0	\N	0.7	1935360
174	493	4	1.7	\N	1.9	6373376
201	1087	4	2.7	\N	1.5	5302272
27	37	1	0	Fish car force American.	1.0	4391936
278	700	4	2.6	\N	1.3	6097920
272	805	1	0	\N	0.8	4843520
208	679	9	0	Better brother in suggest always forget.	1.1	7060480
218	220	4	1.0	Example your face this three talk.	0.7	7715840
292	374	4	2.3	Six party movie industry body late.	1.6	6042624
143	454	4	1.9	\N	1.2	4254720
135	57	10	0	\N	1.5	7697408
2	1058	8	0	Course reason ever example.	1.6	1258496
156	343	4	1.5	\N	0.8	5249024
290	1093	4	1.2	Change bed say as blue central sign.	1.4	7992320
224	404	1	0	Fill it as those trip understand.	1.9	1037312
195	156	1	0	\N	1.7	3472384
160	810	4	0.6	Lead second heart fight debate. Growth grow team ever at second.	1.1	7177216
50	95	4	1.2	Sit general next number.	1.1	1654784
266	479	4	2.7	\N	1.3	903168
211	410	6	0	\N	1.7	4531200
273	1191	7	0	Section interesting read direction matter.	1.6	3382272
226	772	6	0	\N	2.0	6462464
138	43	4	1.2	Treat population yes all expert represent art. Necessary to those.	1.9	5550080
120	194	6	0	\N	0.9	5908480
26	500	4	1.4	Gas within benefit instead to.	0.9	7600128
270	447	4	1.0	Job meeting Congress yard.	0.8	3571712
119	38	1	0	\N	0.7	4709376
120	200	3	0	Activity social can own.	1.6	330752
5	880	4	0.6	Read order particular later part chair especially region. Glass Mr animal.	1.5	6370304
80	226	5	0	Suddenly represent very painting find.	1.8	4641792
141	830	4	2.8	\N	0.7	760832
291	316	1	0	Foreign our away soon white.	1.2	2721792
288	763	10	0	He cold no pay garden little computer. After art ball wide recent later meeting.	0.6	7326720
224	406	4	2.7	Keep production democratic stop yet. Focus rather improve long.	1.7	3486720
68	314	4	2.1	Congress place wind popular.	1.6	1156096
28	206	4	2.6	Again view college fast price act.	1.0	2199552
250	287	10	0	\N	0.9	1277952
108	739	5	0	\N	1.8	2289664
253	648	4	1.3	\N	1.0	1475584
176	1005	3	0	Music maintain believe answer.	0.8	7941120
72	1101	7	0	Accept you hand hotel morning tree mouth already.	1.5	3910656
244	269	5	0	\N	1.0	4289536
86	1131	4	1.9	South watch risk computer.	1.6	1822720
231	242	4	1.4	\N	0.8	6272000
167	13	4	2.5	\N	0.9	8289280
193	344	8	0	\N	1.2	4584448
59	465	1	0	Degree whatever cultural store letter effect young.	0.6	4136960
85	1099	5	0	\N	1.6	4976640
93	653	4	2.1	\N	1.1	2759680
86	1148	9	0	Maybe scene long able network size feel.	1.2	7515136
7	977	3	0	\N	1.2	6341632
112	629	4	1.8	\N	1.4	5941248
46	1081	4	1.9	Again member in.	1.6	8266752
112	615	4	1.2	\N	0.5	7071744
81	1000	9	0	\N	0.5	3451904
241	515	4	2.4	\N	1.2	1586176
289	199	6	0	He affect financial wonder laugh television sister.	1.7	8236032
135	46	7	0	Room everybody accept plan without during thought. Trouble think possible experience first.	0.8	6730752
70	955	4	2.4	Ask mind leader yourself a say hand different. Window debate feel something save.	1.9	7649280
155	68	4	2.7	Produce example action ready.	0.9	2499584
86	1145	4	2.9	Its pay network program expect significant some.	1.7	2879488
113	495	9	0	\N	0.7	2487296
118	855	4	1.5	Store pattern name month national least number.	1.5	769024
212	330	4	0.7	\N	1.0	8036352
212	325	10	0	\N	1.1	1193984
121	703	4	1.7	Effort trip morning do she.	1.2	5057536
27	38	7	0	\N	1.6	559104
70	957	4	1.5	\N	0.7	6363136
70	970	6	0	\N	2.0	937984
100	318	1	0	\N	1.2	7246848
26	490	4	1.0	Ready idea it your newspaper.	1.2	3559424
164	950	7	0	\N	1.4	6151168
253	655	10	0	\N	1.8	5457920
308	681	6	0	Member of dream allow. Young finish walk future between.	0.7	2021376
149	676	4	1.2	Prepare join of thank.	1.2	372736
147	661	4	1.2	\N	1.9	2104320
307	381	4	2.6	Spring network after conference.	1.3	2193408
269	515	10	0	Least forward Mr course western.	1.2	7785472
170	434	4	2.9	Radio standard available better.	1.1	7718912
21	1023	3	0	\N	1.5	592896
208	675	4	1.4	Anything scene thus keep couple enter yet behavior.	0.9	2472960
111	910	6	0	\N	0.6	7484416
288	753	7	0	\N	1.2	5846016
206	655	4	2.0	Key north his.	1.1	1593344
72	1108	4	2.5	Crime authority heart your body have. Guess when security interest system single floor.	0.8	6549504
59	479	4	0.4	Would project partner should game.	1.4	1232896
22	53	4	2.3	Center single education goal exist fish.	0.6	3863552
100	301	3	0	Affect serious mouth movement.	1.6	5068800
310	159	4	2.1	Office protect challenge mother wait major scene listen.	1.2	5432320
82	646	8	0	\N	0.7	8189952
141	827	4	1.6	Spring both capital how girl city. Friend which edge say face.	1.9	5542912
154	848	4	1.9	\N	1.4	3997696
263	375	4	1.2	\N	1.9	4668416
111	905	3	0	\N	0.6	6689792
95	1041	9	0	Despite mean now break lot five.	1.2	1935360
5	877	4	1.2	Traditional young president meeting.	1.7	2297856
59	469	4	2.5	\N	0.8	2709504
177	266	3	0	\N	1.5	1033216
153	945	6	0	It question discover series.	1.7	7918592
135	56	4	1.4	Clear career role power market.	0.6	2721792
148	1179	4	1.3	\N	0.6	1978368
241	511	9	0	\N	1.5	7246848
184	463	4	2.0	\N	0.7	5356544
120	186	4	0.7	Fund stay low purpose store.	1.5	5037056
24	90	4	1.8	Figure throughout throw safe seem black response.	1.5	4904960
302	303	1	0	Computer in history chair. Return partner seek eye doctor couple attorney.	1.6	7860224
119	41	5	0	\N	1.8	6971392
72	1106	6	0	Growth response offer rate president music travel. Local reveal recognize.	1.3	5650432
113	487	9	0	\N	1.0	1140736
273	1194	9	0	\N	1.8	4764672
190	762	9	0	Visit end summer statement west hit thing.	0.7	3779584
185	455	3	0	\N	1.5	3799040
183	378	1	0	Job series little area glass.	0.6	901120
114	883	4	1.0	\N	0.5	6255616
164	963	5	0	Environment general race item put.	1.6	130048
179	451	1	0	Per somebody pretty nation. Soon energy eye during base woman.	1.8	2368512
27	26	7	0	\N	1.5	5819392
281	411	4	0.1	Day carry recent president.	0.6	6767616
58	566	4	1.9	\N	2.0	1795072
68	308	4	2.8	Off pattern administration old crime responsibility.	1.2	7836672
292	370	4	2.7	Society rate move east manage great behind.	1.2	332800
137	747	4	2.4	\N	1.2	6323200
39	848	3	0	Blue industry short.	1.8	7437312
112	616	5	0	Onto test minute do interesting power. Light health much data phone deal something.	1.5	5568512
61	457	6	0	\N	1.2	7177216
272	808	10	0	Middle beyond three despite election.	1.5	7913472
116	638	4	1.1	Treat direction herself much poor day. Forward watch teach structure decide marriage admit.	1.2	628736
11	405	4	1.2	\N	1.2	7671808
48	1191	5	0	Wear tell allow accept sense small should former.	1.3	205824
110	394	7	0	National born law hair.	1.7	6609920
65	392	4	1.2	Represent per technology and unit clearly modern.	0.6	1932288
103	256	6	0	\N	0.7	2814976
5	885	4	1.9	\N	1.8	6424576
69	236	10	0	Human number view serious offer clearly.	1.3	5069824
76	608	5	0	Room affect memory natural career TV lot.	0.8	2609152
300	237	10	0	Unit program figure front simple. Class peace lay.	1.7	202752
270	422	9	0	Quickly respond west six hear return feeling stop. Charge himself benefit ago camera to sit.	1.5	8214528
238	328	4	1.6	Thus small plant several.	1.9	7032832
97	357	8	0	\N	0.9	8093696
272	811	8	0	\N	0.7	1975296
137	743	4	2.0	\N	1.5	7734272
147	671	4	0.4	\N	1.0	7643136
6	168	4	0.9	Wonder might house American heart physical institution.	1.9	5029888
41	259	10	0	Spend mention understand white wish onto nation get.	1.6	857088
215	727	4	0.4	\N	1.1	4579328
240	889	4	1.3	Grow company make call many.	0.8	7179264
226	780	4	1.1	After near can institution.	0.7	4698112
147	659	4	1.3	\N	0.6	2956288
27	29	7	0	Along data week administration pressure price.	1.9	3998720
244	275	4	1.5	Him apply stay concern.	1.0	8028160
59	470	3	0	\N	1.7	3435520
14	83	4	1.6	According safe project thank scene authority.	1.1	1262592
210	1157	4	1.1	\N	1.0	1465344
35	1195	7	0	Key half like cold record adult.	0.6	1173504
147	658	4	2.2	\N	1.9	6413312
262	736	6	0	Marriage crime newspaper best sign.	0.9	6855680
91	264	1	0	Room general health that scene responsibility walk.	1.3	2808832
117	586	3	0	Leader sing occur.	1.0	4454400
187	422	4	1.2	\N	1.9	7419904
271	459	4	2.8	\N	0.5	2705408
177	264	4	2.8	Sea star expert happen hot.	0.9	3085312
155	55	6	0	Continue boy few mention court theory.	0.9	6605824
173	942	3	0	Treatment statement treatment yourself new window likely.	0.9	4899840
48	1197	4	0.6	\N	1.5	3776512
105	1072	4	1.0	\N	1.8	1327104
258	1196	10	0	Kitchen story leg fear hear public.	0.6	7060480
142	436	7	0	\N	1.3	1556480
243	854	4	1.7	\N	0.7	6318080
22	49	4	2.1	\N	0.7	5143552
295	710	1	0	Billion war number might. Service future eat role marriage eight note when.	1.1	6649856
75	282	4	0.3	\N	1.5	1179648
104	364	4	2.5	\N	1.5	2707456
297	755	4	1.6	\N	1.0	4792320
21	1030	4	2.1	Season sort yes campaign player television over.	1.1	3828736
22	48	4	2.6	\N	1.1	3144704
268	604	7	0	\N	1.7	5390336
275	1079	4	1.8	Reflect street subject black state.	1.7	934912
52	1157	8	0	Through statement show claim music sell.	0.6	155648
189	559	4	2.6	Edge miss share eat mission pick know.	1.4	7680000
270	430	4	1.0	\N	1.3	2069504
15	944	7	0	Condition test professional democratic enjoy. Political hour lose boy probably.	1.5	2008064
128	1120	10	0	\N	0.5	3861504
175	133	1	0	Government meeting benefit spend happen more argue.	0.7	5666816
117	590	7	0	Again example though list born look.	1.5	5545984
196	430	9	0	Foreign make later improve able training report.	1.3	2290688
50	97	4	2.4	\N	1.4	4252672
221	1106	4	2.6	How local environmental off.	1.7	7711744
134	1137	4	1.4	Fall change policy certainly traditional run.	1.5	6087680
33	784	3	0	\N	1.8	3391488
235	1165	1	0	\N	0.9	1073152
199	329	4	2.5	\N	0.9	3440640
39	846	4	1.6	Throughout hospital teach arm eight.	1.4	5396480
80	238	4	1.9	Rest once about eight tax drop future.	0.7	5446656
6	176	9	0	\N	0.6	4137984
142	429	4	1.2	\N	0.9	7160832
100	320	3	0	\N	0.8	4330496
163	220	4	1.0	Usually market until other make international.	1.8	2657280
97	360	4	2.7	\N	0.8	2884608
199	327	3	0	Social response entire.	1.8	7483392
41	270	4	1.3	Consider near assume commercial relate material notice.	1.2	5995520
278	691	9	0	\N	1.5	1360896
167	10	4	2.8	Present agency yourself ready focus.	0.7	2246656
126	1183	8	0	Help doctor avoid win according you against. Along kind dog budget career doctor discover.	1.8	2894848
253	667	4	1.9	Rest notice edge sort.	0.5	5082112
2	1069	10	0	\N	0.8	3116032
125	1041	4	1.1	\N	1.5	4368384
69	229	3	0	\N	1.6	4590592
202	875	6	0	Onto visit single be in security.	1.6	5876736
261	996	4	0.4	\N	1.7	2366464
98	1134	4	2.7	Phone approach someone house peace.	1.6	4642816
14	85	4	2.2	Main raise land.	1.9	3016704
188	1174	4	0.8	\N	1.0	4134912
5	874	9	0	Local camera skin too relationship firm against summer.	1.2	2902016
96	691	4	1.7	Without your office law.	2.0	3075072
128	1121	4	1.0	\N	1.1	2619392
250	312	5	0	Suffer nice participant friend.	1.1	6651904
74	244	4	1.3	Meeting fall past star last camera.	2.0	3059712
111	898	4	1.1	\N	0.7	8014848
178	542	1	0	\N	1.9	4769792
161	1041	4	1.1	Trip nation current cost.	0.5	1184768
167	1	4	1.3	\N	1.0	1287168
172	281	8	0	\N	1.7	1675264
68	321	4	0.3	\N	1.3	3506176
234	816	4	1.9	Else air thousand wrong eye lay.	1.4	6668288
151	451	4	1.4	\N	1.7	644096
45	835	4	1.2	Standard should when. Spend why success cover rate forward money low.	1.1	351232
223	367	4	2.9	\N	1.3	4290560
301	142	4	1.7	\N	1.8	6084608
165	466	4	1.6	\N	0.6	2490368
303	1093	9	0	\N	1.9	1738752
163	223	4	2.8	Bill feel eight sit standard type.	1.2	1430528
121	697	1	0	\N	0.8	6517760
111	901	4	0.9	Building first kid once.	1.2	6721536
113	505	4	2.4	\N	1.9	7099392
267	629	4	0.5	\N	1.8	3049472
187	444	4	0.1	Agree president official hold college.	1.0	4799488
148	1189	4	2.0	\N	1.5	2976768
164	953	4	2.9	\N	1.0	6541312
66	333	6	0	He rich remember.	1.0	2483200
252	248	4	0.4	Sell speak poor company difficult. You face person everybody.	1.7	1036288
82	661	4	1.7	Material bar just area establish your.	1.8	5967872
148	1196	4	0.5	\N	1.9	3756032
298	712	4	0.3	\N	1.3	1674240
294	1222	4	1.2	Manager wish change somebody recent.	0.9	3333120
153	943	7	0	Shoulder apply issue wife case.	0.9	8051712
250	317	4	0.9	\N	1.7	3075072
294	1204	4	2.4	Serve else line seem technology enough should.	1.5	7653376
165	471	4	2.9	\N	0.6	3289088
134	1136	6	0	Choose simply machine color different maintain deep.	0.6	603136
210	1154	4	2.8	\N	1.2	3802112
173	939	4	2.6	\N	1.6	2222080
1	814	9	0	Wait author show response view industry production.	0.8	8193024
68	317	4	1.2	Mouth available avoid realize positive add professional.	1.1	7004160
185	450	10	0	Against month he peace carry. Mouth describe computer young compare.	1.8	5145600
30	796	6	0	\N	1.8	4562944
73	883	10	0	Question worry mother like fish health.	1.9	5061632
200	945	4	0.1	\N	0.7	2364416
251	401	4	1.4	\N	1.4	5965824
275	1090	9	0	Clear let away feel traditional scene.	0.6	3772416
110	386	4	1.0	Short rate return statement family someone sense stage.	1.5	2220032
234	804	5	0	Today next entire case customer company rest.	1.4	493568
152	614	8	0	Executive down near.	1.2	5762048
246	741	8	0	\N	0.9	356352
80	236	4	2.8	Away send democratic fact kitchen point.	1.3	6114304
28	208	4	2.9	\N	0.9	5238784
165	482	1	0	\N	1.3	1587200
291	295	10	0	Hear shoulder decision side.	0.6	2618368
232	825	4	1.2	\N	1.7	6014976
216	1088	5	0	Order especially staff message easy create painting charge.	0.8	7630848
35	1191	7	0	Red learn positive training group wait too.	2.0	4459520
269	518	5	0	\N	1.5	439296
100	309	6	0	Teach course modern without. Than answer force.	1.6	4803584
283	411	8	0	\N	1.2	5917696
191	735	8	0	Measure night Congress.	1.9	4903936
235	1167	6	0	Bar set again save customer easy explain.	1.9	3625984
275	1076	4	1.6	\N	0.7	8145920
255	1169	10	0	\N	1.4	1655808
233	66	4	0.1	\N	1.3	4050944
194	693	3	0	\N	0.8	4830208
2	1052	6	0	Community explain Democrat contain.	1.4	5673984
67	737	10	0	\N	1.4	1590272
22	73	4	2.6	\N	1.7	8052736
115	538	4	1.1	\N	1.2	7001088
245	238	4	1.9	\N	0.7	5130240
17	1132	4	2.1	Scientist certainly south way window less simply.	1.6	2393088
63	251	3	0	\N	0.6	7959552
140	571	6	0	Operation space floor all argue forward police. Condition official part compare particular radio charge.	1.7	918528
86	1128	10	0	Clear red send true after.	1.8	7239680
226	782	4	1.2	Side total remain set alone. Hundred class tell north consumer near.	1.2	5961728
250	322	4	1.0	\N	1.8	5820416
76	597	1	0	\N	1.3	5621760
302	287	4	2.0	\N	2.0	7794688
249	268	4	2.8	\N	0.9	7397376
101	1176	4	2.9	\N	1.7	7128064
121	696	4	2.8	\N	1.3	1869824
134	1131	7	0	Yeah international heart notice.	0.6	6490112
88	1082	8	0	\N	0.6	6706176
160	799	6	0	Few where audience eye summer.	0.7	4344832
64	365	4	1.5	\N	1.0	8073216
181	1102	4	2.3	Bring main student similar spend fine. Hope brother catch cell during.	1.5	6602752
216	1080	6	0	Sense hear put at.	0.8	6183936
16	986	4	2.1	Information as customer wife understand avoid.	1.2	6476800
32	1096	4	1.2	Control difference determine act.	1.2	7092224
63	243	3	0	\N	0.9	4964352
248	1110	4	2.2	Great national deal teach short they should. Apply try read have.	1.9	4691968
211	409	4	1.7	Debate language trial red likely second get.	1.7	3254272
2	1043	4	1.8	\N	1.1	3117056
286	1132	3	0	Show individual scene approach city community.	1.7	2274304
105	1080	8	0	Bag miss executive inside region participant gun community.	0.8	3357696
105	1078	8	0	\N	1.0	4993024
67	749	4	0.6	Tonight century hold section customer begin brother. Yeah on power.	1.2	2248704
113	506	10	0	\N	0.6	2450432
134	1141	4	1.1	\N	0.7	3760128
247	912	4	2.3	\N	1.4	2109440
98	1132	5	0	Enjoy work movie.	0.8	291840
237	374	3	0	Health force sometimes wrong nor form.	0.6	5325824
289	184	8	0	\N	1.5	2330624
289	190	9	0	\N	1.7	799744
2	1049	4	2.5	\N	1.5	3847168
78	1233	4	1.2	Unit involve president return already until.	0.6	5800960
106	337	4	1.5	Break customer behavior herself.	1.0	5391360
143	461	8	0	Show reveal by create action environment.	0.6	2978816
279	564	4	1.7	Budget word beyond wind.	1.5	7875584
182	83	4	1.6	Move listen trade foot almost. Hard technology create blue increase hope model.	1.6	389120
205	620	4	1.2	Hit person most dinner statement war.	1.3	8241152
267	610	6	0	Move mother pattern every both by.	1.5	5644288
119	22	1	0	\N	1.4	8132608
201	1089	6	0	Whatever sister house contain good suggest generation.	1.8	7914496
44	117	1	0	\N	0.5	3469312
159	549	3	0	Material bank full attention hospital major environmental.	1.9	194560
136	583	4	2.9	\N	1.6	789504
252	251	10	0	Structure make nor low professor.	0.8	6662144
191	743	5	0	\N	0.5	6828032
69	216	5	0	Father share church.	1.7	5858304
65	389	10	0	\N	1.4	8223744
291	306	10	0	\N	1.1	3681280
66	355	7	0	\N	0.8	6270976
50	102	4	1.7	\N	0.9	6637568
81	1002	4	2.3	\N	1.0	5473280
6	164	4	1.6	Factor nearly Mr.	0.9	4579328
91	268	4	2.8	Understand light mother face compare girl certain interest.	1.0	7589888
174	488	7	0	\N	0.8	8289280
142	437	4	2.6	Nature start born news meeting know message.	1.3	4713472
126	1197	6	0	\N	0.5	6017024
52	1164	9	0	\N	0.8	1160192
98	1130	8	0	\N	1.3	279552
20	113	7	0	Certainly recognize poor.	2.0	802816
73	881	4	2.4	Organization wonder table east open.	1.6	5607424
54	711	1	0	\N	1.1	1042432
18	824	9	0	\N	1.1	2936832
201	1091	4	1.9	Somebody believe science purpose.	0.8	7112704
156	345	8	0	\N	1.2	2480128
249	266	7	0	Position sit large significant play me decide. Business wide change four type share.	1.3	2774016
202	873	4	2.3	Act raise bring necessary example design attack.	1.9	6397952
115	545	1	0	Them middle let everyone. Position happy success tree.	0.8	561152
187	420	4	1.7	Mouth action result begin career without. Education small upon someone season think hold.	0.9	5498880
23	498	4	2.6	Development pressure still this candidate cost. Analysis design information reduce play carry mind.	0.9	351232
139	1005	4	0.0	Perform fund morning resource thank certainly.	1.2	5645312
49	1093	4	1.2	\N	1.8	1088512
245	214	4	1.4	Rule current model foot the my.	1.2	4061184
96	687	4	0.3	\N	1.3	7806976
68	318	6	0	\N	0.5	4030464
231	239	4	1.0	Something ago approach society animal. Investment series natural.	1.6	7907328
260	1001	4	0.0	\N	0.6	1751040
209	298	4	2.7	\N	0.8	3934208
192	371	4	1.7	\N	1.2	3066880
145	1223	1	0	\N	0.6	1881088
35	1183	1	0	Important short at.	0.8	387072
15	942	4	1.7	Wife Congress air theory test record group thus.	1.5	7732224
195	161	4	2.4	Phone society mission because own senior bill.	0.6	5846016
161	1063	4	1.1	Before threat short individual crime. Son receive place card reach green.	1.3	7598080
235	1164	3	0	\N	1.9	1010688
299	364	8	0	Various contain debate feeling officer who.	1.4	4765696
3	262	1	0	\N	0.6	5705728
142	422	6	0	\N	0.7	3383296
8	202	4	1.7	Peace rich hundred student expert practice.	1.5	1230848
204	583	5	0	\N	1.7	7502848
210	1173	4	1.2	Top production executive trial gun line pick.	1.4	2833408
175	134	6	0	Interest live born southern front wall.	2.0	7166976
207	982	4	0.1	Become kind so language though operation.	1.2	2552832
255	1166	4	2.6	Green be whom on understand small.	0.5	3105792
251	407	4	1.7	\N	1.7	6259712
50	99	4	1.8	\N	1.7	3747840
129	455	4	1.2	Travel rate off responsibility rather contain then.	1.5	3306496
17	1147	4	2.4	\N	0.9	2793472
44	114	9	0	Garden could ground attack allow be.	0.7	2069504
82	662	7	0	Full Democrat capital impact. Of involve newspaper glass dog grow.	1.6	5176320
201	1077	7	0	Get pull hair.	1.5	2988032
200	936	6	0	\N	0.7	4682752
92	561	7	0	\N	2.0	7531520
163	233	4	2.1	Rest medical institution us dog training.	1.6	7126016
262	746	4	2.8	Meet mother several central speech.	0.8	7322624
103	268	8	0	\N	1.3	4322304
95	1061	4	2.0	Grow mention my south image wish drive.	1.8	3022848
233	69	4	2.4	\N	0.7	3419136
304	734	4	2.9	\N	0.6	6605824
2	1053	5	0	\N	1.7	5755904
150	261	8	0	\N	0.6	5719040
215	704	4	2.2	Walk least difficult hard.	0.5	5564416
185	463	4	2.0	\N	0.8	5178368
69	223	10	0	\N	1.4	3706880
29	286	4	2.2	\N	0.9	6453248
26	495	7	0	Staff kind weight detail understand scene.	0.8	4955136
147	651	9	0	Nice second major imagine fine activity.	0.5	861184
205	632	7	0	\N	2.0	2339840
98	1147	4	2.4	Sense federal poor at institution guess PM blood.	1.1	5789696
20	95	10	0	\N	2.0	8252416
266	478	1	0	\N	1.0	5882880
240	878	7	0	\N	0.5	381952
95	1046	7	0	Debate let east also newspaper now nearly. Including per unit suddenly team.	0.5	880640
160	804	3	0	\N	1.6	1201152
31	760	4	1.9	Country how better until.	1.4	846848
166	405	4	1.2	\N	1.7	4108288
36	941	4	2.2	\N	1.8	1333248
95	1063	4	1.1	\N	0.6	5167104
282	822	10	0	Risk cultural act political.	1.1	4879360
12	357	4	2.2	\N	0.6	413696
111	911	4	1.7	\N	1.2	2964480
253	653	4	0.5	If beyond character drive enough few million.	0.8	3738624
101	1185	4	2.1	\N	1.7	8023040
229	244	4	1.3	Model surface show purpose.	1.8	289792
161	1062	4	1.5	Old improve senior rule near threat.	1.4	2117632
147	669	4	1.4	\N	1.3	1827840
170	439	4	0.6	\N	0.9	7284736
202	862	4	1.4	Much her thing its soldier. Security possible century model explain offer.	1.7	4109312
256	753	3	0	\N	1.7	202752
86	1138	4	1.1	Performance manage senior loss represent create history.	1.8	5101568
1	820	4	0.1	\N	1.1	6339584
59	483	4	1.3	Water four family discussion lawyer along.	1.3	4938752
152	610	9	0	\N	0.9	7495680
105	1089	4	1.3	Reduce entire control population Congress throughout. Grow remember early purpose deep.	0.5	3763200
152	625	4	0.4	While international assume top reality improve research employee.	1.9	5279744
114	890	4	0.5	Stuff avoid people away focus medical.	1.3	5864448
89	616	4	1.9	\N	1.0	5262336
54	704	3	0	International business performance if.	0.8	6977536
250	294	4	1.4	\N	1.7	1134592
127	636	6	0	Property paper job little that stage people run. Itself focus how item nature.	0.8	2288640
301	140	4	1.4	Strong grow practice model pull.	0.6	5547008
160	814	4	2.7	Term southern road population of cover. But give good experience.	0.9	5979136
115	552	7	0	During buy admit own.	1.2	7426048
112	628	8	0	\N	0.8	5958656
111	925	4	2.9	Late machine break value common hour.	0.9	4537344
271	458	6	0	Traditional try explain.	1.9	893952
304	736	4	1.8	Various black crime note participant owner walk.	1.4	5574656
233	78	4	2.4	Maintain fight soldier lot clearly worry consider.	1.0	1861632
61	456	1	0	Benefit worry would sell include miss. Stuff author material difference it.	1.0	1709056
84	355	4	2.9	\N	2.0	4298752
161	1054	4	2.7	Which finally debate believe quality mention.	1.4	4360192
161	1043	3	0	\N	0.8	1305600
275	1085	4	1.1	\N	0.9	5942272
144	994	4	2.8	Money street change option.	1.8	5785600
73	886	1	0	Maybe month recently left so many certain.	1.9	1655808
111	926	9	0	\N	1.6	3617792
206	652	5	0	Why our investment best.	1.9	4267008
232	828	5	0	\N	1.8	1060864
68	300	4	1.2	\N	2.0	2111488
247	902	4	2.4	Social trade their road get great effort.	1.0	5182464
278	683	4	1.0	\N	1.4	1187840
193	335	4	1.8	Remember source boy. Fear say attention stop project too who.	0.6	1548288
106	340	4	0.6	\N	1.6	1945600
202	869	1	0	Eat science reason defense standard realize. Hear whether public no instead hundred south.	0.5	1605632
267	616	4	1.9	Join beyond anyone environmental.	1.0	5928960
170	417	4	1.5	\N	0.9	2186240
115	546	8	0	\N	1.8	485376
211	401	7	0	\N	1.2	3911680
185	459	4	2.8	New pressure well other size.	1.8	2340864
164	966	8	0	Now even question short reality.	1.3	6642688
298	706	8	0	\N	1.7	4392960
161	1040	1	0	Listen debate your prevent.	1.9	1086464
132	557	4	2.3	Pm majority ten.	0.8	1416192
266	477	4	2.9	\N	0.8	6046720
107	990	10	0	\N	0.6	1137664
235	1169	7	0	Office sound easy condition investment.	0.9	6952960
82	671	10	0	Account weight provide worker.	0.5	3623936
256	754	4	1.3	\N	1.7	2231296
21	1027	5	0	Myself order along throw shake.	1.1	1136640
247	923	4	2.0	Form girl close place majority. Dog interest friend how fear.	0.6	6041600
210	1168	4	2.2	Argue staff nation entire agency whose.	1.4	276480
33	778	8	0	Staff low serious process get family dog.	1.0	2592768
163	231	3	0	\N	1.7	6942720
136	586	4	1.2	\N	1.2	4824064
240	864	4	1.6	\N	1.2	3418112
267	615	4	1.2	\N	1.1	7541760
307	391	10	0	\N	1.4	2970624
70	956	7	0	\N	1.8	2700288
111	933	8	0	\N	1.3	3928064
216	1091	4	1.9	Man beautiful bed beat real tough lead.	1.8	6899712
10	748	4	2.1	\N	0.9	3812352
274	612	7	0	\N	0.9	6555648
3	277	4	2.9	\N	0.7	4212736
91	277	4	2.9	Country chance Republican employee half line ahead.	0.9	2789376
68	311	4	0.7	Difference skin company particular. Deep surface floor operation.	0.5	6197248
150	273	7	0	If election production include bed.	1.4	4219904
173	941	5	0	Specific tree ability series Republican bit professor.	1.6	6276096
89	617	4	1.2	Property month represent through color itself. Fill interview phone clearly social approach check.	1.9	7634944
218	229	7	0	\N	1.0	5608448
18	829	4	1.6	\N	1.1	1828864
46	1077	4	2.5	\N	1.7	906240
233	79	7	0	Notice be again draw person few product.	1.7	5161984
254	832	4	2.0	\N	1.5	171008
9	995	4	2.4	\N	1.0	1207296
215	721	3	0	Figure program technology person doctor him still. Sort enough smile fear leave section.	1.9	8020992
263	371	10	0	Realize official set security campaign my technology of.	1.4	656384
90	596	10	0	Risk ever buy high couple about glass onto. Talk series site door first.	1.2	787456
83	996	4	2.0	\N	1.9	3378176
48	1180	4	0.7	\N	1.4	1031168
61	461	7	0	\N	1.9	1038336
68	293	9	0	\N	0.7	1673216
95	1049	1	0	\N	1.4	2709504
294	1217	4	1.6	\N	1.9	2972672
224	401	4	0.5	Rule ground way machine wife scene. Family suggest office red would.	1.6	964608
135	61	4	2.6	\N	0.6	6988800
94	1163	4	2.9	Later say industry wide operation star.	1.6	2820096
170	437	5	0	Record deep treatment hand discover method.	0.6	7166976
126	1194	4	2.3	Military not now.	1.5	4702208
270	423	5	0	\N	1.3	1156096
285	1070	4	2.3	Yeah group job million machine. Law over administration church.	1.1	2177024
256	762	5	0	\N	1.5	5021696
48	1177	4	1.9	\N	1.3	3898368
124	973	3	0	\N	1.5	6711296
235	1156	4	1.3	\N	1.1	7967744
285	1086	4	1.8	\N	1.9	8123392
5	891	4	1.4	Thousand cell identify.	0.9	5346304
140	563	4	1.9	Million time region occur market probably choose. Treatment these only individual that reflect.	1.1	4294656
74	241	4	2.2	\N	1.2	226304
226	771	1	0	Notice defense especially my work could need practice.	0.5	3297280
159	541	6	0	\N	1.9	3609600
9	989	5	0	Study wonder unit reduce hot value shoulder when. Lose painting identify increase term.	1.8	569344
128	1117	4	1.2	Address side least cost.	1.8	3703808
20	118	8	0	Food cultural take card enjoy. Summer see form safe home service alone toward.	0.6	6141952
40	491	4	1.6	\N	1.9	5060608
192	379	3	0	\N	1.8	2072576
288	761	4	2.8	Particularly play wear.	1.1	7778304
291	320	4	1.6	Threat join raise high no. Score run style.	1.0	1698816
54	715	5	0	\N	1.1	747520
218	236	5	0	\N	1.3	1769472
69	220	1	0	Window call clearly since exactly billion.	1.1	3881984
170	440	7	0	East every western firm.	1.7	7024640
233	55	4	1.5	Blue possible teacher race who space career.	1.0	2626560
65	394	4	2.5	\N	1.0	5575680
247	894	3	0	Large even conference sign bring through sit see.	1.9	322560
134	1133	4	2.9	Doctor nearly question just. Drop truth computer prevent ahead.	1.4	2139136
24	85	4	2.2	\N	0.8	4571136
216	1081	7	0	Son piece easy above allow.	1.8	3889152
40	486	4	0.2	Low fire build those laugh four professional.	0.6	7577600
162	559	4	2.6	Process simply rate they per account pressure.	1.6	5055488
262	742	4	1.9	\N	1.8	4562944
113	491	4	0.3	Thus teach body blood large brother single.	1.9	8206336
274	622	4	2.8	\N	1.2	5167104
168	732	4	1.9	Forward follow data resource.	1.3	6003712
3	271	4	2.5	\N	0.8	1536000
161	1067	7	0	Despite parent work million stage amount relationship he.	1.8	909312
193	338	4	2.1	\N	0.9	192512
291	299	4	1.5	\N	0.6	2528256
98	1149	4	1.1	\N	1.9	2638848
68	319	8	0	\N	0.8	7867392
241	510	7	0	\N	0.9	3678208
195	154	4	1.8	Occur rich morning two public.	1.2	850944
146	1100	3	0	Without boy me message beyond them happy.	1.3	7191552
153	940	3	0	\N	0.5	482304
193	333	7	0	A best language theory defense film eye. Early almost give already walk.	1.1	3815424
192	369	4	1.8	Lay drive discussion cause.	1.1	1655808
119	31	4	1.4	Hold recent during I chair foreign network career.	0.9	3434496
308	696	4	1.7	\N	1.4	2189312
302	292	3	0	\N	1.0	7469056
242	863	4	1.6	\N	1.0	1784832
307	386	4	0.3	General vote difference party include fire.	1.8	1898496
108	738	8	0	\N	1.8	1043456
159	546	4	1.7	Treat likely thing inside step country.	0.8	5094400
174	500	4	0.1	Address maintain once. Tough goal they treatment.	1.8	1943552
150	275	6	0	Wonder entire theory bed whose level note.	1.5	6168576
178	536	4	1.9	\N	1.2	8085504
85	1104	4	2.8	Husband white experience front would shake.	1.2	6226944
121	681	4	1.5	\N	1.5	3491840
255	1163	4	2.9	\N	1.9	1566720
43	108	8	0	Over between health. Along crime seem power former.	1.2	2622464
84	346	4	1.3	\N	1.6	1773568
93	671	4	1.2	\N	2.0	1890304
114	880	3	0	State same minute require will type decade. Food modern might because despite.	1.3	2599936
294	1214	4	1.7	Rule memory series parent parent too.	1.3	7536640
26	491	1	0	\N	0.7	3257344
259	937	4	1.5	Onto teach black wind.	1.3	3753984
80	217	6	0	Easy wrong trial event strategy image identify which.	1.7	6811648
73	866	4	0.2	Allow wall leg deep method.	0.7	4619264
273	1188	4	2.3	\N	1.2	2110464
228	846	4	1.0	\N	1.3	7802880
242	889	4	0.4	\N	1.4	5364736
6	174	4	1.8	Institution few kind do improve.	1.5	3109888
4	286	3	0	Unit direction tree.	1.8	8250368
169	263	4	1.0	Wait executive continue huge indeed prepare. Reason great mind place candidate her food.	0.5	2885632
92	570	9	0	Face itself class only as central.	1.9	7130112
86	1137	8	0	\N	1.3	2586624
147	644	10	0	\N	0.6	2158592
309	833	4	1.2	Able benefit turn human air letter.	0.9	2237440
44	94	1	0	\N	0.7	5898240
188	1176	8	0	Century southern pay drop present teacher.	1.5	1097728
1	797	1	0	Threat physical right relate statement.	0.7	409600
300	231	8	0	\N	1.5	6031360
113	493	4	1.7	\N	2.0	6276096
203	1216	4	1.5	Box ground single necessary father.	1.0	3612672
54	705	4	1.0	\N	1.9	1978368
145	1214	4	1.7	Recognize cell western human happy poor care. Population develop citizen office result material.	1.1	1552384
138	34	6	0	\N	1.5	3862528
159	540	6	0	\N	1.0	1362944
89	620	4	0.4	Let check simple affect very nothing.	1.9	6790144
98	1127	9	0	\N	1.5	8284160
215	714	4	1.8	Current whatever cultural bring.	0.6	702464
257	363	4	2.1	\N	1.3	3880960
76	606	4	2.7	Computer street wrong improve receive full.	1.6	3396608
133	380	4	2.5	Wife really eye shoulder bag cover law.	1.6	3819520
56	1107	4	1.3	\N	0.8	2775040
267	620	4	1.2	While find enough paper series. Brother people determine race concern hot.	0.6	291840
69	221	4	2.0	Radio catch teacher clearly.	1.4	5549056
205	612	4	1.7	\N	1.5	2700288
192	366	4	2.9	Congress build current.	1.7	1734656
114	885	5	0	Law whole board prepare base open. Certainly actually morning.	0.9	5820416
264	837	4	1.1	National sense how ahead any poor find. Manager offer sometimes that necessary bag.	0.8	1716224
269	519	5	0	Guess especially go.	1.8	2735104
150	276	1	0	\N	1.5	6514688
139	1004	8	0	\N	1.9	3819520
67	740	4	2.7	Strategy husband provide wrong.	0.6	319488
226	786	6	0	\N	0.7	162816
88	1071	4	1.4	Future why up must live method. Stage list economic none.	1.0	5340160
244	274	1	0	\N	0.7	2241536
302	289	1	0	\N	0.5	8267776
247	927	4	1.7	Property trip popular. Nation record see.	1.7	778240
249	264	5	0	\N	0.7	3461120
158	183	8	0	Wonder field describe list describe.	1.1	6678528
54	730	6	0	\N	0.7	2567168
94	1153	9	0	Really everybody notice would avoid.	1.8	2276352
94	1154	4	2.8	\N	1.6	2533376
284	151	7	0	\N	1.0	3621888
240	861	4	2.5	National book job information listen there. Know hit should others treat result environment.	1.1	4827136
38	1113	4	2.2	\N	1.1	2446336
152	613	4	1.1	Me behavior hard event toward.	1.0	2723840
105	1090	3	0	Month coach career score throughout.	1.3	2164736
34	981	4	2.4	\N	0.9	6798336
228	845	4	2.6	Fall should finally control occur. Hospital while catch city medical.	1.1	3543040
177	277	6	0	Keep fly lot. Cause plant protect read family develop.	1.5	2953216
173	947	8	0	\N	1.6	696320
103	253	4	1.1	\N	0.7	1382400
242	878	4	0.6	\N	1.9	2289664
186	250	8	0	Small medical system bring.	0.8	7028736
233	52	4	1.3	Animal lead hundred executive painting some few.	1.5	5886976
83	997	4	1.6	\N	1.1	4809728
134	1135	4	2.9	\N	1.2	2723840
184	454	9	0	\N	1.4	2853888
169	268	7	0	Election build could throw air treat medical. Rise rich church.	0.6	7808000
302	290	6	0	Answer believe determine military tree.	0.7	925696
238	330	4	2.4	\N	1.3	8164352
124	975	4	0.8	Never catch change size political manager water.	1.7	4625408
95	1055	4	1.7	\N	0.6	5213184
297	759	5	0	\N	1.7	2812928
178	552	7	0	\N	0.6	451584
116	639	6	0	\N	1.9	934912
169	267	3	0	When news tonight suffer.	0.9	1511424
180	942	4	1.7	Next consider husband different impact including.	1.0	2488320
35	1181	7	0	\N	0.6	8102912
250	314	4	0.5	Size if here cell.	1.7	136192
46	1084	9	0	\N	1.7	4250624
97	364	4	1.9	\N	1.9	8267776
130	1063	9	0	Of mind share none fall kind.	0.9	3981312
106	348	3	0	\N	1.5	547840
130	1062	3	0	Official red get similar manager consider.	1.4	5513216
142	432	4	2.3	\N	1.4	5200896
252	250	4	2.0	\N	0.6	1409024
300	211	4	1.1	\N	1.8	7153664
18	826	4	1.7	Along watch arrive expect. Score form situation their heavy her.	1.7	648192
159	552	4	2.4	Until response make accept hair.	1.8	7128064
69	217	10	0	\N	1.7	5628928
101	1187	4	2.9	\N	0.5	1811456
52	1160	4	1.3	After develop approach onto answer. Method while really commercial out almost present.	1.3	7782400
249	261	7	0	Several against us surface skin my artist thousand.	0.9	2477056
135	59	4	0.6	Music ten dark civil do.	0.5	667648
307	390	10	0	\N	0.7	6576128
89	621	6	0	Size board buy often help.	1.0	1670144
188	1175	4	1.1	Guy require indicate.	1.0	2348032
22	65	5	0	Peace toward table behind early plan lot.	1.1	7394304
4	278	4	2.5	\N	1.0	1040384
169	261	4	0.2	\N	0.6	2382848
236	462	8	0	Fear drive situation popular reflect field personal.	0.6	7745536
273	1195	4	2.7	\N	1.1	968704
94	1151	7	0	Owner official door final. Government lot person right charge.	1.5	8136704
158	182	4	2.5	Between nice crime subject tend deep describe.	1.2	2791424
217	1233	1	0	Garden finish address great. Audience what dog computer group.	0.7	6098944
170	448	4	2.9	\N	1.7	2476032
41	277	4	2.9	\N	1.7	6897664
170	424	7	0	Expect company own. Discussion help wish woman herself team marriage.	1.7	6918144
82	645	4	1.5	Adult development defense with bad author girl.	1.6	6817792
206	648	4	0.9	\N	0.9	4940800
253	649	4	0.1	\N	1.6	4207616
176	1013	4	0.3	Sometimes environment each family shake kid be.	0.6	1473536
30	818	8	0	\N	1.9	2790400
141	823	4	0.4	Trade its commercial institution outside.	1.4	6176768
151	453	4	1.2	Mrs doctor each edge high number step.	1.6	670720
210	1159	4	2.5	\N	1.3	1267712
73	863	3	0	Speak responsibility per would hundred admit. Support whatever former it.	0.9	2705408
184	460	4	2.8	\N	1.6	5099520
204	580	9	0	Become culture travel industry explain south economic.	0.9	1952768
31	752	4	1.1	\N	0.8	435200
286	1134	4	2.7	Difficult know that remember our.	0.8	914432
309	823	4	1.1	\N	1.8	5884928
46	1088	4	1.8	\N	1.5	1915904
96	699	4	2.2	\N	1.6	3960832
115	534	5	0	\N	1.4	7784448
62	1182	4	2.9	\N	0.7	5569536
161	1051	5	0	\N	2.0	4036608
137	735	7	0	\N	1.5	3715072
194	682	4	1.1	\N	0.6	7998464
266	469	9	0	Manager like eight senior. Play water establish section nice.	1.4	498688
31	755	4	1.6	When night exist sit little reduce see.	1.2	3926016
125	1054	6	0	Place fire road computer. Develop character develop.	1.0	3390464
76	596	10	0	Blue market modern attention have. Remain under cell before nearly.	0.7	3985408
26	492	3	0	Be season last affect phone why.	1.4	2641920
275	1088	4	0.4	\N	1.1	2134016
295	707	4	1.1	Reason product shake respond street.	1.6	1437696
242	872	3	0	\N	1.7	6333440
182	89	4	0.3	Image data like either.	0.5	2252800
234	821	3	0	Stuff mind discussion door company yeah.	1.0	5035008
82	659	4	1.3	\N	1.1	6219776
247	924	3	0	\N	1.8	4215808
50	105	5	0	Travel whole particular woman student easy. Color get adult could lot continue.	1.1	4384768
101	1193	4	1.6	Since inside meeting fear almost second nor.	1.1	4225024
205	617	3	0	Yes smile she measure.	0.9	2781184
24	88	4	0.6	Tree recently magazine. Statement control food left film.	1.4	6979584
236	457	9	0	\N	1.8	5597184
85	1105	4	1.4	News final buy take agent.	1.4	1602560
135	71	4	1.5	\N	0.7	4001792
171	847	4	2.5	\N	1.7	3972096
3	267	4	0.7	Still democratic few south moment.	1.3	7777280
286	1129	7	0	Future people minute data ago trade natural security.	1.2	4048896
134	1146	4	1.2	\N	1.4	2549760
187	430	10	0	\N	0.7	7231488
233	80	3	0	Debate campaign animal road under page production.	1.3	3641344
188	1192	4	0.2	Public politics finally author. Response thought above sound.	1.2	7885824
96	696	10	0	Machine son popular wait.	1.7	856064
271	460	4	2.8	\N	1.6	3679232
80	211	4	1.1	Perform leg manager join bad how information. Church number piece poor population movement mean green.	1.0	3535872
121	702	4	0.1	\N	1.3	5203968
44	120	8	0	\N	1.0	3420160
216	1083	4	1.1	Economy inside some also pull education care.	0.6	8136704
142	420	4	1.7	Sure method board up.	0.8	5397504
22	47	4	2.7	North result her.	0.5	6600704
267	614	4	1.4	To sit car always him customer as. Focus outside kid author forward blood owner.	1.3	6299648
145	1198	8	0	Realize most picture west establish mention collection. Produce dinner east behavior leave.	1.7	3344384
5	871	4	2.0	Admit happen military charge.	1.5	7071744
137	749	4	1.0	Realize place itself.	1.1	7087104
161	1047	4	0.8	\N	1.2	4087808
124	974	5	0	\N	1.6	8128512
170	445	4	0.8	\N	2.0	7620608
41	274	4	0.3	Sister firm ever memory tell open. Threat degree learn there.	0.8	7848960
69	237	4	1.3	Political factor share later attorney.	1.0	3940352
175	144	1	0	Possible in sometimes condition.	1.7	5612544
188	1191	7	0	\N	1.7	1319936
253	659	4	1.3	Nor loss true option fine baby. Live no send couple.	1.8	5613568
262	734	4	2.9	\N	1.3	167936
73	885	4	1.9	Feel sit right training.	1.3	6757376
237	373	4	1.6	\N	1.4	4765696
55	451	4	1.4	Program among until cell artist bring safe difficult.	1.9	841728
173	943	4	2.2	Soon unit detail. Special arm yet piece account film story.	1.6	7877632
224	405	4	1.2	\N	0.5	3701760
21	1029	3	0	Above industry cost clearly rich control.	1.3	3395584
223	376	4	2.5	Growth since its picture fall.	1.5	2125824
129	458	5	0	\N	1.7	7444480
128	1116	4	1.5	South example natural.	1.1	3604480
125	1057	4	2.0	\N	0.9	4089856
69	224	4	0.0	\N	1.3	7984128
270	428	5	0	Newspaper pull candidate safe.	1.9	3001344
139	1012	4	2.6	\N	1.6	7969792
198	1152	7	0	\N	0.6	2089984
297	752	7	0	Bring care opportunity myself concern authority.	1.6	1895424
150	270	10	0	Practice gas major sometimes produce fish.	0.8	3534848
292	373	4	2.0	Within fast far figure.	1.6	1312768
155	51	1	0	Tax various artist finish for production rest start.	1.9	8010752
300	209	10	0	Practice oil stand. Different whatever you end step anything those.	1.8	228352
93	647	1	0	\N	1.3	6981632
52	1153	1	0	Force street occur bar hand. Near research field enjoy evening arm water.	1.9	8226816
304	746	6	0	\N	1.5	6331392
179	455	9	0	Difficult set major heavy simple.	0.7	6121472
91	258	4	1.9	\N	1.6	1719296
122	856	1	0	Past employee somebody conference agreement more choice set.	0.7	339968
149	675	10	0	\N	1.4	3838976
91	254	7	0	Expert check as rise.	1.2	1788928
66	336	9	0	\N	0.7	2636800
258	1190	4	2.7	Certain activity report low serve.	1.3	5179392
220	415	4	2.8	\N	1.0	2278400
307	399	3	0	\N	1.0	410624
114	860	7	0	Policy I address condition smile interesting.	1.5	7196672
48	1196	4	1.1	\N	1.4	1823744
53	590	4	0.2	Media fish this visit player pay.	1.8	7918592
8	204	4	1.7	\N	1.7	882688
163	221	8	0	Miss their less tell operation young.	1.1	7992320
288	758	4	1.4	Many yard until. Thus statement same reason along single standard.	0.6	3190784
205	619	4	1.3	\N	1.5	2152448
82	656	9	0	\N	1.2	6815744
163	228	4	1.3	Sea heavy read develop. Resource machine stock peace race artist.	1.5	2800640
6	173	4	1.2	Attack begin campaign personal father sport.	0.5	2488320
267	626	4	1.9	Born medical available around.	1.5	2279424
166	402	3	0	Build voice unit. Ago close late.	1.1	309248
170	423	5	0	Military describe heart line only method. Radio serve defense between.	2.0	2221056
187	437	6	0	Significant focus prepare.	1.3	4400128
167	9	3	0	Decision size news growth.	1.0	6306816
85	1110	8	0	Carry front choice business suggest.	1.2	8071168
242	866	4	2.5	Per security nice risk.	1.9	3367936
305	394	9	0	End professional south Mr investment specific hold. Fall we region add down.	0.5	6199296
147	660	4	0.2	\N	0.7	4024320
5	862	4	2.3	\N	0.9	943104
163	218	8	0	\N	0.6	7822336
43	98	4	1.8	World war travel mention financial.	1.4	6103040
103	262	9	0	Subject avoid Mr hospital tonight.	1.5	1153024
103	254	4	2.0	Say data baby use.	1.6	7918592
111	929	4	0.5	\N	0.8	6371328
91	262	4	2.2	Positive check finish.	0.9	2917376
103	273	6	0	Soon central hundred style six policy garden. One customer game region rule article add especially.	1.7	5385216
179	457	1	0	Human friend deep machine cup instead.	0.8	5342208
100	317	4	0.2	\N	1.0	2062336
233	57	4	1.0	Value unit play five. Book item information policy rock.	1.1	6296576
35	1179	7	0	Hit your station open close nearly personal. Reason ever attorney baby important factor yeah.	1.5	5325824
300	218	1	0	Tough economic beyond easy.	1.9	7211008
33	772	7	0	Put feel four lot reach. Himself space prove exist born likely.	1.5	2507776
246	742	3	0	\N	0.7	7738368
159	542	4	2.0	Model between wish use bad fall catch. Resource under deep security.	1.5	7119872
9	988	4	0.2	\N	0.8	7586816
23	501	4	2.3	\N	1.8	3282944
201	1070	8	0	Could project condition amount get appear.	1.7	653312
291	298	4	2.7	Out generation team civil.	1.0	6500352
169	273	1	0	Argue fear bag challenge detail media teach.	1.6	1681408
80	222	10	0	Fear experience garden training show.	0.8	5557248
142	434	4	2.9	\N	1.6	5272576
84	351	3	0	Any night interview follow service summer.	0.8	1416192
65	396	7	0	Whatever use quickly weight provide.	1.4	606208
262	745	4	2.0	\N	0.9	2849792
93	644	4	2.5	\N	1.4	881664
132	556	9	0	\N	1.3	2661376
143	453	9	0	Interest assume reach pressure member.	1.5	902144
284	160	4	1.0	When effort difference miss specific others bill exist.	1.7	8151040
127	642	3	0	Will Democrat whole his.	1.6	8124416
99	554	3	0	\N	0.6	4107264
156	334	3	0	\N	1.6	6479872
112	612	4	1.7	\N	0.8	2661376
20	94	4	2.1	\N	1.0	2636800
132	559	5	0	Home realize listen rather daughter word.	1.5	1446912
240	883	4	0.3	\N	1.3	3852288
203	1225	4	1.4	\N	1.5	2107392
127	633	6	0	\N	0.8	6244352
257	365	4	2.0	Check model director you that other word. Anything each eat would.	1.6	998400
292	367	5	0	\N	1.5	2954240
137	742	4	1.9	Them rule knowledge manager. Second radio sea spend season capital picture represent.	1.6	918528
86	1143	4	1.3	\N	1.9	3580928
46	1074	5	0	Customer together stay turn Republican feeling experience.	0.7	5327872
68	287	1	0	\N	1.4	3249152
53	577	4	2.2	\N	0.8	558080
76	602	5	0	Need never federal movement player.	0.6	7157760
245	231	4	1.0	This consider wide five.	1.0	7805952
52	1167	4	0.3	\N	0.8	4966400
285	1088	4	1.8	\N	0.8	3551232
200	943	4	2.2	\N	0.9	4262912
289	200	3	0	Feel stand present yeah school.	1.7	4240384
172	285	1	0	\N	1.5	5107712
291	314	4	2.3	Wrong simple newspaper animal note it good.	1.2	5829632
86	1136	4	1.0	\N	1.6	5605376
285	1073	4	1.6	\N	1.2	3165184
130	1044	1	0	Turn nice conference voice.	0.6	4944896
299	360	4	2.7	\N	1.6	831488
292	371	4	2.3	Lawyer old teach at successful best.	1.6	1532928
231	243	9	0	Season minute just few soldier.	2.0	5909504
96	698	4	1.8	Mr call technology Mr run.	0.7	2647040
44	118	4	2.9	Teacher sea measure.	1.2	1395712
249	252	4	1.8	First gas later worker seek.	0.8	7634944
256	751	8	0	\N	1.2	5779456
72	1104	4	2.8	Actually however history performance adult agency nature list.	1.2	395264
94	1162	1	0	\N	0.9	2850816
246	738	8	0	Fire available small start future organization.	0.5	8078336
194	700	4	2.6	Difference health new song.	1.9	6603776
294	1210	4	0.1	\N	1.9	2363392
236	458	5	0	Example front radio minute pull.	1.5	5994496
86	1130	8	0	\N	0.8	2701312
106	352	4	1.2	\N	1.0	5830656
36	938	4	1.5	\N	0.6	7288832
114	877	4	1.2	Hard pressure argue.	1.9	5447680
158	195	4	1.0	Sort former any late sister eight. Plant example local camera.	1.1	174080
184	452	5	0	\N	1.3	630784
2	1040	4	1.1	Form why lay degree live character game contain.	1.1	6922240
226	766	4	1.5	Scientist bank offer despite.	1.0	7607296
22	45	5	0	Because relate report drop language dream present.	1.6	7149568
301	141	4	2.3	\N	0.9	3704832
137	739	7	0	\N	1.4	2965504
266	468	4	2.1	\N	1.8	185344
2	1055	4	1.7	\N	0.7	3136512
80	233	4	2.1	\N	1.3	7576576
109	1013	3	0	\N	1.6	1492992
33	777	10	0	Name buy campaign require central what learn.	1.0	2547712
155	64	4	0.5	Expert travel start. Change contain against beyond way benefit voice.	1.7	4409344
234	794	4	1.4	\N	1.4	5923840
268	601	4	2.7	\N	0.9	7422976
65	382	4	1.5	\N	0.7	6790144
73	879	4	2.6	Career occur election small television product.	0.7	594944
128	1119	4	2.3	Draw position interview describe difference.	0.5	7450624
178	530	4	2.8	\N	1.6	304128
242	860	4	1.3	Artist part necessary receive. Senior computer role rate century.	1.5	8208384
240	890	5	0	Of increase south all bag those practice. Hotel relate hot measure and.	1.7	3590144
84	356	4	1.0	Also choose only Mrs. Happen have laugh able middle west.	1.2	5673984
130	1055	4	1.7	Article popular easy order information avoid beautiful.	1.8	1940480
178	533	4	1.2	\N	1.8	7727104
40	495	6	0	\N	0.7	8064000
240	884	10	0	House exist science wife brother.	1.7	5835776
46	1090	3	0	\N	1.6	3974144
301	138	1	0	Girl finally language hair.	1.1	7345152
54	727	7	0	Day dinner believe add president event.	1.7	6129664
169	277	4	2.9	\N	1.1	5567488
245	211	7	0	Yes him mind ground card available sign.	1.2	3757056
301	134	9	0	Able citizen mother guy clear service.	1.9	5685248
26	503	6	0	\N	2.0	1397760
135	48	4	1.4	\N	0.8	4190208
114	888	4	2.1	Amount very hear how best federal. Defense usually entire form.	1.1	2358272
232	833	4	1.2	Not rather feel tree stay expert.	1.3	6310912
68	301	4	2.8	Fish that nature hour water state standard record.	1.8	4032512
247	893	6	0	Anyone program coach performance admit in analysis.	0.9	3531776
37	331	9	0	Someone north short wide.	0.5	5049344
218	232	4	1.2	\N	1.4	3827712
198	1166	4	2.6	Authority reality key walk. Music page reveal door.	1.4	2789376
86	1147	1	0	President newspaper because score century.	0.5	7085056
21	1032	4	2.0	\N	1.6	7513088
297	757	4	1.5	\N	1.9	8133632
70	959	1	0	\N	1.0	3721216
202	882	6	0	\N	1.2	566272
91	269	4	1.8	\N	1.7	887808
20	100	4	2.4	\N	1.1	2884608
156	333	4	1.2	Successful nice success election tree.	0.7	1401856
115	521	4	1.6	Road record put fill.	0.8	662528
220	412	8	0	Science history ability daughter.	1.0	6105088
105	1087	4	2.7	City home trouble produce energy risk involve matter.	1.8	2584576
114	891	10	0	Detail yourself all.	0.5	527360
237	366	8	0	Republican training success employee quality hundred.	1.9	7265280
82	665	9	0	\N	1.8	914432
188	1186	4	1.9	\N	0.9	5647360
302	314	1	0	\N	1.8	1423360
258	1178	4	1.7	Note include from leader. Wall number into development.	0.5	2680832
68	299	4	1.5	Wide maintain leader edge spring remember.	1.1	7331840
20	103	7	0	\N	1.8	1807360
84	333	4	1.2	\N	1.2	4773888
70	960	4	1.6	Ball too almost risk new at part center.	0.7	7915520
215	724	4	1.6	Industry drug writer population affect cause open.	1.4	4121600
198	1172	6	0	\N	1.0	5106688
244	270	9	0	Center significant old.	2.0	1859584
48	1188	1	0	\N	1.9	6526976
158	187	10	0	\N	1.7	7247872
161	1057	10	0	\N	1.0	5608448
206	645	4	1.3	Mean year performance effect.	0.8	1980416
116	641	5	0	Term present final first religious free. Film board put time others.	0.8	6518784
273	1184	4	0.2	\N	0.8	2754560
181	1110	4	2.2	\N	0.6	6228992
24	83	4	0.3	Cultural cost market best night behind stage.	0.5	1285120
10	747	4	1.8	\N	0.9	5693440
292	375	4	1.2	\N	1.5	2700288
21	1037	4	2.2	\N	1.7	4494336
255	1167	4	1.9	\N	1.8	7081984
135	45	5	0	\N	1.2	5297152
120	195	4	1.0	Summer way step doctor trouble moment they. Range either change.	0.8	5411840
108	744	4	1.5	\N	1.4	7219200
105	1077	10	0	Republican structure able eye rest nice.	1.7	2333696
170	428	8	0	\N	1.5	6813696
115	524	3	0	Cut feel second deal around together really.	0.7	4415488
112	625	5	0	\N	0.8	2653184
66	338	4	0.1	\N	1.9	7620608
5	876	8	0	\N	1.5	4634624
112	623	3	0	All person sound amount.	1.9	5815296
111	920	7	0	Religious each fear doctor choose attack. Energy trial toward similar home democratic.	1.2	1627136
247	911	10	0	\N	0.9	3121152
234	795	4	1.2	Increase democratic decade whose unit who. Mr wait their.	1.9	4311040
94	1169	4	2.5	Hot role yard quality a direction thought.	1.0	6821888
291	290	3	0	Mother order form cost. Generation fear establish hair.	1.7	5405696
6	167	9	0	Assume before material however challenge ever.	1.7	2598912
284	156	10	0	\N	1.3	2938880
228	843	8	0	Particularly amount people today set million.	0.7	2250752
178	527	4	0.0	Imagine affect south such economy difference can.	1.0	2461696
158	192	4	1.8	Success PM garden never.	1.5	3478528
65	395	4	1.3	\N	0.7	1627136
98	1143	9	0	Anything than respond do there spring.	1.1	5591040
171	845	3	0	\N	0.8	2114560
125	1047	4	1.8	Improve industry history theory article father.	1.8	1950720
85	1106	5	0	\N	0.8	942080
166	409	6	0	Ever boy feel yourself office common.	0.5	3245056
278	693	7	0	\N	0.5	6752256
108	747	7	0	\N	1.9	6569984
41	262	4	0.5	Common major nice begin college partner.	1.9	3303424
272	820	7	0	\N	0.9	6671360
279	563	4	1.9	\N	1.5	1349632
138	26	10	0	Practice common just animal. Close son its meet western language almost left.	1.6	2725888
59	464	4	1.3	\N	0.9	989184
240	877	6	0	\N	1.6	7500800
302	309	4	1.9	\N	1.5	6717440
189	555	4	2.7	Threat drug certain term avoid.	1.7	4827136
67	746	1	0	\N	1.5	3169280
173	937	1	0	\N	1.7	8253440
84	336	4	0.5	Stand staff expect future foot this difficult.	1.1	741376
114	867	4	2.4	Make affect front enter.	1.5	1943552
52	1162	4	1.8	Fund analysis situation Republican culture. Congress suggest myself man record.	1.9	1699840
149	674	3	0	Quality experience effort sometimes. Use sort figure table.	1.6	2681856
150	258	5	0	\N	0.8	4345856
232	830	4	2.8	Produce rise best argue rock clearly health.	1.3	7609344
22	44	4	1.2	Hair should central.	0.8	3683328
106	346	6	0	\N	1.6	5101568
155	50	4	1.1	\N	1.8	8154112
90	604	4	1.7	Seem baby draw I never military memory. Commercial seem response thus clearly sport.	1.5	5318656
111	892	7	0	\N	2.0	5437440
251	408	4	2.8	\N	2.0	1494016
52	1165	4	1.9	\N	1.7	5801984
48	1179	4	0.9	\N	1.6	310272
155	70	4	0.0	Teach nation sit food.	1.8	6845440
259	944	10	0	\N	1.2	1214464
88	1085	4	1.1	Available stop current on successful available number discover.	1.6	1112064
1	809	4	1.7	Two short lawyer brother consider road traditional hotel.	1.6	4225024
179	450	4	1.9	Check table concern call. Late thing next manager natural score benefit.	0.9	2271232
272	800	4	2.3	\N	1.0	6780928
138	38	3	0	Chance risk last eight.	2.0	6348800
50	114	4	0.6	\N	1.0	4730880
135	69	4	2.4	\N	1.6	3395584
94	1172	1	0	\N	1.9	825344
27	27	4	1.8	\N	1.4	1517568
100	298	4	2.7	Assume north road check red sure too.	1.5	8003584
74	250	4	2.0	Face build than enough step sign.	1.6	7439360
206	660	3	0	Media compare improve.	1.4	5210112
105	1075	4	1.6	\N	0.5	2448384
84	339	7	0	\N	1.0	2950144
242	858	4	1.9	\N	1.0	1682432
86	1139	4	0.2	\N	0.7	1811456
221	1109	4	2.3	Yourself record avoid.	1.2	4153344
302	310	4	1.9	Together spring brother act entire.	1.3	4443136
198	1168	4	2.2	Simple reduce reason within civil radio theory.	1.7	6238208
290	1095	9	0	Age put but reality toward fast.	0.7	5454848
291	291	4	1.1	\N	1.8	1727488
161	1061	7	0	\N	1.7	1032192
125	1059	1	0	Score argue could heavy gas. Central want cover vote edge safe.	2.0	2893824
52	1163	6	0	\N	0.9	7897088
146	1098	6	0	\N	0.7	4878336
5	878	4	1.3	Want time character word several despite prepare. New eye international him difference live star wait.	1.3	8039424
204	590	4	2.0	Decision threat common benefit us it center.	1.6	7321600
258	1185	4	2.1	Day hope government student.	1.8	6124544
124	976	7	0	\N	1.6	4142080
103	270	6	0	People manage physical term.	0.9	130048
186	239	6	0	Television more speech serve gas expert.	1.6	5862400
244	265	4	0.3	\N	0.8	7585792
302	301	4	2.8	They yes pressure without green.	1.8	6410240
49	1096	4	1.2	Avoid significant see whether billion public focus provide.	0.7	4047872
58	563	4	1.9	Mean present realize consider early give we. Discover forward popular receive condition teach network.	0.8	924672
40	506	4	2.2	\N	1.8	1626112
108	737	4	1.5	\N	0.8	5434368
1	815	4	1.9	Matter career leader spring.	1.8	5137408
137	741	4	1.0	\N	1.3	601088
152	623	7	0	Again century take day stop.	0.5	2678784
305	393	6	0	Without approach moment table civil project.	0.7	1868800
202	877	4	1.2	Size vote economy food.	0.6	6823936
54	728	9	0	Fly machine only mouth wind prove.	0.9	7908352
55	463	5	0	\N	0.7	5058560
217	1232	9	0	\N	1.6	6648832
282	825	4	1.2	\N	1.2	4319232
110	393	10	0	\N	1.4	6675456
242	865	4	2.9	\N	1.1	3485696
5	875	7	0	Example industry policy clearly.	0.6	2312192
98	1141	4	1.1	Either put dream attack early.	2.0	1527808
112	627	1	0	\N	0.6	4018176
183	366	7	0	Although I onto onto cell wish. Everyone court heavy chair.	1.0	6170624
289	181	4	1.5	\N	1.1	1024000
191	749	4	1.0	\N	0.7	2947072
96	693	4	1.0	Economic result especially option.	1.7	3923968
50	103	9	0	Measure operation share bar minute.	1.6	3052544
36	940	7	0	Enjoy condition factor together race growth accept. Surface radio place throw type east shake.	1.3	5261312
94	1173	3	0	\N	1.7	7176192
196	426	4	0.5	Age leader always less deal.	1.0	1162240
120	183	4	1.1	\N	0.7	2327552
5	872	4	1.1	Allow though serious successful home.	0.8	3115008
125	1055	4	1.7	Kitchen wall present three statement Democrat respond return.	1.8	5243904
204	593	4	1.5	Agree here continue keep.	1.0	1366016
210	1172	3	0	Four blood drive Mrs. General summer bed happy peace.	1.6	2823168
139	1006	4	1.5	Physical data end become since entire.	1.9	6238208
160	805	4	2.7	\N	0.6	3013632
289	180	5	0	Firm card law particularly green.	1.4	3909632
186	242	4	1.4	Evidence war TV possible cold level federal capital. Argue role election gun trial.	1.9	5765120
221	1102	4	2.3	Especially cell himself room painting defense trade figure.	1.6	1680384
187	427	3	0	\N	0.8	5699584
158	194	4	1.3	\N	0.7	8152064
285	1079	4	2.4	\N	1.9	3603456
114	868	1	0	\N	1.7	2216960
301	139	4	1.5	Alone himself feel stock. Film chance price newspaper arrive.	0.6	2001920
108	745	4	2.0	\N	0.8	6642688
294	1199	4	2.8	Prevent sort idea dog.	1.3	7223296
48	1175	5	0	\N	1.5	1943552
298	719	8	0	Fund deep wish both.	1.1	3779584
22	75	9	0	\N	1.7	4221952
92	576	10	0	\N	1.3	7038976
247	920	4	2.3	Rather not camera avoid present office thus.	1.7	4797440
241	514	3	0	\N	1.6	5777408
124	977	4	1.3	\N	1.2	2599936
295	724	10	0	Fill oil election face much short morning.	1.1	2739200
14	84	3	0	\N	0.7	6471680
214	1094	6	0	\N	0.6	4548608
230	1227	4	1.9	\N	1.0	3016704
217	1228	4	2.7	\N	1.7	5330944
210	1151	4	2.8	\N	1.3	5386240
34	982	9	0	\N	0.8	1446912
21	1034	6	0	Result himself process professional service design. Him something everybody concern much week.	1.1	4268032
124	972	4	2.9	Now their usually build bank morning son. Food friend soldier rich.	1.1	7601152
50	107	4	2.1	Address method discover doctor.	1.0	2712576
23	505	4	0.4	\N	1.8	316416
63	245	5	0	\N	2.0	4339712
2	1067	4	0.7	Nature may hand of though send five.	2.0	5067776
56	1098	7	0	Professor management charge Democrat quite experience see identify. Must music myself all.	2.0	8018944
183	372	4	1.9	\N	1.7	2939904
106	353	4	2.7	Store above forward drive.	1.1	4745216
152	628	6	0	\N	0.9	2276352
170	446	4	0.4	Fill morning good seem team activity.	0.5	2560000
308	700	4	1.0	Everything recently research avoid by exactly. Admit teacher college reduce positive up.	1.9	3576832
115	529	7	0	Show produce dream. Capital book science behavior character season party.	0.8	912384
46	1072	9	0	\N	0.8	5656576
122	849	4	1.4	Hotel think three bed page.	1.7	1593344
85	1098	5	0	Throw common along next across suddenly.	1.9	1767424
11	403	3	0	Right person your past to research avoid sometimes. Civil travel night water behind group.	1.0	437248
25	176	10	0	\N	1.3	3066880
283	414	4	2.1	\N	0.8	2742272
146	1111	4	2.6	Away evening table.	1.5	5752832
176	1006	4	2.2	\N	1.5	4640768
152	622	7	0	Not think some far.	1.3	1241088
191	744	6	0	Address author matter oil.	0.8	282624
294	1208	4	0.8	\N	1.1	5275648
226	770	9	0	Involve edge carry front.	1.9	5919744
101	1183	6	0	Or fast practice.	1.4	1246208
152	624	4	1.7	East voice imagine great ahead clear.	2.0	3011584
54	720	10	0	Lose there since significant issue different degree.	0.9	509952
115	544	6	0	\N	1.0	3522560
62	1179	8	0	Live what agree enough into.	1.6	1568768
177	271	4	2.5	\N	1.6	3874816
44	93	10	0	\N	1.0	5005312
102	1030	4	1.1	Might thing glass matter southern once. Task child as use section day future.	1.5	3903488
170	436	7	0	\N	1.9	2979840
262	747	9	0	\N	1.2	2487296
73	891	4	1.4	\N	0.7	176128
106	355	4	2.9	\N	0.8	1569792
186	249	4	2.0	Road these identify.	1.8	7606272
145	1220	4	1.7	Right policy future ten guess.	2.0	1266688
300	227	4	0.6	Property century thus world share face happen art.	1.7	7388160
25	165	6	0	\N	0.9	911360
138	33	4	2.0	Research economic able.	2.0	8083456
229	246	10	0	Range different them.	0.6	7245824
175	130	9	0	\N	0.9	7783424
1	807	7	0	\N	0.6	578560
111	916	4	2.2	Certain ever social foreign sound while trial.	1.0	3403776
1	818	6	0	\N	0.6	6926336
285	1072	4	0.5	Before Mrs ago last yet you put. Tree report think candidate mind reveal music.	1.1	5246976
291	300	9	0	Sister hair daughter but wish.	1.1	2816000
121	686	4	0.6	\N	1.1	8012800
195	158	10	0	Wear play many. Challenge from begin doctor according something charge.	1.2	2440192
31	751	6	0	\N	0.8	8171520
162	554	4	2.1	\N	0.7	6352896
213	856	4	1.2	\N	0.6	3522560
103	272	4	1.5	\N	1.7	5132288
141	831	4	0.7	From final forget seven economy none. Write wear entire bar special.	0.9	827392
178	540	4	2.0	Crime physical whom wear culture.	0.8	2909184
44	102	4	2.0	New continue red tree message.	1.0	4909056
203	1218	4	1.2	Environment trip capital anything successful.	0.7	5054464
15	939	4	1.7	\N	0.6	4503552
43	96	4	0.8	\N	1.6	750592
152	626	4	1.9	Child quality cause could surface free maintain.	1.5	6704128
145	1226	10	0	\N	1.2	6446080
1	802	6	0	\N	1.8	3184640
209	289	9	0	Art of half free.	1.8	7420928
302	322	10	0	\N	1.5	3314688
253	656	8	0	Stop many technology reveal result here. Herself officer first firm.	1.8	7937024
258	1195	4	1.4	\N	0.7	2048000
208	678	3	0	\N	1.4	6855680
247	903	4	2.0	Least serve also leave report chance religious thought.	1.9	2472960
50	96	9	0	Test section data. Early data win word.	1.1	7262208
1	819	4	0.5	Five lot pick campaign southern.	0.8	5533696
129	456	8	0	\N	0.6	2415616
198	1153	4	2.4	\N	1.5	8206336
147	657	4	2.1	Start fast article reflect read.	1.0	5024768
32	1094	9	0	\N	1.5	2349056
283	415	3	0	\N	1.5	1460224
55	450	3	0	\N	1.1	4526080
226	764	10	0	Majority require evening enter trade church sit.	1.1	2688000
285	1091	7	0	\N	0.8	337920
43	93	4	0.2	\N	0.7	8110080
43	114	4	1.7	Than matter smile policy. Stuff sit turn marriage subject try model agree.	1.2	663552
53	584	4	2.0	Keep mouth teach walk.	1.1	1767424
150	265	4	1.6	\N	1.0	3786752
245	226	3	0	\N	1.6	846848
105	1086	4	1.8	Task every education camera report safe.	1.5	6453248
2	1063	4	1.1	\N	2.0	4955136
165	467	4	2.7	\N	1.8	3103744
33	792	1	0	\N	0.8	2374656
209	287	6	0	Former evidence of drop once. Stock magazine forget degree oil own.	1.5	8095744
284	162	6	0	\N	0.8	2411520
199	326	4	2.4	\N	0.6	1258496
142	435	8	0	\N	1.5	5556224
54	716	4	2.1	\N	1.0	3444736
103	274	6	0	\N	0.9	1150976
275	1089	7	0	\N	1.7	3274752
2	1056	4	0.5	\N	0.9	7342080
144	992	4	0.6	Though reason create challenge. Road can employee add without approach.	0.7	3613696
67	738	4	1.5	\N	1.6	4732928
66	346	9	0	Step scientist control car avoid.	0.7	6949888
85	1111	4	1.1	Already reality sound moment outside act.	1.4	5830656
216	1090	10	0	\N	1.5	2707456
66	340	4	1.8	\N	1.1	4487168
274	626	4	1.9	My use civil peace half.	1.0	2628608
145	1205	4	1.8	\N	1.2	3686400
298	728	4	1.1	Practice ago hotel or writer if always attention. From team interest.	0.9	8130560
68	298	1	0	Break offer indeed letter kid arm against walk. Red mouth camera camera old another.	0.6	8215552
206	666	7	0	\N	1.3	7422976
111	928	6	0	\N	1.4	4874240
176	1004	7	0	Prove spring mention skin gas happen.	1.2	2971648
234	818	7	0	Third power behind court election ground report position. Various themselves American compare half anyone.	1.1	2810880
274	630	4	1.9	Capital consider thought task.	2.0	1401856
203	1217	10	0	\N	1.6	1581056
240	881	7	0	From art president city despite hospital five. Role cultural several tough fly.	1.3	5184512
251	405	9	0	Development hand huge kitchen develop under fill.	0.8	7810048
284	159	4	2.1	\N	1.2	1692672
19	826	7	0	Discover happen even great decision arm wall no.	1.0	8132608
65	386	1	0	Mother visit store measure lose. Effort hold goal today whose member sit.	0.7	6883328
91	270	4	1.3	Piece box social strategy free.	1.3	5711872
253	671	4	0.8	\N	1.3	6896640
32	1093	4	0.0	\N	1.6	7827456
33	787	4	2.4	Success pattern hospital today though suddenly lay husband. Simple bad we despite amount staff.	1.1	8217600
61	453	4	0.5	Fly stop free think soon professor tell.	0.7	5074944
70	958	9	0	Wrong into remember foreign final responsibility.	0.9	7313408
204	579	4	2.9	Purpose begin right measure.	1.9	4284416
266	467	7	0	Use security star small increase. Nation when collection offer paper customer because.	1.4	2653184
155	74	4	2.4	\N	0.6	1018880
22	57	3	0	\N	0.6	1659904
260	997	4	2.6	\N	1.9	2440192
111	934	6	0	\N	0.8	4036608
148	1186	4	1.9	Our stock draw believe.	0.9	2511872
86	1134	4	2.7	\N	1.2	2140160
105	1084	4	1.8	\N	1.2	4388864
69	228	5	0	\N	1.8	5113856
227	679	4	2.9	\N	1.5	5684224
17	1127	7	0	Major watch practice ok. Already few among major seat third center.	0.9	7387136
201	1088	5	0	\N	1.7	8083456
145	1210	10	0	Medical else either now defense. Political instead whether benefit.	0.9	6916096
120	180	8	0	Left recognize somebody.	0.6	415744
215	712	1	0	Ability impact staff during resource detail look.	1.1	4617216
188	1183	7	0	\N	0.9	1585152
271	450	8	0	\N	1.8	3215360
291	297	4	2.8	Last allow day seem car have true exist.	1.9	6347776
81	997	4	2.6	Serve community usually newspaper opportunity fast effect.	1.5	5718016
103	263	8	0	Natural decade sing hotel. May compare family time phone would purpose.	1.9	1250304
227	675	6	0	Entire develop can test.	1.6	8013824
276	559	4	2.6	\N	1.8	3605504
300	228	4	1.3	\N	1.3	7258112
77	12	4	2.5	\N	0.9	6647808
161	1046	9	0	With free economy traditional until stand notice new.	1.1	5415936
15	945	9	0	Share point field.	1.9	4201472
107	987	4	1.7	Possible day economic international fly.	1.6	2039808
180	935	4	1.4	Base serious year put minute factor write reduce. Usually cost life why cost.	1.2	1824768
195	151	10	0	\N	0.6	6127616
4	285	4	1.9	Half manage medical meet major.	1.6	3751936
273	1186	4	1.9	Environmental edge which agree vote surface from.	1.8	162816
238	325	4	1.6	Actually everything life they program.	0.8	7932928
137	733	7	0	\N	1.3	5032960
149	678	4	1.4	\N	1.0	7091200
172	280	9	0	\N	0.7	6114304
77	16	4	2.9	Evening rise front hold reason glass.	1.7	3803136
6	165	4	1.3	Land anyone expect speech start peace.	1.3	1668096
18	825	4	1.2	Process reach nature six.	1.4	3137536
285	1084	4	1.8	\N	0.6	5595136
74	246	9	0	\N	0.5	437248
221	1099	5	0	\N	1.9	2549760
53	589	10	0	\N	1.4	1244160
234	811	6	0	Time likely ever sell old sign control nor.	0.9	2922496
298	721	4	1.5	\N	0.6	6013952
108	733	4	2.2	Manager to few follow impact.	1.3	3067904
106	345	4	1.2	Bring better indicate happen difference item.	0.8	108544
297	761	4	0.2	Everybody road professor remain.	0.6	3201024
202	876	4	1.3	\N	1.8	2245632
234	810	4	1.0	\N	1.9	4413440
187	421	4	1.7	Process poor free paper able fire wear.	0.6	8048640
150	266	5	0	Stand organization fund open. Choose us society which couple bit again.	0.8	1404928
101	1194	4	2.3	\N	1.2	7355392
179	459	6	0	\N	0.6	4972544
256	763	4	1.7	Simply never choice through become garden decade.	1.4	4211712
291	305	4	1.1	\N	1.3	7553024
40	494	7	0	\N	1.4	2797568
181	1109	9	0	\N	1.6	5935104
62	1185	7	0	\N	1.1	2753536
104	362	8	0	Able quality side with nearly trade form.	2.0	2223104
300	226	9	0	\N	1.0	3044352
310	156	4	1.9	Hospital would necessary.	1.1	2282496
248	1099	4	2.3	\N	0.5	5736448
41	275	4	1.5	\N	1.6	7601152
163	227	4	1.0	\N	1.0	3650560
291	323	7	0	Best woman tree anyone increase.	1.6	7113728
96	694	4	2.1	They over base job region require interesting.	1.0	1438720
273	1181	4	1.1	\N	1.4	4197376
80	221	9	0	\N	1.7	3220480
102	1022	4	2.0	Word give our film. Region catch maybe man away eight.	0.6	3707904
183	377	4	2.9	\N	1.6	4096000
76	605	4	2.2	\N	1.7	4436992
294	1219	4	2.5	Plant instead dog because responsibility relate. Herself seat fly specific major.	1.3	3113984
75	284	8	0	\N	0.7	3635200
82	660	1	0	\N	0.8	6124544
310	154	4	1.1	With everybody relate relate whole cold marriage.	1.8	2374656
164	955	4	2.4	Main couple marriage budget bar.	1.0	1317888
160	821	3	0	\N	1.6	6597632
3	258	5	0	\N	0.5	6674432
121	688	4	1.2	Above anyone often both.	1.8	7469056
73	884	4	1.1	\N	0.8	4580352
153	939	6	0	Fund house evening something career.	1.7	2567168
190	763	1	0	\N	0.5	2198528
84	334	9	0	\N	1.6	4748288
170	418	7	0	Agent thousand share. Early pass relate six understand by.	1.9	445440
125	1058	4	1.7	Less scene similar authority employee.	1.6	4550656
258	1187	3	0	Laugh my season common send father skill.	1.2	4389888
308	686	4	0.6	\N	2.0	1178624
121	701	7	0	Tough no positive decision. Game generation teacher maybe beat.	1.4	2483200
131	677	5	0	Sure water look none.	1.1	4363264
68	291	1	0	\N	1.5	117760
26	488	9	0	All reflect against pass hot check commercial.	1.7	3176448
192	367	9	0	Strong full laugh painting.	1.9	6162432
40	500	4	1.4	Mouth page vote sister staff add treat.	1.2	5060608
14	82	4	2.6	Bag money wish technology many thought.	0.6	6647808
205	614	4	1.4	Maintain program trade inside poor amount whom.	0.9	1389568
74	243	5	0	\N	1.3	3019776
217	1231	4	2.6	Age computer degree article.	1.0	6115328
127	634	4	2.6	Movie performance cut impact protect.	1.7	8115200
76	601	5	0	\N	1.0	4763648
266	471	4	1.4	\N	0.8	2496512
141	829	6	0	\N	0.9	6071296
247	932	4	2.8	\N	0.9	5801984
166	408	10	0	Record detail cover factor ball natural. Sister father big summer hear party Mrs.	1.7	915456
142	438	4	1.0	Glass who human adult. Each case mean court occur woman foreign.	0.8	7655424
272	794	9	0	Myself base fund many real agent various relationship. Final physical father almost stand try imagine.	0.6	4602880
109	1009	4	1.2	Natural factor six exactly technology. Side fast energy mean meet war.	1.8	436224
263	366	7	0	\N	1.8	7544832
114	882	4	2.3	\N	1.4	6979584
307	383	4	0.3	\N	0.7	3140608
143	458	4	0.6	\N	0.6	2646016
206	672	8	0	\N	1.8	8081408
38	1114	4	2.5	Station hundred owner year resource.	1.4	4700160
205	618	4	2.3	\N	0.7	7733248
142	428	1	0	\N	0.8	5200896
294	1203	4	2.2	\N	1.9	746496
64	360	4	2.7	Next bank executive goal.	1.7	5321728
73	865	1	0	Compare tough north food.	0.8	6025216
177	275	5	0	Food interview music base.	1.4	5380096
40	493	4	1.7	\N	1.3	514048
245	212	4	1.5	\N	1.5	8164352
46	1092	10	0	\N	1.2	1799168
80	213	4	1.8	\N	1.3	551936
115	543	9	0	Team contain price forget stop avoid right.	1.0	1676288
50	98	6	0	\N	1.3	268288
279	571	10	0	\N	0.9	3686400
158	184	10	0	\N	1.0	825344
223	371	4	2.3	\N	1.0	6680576
278	703	4	1.7	\N	0.8	2956288
33	782	4	1.4	Pick fly red human something.	1.2	1226752
247	915	9	0	\N	1.2	6419456
29	285	4	1.9	\N	0.8	415744
108	741	4	0.0	Budget best also sing apply something dinner.	1.3	6646784
79	557	8	0	\N	1.1	987136
216	1087	4	2.7	\N	1.5	4078592
43	92	4	0.9	\N	2.0	1508352
244	256	4	2.2	\N	0.6	5214208
268	607	1	0	\N	1.5	4183040
17	1135	7	0	Chair ever culture and pattern.	1.9	6275072
284	153	6	0	\N	0.8	5906432
67	748	4	2.1	Hard street our spend without.	1.9	3593216
91	272	4	2.0	Back near the national personal.	1.9	703488
260	999	4	1.3	Foot away probably water hundred ground later.	1.2	4923392
226	778	4	0.9	Grow design ten difficult forget. Box or benefit able.	0.9	6092800
125	1046	4	1.8	Hospital view avoid really.	1.9	6532096
247	934	10	0	\N	1.8	4728832
118	853	9	0	Station actually road opportunity.	1.7	2522112
151	450	4	1.9	\N	2.0	1019904
20	101	5	0	\N	1.3	1044480
163	212	4	1.5	Bar option evening suffer program west course.	1.3	6384640
80	235	4	1.6	\N	0.9	6409216
121	695	4	1.5	\N	1.5	6907904
106	342	6	0	Person idea Mrs generation. Box spend PM partner.	1.9	5240832
204	582	8	0	\N	1.3	3086336
39	845	4	2.6	\N	1.6	7418880
102	1024	4	1.9	Opportunity real phone conference former.	1.9	1568768
226	793	4	1.2	Call recognize build child owner.	1.0	2298880
233	45	3	0	Matter policy fall set information.	1.0	5258240
251	400	4	2.1	Station often central establish black nature book.	0.7	2120704
61	458	9	0	\N	0.6	7382016
65	387	4	1.5	Necessary tonight recognize TV.	1.2	6247424
180	944	5	0	\N	0.6	7695360
106	349	10	0	Identify total inside.	1.6	163840
135	75	1	0	\N	1.1	4221952
48	1182	7	0	\N	1.3	663552
68	313	4	0.4	\N	1.1	6416384
161	1044	6	0	Use specific tonight fast yeah concern.	1.1	317440
188	1180	1	0	Yet mean west exactly question standard care.	0.9	6180864
21	1022	4	2.0	\N	0.7	2233344
50	120	4	1.3	Reality for entire. Above rather kitchen on then again.	1.9	4651008
190	750	6	0	It cell attack impact floor mother.	1.7	3716096
160	811	4	2.5	\N	0.6	3393536
175	132	9	0	Trial vote high small fund method few account.	1.8	3768320
309	829	4	1.2	Arm when available. Describe respond top.	1.0	1314816
84	338	6	0	Beautiful region method store situation discuss. Across especially wind center.	1.0	2473984
45	841	4	1.5	Pretty teacher investment stay.	1.2	7026688
291	310	6	0	Apply though wall especially boy customer my blood.	1.6	2680832
270	429	4	1.2	Seven full suggest late seem go. None grow sometimes others sure television.	0.8	7687168
102	1016	4	2.2	\N	1.1	5145600
79	560	4	1.2	\N	0.6	2387968
98	1142	6	0	Send something leader check project. Key coach month kid past party candidate painting.	1.0	3939328
298	725	4	2.4	Five operation quality likely tax cold.	1.5	1790976
194	686	4	0.5	Effort name country.	0.5	2168832
187	435	4	1.5	Property establish society among.	1.9	6628352
233	77	4	1.8	Husband bag task plant.	2.0	4712448
266	465	4	1.0	\N	0.9	6752256
88	1080	4	1.5	Center pattern cut couple nothing yeah two. Growth simple cover ever growth too.	0.7	6612992
181	1098	9	0	\N	1.9	2307072
170	422	7	0	Official campaign cup attack small guy soldier.	1.5	6938624
137	738	4	0.6	Four although project process nor whether. This past direction.	0.8	7089152
114	866	9	0	Consider form language serve.	1.4	1987584
218	211	6	0	\N	0.8	2504704
63	247	4	2.7	\N	1.7	5368832
102	1020	7	0	\N	1.7	536576
67	735	4	1.7	Score animal bed Mrs measure. I rock seven oil western anyone.	1.1	8091648
111	918	4	1.9	Administration pay every course speech collection shake quality.	1.9	4319232
253	652	1	0	\N	2.0	4390912
73	864	1	0	More last black exactly stuff certainly ago among.	0.9	6407168
73	873	9	0	\N	1.7	7792640
266	466	4	1.6	\N	0.8	2588672
73	888	4	1.9	\N	0.8	6592512
234	815	4	1.9	\N	0.6	2988032
69	212	4	0.9	\N	0.8	8112128
218	237	6	0	\N	1.8	1545216
35	1192	4	2.7	\N	2.0	6735872
284	155	4	1.8	These citizen site also appear expert leave.	1.3	5940224
56	1109	10	0	Ability stand remain only defense.	0.8	1708032
180	938	4	1.5	Yard different maintain name save bar performance.	1.1	2693120
246	744	3	0	\N	1.4	1528832
136	580	8	0	\N	1.0	7180288
291	301	7	0	\N	1.0	6745088
247	907	4	0.8	Arm fund general mean whether blood their. Modern have board nation.	0.9	5982208
271	463	6	0	Image development win that clearly author.	1.5	4755456
289	187	4	1.5	Left arrive save data effort.	1.1	8131584
305	384	4	1.0	Some even technology how street see. Forget stand every mean tell market radio.	0.8	5831680
3	268	9	0	\N	0.8	6004736
40	487	4	2.8	Congress customer go.	1.3	1484800
62	1178	4	1.7	\N	1.2	1189888
169	260	6	0	Professional identify movement couple above.	0.6	6591488
196	445	6	0	After speech bit sing story reduce contain.	1.6	3587072
164	967	4	1.7	Bar full simple own.	0.5	613376
117	577	4	2.2	\N	1.5	4205568
196	439	4	2.5	\N	1.6	5049344
29	283	1	0	Sense put single teach happen.	1.0	6000640
31	758	4	2.9	Worker community generation address notice.	1.8	2903040
233	44	4	1.2	\N	0.9	4513792
198	1161	1	0	\N	1.5	5206016
193	346	4	1.0	\N	0.9	7013376
291	307	1	0	\N	1.5	5712896
103	277	4	2.9	\N	1.1	1148928
52	1161	4	2.2	\N	0.8	7771136
110	397	4	0.9	Likely military piece win boy.	1.2	3505152
76	599	4	1.6	Side Democrat party thought weight likely.	0.7	2408448
153	942	8	0	Coach above forward reach guy debate majority likely. Keep baby instead dinner to party.	0.8	5533696
4	279	4	2.9	Suddenly her firm think senior specific.	1.8	1617920
223	374	5	0	\N	1.0	6662144
192	377	4	0.5	Far couple few. Could development entire above.	0.8	3644416
298	726	4	2.5	\N	1.5	1683456
55	461	8	0	\N	1.8	6765568
210	1165	5	0	\N	1.5	1397760
163	213	8	0	Candidate must form majority unit interest focus. Television find they.	0.7	6772736
196	418	4	0.3	\N	1.5	5588992
70	948	4	2.0	\N	1.7	3481600
224	409	4	1.7	System PM walk six reveal friend try. Manage ball side science again.	1.2	2776064
41	265	10	0	\N	1.1	5181440
50	112	4	2.1	Why certainly sister impact color professional report.	1.9	3190784
21	1024	7	0	Also thought ever kitchen doctor. Worry field style list use.	1.9	4401152
270	439	4	2.5	\N	1.9	321536
85	1107	9	0	\N	1.6	5968896
192	372	7	0	Raise fund growth financial including itself city pressure. Bring hundred process onto quality city line.	0.6	7330816
156	350	6	0	Against article thing individual.	1.3	542720
213	853	4	1.0	\N	1.4	833536
178	535	4	2.1	Increase financial bed two hospital.	0.9	395264
118	849	4	1.4	Treat pass rich.	1.7	3008512
120	188	5	0	\N	1.4	7529472
291	308	3	0	Walk view represent collection. Top stuff stock current appear appear.	0.6	1893376
178	541	4	1.2	Play candidate know various.	1.8	8143872
273	1190	4	2.7	Site could serious decision sister energy reduce affect.	1.2	2252800
190	751	7	0	Lot room American candidate head friend area.	0.9	6252544
245	224	6	0	\N	0.8	3058688
100	302	4	1.0	Turn parent over start both picture.	0.8	5746688
64	358	4	2.6	\N	1.7	1627136
248	1109	4	2.3	Say when management of.	1.8	8103936
36	944	4	2.9	\N	1.8	5240832
1	804	4	2.7	Plant deal number Mrs apply thus reflect.	0.8	1454080
98	1145	3	0	\N	1.8	1562624
175	121	4	2.3	Tax community throw despite imagine adult. Middle write operation dinner study soon.	1.5	2974720
248	1108	1	0	Action other no special know.	1.4	7524352
10	749	4	1.0	\N	0.9	6192128
237	371	6	0	Him just player player page say. Same who bar less since along project.	0.6	3017728
86	1135	4	1.7	\N	1.8	4987904
169	270	4	1.3	Difficult teach easy.	1.1	721920
93	652	5	0	Should especially close listen. Contain shoulder beat street century age part.	0.6	4884480
178	532	8	0	\N	0.8	2686976
206	653	4	2.1	\N	1.3	2117632
167	19	4	1.7	\N	0.6	3537920
89	610	4	1.4	\N	1.5	7508992
307	398	9	0	Director drop join guess.	1.1	1358848
213	854	7	0	\N	1.4	3950592
279	569	4	1.4	Include somebody game.	1.4	3446784
131	674	3	0	Clear pay measure woman.	0.6	1974272
251	404	4	1.2	Way entire will force find great we.	0.6	3144704
298	730	7	0	Performance life blood authority run grow life.	1.9	1864704
305	399	6	0	\N	0.8	834560
36	946	4	2.4	Benefit way south huge now.	0.7	5424128
10	741	4	1.5	Right reach country partner various speak. Scientist difficult indeed.	0.8	3164160
82	648	4	1.3	\N	0.8	5766144
110	388	6	0	Safe class able grow of.	1.5	4177920
159	547	4	1.5	Media suddenly large onto.	1.7	3864576
234	801	4	0.5	State very kind partner manage. Compare whole draw establish.	1.6	1632256
49	1095	8	0	\N	1.1	2613248
202	870	4	2.7	Simply society amount school.	1.1	4190208
301	145	3	0	\N	0.8	1373184
263	373	3	0	Region place worry state move there.	0.8	7985152
88	1088	4	1.8	\N	0.7	5832704
265	1229	4	1.8	\N	0.7	5039104
88	1073	4	1.6	Glass throw work say alone want officer.	1.1	6679552
267	613	4	1.9	Fear operation manager scientist them give treatment.	1.1	6579200
62	1174	4	1.7	\N	1.8	2443264
22	68	4	0.6	Benefit talk do. Pull participant listen doctor for somebody before alone.	0.5	5325824
186	243	1	0	Most successful itself health.	1.2	572416
271	453	4	1.2	\N	0.8	6610944
309	827	4	1.6	\N	1.1	3304448
267	632	1	0	\N	1.6	5985280
43	120	3	0	\N	0.7	4098048
30	810	4	1.0	Yourself not arm seven teach or week. Finally government relationship resource close.	1.0	6367232
246	748	4	2.1	Determine time report vote.	1.8	4014080
44	108	4	1.6	\N	0.7	6990848
170	419	3	0	Knowledge speech station wall affect service.	1.6	1684480
80	232	4	1.2	Money issue some interesting assume detail.	1.2	2151424
229	245	7	0	\N	1.6	7195648
10	736	4	0.1	Movie class bad.	0.7	1286144
30	808	4	2.0	\N	1.7	6141952
203	1226	4	2.7	After imagine speak money strategy.	1.9	3529728
231	240	6	0	\N	1.0	1406976
135	79	4	1.0	Piece car himself exactly occur interview also fine.	1.9	1714176
202	888	4	2.1	Trade food where story service wide. Fill weight discuss.	1.5	2185216
225	1001	3	0	\N	0.7	4126720
106	351	4	1.5	Strategy southern music.	1.2	6901760
93	672	4	2.0	Program machine bed create. Scientist different painting black scientist less including.	1.8	1753088
285	1071	4	1.4	\N	1.8	3335168
83	1002	5	0	Dog brother these car free out. Reflect seem town themselves lot.	0.7	7015424
241	519	4	1.3	\N	1.6	7970816
156	352	5	0	Guy manage surface forward example.	0.9	2853888
22	58	4	0.9	\N	1.8	6522880
247	895	10	0	Each lose almost senior.	0.8	1033216
91	265	4	1.6	\N	0.5	5899264
17	1139	4	0.6	Road girl be above since. Bank feeling response understand.	1.3	6651904
229	242	6	0	Under set back someone travel pull hard.	1.8	1433600
108	749	4	1.0	\N	1.4	1156096
62	1184	4	1.4	Bit practice lead.	0.6	2565120
298	720	1	0	Interesting modern trip parent.	1.1	4900864
226	789	4	1.8	Western worker small school.	1.5	7513088
98	1131	3	0	\N	0.7	1363968
106	336	9	0	Only house much prepare loss network. Various some hand small.	1.7	4245504
110	384	4	1.7	Song radio so chance.	0.6	8118272
89	625	6	0	\N	1.5	1299456
121	699	4	2.2	Past call also wish network treatment late.	0.7	2262016
139	1009	4	1.9	\N	1.2	4795392
26	487	4	2.8	Floor age question successful.	1.4	2520064
46	1082	4	2.1	\N	1.5	7390208
100	293	4	2.3	\N	1.1	1010688
147	667	4	1.9	Leader affect purpose prevent sit work lay. West do she mean.	1.2	5185536
210	1164	10	0	\N	1.2	7272448
89	624	4	1.7	\N	1.7	799744
302	317	4	1.2	Thank audience ready size him name him.	1.4	7648256
45	836	4	1.5	Treatment owner dog.	0.6	6622208
240	867	1	0	\N	1.8	1355776
285	1092	9	0	Two five radio physical. Support letter section statement size.	0.9	4595712
164	968	5	0	\N	1.9	2029568
129	460	1	0	Want training speak light.	0.8	1587200
207	984	3	0	\N	1.4	4104192
69	230	9	0	\N	0.7	4955136
139	1011	4	2.7	\N	0.7	5216256
172	279	4	2.9	Prove security kid its head.	1.6	3459072
143	450	4	1.9	Various up finally.	1.7	232448
178	549	7	0	Amount all to hard whatever summer.	1.9	4734976
61	454	4	1.9	\N	1.6	3254272
187	440	9	0	Theory model type these door.	0.8	3940352
302	323	4	2.0	\N	1.2	1272832
91	259	4	2.6	\N	1.9	4999168
201	1083	4	1.1	\N	1.1	6342656
21	1026	10	0	Seek any card product others continue glass.	0.9	3202048
109	1010	8	0	\N	2.0	2673664
135	66	4	2.5	Story film million end remain.	1.9	5025792
244	261	3	0	Treatment include window writer trouble town. Nation stuff rise simply friend.	0.7	727040
256	760	4	1.3	\N	0.9	570368
306	609	4	1.7	Continue phone industry right.	1.1	5719040
209	312	4	1.6	\N	1.5	1329152
286	1146	4	1.2	\N	1.2	5565440
44	99	8	0	All beyond become point figure reveal.	1.5	5320704
257	359	4	2.9	College reflect one same seek people.	1.7	7824384
242	888	4	2.1	Authority general investment total politics read.	1.9	936960
259	940	4	2.6	Shoulder feeling hot avoid.	1.7	1523712
110	387	7	0	Enough happy learn understand writer professional one middle.	1.1	2716672
294	1202	1	0	Entire Mrs sort open pick across.	0.8	5072896
9	990	6	0	\N	1.1	4588544
258	1192	9	0	\N	1.8	2424832
298	707	4	2.3	\N	1.3	7189504
247	897	8	0	\N	1.6	6529024
5	863	4	1.6	\N	1.4	5060608
260	1002	4	0.4	\N	1.4	171008
43	106	4	1.0	\N	1.0	7644160
54	724	6	0	\N	1.1	6727680
193	342	10	0	How what send including.	1.8	5526528
82	663	4	1.0	\N	1.5	3605504
73	872	10	0	\N	0.9	5177344
138	31	4	1.4	\N	1.8	4976640
241	513	4	2.4	\N	0.9	6217728
58	573	1	0	Easy debate bring indeed despite few establish. Report dinner least.	1.9	1714176
3	252	4	0.2	\N	1.1	4854784
146	1108	3	0	On cup toward audience send themselves situation. Million lot serve eat mention audience size.	0.7	6460416
9	987	4	1.4	\N	0.9	2684928
198	1150	8	0	Size attorney expect set.	1.6	2379776
43	116	4	2.3	\N	1.0	8158208
285	1085	4	0.5	Suggest race economy yeah.	0.8	4362240
274	613	5	0	\N	1.4	8065024
201	1073	4	0.9	Early these sometimes as relate lose recently.	0.8	3837952
174	486	4	1.9	Benefit beyond and think I.	1.1	4176896
6	169	10	0	Recently sit imagine single paper hour break.	1.7	2854912
235	1154	4	2.8	Garden entire air situation.	1.2	7345152
48	1174	4	1.0	Generation wish analysis everyone include hope. Garden within down when son on way claim.	0.9	7788544
191	742	4	1.9	\N	1.4	1955840
200	937	6	0	Computer sound leave so general.	1.5	5923840
231	251	4	1.9	\N	1.0	4314112
125	1063	6	0	Republican true perhaps administration future hour piece.	1.4	6610944
141	832	4	2.0	\N	1.5	7158784
301	146	9	0	Race environmental soldier difficult top. He two five weight.	2.0	2169856
165	469	4	2.5	\N	1.1	4128768
118	850	4	2.1	\N	1.8	1378304
306	597	3	0	\N	1.2	7987200
155	61	4	2.6	\N	0.7	3620864
187	425	4	2.4	Near girl high popular. Practice trip top pressure.	1.6	5223424
136	585	9	0	Girl sense give attorney never.	1.8	6483968
180	946	4	2.4	Whom trade oil sometimes. Reflect ability over different true camera stand.	0.7	1094656
103	276	4	2.0	\N	1.3	2130944
270	419	4	0.9	\N	0.7	4434944
5	866	7	0	\N	1.5	1458176
209	302	9	0	Condition read clearly miss keep radio.	1.3	1991680
30	795	4	1.2	Practice common save protect own identify environment possible.	1.7	5609472
217	1230	4	0.2	Allow pick attorney step.	1.3	1079296
188	1195	4	2.7	\N	1.0	3330048
52	1150	4	2.8	\N	1.7	7129088
275	1072	4	1.0	Specific trade none along fast.	1.8	6683648
178	547	8	0	Court kitchen ago take. Day suggest through similar million way difference.	1.7	130048
175	145	5	0	\N	1.4	2239488
188	1196	4	1.8	Those fly country international. In draw situation night we.	0.9	6025216
140	562	4	1.6	Above now edge else arm.	1.0	6798336
270	416	4	2.2	Floor per body value present.	0.7	7282688
187	446	4	1.9	Wrong management bring manage woman serve Republican defense.	1.0	1581056
156	338	3	0	\N	1.8	6292480
105	1088	8	0	\N	0.5	2263040
93	656	4	2.3	Son within account story democratic picture.	1.9	7752704
307	388	4	1.0	Pick work performance tend present little southern. Rise attorney security dog several product.	1.7	1069056
246	745	6	0	Reason teacher of force for the popular.	1.3	1294336
65	383	4	1.3	\N	0.8	6129664
25	174	3	0	Toward who challenge senior would eight letter.	0.9	8090624
254	823	4	1.1	\N	1.6	8120320
254	822	4	1.8	\N	1.3	3178496
169	257	6	0	Bill long agreement break.	0.7	5710848
209	308	5	0	Onto job forward development language lay PM not. Even money husband defense buy.	0.7	7709696
121	698	4	0.1	Learn whom authority fight they outside tree.	1.8	4335616
104	365	4	2.0	Respond especially table.	1.1	1009664
33	774	7	0	Price you within future.	1.0	883712
249	258	5	0	Kid just late someone.	1.6	7977984
302	302	4	1.0	\N	1.4	1443840
44	95	4	1.2	Certainly senior local easy watch. Ago generation five avoid year woman available.	1.1	5151744
233	61	5	0	Player whose among situation. Another various federal instead yourself recognize article.	1.1	7885824
288	756	4	2.0	\N	0.9	4362240
296	852	6	0	\N	0.6	1170432
46	1087	4	2.7	\N	1.9	1189888
94	1156	4	2.8	\N	1.2	3462144
240	873	4	2.3	Pull lawyer his.	0.8	7923712
254	829	4	1.4	Sometimes wait whatever.	1.0	6761472
213	852	5	0	Resource benefit affect activity entire.	1.0	7682048
82	670	3	0	Power really rich home. Return anything show occur time.	1.4	2584576
28	201	7	0	Toward green conference. Enough pass billion treatment visit community recent.	0.9	8167424
52	1151	4	1.0	\N	1.9	3490816
163	238	9	0	\N	1.5	3019776
234	796	4	1.9	Design fast rest break.	1.5	355328
54	712	6	0	\N	0.6	3874816
130	1041	4	0.9	\N	0.6	1034240
250	300	10	0	Walk particularly drug south you.	1.5	6374400
297	762	4	1.7	Western imagine director history war.	1.1	3222528
73	860	4	1.6	\N	1.1	378880
54	719	4	1.0	Color into listen provide her easy.	1.3	2721792
244	267	4	1.5	Prepare prove project week involve.	0.8	5946368
242	884	6	0	Story series recently morning. Tonight over wear enough save grow both.	1.4	1631232
210	1155	1	0	By reality treat bad particular professional dog.	1.4	4166656
261	1001	4	1.6	Whom bank theory fear know low movement.	0.6	1841152
186	251	5	0	School product somebody ever specific new.	1.3	7123968
226	767	7	0	Generation environment how pretty huge industry hot sea.	0.9	8179712
84	349	6	0	\N	1.5	2386944
128	1125	7	0	\N	1.9	823296
165	465	1	0	\N	1.7	3277824
102	1018	4	2.9	\N	1.3	4186112
279	572	4	2.0	Majority administration war whether.	0.6	3209216
153	935	4	1.4	Traditional science none defense.	0.8	1635328
93	662	4	0.2	\N	0.8	843776
155	72	4	2.4	\N	1.0	1977344
84	337	4	1.5	Defense woman take son value buy.	0.9	4984832
291	312	4	1.9	\N	0.5	5257216
98	1139	4	1.6	\N	1.7	1981440
122	853	10	0	Challenge clearly room yes cell home.	2.0	5388288
22	72	4	1.9	\N	1.3	1115136
139	1013	4	2.3	\N	1.0	1543168
294	1212	4	2.3	Role land build edge image prepare.	1.9	2339840
289	198	3	0	Mind some thank use responsibility.	0.7	2128896
240	869	7	0	Different type set return rich remember themselves.	1.9	585728
89	619	4	1.3	\N	1.7	1737728
255	1162	10	0	Wide public student itself fear contain. Mean we heart than pick.	1.4	4603904
3	253	4	1.1	\N	1.6	7352320
295	713	4	1.6	\N	1.2	6380544
285	1089	1	0	\N	1.8	4019200
234	808	1	0	\N	1.5	3551232
169	269	5	0	\N	2.0	2741248
242	871	4	2.6	Own radio main practice not involve account.	1.9	1898496
208	677	4	1.2	\N	1.7	410624
196	428	4	1.7	\N	1.9	1254400
310	163	4	1.5	Single plant hear stuff several coach carry.	0.9	2924544
250	299	4	1.5	Seek event radio number level.	0.6	4454400
138	29	4	1.3	\N	1.7	7180288
177	272	5	0	\N	1.2	3409920
178	548	3	0	\N	1.9	5648384
187	419	4	2.9	Shoulder seat fast notice.	1.3	3631104
188	1178	8	0	Decision red allow material. Certain why easy management employee usually strategy.	1.3	7728128
256	752	4	1.8	\N	0.5	3588096
100	294	4	1.4	\N	1.6	2856960
247	925	4	1.6	\N	1.4	4048896
30	817	4	1.0	White federal agency open despite oil. Early condition star.	1.8	7456768
3	276	4	0.3	\N	1.7	8101888
138	36	3	0	Despite contain base her western. House process hard go.	0.6	2225152
174	491	4	1.3	\N	1.9	2959360
92	567	9	0	Sometimes season nearly bring.	1.6	6272000
216	1073	4	1.6	Several huge rate. Leader edge line standard of dark.	1.6	7128064
4	280	7	0	Various response religious box staff approach.	0.6	4429824
20	105	4	1.0	\N	1.4	3694592
57	560	8	0	\N	1.8	3813376
210	1171	4	1.6	\N	1.5	5076992
306	595	6	0	Wife your bad attention. Wife yourself thing certain Mrs language.	0.9	3759104
258	1194	4	0.0	Degree project the lot case.	1.5	922624
143	459	1	0	Enjoy without nor account. Reason necessary these discussion.	0.7	5060608
48	1187	3	0	\N	1.3	2159616
254	824	4	0.5	Ago finally town election alone someone program. Minute fear citizen industry wide career or.	1.0	739328
59	471	1	0	\N	1.6	1979392
273	1193	7	0	\N	0.8	2942976
148	1183	4	1.3	\N	1.0	6711296
125	1049	4	1.4	Tough wish bring court.	0.6	4258816
301	135	4	1.9	\N	1.8	866304
124	978	6	0	Sort quality imagine turn probably music themselves.	1.7	355328
41	264	9	0	Health yes return city authority image decision still.	1.2	7236608
54	708	4	1.3	Democrat east attack head shake body. Minute would policy.	1.9	1763328
115	541	4	1.2	Offer open raise while task.	1.3	2833408
103	267	4	1.5	Fear develop music certain office social significant.	0.9	7526400
206	663	8	0	\N	0.7	7284736
205	630	10	0	\N	1.5	3556352
17	1138	8	0	\N	0.7	5321728
101	1188	7	0	Back poor meeting season. Card think property response shoulder.	0.7	4867072
198	1158	8	0	Reason condition beat represent scene.	1.3	2591744
22	56	4	1.4	\N	1.5	6007808
100	316	10	0	Political bad position leader control finally. Price worry amount religious shake name.	1.6	3177472
1	805	8	0	Fight remember grow inside meeting.	1.5	4578304
27	28	5	0	Option total month us manager. Different eight environment car again of behind.	2.0	370688
33	789	4	1.8	Skin plant new skin.	1.0	7938048
235	1163	4	0.8	West fine build his.	0.9	301056
216	1079	4	2.4	Professional sea generation girl chance.	1.2	8108032
25	179	1	0	\N	1.2	4817920
215	728	4	1.7	Back owner near left forget save.	1.9	5046272
308	689	4	2.4	\N	1.3	3338240
18	822	4	1.6	\N	1.7	7192576
194	696	9	0	\N	1.1	6129664
259	939	10	0	\N	0.6	3104768
48	1194	10	0	\N	0.6	754688
196	425	10	0	Easy likely capital guy front machine. World official fill medical.	1.8	6481920
288	757	1	0	Example ago interview if laugh interest.	1.1	2878464
145	1206	1	0	Issue follow describe reduce position full.	1.0	2268160
307	385	7	0	\N	1.4	3636224
17	1133	4	2.9	\N	1.5	345088
286	1133	1	0	Per table door serious clear guy leave serve.	0.8	5316608
275	1074	9	0	\N	1.4	6197248
217	1234	4	1.2	\N	0.7	3076096
120	190	4	0.7	\N	1.2	3135488
30	803	4	2.3	\N	1.0	8212480
20	109	5	0	\N	2.0	5700608
289	194	9	0	Return heart often job.	1.4	4421632
254	825	4	1.2	Difference also claim since chance.	1.0	5454848
215	725	4	2.4	\N	1.4	3553280
187	447	6	0	Realize whom old employee trade green.	1.2	789504
178	528	4	1.3	\N	0.6	2089984
59	466	4	1.6	How movement far if control grow.	1.6	6682624
11	404	10	0	Pretty news to international the bed top. High wrong play soon list avoid office maintain.	1.7	5091328
277	1003	4	1.5	\N	1.9	5069824
203	1223	4	0.1	Realize admit manager quickly American improve mention. Guess so fish author.	1.5	2727936
5	882	10	0	\N	1.5	2792448
35	1180	4	1.3	\N	0.7	7887872
270	438	4	1.0	\N	1.9	742400
301	137	4	1.9	\N	1.7	2584576
216	1085	5	0	\N	1.1	1198080
310	157	4	2.0	\N	1.0	7792640
196	437	4	2.6	Information himself yourself air sound southern walk letter.	0.9	8120320
286	1140	9	0	\N	1.2	7053312
258	1180	8	0	\N	1.6	6938624
251	409	4	0.1	Machine herself war affect hand leave process.	0.9	6921216
195	162	4	2.6	\N	1.1	1223680
83	1003	1	0	\N	1.4	2700288
50	106	9	0	\N	1.5	4694016
3	269	9	0	\N	0.7	1464320
120	187	4	1.5	Never bed listen threat lead son.	1.0	7150592
96	688	4	2.3	\N	1.2	5666816
288	755	4	1.6	\N	1.7	3299328
62	1176	5	0	Base wife appear seven look such.	1.2	1982464
307	384	4	1.7	Myself southern next.	1.2	7088128
120	199	4	1.5	Require language that establish.	0.9	3792896
87	977	10	0	\N	0.9	6170624
216	1082	6	0	\N	1.8	250880
203	1208	6	0	Idea president experience hard remember arm central. Do worry big then building.	2.0	658432
63	248	4	1.0	\N	0.6	962560
72	1105	4	1.4	Despite hand especially. Specific beat hot.	1.0	5304320
163	215	3	0	Student political couple may check bag range.	0.5	5541888
83	999	10	0	Simply everything decision million. Consumer third miss film.	1.6	3610624
226	788	6	0	\N	1.8	6664192
249	260	4	1.8	\N	1.1	7622656
115	522	5	0	\N	1.1	4950016
14	89	5	0	\N	0.5	1470464
111	921	5	0	\N	1.5	817152
15	936	5	0	Student discussion soon city movement report.	1.3	2668544
203	1212	4	1.0	\N	1.7	1738752
50	119	4	1.3	Take catch girl very station make material.	1.4	3986432
253	651	6	0	\N	0.8	944128
22	69	4	2.4	Administration movie back skin police western.	1.6	954368
67	734	4	0.9	\N	1.3	1994752
89	612	4	0.4	Public specific event will fear.	0.9	2262016
255	1164	4	1.5	Guy everything course offer surface serve cost.	1.7	7164928
178	531	4	2.2	\N	1.4	2490368
164	951	3	0	\N	1.2	5829632
302	288	4	1.4	Term wear treatment employee shoulder clear force.	1.8	3790848
165	468	9	0	\N	1.5	7318528
187	429	3	0	\N	1.0	2869248
63	250	4	2.0	Meeting share again pressure soldier a.	0.9	814080
124	979	4	0.3	\N	1.7	3301376
44	92	4	1.4	Member current clear Republican total late price. Education avoid table.	1.8	393216
273	1180	8	0	Decision black must media take paper.	0.6	7035904
92	572	6	0	Interesting wear store more clear produce a.	1.7	2388992
125	1052	7	0	\N	1.3	7436288
136	588	7	0	\N	1.5	6349824
110	399	4	1.1	Beat close thing night some ahead Mr.	1.3	4363264
249	273	6	0	\N	1.8	2139136
275	1092	4	1.4	\N	1.0	6092800
187	439	8	0	Tonight activity choose letter sound team over. Participant image your try.	1.3	2485248
30	800	5	0	Science policy thousand.	1.0	1925120
206	664	4	2.5	\N	0.8	6219776
30	807	4	2.8	Officer before physical better return attack check. Our guess west across generation wear less.	1.8	6071296
206	650	4	1.8	\N	1.5	2344960
142	418	9	0	Music none inside concern close today. Feeling state avoid summer dog.	1.8	5792768
260	1000	4	0.4	Space enough economy practice PM wife fish.	1.1	5645312
250	307	4	0.2	Dream foreign security.	1.3	6160384
24	84	9	0	Sea television economy kid. Appear someone theory indicate last fast tree number.	2.0	3573760
56	1110	4	1.9	Property language food develop find history Mr.	1.5	4903936
56	1108	3	0	Shoulder operation scientist soldier believe individual here.	1.8	3989504
15	946	4	2.4	To room radio position involve.	1.1	303104
175	136	4	1.2	Continue commercial share new his operation look. Family but miss if.	1.3	1251328
148	1193	4	1.7	Age body after everything training appear camera. Until own law blue treat choice.	1.7	201728
302	316	6	0	\N	1.0	6144000
61	460	4	2.8	\N	1.0	4651008
304	748	4	0.1	Citizen technology with against box ready.	0.7	3161088
252	239	4	1.0	Military arrive road without.	1.6	2827264
43	91	4	1.3	Forward guess sit system message hospital most specific.	0.8	2378752
148	1187	4	0.4	Similar amount everyone truth give music.	1.9	2958336
304	747	4	1.7	\N	1.3	703488
273	1196	4	1.8	\N	1.3	1350656
258	1177	4	1.9	\N	0.6	3377152
199	324	1	0	\N	1.4	2235392
125	1066	10	0	\N	0.6	6352896
142	441	4	0.5	Firm recognize rate difficult mind claim leader idea. Late professional west box throughout.	1.4	3486720
294	1221	8	0	Generation economic across rock main society.	1.7	5824512
2	1041	4	1.1	\N	1.7	6124544
308	703	7	0	\N	1.2	1045504
307	382	4	1.5	\N	1.9	2938880
234	807	4	2.8	Agreement wind cost old spring piece.	1.7	3210240
27	32	4	2.6	Need street let girl tough.	1.4	1689600
23	504	4	0.0	\N	0.7	1887232
8	206	10	0	\N	1.9	3289088
174	509	1	0	Today break receive trouble.	1.5	5256192
297	756	1	0	Soldier want live four.	1.5	152576
159	521	9	0	Recent above dark.	1.1	8217600
274	614	6	0	\N	0.9	3142656
240	868	4	2.5	Employee hotel civil staff.	1.1	5686272
267	619	4	1.0	Course few control phone consider avoid government may.	1.8	2913280
16	981	5	0	Growth financial however for explain expert sort. Sound degree along energy build design.	1.9	7334912
23	489	9	0	Air rock open return young. Art upon value political expert company to.	1.5	1747968
33	786	4	2.6	Customer push serious radio tonight. Apply return top traditional mouth specific maybe.	1.5	4978688
96	692	5	0	Material partner bank democratic.	1.4	4927488
188	1193	4	1.7	\N	1.7	7122944
100	287	7	0	Three everyone summer poor once trouble.	0.5	256000
221	1100	4	1.5	\N	1.7	364544
161	1060	4	2.4	\N	1.2	7348224
63	242	4	1.4	Teacher positive his together trouble defense.	1.6	3922944
245	222	9	0	\N	0.7	3824640
69	214	3	0	\N	0.9	7157760
291	313	8	0	\N	1.7	250880
20	102	4	1.5	Economy citizen focus seven know would allow role. Think recognize accept answer.	0.9	3289088
179	461	8	0	\N	0.8	7145472
144	987	5	0	Office situation present mind.	0.5	2104320
38	1112	4	2.1	Result catch anyone great process.	1.6	6787072
225	999	3	0	Simple anyone three final interview culture.	0.9	8057856
62	1183	4	1.3	Finally debate beyond tree.	1.3	1222656
1	813	4	2.4	\N	1.4	3509248
295	730	4	2.7	\N	1.7	4235264
104	357	4	2.2	\N	1.8	657408
86	1146	4	1.2	Shoulder religious many drop then effort administration past.	1.9	1170432
82	654	1	0	\N	1.8	3585024
84	348	4	2.5	Near like focus listen practice study.	1.9	6191104
36	947	6	0	Answer themselves need gas.	1.3	5329920
304	740	4	2.7	\N	1.3	3575808
187	428	10	0	\N	0.6	1425408
127	635	5	0	\N	1.7	6085632
91	275	7	0	Short form apply two.	1.6	3194880
267	628	4	1.0	Drive growth light pull manage. Either situation because star.	1.0	4442112
101	1174	4	1.7	Yourself prove school. Reality parent address Congress different.	1.2	5554176
22	81	8	0	Arm what blood free state.	1.1	2776064
188	1188	9	0	\N	1.5	8040448
306	604	3	0	\N	1.0	7560192
119	35	4	1.5	Color ball court live traditional.	0.5	468992
136	590	4	2.4	Exist factor well join push foreign church.	1.7	200704
203	1207	5	0	\N	1.0	3968000
40	501	10	0	If together modern collection simply where grow. Hot behind might purpose true garden.	0.9	3487744
250	306	4	1.2	\N	1.4	1465344
89	622	4	2.5	Source well under make ready.	0.6	3047424
35	1174	9	0	Drive he marriage his.	0.8	1098752
27	23	9	0	\N	1.4	6893568
242	880	1	0	\N	1.0	4815872
258	1174	7	0	\N	1.0	8186880
44	112	7	0	Yard model water opportunity.	2.0	8072192
235	1157	4	1.1	\N	0.7	4389888
123	978	4	2.7	Cold bag wife paper.	1.0	757760
263	377	5	0	\N	1.4	7549952
202	858	4	2.7	Participant provide cultural school field know else. I southern add majority life who.	1.7	5117952
302	312	9	0	\N	0.8	7034880
200	947	4	0.5	Style care dinner it build. Put break stuff modern he teach ground.	1.3	4497408
77	20	4	1.7	\N	1.2	4896768
249	272	4	2.0	Second itself watch model.	1.3	2062336
246	733	4	2.2	Individual thank art.	1.7	5805056
81	998	4	2.8	Position edge there type. Help theory little professional.	1.0	5877760
94	1164	4	2.7	\N	1.5	1769472
288	759	4	1.2	\N	1.0	5485568
165	479	4	2.7	\N	1.8	7135232
181	1104	6	0	Anyone happen prove still.	1.5	6031360
215	720	7	0	Win without hand first middle picture moment important.	1.0	5367808
272	799	4	2.8	Particularly act represent management recently party life. Bed job reveal it four film.	1.9	3887104
43	99	7	0	So laugh focus door new.	1.0	5087232
259	942	10	0	\N	1.1	1214464
100	304	7	0	Cause strong firm remain power rich threat.	1.1	4059136
169	264	4	1.8	\N	1.4	7924736
193	337	9	0	\N	1.0	3840000
109	1012	7	0	But school ability writer shake.	1.5	3012608
161	1050	4	2.3	Wide improve agreement worry build yes specific those.	1.8	4561920
247	917	4	2.7	Plan hope become catch.	0.9	1227776
156	332	6	0	Sort company reduce activity use. Lose behavior place leg.	0.6	7154688
26	489	7	0	\N	0.9	7718912
66	337	4	1.5	\N	1.3	5001216
272	795	5	0	\N	1.2	6362112
233	76	3	0	Back night hold top give item. Capital interview after well sell media.	1.6	6728704
152	621	4	2.4	\N	1.6	6221824
74	239	4	1.0	Minute drive trade house strong everything even.	1.1	6133760
74	242	8	0	\N	1.9	5852160
5	864	4	2.0	Interview join south debate somebody west. Than daughter cold.	1.0	7098368
130	1056	3	0	\N	1.5	7951360
209	293	4	2.7	\N	1.6	7666688
302	305	1	0	Image region score return something. Car subject weight money.	1.8	1172480
79	556	4	2.1	Painting ball lose make year kid great.	1.4	2867200
299	359	9	0	Image quite everybody court person democratic loss.	1.3	2603008
291	294	4	0.3	Quality sister camera central want class office.	1.2	4733952
139	1008	4	2.1	\N	1.3	3420160
202	874	4	1.7	Language station hope real.	1.7	7810048
233	65	4	2.5	\N	0.5	807936
145	1200	9	0	Month region similar option.	0.9	3781632
275	1071	4	1.4	Suffer third southern couple of.	0.8	993280
233	71	1	0	Attorney low turn when total degree.	1.4	7113728
101	1195	3	0	\N	1.2	5217280
156	353	10	0	Leader rise few past open property trouble laugh.	1.8	4357120
232	832	4	2.0	Win rock name. Father pick what own add.	0.9	3585024
214	1093	7	0	\N	1.1	5958656
98	1146	9	0	\N	1.6	2880512
205	610	4	1.4	\N	1.0	1680384
196	448	5	0	\N	2.0	4129792
118	857	4	1.7	\N	0.7	701440
62	1195	4	2.7	\N	1.9	1127424
212	331	4	1.0	Direction tend identify too hot discover.	1.8	3122176
273	1176	7	0	\N	1.1	754688
123	975	10	0	\N	0.8	2415616
52	1169	9	0	\N	1.6	7487488
102	1028	4	2.7	\N	1.5	1317888
259	938	9	0	\N	0.8	4725760
203	1204	8	0	\N	1.3	3813376
295	714	4	1.8	Once father important cost well. Heavy gun couple very better buy dark similar.	1.9	7399424
86	1144	4	2.5	Get worker production happy.	0.6	5653504
163	217	4	1.6	\N	1.1	7886848
75	279	4	2.4	\N	1.1	4874240
202	863	4	1.6	\N	0.8	8151040
119	37	10	0	Foreign help to happy.	1.7	4141056
177	268	9	0	\N	1.7	4923392
235	1160	4	1.2	Clear right campaign test quite red.	1.2	5690368
198	1151	4	2.8	International save democratic team pretty star. Southern step town add Republican current.	1.9	7706624
158	189	4	0.6	Specific style help want stage.	0.8	1559552
283	412	4	2.8	Everything air nor ago member reduce expert civil.	1.5	7508992
282	833	4	1.2	Account example explain it.	1.2	2275328
233	49	10	0	Staff teach firm energy.	0.5	7435264
293	556	4	2.1	\N	1.8	6094848
113	486	4	1.9	\N	1.2	1729536
183	368	10	0	\N	1.2	4033536
177	262	4	2.2	How community by collection experience.	1.5	5804032
278	682	4	0.3	Big move knowledge real perform return.	1.5	2759680
251	406	4	2.7	\N	1.7	7952384
205	625	7	0	Chair memory pick door.	0.7	4411392
68	295	8	0	\N	0.6	7897088
64	362	7	0	\N	0.9	957440
114	870	10	0	Power product week specific.	1.0	2782208
202	881	4	2.0	\N	1.5	5929984
136	581	1	0	\N	0.9	4255744
46	1079	4	2.4	\N	0.6	627712
41	267	6	0	\N	2.0	5602304
301	147	7	0	\N	1.9	8121344
229	241	4	1.3	\N	1.9	781312
126	1195	4	2.7	Save buy mission question word nearly.	1.5	4424704
268	597	4	0.3	Available individual century hope. Ago design under seem painting.	1.2	6581248
140	564	5	0	\N	0.6	3289088
187	432	1	0	\N	1.3	6941696
174	508	4	1.8	\N	1.2	1915904
91	267	4	1.5	\N	1.5	5307392
23	506	9	0	Itself issue actually debate right positive take stuff.	1.4	3441664
226	781	4	1.5	Goal bit clearly thing work say likely.	1.2	5662720
187	449	4	2.1	\N	0.9	6734848
22	76	4	0.8	\N	1.8	6420480
97	363	9	0	\N	1.5	4498432
199	325	8	0	Nearly star small speak.	1.9	5048320
207	983	4	0.6	\N	0.8	7638016
62	1192	4	2.2	View firm both similar table certain hotel.	0.9	6828032
155	77	4	1.8	Hard even politics wind deal age above.	0.8	956416
298	723	9	0	Hand how along hope.	1.2	5778432
164	954	4	2.1	Staff son pressure rich front yet. Each mouth make.	1.1	3220480
90	598	8	0	\N	1.6	3591168
273	1187	1	0	Send really TV Republican budget story.	1.9	6118400
307	395	4	1.3	Stop site professional truth indeed often.	1.2	3305472
258	1175	6	0	\N	0.6	1027072
248	1100	4	1.6	\N	1.1	3481600
173	936	4	1.7	Protect focus turn military actually actually.	1.9	2955264
30	821	10	0	\N	1.2	4978688
279	567	9	0	Ago buy whole people quite resource glass young.	1.1	4843520
286	1148	4	2.0	Environment half even space church. Be both effect begin health.	1.2	2204672
302	300	3	0	\N	0.5	1103872
300	214	4	1.5	\N	1.8	3694592
8	207	4	2.9	\N	1.2	2413568
205	623	4	2.1	Source mind school. Not drug with someone development.	0.6	1817600
223	373	8	0	\N	0.7	2622464
235	1161	5	0	\N	0.9	5568512
2	1064	7	0	Over positive important accept that as. Decade fear by economy stock nation available.	1.4	5907456
258	1188	4	2.3	Toward production run positive.	1.7	7865344
274	632	4	1.9	\N	0.8	5696512
26	502	4	2.4	\N	0.7	7481344
240	866	4	2.5	\N	0.6	3493888
115	535	4	2.1	\N	2.0	7658496
253	663	3	0	Difficult here speak.	1.1	951296
167	17	4	2.1	Only explain answer Mr run if.	1.9	972800
210	1160	3	0	Operation decade sign hospital success read activity.	0.7	3337216
308	701	6	0	Scene city soon cause carry themselves become.	1.4	2033664
292	377	9	0	Stay system side that what. Ability thank article without commercial camera.	0.9	5574656
54	725	10	0	Left fear involve break drug. Event light yet arrive successful tonight over picture.	0.8	5465088
142	423	4	0.5	\N	1.5	7873536
163	225	5	0	\N	1.9	3791872
134	1127	4	1.3	\N	0.6	7085056
111	895	9	0	\N	0.5	5958656
111	927	4	1.7	Standard environment ready than later image oil officer. These gun positive.	1.0	8117248
229	239	8	0	\N	0.5	3744768
200	939	4	2.6	Foreign work range loss test probably store. From well less weight more.	1.2	2449408
125	1065	4	0.2	Evening near including management minute friend like industry.	1.4	651264
91	255	4	1.4	\N	1.1	1909760
26	506	4	2.2	Program green watch economic drive energy I.	1.8	1811456
68	320	5	0	Cause perhaps source region senior window purpose.	0.7	5224448
94	1170	8	0	By four national few house fact there.	1.5	3686400
181	1099	4	0.1	Should huge care outside friend. Standard without man establish.	0.7	2911232
73	876	4	1.3	Physical lot floor during.	1.7	4660224
27	30	9	0	\N	1.2	8287232
161	1058	4	1.7	Accept end dark spend allow mission high.	1.5	1249280
254	831	9	0	\N	0.7	1200128
274	617	7	0	Tough bad phone he according key.	1.5	7916544
145	1208	4	1.1	\N	1.7	5669888
27	22	4	1.6	\N	1.7	164864
262	740	6	0	\N	1.0	7934976
273	1197	4	1.2	\N	0.9	1378304
158	186	4	1.6	So skill answer lay rest.	0.5	3451904
225	1002	5	0	Western structure national low amount. Provide consider add central.	0.8	3277824
123	977	4	0.4	\N	1.6	2899968
253	646	4	2.6	Thus human campaign role agent movie.	1.7	733184
135	62	1	0	Significant discussion player.	1.0	1464320
188	1189	4	1.5	Trouble forget so according including.	1.8	7137280
160	803	4	2.0	Size tend seat ahead.	1.5	4518912
63	246	4	2.2	Remain firm television herself. Reach think from chair.	1.9	6840320
255	1160	5	0	Yes by still box. Area spring agreement history meet decision.	1.7	5727232
126	1174	4	1.5	Bring matter why believe source listen call fact.	1.6	4415488
184	461	4	1.5	Example three rise body action east eye.	1.2	3504128
242	875	4	2.2	Sister better lead size perhaps.	2.0	3112960
33	783	4	2.9	\N	1.8	3057664
45	837	3	0	\N	1.5	5276672
80	234	3	0	\N	0.9	527360
36	942	4	1.7	Early bank wish.	1.3	6299648
69	227	4	1.0	Lot pretty seek similar.	1.1	5080064
150	267	4	1.5	Must first wait sister unit.	1.3	1243136
282	828	4	2.3	\N	0.8	4651008
148	1185	7	0	Friend summer continue. Rate issue both represent like lot space maintain.	0.9	866304
74	247	4	2.7	Will business number keep property.	1.2	2379776
92	569	4	0.3	Action sort age long form foot.	1.1	4618240
304	749	4	1.0	Especially summer threat strong. Only type little forward.	1.7	4732928
43	119	4	1.3	\N	1.1	4491264
20	114	8	0	Standard somebody growth. Consumer lot trouble.	1.7	3876864
41	253	4	0.5	\N	0.7	4276224
104	358	4	1.8	\N	1.8	5043200
310	150	4	2.7	Character continue third you.	1.4	4975616
130	1064	1	0	Respond front interest Republican.	1.1	5025792
226	773	1	0	\N	0.6	1413120
74	249	4	0.6	\N	1.8	5126144
75	280	10	0	\N	1.4	2466816
165	474	10	0	Gas professional and word detail.	1.9	5946368
288	751	3	0	\N	1.8	7697408
295	725	6	0	\N	0.5	1136640
147	666	4	2.2	\N	0.8	6272000
155	80	10	0	\N	1.3	6317056
229	243	10	0	\N	2.0	2212864
198	1159	4	2.5	Than history push manager very administration join require.	1.5	6983680
276	556	4	0.6	Full believe world water store eat.	1.7	2608128
302	307	1	0	Question well rule ground condition.	1.5	7087104
246	735	4	1.5	Order able until customer crime campaign contain reality.	1.6	6349824
242	873	4	2.3	Avoid live ready development. Reality entire enter food within at.	1.5	1030144
170	435	3	0	\N	1.3	1047552
249	267	4	0.2	Ready you scientist medical rule.	0.8	2934784
275	1082	4	0.7	\N	0.8	1726464
35	1185	8	0	Official full door peace manage religious prove.	1.5	4281344
262	735	1	0	\N	1.7	1812480
218	213	4	1.8	Mother probably this range thing condition another.	1.6	2477056
250	304	4	2.6	First wrong my approach serious.	1.9	3424256
147	645	4	1.5	Particular loss help movement put inside.	0.7	3352576
236	450	1	0	With score sense soon beyond food. Everybody chair usually artist father structure move finally.	1.0	2192384
114	881	5	0	\N	1.7	498688
178	544	8	0	Outside resource discussion listen least really either forget. Who music wide ground offer off believe.	1.9	3666944
\.
COPY submit_results (submit_id, score, status) FROM STDIN;
34	7.800000000000001	9
253	24.300000000000004	10
198	19.3	10
81	8.399999999999999	9
19	6.3999999999999995	10
213	3.9000000000000004	9
22	48.300000000000004	9
11	13.7	10
215	28.799999999999997	10
212	11.299999999999999	10
158	15.4	10
54	18.700000000000003	10
33	29.499999999999996	10
52	23.1	10
61	8.1	10
155	44.8	10
231	12.600000000000001	10
250	31.599999999999994	10
309	13.899999999999997	10
124	8.200000000000001	7
152	15.9	10
210	29.900000000000002	10
265	7.8999999999999995	10
91	34.0	10
285	28.5	10
94	23.0	10
14	8.6	5
200	14.1	8
174	24.000000000000004	9
7	7.999999999999999	7
189	10.0	8
111	36.1	10
275	15.600000000000001	9
278	30.700000000000003	10
182	10.9	9
186	8.1	8
2	31.700000000000003	10
271	15.400000000000002	10
109	8.6	10
112	23.0	10
1	30.09999999999999	9
108	11.600000000000001	10
179	8.3	9
146	7.5	8
286	21.4	9
13	1.9	4
292	16.599999999999998	9
99	6.9	10
12	12.8	9
142	30.2	10
24	7.699999999999999	9
93	28.5	10
192	15.200000000000001	9
148	24.999999999999996	10
104	11.200000000000001	9
100	27.6	10
107	5.3	10
165	19.4	10
51	2.5	4
132	4.8999999999999995	9
154	7.1	10
10	19.5	6
92	5.3	10
29	11.1	10
47	5.3999999999999995	8
283	4.9	8
6	16.8	10
36	13.2	10
8	14.299999999999999	10
216	24.1	10
83	3.8000000000000003	10
299	11.2	9
208	3.5	9
280	6.9	9
298	18.500000000000004	9
230	1.9	4
201	19.2	9
228	7.300000000000001	8
135	33.2	10
269	13.099999999999998	10
20	24.8	10
191	16.3	8
139	14.799999999999999	8
197	2.5	4
261	10.1	9
62	35.2	8
9	8.1	6
118	6.7	9
41	23.400000000000002	10
237	15.4	10
64	12.499999999999998	7
138	17.999999999999996	10
183	15.6	10
221	18.1	9
70	22.6	10
262	19.5	9
44	19.7	10
4	15.200000000000001	7
55	16.599999999999998	10
127	10.5	6
185	6.6	10
301	30.699999999999992	10
86	27.2	10
296	6.6000000000000005	8
181	19.7	9
103	30.700000000000003	9
85	6.199999999999999	9
184	13.600000000000001	9
264	8.9	6
257	10.8	9
241	12.4	10
59	20.700000000000003	9
207	3.1	8
223	20.0	8
101	29.3	8
77	33.1	8
267	21.899999999999995	8
281	4.999999999999999	4
204	22.3	9
27	16.3	9
23	16.999999999999996	9
164	20.0	10
15	7.9	9
42	0	6
79	12.1	8
133	2.5	4
209	33.599999999999994	10
172	8.0	10
66	31.0	9
137	13.3	10
214	1.0	8
74	13.200000000000001	9
273	27.299999999999997	9
80	28.6	10
268	14.200000000000003	9
274	19.7	9
177	17.3	10
175	23.4	9
58	15.3	7
60	0	7
136	22.799999999999994	9
266	24.2	10
199	4.9	10
38	22.200000000000003	10
180	17.5	7
276	8.799999999999999	7
31	17.099999999999998	10
69	26.5	10
75	4.2	10
105	17.6	10
236	10.1	9
247	45.6	10
115	26.1	10
252	17.4	10
125	28.7	10
288	12.899999999999999	10
240	31.900000000000006	10
187	26.099999999999994	10
143	11.5	9
87	2.9	10
170	29.699999999999996	10
166	4.7	10
45	7.6	9
163	26.200000000000003	10
229	8.2	10
126	20.5	10
226	21.2	10
227	7.200000000000001	6
82	21.2	10
131	4.4	5
234	33.69999999999999	10
254	11.9	9
56	14.700000000000001	10
116	8.5	10
78	7.8	7
205	25.5	10
220	6.8999999999999995	8
196	36.0	10
28	8.4	9
129	14.0	10
211	12.299999999999999	9
63	16.8	5
239	0	7
244	24.4	10
122	8.1	10
32	1.2	9
169	23.4	8
167	21.7	10
293	8.5	9
71	0	1
251	13.899999999999999	9
308	22.2	9
113	26.299999999999997	10
188	22.7	9
246	13.5	9
84	25.2	10
150	21.3	10
48	21.5	10
303	1.2	9
235	24.700000000000003	8
255	24.799999999999997	10
121	28.5	9
224	10.5	10
40	20.999999999999996	10
117	17.200000000000003	10
73	36.4	10
72	17.099999999999998	9
114	30.0	10
160	34.099999999999994	10
149	5.5	10
206	29.0	10
119	23.699999999999996	10
272	26.7	10
96	25.3	10
193	17.8	10
49	2.4	8
88	23.700000000000006	10
39	6.800000000000001	8
120	13.299999999999999	10
95	22.600000000000005	9
16	3.7	9
140	16.1	8
217	6.700000000000001	9
178	27.3	9
98	18.1	9
21	23.5	10
243	11.299999999999999	8
5	29.900000000000002	10
256	16.8	8
297	15.199999999999998	7
295	28.3	10
162	9.1	8
\.
