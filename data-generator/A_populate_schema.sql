SET search_path TO tanuki;
COPY users (login, name, surname, password_hash, email) FROM STDIN;
james96	Nathan	Landry	$2b$12$r0u7qc1Ssk7ok/QRX7XpxO9MO9qu36EugzMAm0CgNqhamF6bmQxlC	rodriguezmelanie@example.net
uadams	Traci	Jackson	$2b$12$Q4i.K5C.B71e1ZkwvqMAb.I1gDnJari.iUfYsMehU06xRD/o1pnf6	jmatthews@example.net
jameskatie	Douglas	Johnson	$2b$12$OtYL.pWo4VGTDZMudSlKuuQoWmC/Zcz1oKVCd1URL30/6oxPq82Wu	juan41@example.com
aaguilar	Michael	Bautista	$2b$12$TfVdAl3jrY8It4hVNGSa/OnSaJ8T7/dRUvzi48Dz9SGpF8qamJlce	angelatran@example.com
nlove	Sheri	Ortiz	$2b$12$.5tH67fXfommDnalbL453.9enosAkfRkFEuK8vhaHsm8IKKWW5Hj6	sfoster@example.org
christopher75	Andrew	Roman	$2b$12$kNrp7cK2qWcWs4w6pqRbo.AA7p7XYEwqybKGGXywHGyxRaLK7.ftu	barbara76@example.net
hardykristin	Victoria	Adams	$2b$12$Bw.tw/XaMgv42gNH0WIgIucGzFoFQu0oP86bvZtIX5UyXqderpsNu	thompsongabriella@example.com
michael38	Jeffrey	Cortez	$2b$12$QMJ3VUds0hdTdSHVCmfHLuenzN04HReGQAO/CpofkI4reipPI.MUO	ythomas@example.net
dakota58	Jennifer	Ponce	$2b$12$ojHfba.K.OeT5Uv0dTAcluL47gDh3oGRz/8PJ33QK8mN5DhG4jdGa	leebrian@example.com
wnelson	Danielle	Tucker	$2b$12$rtoTyIG6u2iLMtX4wwTgoOlTsA6E/ojxNPBY.BTrABMvy.Ytr7Z4K	downsjohn@example.com
admin	A0	D	$2b$12$qoCRB7jl2wcDvbrr1DP4uudaGJGjWskIh/vi9uo1U4qBzpgfJ1h56	administracja@tanuki.pl
admin1	A1	D	$2b$12$zEaPvudvIgrxnmS/QwBRJOQCNz3GakiZaREjAjj9WNYI0fa0MyjP.	administracja@tanuki.pl
admin2	A2	D	$2b$12$bNubPVTLhv8kMquBq8T.4.dbbVJ3k1g7mcowJExwKWjJTACMUG8bS	administracja@tanuki.pl
admin3	A3	D	$2b$12$5eZin5fc3NtFzku9gZrCTOBoWIZaJwaK2UCLCAVI9sUYPQHJpgTK2	administracja@tanuki.pl
admin4	A4	D	$2b$12$7DmryYIVNXbz2cQq7ysDGej4dGQzcnRBVQEfnf1fKriplwfAoX9C6	administracja@tanuki.pl
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
Development thousand sense.	Meeting.	False
Rock stock hotel anything.	Down sister.	True
Political bit although look.	Ground high.	True
They east item.	Concern.	False
Along note per fire.	Purpose.	False
Play more worry.	Factor.	True
Science into side end the.	Bad city.	True
East onto teach ever.	Item create.	True
Company cell yes reduce.	Economic.	True
Life choice join draw.	Heavy.	True
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
8	2	2
6	2	9
5	1	8
7	2	9
10	2	5
2	2	7
4	2	9
5	2	6
6	2	2
8	2	4
7	2	2
9	2	4
4	2	2
2	2	9
5	2	8
6	2	4
8	2	6
7	2	4
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
2	2	4
1	2	1
3	2	3
1	2	10
8	2	1
7	2	8
10	2	7
5	2	5
1	2	3
3	2	5
7	2	1
9	1	4
9	2	3
7	2	10
10	2	9
5	2	7
1	2	5
3	2	7
8	1	9
7	2	3
10	1	3
10	2	2
1	2	7
3	2	9
7	2	5
8	2	10
9	2	7
2	2	6
5	2	2
4	2	8
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
8	1	6
8	2	5
9	2	2
5	1	2
10	2	8
4	2	3
2	2	10
3	2	6
5	2	9
6	2	5
8	2	7
1	1	5
2	2	3
4	2	5
1	2	6
3	2	8
8	1	1
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
Eye several story wife.	Capital.	1	/problems/dummy	True	0	0.0	1994-02-19, 14:39:54	2009-10-04, 07:32:39	True	2	56320
Base girl real.	Crime.	2	/problems/dummy	False	0	0.0	2013-08-27, 19:00:52	2017-11-13, 15:37:16	False	2	92160
Of especially budget.	History.	2	/problems/dummy	False	1	0.0	1997-12-19, 12:57:11	2009-10-06, 12:19:29	True	2	40960
Business quickly plan eat.	Until.	2	/problems/dummy	False	2	0.3	1999-08-26, 08:08:23	2007-11-22, 18:20:35	True	3	11264
Carry bed play material.	Walk.	2	/problems/dummy	False	3	0.3	\N	\N	True	3	96256
Movie you before decide.	Travel.	2	/problems/dummy	False	4	0.3	\N	\N	True	3	53248
Task heavy political general.	Debate.	2	/problems/dummy	True	5	0.4	2008-09-17, 04:33:17	2011-07-23, 19:58:31	False	3	52224
Middle artist practice.	Should.	2	/problems/dummy	False	6	0.1	\N	\N	True	1	94208
Drive employee kitchen line.	Church.	2	/problems/dummy	True	7	0.1	1994-01-25, 16:02:10	1998-04-07, 13:42:34	False	3	37888
Through kitchen who join.	What.	3	/problems/dummy	True	0	0.2	\N	\N	True	2	33792
Back on key.	Program.	3	/problems/dummy	False	1	0.4	1993-12-31, 03:04:11	2007-07-21, 08:15:56	True	1	25600
End important west carry.	Mention.	3	/problems/dummy	False	2	0.4	2014-04-12, 07:49:49	2019-11-06, 12:15:55	True	3	59392
Build many peace situation.	Similar.	4	/problems/dummy	True	0	0.0	2016-06-24, 12:29:28	2018-09-27, 16:05:30	False	2	90112
Material attack agent some.	Part.	4	/problems/dummy	True	1	0.4	1993-02-25, 12:52:27	2019-05-18, 13:20:08	False	1	51200
Road clearly today could.	Member.	4	/problems/dummy	False	2	0.2	\N	\N	True	3	28672
Quickly address person.	Forget.	4	/problems/dummy	False	3	0.4	1995-03-09, 10:59:54	2003-04-09, 18:42:51	True	1	6144
Area nothing occur.	Address.	4	/problems/dummy	False	4	0.3	1996-01-28, 16:35:01	2012-03-17, 14:15:57	True	2	97280
Guess clearly do become main.	Upon.	4	/problems/dummy	False	5	0.4	\N	\N	True	2	57344
Instead total claim.	Feel.	4	/problems/dummy	True	6	0.1	\N	\N	True	1	77824
Under like tell with.	Sell.	5	/problems/dummy	True	0	0.2	2004-06-05, 06:16:34	2018-12-14, 01:24:03	True	1	13312
Out cut power.	Truth.	5	/problems/dummy	False	1	0.4	2014-07-07, 05:34:19	2020-01-15, 19:03:08	True	2	52224
Can Mrs challenge.	Design.	5	/problems/dummy	False	2	0.1	2008-03-12, 23:22:52	2012-11-30, 14:20:39	False	2	75776
Particularly successful else.	Compare.	5	/problems/dummy	False	3	0.1	\N	\N	False	3	97280
Soon moment president.	Play.	5	/problems/dummy	False	4	0.2	2003-03-19, 13:53:10	2017-01-19, 09:09:52	True	2	39936
Under try to.	Onto.	5	/problems/dummy	True	5	0.0	1995-04-28, 16:20:15	2016-05-16, 09:19:00	False	2	93184
Occur good consumer brother.	Meet.	5	/problems/dummy	True	6	0.1	\N	\N	True	1	30720
Knowledge front ever.	Star.	6	/problems/dummy	False	0	0.3	2003-02-22, 19:46:55	2012-08-07, 16:46:29	True	2	17408
Meeting PM fear occur watch.	Point.	7	/problems/dummy	True	0	0.3	\N	\N	True	3	32768
East light choice.	Now.	7	/problems/dummy	True	1	0.3	1999-03-08, 01:35:07	2004-10-07, 11:07:49	True	3	56320
Hand material play direction.	Social.	7	/problems/dummy	True	2	0.3	1992-09-20, 13:38:59	2011-04-21, 07:32:29	False	3	46080
Help bar newspaper decade.	Food.	7	/problems/dummy	True	3	0.1	2010-09-02, 13:42:10	2021-03-16, 05:46:05	True	2	19456
Base do painting nation.	Deep.	7	/problems/dummy	True	4	0.3	\N	\N	True	2	73728
Kind key tree send.	Current.	7	/problems/dummy	True	5	0.1	1993-05-13, 20:05:40	1997-11-12, 13:32:54	False	3	44032
Dog that win radio effort.	Hear.	8	/problems/dummy	False	0	0.2	2015-10-11, 05:28:23	2018-07-31, 19:55:59	True	3	40960
Wide few put few.	Number.	8	/problems/dummy	True	1	0.0	2004-08-24, 22:54:44	2005-07-20, 11:56:49	True	1	8192
They worker life.	As.	8	/problems/dummy	True	2	0.0	1995-07-13, 20:42:04	2011-01-31, 18:18:09	True	1	78848
Peace them Congress.	Six.	9	/problems/dummy	True	0	0.1	1994-11-04, 19:48:51	2017-02-20, 09:26:01	True	2	51200
Store be something.	Medical.	9	/problems/dummy	True	1	0.2	1993-10-18, 21:33:36	2004-05-29, 14:27:03	False	1	73728
Executive or indeed best.	Later.	9	/problems/dummy	True	2	0.4	1997-02-15, 10:21:59	2006-05-10, 20:40:03	False	3	51200
Sea economy walk citizen us.	Charge.	9	/problems/dummy	True	3	0.4	2005-06-30, 02:22:27	2014-05-29, 13:33:16	True	1	45056
Tough spend past.	Go.	9	/problems/dummy	True	4	0.4	2015-11-22, 13:45:56	2017-09-01, 11:55:29	True	2	69632
Land like me southern.	Common.	9	/problems/dummy	False	5	0.1	1998-05-19, 20:24:27	2006-02-24, 21:52:45	True	1	88064
Card common thousand also.	Decide.	9	/problems/dummy	True	6	0.4	1994-11-03, 20:02:47	2014-07-19, 13:57:26	True	1	73728
Front red site but.	Wait.	9	/problems/dummy	False	7	0.4	1996-06-20, 08:26:17	2008-07-28, 11:01:20	True	2	45056
Office then remain family.	Off.	9	/problems/dummy	False	8	0.3	2003-07-14, 19:33:57	2008-10-28, 18:38:53	True	1	65536
First represent himself true.	Strong.	9	/problems/dummy	True	9	0.0	2007-05-31, 12:14:55	2017-01-02, 17:38:07	True	1	9216
Address page hear seven.	Nice.	10	/problems/dummy	False	0	0.2	\N	\N	True	3	62464
Bill green part argue a.	Music.	10	/problems/dummy	True	1	0.2	1994-07-14, 01:35:52	1999-04-07, 10:10:07	True	1	76800
Off suffer very analysis.	Major.	10	/problems/dummy	False	2	0.4	2013-01-16, 15:19:16	2022-04-28, 05:02:26	True	1	15360
Color left here yeah leg.	Account.	10	/problems/dummy	True	3	0.2	1998-04-21, 16:54:33	2001-10-14, 01:30:55	True	2	96256
Require to day bed.	Say.	10	/problems/dummy	False	4	0.4	1996-11-04, 14:58:49	1996-11-24, 15:00:59	True	1	69632
I young able in let.	Save.	10	/problems/dummy	False	5	0.4	2001-04-04, 03:50:35	2007-09-06, 03:45:54	False	2	92160
Receive realize what.	Fear.	10	/problems/dummy	False	6	0.2	2002-02-17, 11:58:53	2008-06-09, 18:39:37	True	2	14336
Agree lawyer quality act.	Early.	10	/problems/dummy	False	7	0.4	1994-04-17, 06:35:42	1998-09-07, 16:23:34	False	2	82944
Wall cell yeah do step in.	Section.	10	/problems/dummy	False	8	0.2	2003-04-20, 11:26:01	2004-02-14, 13:48:30	True	1	12288
Certainly remember much.	Back.	10	/problems/dummy	False	9	0.1	1997-11-03, 18:32:25	2017-07-02, 23:22:07	True	2	75776
\.
COPY problem_languages (problem_id, language_id) FROM STDIN;
55	2
36	7
50	6
37	6
17	3
51	7
46	2
40	4
18	1
55	4
34	3
45	3
27	6
9	1
43	5
24	1
15	7
40	6
18	3
21	2
45	5
36	2
51	2
32	7
33	6
35	3
54	1
22	5
51	4
13	5
26	2
38	4
18	7
53	4
31	1
36	6
23	6
17	2
9	7
11	4
52	5
6	1
45	2
3	5
4	4
50	1
32	4
15	6
16	5
34	4
47	1
12	1
56	4
43	6
10	3
35	2
44	5
53	1
20	7
34	6
23	3
37	2
5	6
27	3
41	2
52	2
10	5
13	4
26	1
44	7
46	1
39	4
38	6
22	6
3	2
32	1
19	1
42	3
1	4
24	6
2	3
25	5
6	3
54	4
21	1
12	7
52	6
19	3
33	2
16	4
29	7
40	7
14	6
4	5
8	5
19	5
2	7
48	4
7	6
23	2
50	4
28	1
30	7
11	3
49	5
21	7
\.
COPY submits (source_uri, user_id, problem_id, language_id, submission_time) FROM STDIN;
/submitted/dummy	1	25	5	2000-10-11, 08:32:37
/submitted/dummy	1	1	4	2015-02-04, 05:17:17
/submitted/dummy	1	20	7	2004-07-31, 14:25:44
/submitted/dummy	1	55	4	2021-08-04, 11:02:06
/submitted/dummy	1	24	6	2018-03-27, 18:42:12
/submitted/dummy	1	27	3	2003-01-23, 13:37:48
/submitted/dummy	1	41	2	1997-06-13, 21:15:25
/submitted/dummy	1	4	4	2012-09-20, 20:41:01
/submitted/dummy	1	22	5	2013-06-10, 13:01:07
/submitted/dummy	1	43	5	2007-12-16, 10:06:52
/submitted/dummy	1	32	4	2019-06-28, 10:29:48
/submitted/dummy	1	20	7	2007-02-15, 16:40:12
/submitted/dummy	1	4	4	2017-05-31, 10:48:28
/submitted/dummy	1	20	7	2020-11-04, 03:11:56
/submitted/dummy	1	7	6	2014-05-07, 07:14:16
/submitted/dummy	1	26	2	1995-08-17, 14:35:06
/submitted/dummy	1	25	5	1994-12-24, 21:37:19
/submitted/dummy	1	9	1	1999-09-21, 10:54:11
/submitted/dummy	1	47	1	1993-04-13, 06:59:46
/submitted/dummy	1	52	5	2005-04-18, 05:58:39
/submitted/dummy	1	30	7	1998-07-19, 09:23:48
/submitted/dummy	1	1	4	2004-08-25, 11:56:22
/submitted/dummy	1	29	7	2017-01-31, 15:50:15
/submitted/dummy	1	40	4	2019-01-31, 07:15:02
/submitted/dummy	1	22	6	2021-12-27, 20:38:20
/submitted/dummy	1	23	3	2015-06-26, 13:53:51
/submitted/dummy	1	42	3	2006-05-08, 08:36:11
/submitted/dummy	1	35	3	2008-08-14, 18:58:57
/submitted/dummy	2	53	1	1994-06-28, 23:07:15
/submitted/dummy	3	56	4	2010-01-30, 21:41:23
/submitted/dummy	3	11	3	1999-12-26, 22:54:17
/submitted/dummy	3	47	1	2011-05-07, 17:01:20
/submitted/dummy	3	49	5	1998-03-18, 08:41:00
/submitted/dummy	3	44	7	1996-09-05, 11:46:38
/submitted/dummy	3	48	4	2015-01-31, 12:59:40
/submitted/dummy	3	23	3	2013-10-05, 20:52:44
/submitted/dummy	3	34	3	2010-05-04, 20:29:56
/submitted/dummy	3	32	1	1995-09-18, 22:48:02
/submitted/dummy	3	16	4	2000-01-15, 11:51:37
/submitted/dummy	3	47	1	1997-05-12, 20:23:36
/submitted/dummy	3	31	1	2021-06-08, 22:33:02
/submitted/dummy	3	53	4	2005-10-28, 10:31:43
/submitted/dummy	3	41	2	2001-07-28, 16:55:00
/submitted/dummy	3	48	4	1999-01-03, 19:47:19
/submitted/dummy	3	49	5	1999-03-30, 02:21:36
/submitted/dummy	3	33	6	2014-03-25, 16:41:56
/submitted/dummy	3	11	3	2009-01-30, 16:16:59
/submitted/dummy	3	14	6	2021-06-04, 13:41:58
/submitted/dummy	3	21	7	2004-04-13, 08:07:24
/submitted/dummy	3	37	2	2015-04-04, 12:21:02
/submitted/dummy	3	47	1	1998-01-04, 17:38:02
/submitted/dummy	3	32	4	1997-01-13, 16:45:29
/submitted/dummy	3	27	6	2006-12-20, 23:04:11
/submitted/dummy	3	39	4	2008-04-20, 20:34:57
/submitted/dummy	3	1	4	2002-11-01, 10:33:25
/submitted/dummy	3	30	7	1992-08-13, 03:11:38
/submitted/dummy	3	10	3	1996-12-14, 21:23:02
/submitted/dummy	3	37	2	2013-08-21, 20:37:41
/submitted/dummy	3	26	2	2015-11-13, 01:31:39
/submitted/dummy	3	20	7	2015-10-29, 02:06:56
/submitted/dummy	3	55	2	2004-05-15, 20:36:21
/submitted/dummy	3	14	6	2002-03-14, 00:56:46
/submitted/dummy	3	53	1	1998-03-02, 18:57:47
/submitted/dummy	3	25	5	2020-04-29, 12:08:00
/submitted/dummy	4	6	1	2007-02-05, 13:03:03
/submitted/dummy	4	53	1	1996-10-15, 09:39:37
/submitted/dummy	4	25	5	1994-01-17, 20:40:46
/submitted/dummy	4	28	1	1995-09-25, 05:50:54
/submitted/dummy	4	30	7	1995-01-08, 03:06:36
/submitted/dummy	4	23	6	2014-05-21, 15:39:00
/submitted/dummy	4	54	1	2018-10-31, 14:08:37
/submitted/dummy	4	18	3	2002-09-11, 04:05:48
/submitted/dummy	4	32	1	2007-10-24, 01:09:39
/submitted/dummy	4	7	6	2002-08-16, 11:39:33
/submitted/dummy	4	6	3	2017-10-02, 12:50:46
/submitted/dummy	4	52	5	2007-03-29, 20:00:54
/submitted/dummy	4	24	6	2009-03-26, 07:12:40
/submitted/dummy	4	49	5	2020-07-18, 07:16:59
/submitted/dummy	4	17	2	2011-03-31, 08:43:24
/submitted/dummy	4	44	5	2012-04-07, 00:29:27
/submitted/dummy	4	18	1	1993-03-12, 20:22:55
/submitted/dummy	4	19	5	2006-05-07, 00:17:32
/submitted/dummy	4	55	2	2009-12-17, 16:33:50
/submitted/dummy	4	20	7	2003-12-21, 18:25:10
/submitted/dummy	4	14	6	2016-09-30, 10:37:47
/submitted/dummy	4	30	7	1993-03-23, 14:49:35
/submitted/dummy	4	56	4	2015-06-03, 14:00:12
/submitted/dummy	4	8	5	2012-11-18, 11:08:41
/submitted/dummy	4	47	1	2006-11-06, 08:00:46
/submitted/dummy	4	10	3	1996-11-17, 18:10:55
/submitted/dummy	4	56	4	2003-08-18, 19:25:52
/submitted/dummy	4	20	7	2001-11-14, 17:13:06
/submitted/dummy	4	33	6	2017-11-11, 04:23:32
/submitted/dummy	4	32	4	1996-03-27, 02:54:11
/submitted/dummy	4	23	2	2004-04-10, 21:24:17
/submitted/dummy	4	25	5	1997-12-09, 11:37:03
/submitted/dummy	4	7	6	1998-11-07, 11:25:33
/submitted/dummy	4	3	5	1993-02-09, 23:34:43
/submitted/dummy	4	20	7	1992-11-27, 00:47:54
/submitted/dummy	4	1	4	2005-09-27, 11:49:06
/submitted/dummy	4	40	6	1998-01-25, 20:19:37
/submitted/dummy	4	20	7	1995-09-05, 03:51:05
/submitted/dummy	4	54	1	2020-04-26, 06:32:45
/submitted/dummy	4	1	4	2002-07-22, 22:43:55
/submitted/dummy	5	51	7	2010-12-13, 07:30:56
/submitted/dummy	5	45	2	2006-04-20, 18:39:42
/submitted/dummy	5	43	6	1996-09-16, 18:14:55
/submitted/dummy	5	37	2	2010-11-14, 01:36:29
/submitted/dummy	5	27	3	1998-10-14, 22:44:54
/submitted/dummy	5	37	2	2002-06-20, 14:02:55
/submitted/dummy	5	40	4	2001-09-25, 11:19:43
/submitted/dummy	5	8	5	2016-10-16, 14:09:21
/submitted/dummy	5	41	2	1994-09-03, 08:13:51
/submitted/dummy	5	56	4	1996-02-21, 19:48:43
/submitted/dummy	5	39	4	2017-03-07, 10:04:26
/submitted/dummy	5	5	6	2018-05-17, 05:13:37
/submitted/dummy	5	42	3	1999-07-30, 03:31:05
/submitted/dummy	5	13	4	1993-12-04, 00:54:14
/submitted/dummy	5	6	1	1995-06-06, 08:43:52
/submitted/dummy	5	28	1	2005-12-11, 11:24:11
/submitted/dummy	5	37	2	2021-07-11, 09:15:43
/submitted/dummy	5	29	7	2007-06-12, 16:29:34
/submitted/dummy	5	36	2	1998-01-30, 17:58:25
/submitted/dummy	5	37	6	1995-05-24, 23:56:54
/submitted/dummy	5	44	5	2008-05-15, 22:04:46
/submitted/dummy	5	30	7	2013-08-10, 20:53:05
/submitted/dummy	5	50	1	2009-03-10, 11:21:03
/submitted/dummy	5	39	4	2021-07-18, 12:20:27
/submitted/dummy	5	1	4	2011-03-02, 04:20:43
/submitted/dummy	5	42	3	1995-05-06, 16:18:14
/submitted/dummy	5	8	5	2007-06-27, 16:08:01
/submitted/dummy	5	5	6	2018-03-15, 20:28:26
/submitted/dummy	5	1	4	2004-04-17, 04:42:47
/submitted/dummy	5	27	6	1992-08-08, 13:38:13
/submitted/dummy	5	20	7	2017-11-17, 07:55:20
/submitted/dummy	5	52	6	1999-05-15, 03:14:38
/submitted/dummy	5	30	7	2000-04-04, 15:22:56
/submitted/dummy	5	28	1	2006-01-31, 23:08:21
/submitted/dummy	5	48	4	2014-03-06, 19:14:48
/submitted/dummy	6	18	3	2001-06-12, 01:58:49
/submitted/dummy	6	8	5	1998-10-23, 08:40:57
/submitted/dummy	6	43	6	2013-11-21, 05:05:58
/submitted/dummy	6	32	7	2021-06-02, 15:34:44
/submitted/dummy	6	33	2	2015-11-27, 12:48:08
/submitted/dummy	6	56	4	2002-10-28, 21:19:28
/submitted/dummy	6	31	1	2005-09-26, 01:56:21
/submitted/dummy	6	6	3	2018-06-21, 22:57:11
/submitted/dummy	6	17	2	2008-07-03, 11:48:32
/submitted/dummy	6	52	6	1994-03-07, 00:51:57
/submitted/dummy	6	3	2	2003-11-28, 17:44:51
/submitted/dummy	6	38	4	2006-03-01, 22:07:18
/submitted/dummy	6	53	4	1995-12-27, 12:29:13
/submitted/dummy	6	22	5	2007-04-20, 13:29:15
/submitted/dummy	6	6	1	2005-10-28, 22:08:05
/submitted/dummy	6	27	3	1997-01-12, 22:32:00
/submitted/dummy	6	1	4	1993-04-24, 04:17:14
/submitted/dummy	6	54	1	2003-11-14, 18:32:06
/submitted/dummy	6	33	2	2006-08-09, 16:45:21
/submitted/dummy	6	42	3	2004-04-07, 00:50:23
/submitted/dummy	6	40	7	2019-05-11, 17:16:44
/submitted/dummy	6	5	6	2006-06-22, 14:31:36
/submitted/dummy	6	5	6	2003-06-01, 19:54:24
/submitted/dummy	6	3	5	2021-12-19, 05:14:38
/submitted/dummy	6	48	4	2022-04-26, 14:06:26
/submitted/dummy	6	49	5	2004-08-29, 20:24:04
/submitted/dummy	6	29	7	2016-08-16, 23:59:31
/submitted/dummy	6	27	3	1999-08-31, 17:15:44
/submitted/dummy	6	50	1	1993-10-02, 08:03:49
/submitted/dummy	6	1	4	1995-02-05, 04:43:54
/submitted/dummy	7	50	4	2015-08-29, 23:20:12
/submitted/dummy	7	25	5	1995-06-19, 15:29:54
/submitted/dummy	7	52	6	2014-07-11, 23:07:21
/submitted/dummy	7	44	5	2021-09-20, 00:22:51
/submitted/dummy	7	17	3	2001-12-13, 04:28:46
/submitted/dummy	7	26	2	2010-12-06, 06:24:59
/submitted/dummy	7	27	6	2001-08-10, 21:09:29
/submitted/dummy	7	7	6	2016-11-11, 15:22:11
/submitted/dummy	7	54	1	2008-08-11, 08:32:38
/submitted/dummy	7	54	4	1999-05-17, 13:11:03
/submitted/dummy	7	43	6	1995-08-31, 02:05:09
/submitted/dummy	7	30	7	2006-06-10, 13:59:18
/submitted/dummy	7	29	7	2021-06-19, 19:32:07
/submitted/dummy	8	23	2	2004-01-06, 14:39:27
/submitted/dummy	8	55	4	2009-06-21, 01:40:04
/submitted/dummy	8	42	3	2013-05-16, 14:21:25
/submitted/dummy	8	47	1	2003-04-21, 08:36:30
/submitted/dummy	8	12	1	2003-10-01, 14:52:38
/submitted/dummy	8	35	2	2013-04-22, 10:18:19
/submitted/dummy	8	2	7	1992-08-10, 21:22:16
/submitted/dummy	8	24	6	2005-01-09, 17:19:56
/submitted/dummy	8	35	2	2002-01-02, 02:56:36
/submitted/dummy	8	28	1	2019-03-08, 20:14:47
/submitted/dummy	8	7	6	2001-01-12, 16:41:37
/submitted/dummy	8	5	6	2001-09-15, 04:06:06
/submitted/dummy	8	39	4	2015-12-29, 20:32:48
/submitted/dummy	8	33	2	2015-10-01, 18:31:02
/submitted/dummy	8	20	7	1998-06-02, 22:19:30
/submitted/dummy	8	10	5	2009-08-29, 11:36:17
/submitted/dummy	8	37	2	2007-03-08, 02:19:39
/submitted/dummy	8	22	6	2001-07-05, 08:07:33
/submitted/dummy	8	19	1	2013-02-26, 09:10:53
/submitted/dummy	8	28	1	1993-12-22, 05:09:16
/submitted/dummy	8	9	7	2003-04-03, 19:33:47
/submitted/dummy	8	55	4	1998-10-28, 23:18:35
/submitted/dummy	8	34	4	2021-06-05, 03:05:10
/submitted/dummy	8	10	3	1993-05-07, 05:28:38
/submitted/dummy	8	20	7	1998-09-16, 19:05:01
/submitted/dummy	8	29	7	2020-11-09, 12:02:03
/submitted/dummy	8	33	2	2003-01-01, 02:01:18
/submitted/dummy	8	30	7	2005-02-08, 17:22:33
/submitted/dummy	8	24	1	1997-03-31, 00:09:24
/submitted/dummy	8	44	7	2008-08-21, 18:58:16
/submitted/dummy	8	40	6	2006-02-21, 22:04:03
/submitted/dummy	8	19	5	2019-10-24, 13:09:42
/submitted/dummy	8	2	3	2022-01-31, 01:59:53
/submitted/dummy	8	35	3	2011-02-12, 23:44:39
/submitted/dummy	8	25	5	2002-08-20, 12:06:38
/submitted/dummy	8	42	3	2004-12-20, 12:56:35
/submitted/dummy	8	46	2	2016-09-13, 15:57:04
/submitted/dummy	8	17	3	1995-11-06, 01:50:47
/submitted/dummy	8	19	3	2016-04-28, 20:10:59
/submitted/dummy	8	30	7	2011-02-08, 10:59:26
/submitted/dummy	8	40	4	2007-10-07, 17:59:36
/submitted/dummy	8	32	7	2005-07-15, 00:57:55
/submitted/dummy	8	38	6	2019-12-28, 17:44:33
/submitted/dummy	9	38	6	1992-07-31, 13:57:20
/submitted/dummy	9	9	1	1998-10-14, 11:19:38
/submitted/dummy	10	34	4	2007-11-30, 21:57:50
/submitted/dummy	10	34	6	2014-08-25, 18:36:44
/submitted/dummy	10	2	7	2000-08-10, 19:11:23
/submitted/dummy	10	6	1	2006-06-14, 06:41:11
/submitted/dummy	10	8	5	2009-04-17, 08:16:29
/submitted/dummy	10	37	2	2022-04-08, 04:26:08
/submitted/dummy	10	11	3	2018-11-11, 10:27:43
/submitted/dummy	10	25	5	1999-12-14, 15:53:00
/submitted/dummy	10	46	1	2020-12-01, 11:19:42
/submitted/dummy	10	40	4	2004-08-16, 02:15:56
/submitted/dummy	10	37	6	2012-09-04, 05:08:33
/submitted/dummy	10	5	6	2022-05-20, 06:46:48
/submitted/dummy	10	8	5	1995-03-31, 09:51:55
/submitted/dummy	10	39	4	2009-04-14, 21:03:59
/submitted/dummy	10	5	6	2018-08-04, 09:51:19
/submitted/dummy	10	29	7	2018-08-23, 22:25:49
/submitted/dummy	10	4	5	2014-08-12, 16:03:59
/submitted/dummy	10	2	7	1995-09-04, 16:29:16
/submitted/dummy	10	25	5	1993-10-23, 19:38:58
/submitted/dummy	10	37	6	1992-12-15, 12:56:48
/submitted/dummy	10	21	2	2015-04-14, 09:48:51
\.
COPY task_groups (problem_id, name, requires_all_ok) FROM STDIN;
1	Group 1	False
1	Group 2	True
1	Group 3	False
1	Group 4	True
2	Group 1	False
2	Group 2	False
2	Group 3	True
2	Group 4	True
3	Group 1	True
3	Group 2	False
3	Group 3	True
3	Group 4	False
3	Group 5	True
4	Group 1	False
4	Group 2	False
4	Group 3	False
4	Group 4	False
5	Group 1	False
5	Group 2	False
5	Group 3	True
5	Group 4	False
5	Group 5	False
6	Group 1	True
6	Group 2	True
6	Group 3	True
6	Group 4	True
6	Group 5	True
7	Group 1	True
7	Group 2	True
7	Group 3	False
7	Group 4	True
7	Group 5	True
8	Group 1	True
8	Group 2	False
8	Group 3	False
9	Group 1	False
9	Group 2	True
9	Group 3	True
9	Group 4	False
9	Group 5	True
10	Group 1	False
10	Group 2	False
10	Group 3	False
10	Group 4	False
10	Group 5	False
11	Group 1	True
11	Group 2	False
11	Group 3	True
11	Group 4	True
11	Group 5	True
12	Group 1	True
12	Group 2	False
12	Group 3	True
13	Group 1	True
13	Group 2	True
13	Group 3	True
13	Group 4	False
13	Group 5	False
14	Group 1	True
14	Group 2	True
15	Group 1	True
15	Group 2	False
15	Group 3	True
15	Group 4	True
15	Group 5	False
16	Group 1	False
16	Group 2	False
16	Group 3	True
16	Group 4	False
17	Group 1	False
17	Group 2	True
17	Group 3	False
18	Group 1	False
18	Group 2	False
18	Group 3	True
18	Group 4	True
18	Group 5	False
19	Group 1	True
19	Group 2	False
19	Group 3	False
19	Group 4	True
20	Group 1	False
21	Group 1	True
21	Group 2	True
22	Group 1	True
23	Group 1	False
24	Group 1	False
24	Group 2	False
24	Group 3	False
24	Group 4	False
24	Group 5	True
25	Group 1	True
25	Group 2	False
26	Group 1	True
27	Group 1	False
27	Group 2	True
27	Group 3	False
28	Group 1	False
28	Group 2	True
29	Group 1	True
29	Group 2	False
29	Group 3	False
30	Group 1	True
30	Group 2	True
30	Group 3	True
30	Group 4	True
30	Group 5	False
31	Group 1	True
31	Group 2	False
31	Group 3	False
31	Group 4	False
32	Group 1	True
32	Group 2	False
32	Group 3	False
32	Group 4	True
33	Group 1	True
33	Group 2	True
33	Group 3	False
33	Group 4	False
34	Group 1	False
34	Group 2	False
35	Group 1	False
35	Group 2	True
36	Group 1	True
36	Group 2	True
36	Group 3	True
37	Group 1	False
37	Group 2	False
38	Group 1	True
38	Group 2	False
39	Group 1	True
39	Group 2	True
39	Group 3	False
39	Group 4	False
40	Group 1	False
40	Group 2	False
40	Group 3	False
40	Group 4	False
40	Group 5	True
41	Group 1	True
41	Group 2	False
41	Group 3	False
41	Group 4	True
42	Group 1	True
42	Group 2	True
43	Group 1	False
43	Group 2	True
44	Group 1	True
44	Group 2	True
45	Group 1	True
45	Group 2	False
45	Group 3	False
45	Group 4	True
45	Group 5	False
46	Group 1	True
46	Group 2	False
47	Group 1	True
48	Group 1	True
48	Group 2	True
49	Group 1	False
49	Group 2	False
49	Group 3	False
50	Group 1	True
50	Group 2	True
50	Group 3	False
51	Group 1	False
51	Group 2	True
51	Group 3	False
52	Group 1	True
53	Group 1	False
53	Group 2	True
53	Group 3	False
53	Group 4	True
53	Group 5	False
54	Group 1	True
54	Group 2	False
54	Group 3	True
55	Group 1	False
55	Group 2	False
56	Group 1	False
56	Group 2	True
56	Group 3	False
\.
COPY tasks (task_group, name, test_uri, points, time_limit, memory_limit, show_output) FROM STDIN;
1	Test 0	tasks/main/posts	1.9	0.5	53477376	True
1	Test 1	tasks/wp-content/main	2.8	0.9	94371840	True
1	Test 2	tasks/list/explore/category	2.9	2.7	89128960	True
1	Test 3	tasks/app	1.6	0.7	80896	False
1	Test 4	tasks/tag	2.6	1.0	57671680	False
1	Test 5	tasks/blog/list/wp-content	1.6	1.4	84934656	True
2	Test 0	tasks/categories/tag/posts	1.4	1.0	77824	False
2	Test 1	tasks/main/list/blog	2.1	1.1	2048	True
2	Test 2	tasks/tags/blog	1.3	3.4	79872	False
2	Test 3	tasks/tags	1.7	0.5	30720	True
2	Test 4	tasks/category/search/category	1.5	3.4	99328	False
2	Test 5	tasks/explore/search	2.1	1.9	98304	True
2	Test 6	tasks/blog/search	1.6	1.3	5120	False
2	Test 7	tasks/category/main	2.7	3.4	97517568	True
3	Test 0	tasks/search	1.7	2.0	41943040	True
3	Test 1	tasks/tags/list	2.5	1.8	78643200	False
3	Test 2	tasks/blog/tag/posts	1.1	3.4	99614720	True
3	Test 3	tasks/list	1.5	1.5	65536	False
3	Test 4	tasks/category/app	1.3	1.8	33554432	False
3	Test 5	tasks/app/categories/category	2.7	1.4	79872	False
3	Test 6	tasks/tags	2.0	2.9	15360	True
3	Test 7	tasks/main/main	1.4	1.7	25600	False
4	Test 0	tasks/main	1.7	3.1	22020096	False
4	Test 1	tasks/tag	1.0	0.9	67584	False
4	Test 2	tasks/tags/main/list	1.0	0.8	33554432	False
4	Test 3	tasks/category/wp-content	2.0	1.8	85983232	False
4	Test 4	tasks/search/tags/posts	1.4	3.1	67108864	True
4	Test 5	tasks/tags/search/blog	1.6	1.9	81788928	False
4	Test 6	tasks/tags	2.9	1.0	89088	False
4	Test 7	tasks/tag	2.8	2.9	84934656	True
4	Test 8	tasks/list/list/tags	1.3	1.8	3072	False
4	Test 9	tasks/main/tag/posts	1.2	2.9	47185920	True
5	Test 0	tasks/tags/tag/list	2.1	0.7	56623104	True
5	Test 1	tasks/main	2.2	1.2	22528	True
5	Test 2	tasks/posts/main/blog	2.1	2.5	80896	True
5	Test 3	tasks/app/tag	1.4	1.9	71680	True
5	Test 4	tasks/wp-content/tag	2.6	0.7	95420416	False
5	Test 5	tasks/app/blog	2.1	1.3	39936	False
5	Test 6	tasks/blog/categories	2.3	3.0	89088	True
6	Test 0	tasks/main	2.9	2.5	38912	False
6	Test 1	tasks/app	1.9	1.9	89128960	True
6	Test 2	tasks/main/wp-content/tag	2.6	1.1	1048576	False
6	Test 3	tasks/explore/categories	2.4	0.5	69632	True
6	Test 4	tasks/tag/explore	2.0	2.2	63963136	False
6	Test 5	tasks/tag/categories	2.2	2.9	65011712	False
6	Test 6	tasks/main/app	1.6	2.3	25600	True
7	Test 0	tasks/app	2.9	2.9	20480	False
7	Test 1	tasks/main/blog/app	2.7	2.8	34816	True
7	Test 2	tasks/main/tags	1.3	2.4	102760448	False
7	Test 3	tasks/list/app/categories	2.2	3.3	72704	False
7	Test 4	tasks/search	2.0	1.5	79691776	True
7	Test 5	tasks/tag	1.5	1.9	20480	True
7	Test 6	tasks/category/explore	1.4	2.1	51380224	True
7	Test 7	tasks/tags	1.7	2.6	99328	True
7	Test 8	tasks/app	1.4	2.4	46080	True
7	Test 9	tasks/main/main	1.4	0.6	98566144	False
8	Test 0	tasks/posts/explore/categories	1.3	1.5	90177536	True
9	Test 0	tasks/wp-content/blog/posts	2.7	2.2	80740352	False
10	Test 0	tasks/tags/app	2.7	2.4	50331648	True
11	Test 0	tasks/tag/categories	2.3	1.2	65536	False
11	Test 1	tasks/explore/blog/explore	2.5	1.4	27262976	True
11	Test 2	tasks/wp-content/category/tag	2.5	0.8	24117248	False
11	Test 3	tasks/tags/wp-content	1.6	3.1	52428800	False
11	Test 4	tasks/wp-content/wp-content/wp-content	1.7	1.4	63488	False
11	Test 5	tasks/search	2.5	3.3	48128	False
11	Test 6	tasks/categories/categories	1.1	1.7	41943040	True
11	Test 7	tasks/tags/tags	1.4	2.5	69206016	True
11	Test 8	tasks/category/app/list	1.1	2.5	57344	False
12	Test 0	tasks/search	1.9	2.4	25600	False
12	Test 1	tasks/list/posts/main	2.5	2.6	52428800	False
12	Test 2	tasks/search/explore/explore	1.0	1.8	19456	False
12	Test 3	tasks/list/app	1.5	3.1	70656	False
12	Test 4	tasks/blog/app/explore	2.7	2.4	10485760	False
12	Test 5	tasks/posts	1.3	2.9	59768832	True
12	Test 6	tasks/app/categories	2.9	0.9	33792	True
12	Test 7	tasks/category/tag	1.6	2.6	66560	False
12	Test 8	tasks/list/blog/blog	2.1	0.9	45088768	True
13	Test 0	tasks/explore/list	2.1	1.3	8192	True
13	Test 1	tasks/categories	2.2	2.7	34816	False
13	Test 2	tasks/tag/blog	1.0	3.2	16384	False
13	Test 3	tasks/wp-content/tags	1.7	1.9	74752	True
13	Test 4	tasks/tags/categories	2.5	2.7	60416	False
14	Test 0	tasks/search/explore	2.5	1.4	19922944	True
14	Test 1	tasks/list	2.0	1.3	89088	False
14	Test 2	tasks/wp-content/list	2.1	2.0	53477376	False
14	Test 3	tasks/list/tags	2.8	2.4	69206016	True
14	Test 4	tasks/categories/search	2.8	2.1	53477376	True
14	Test 5	tasks/list/category	1.1	2.8	10240	False
15	Test 0	tasks/wp-content	2.9	1.7	75497472	False
15	Test 1	tasks/posts	2.3	3.3	68608	False
15	Test 2	tasks/category	2.7	2.0	36864	False
15	Test 3	tasks/category/tags/category	1.7	2.6	87040	False
15	Test 4	tasks/posts/categories/wp-content	2.8	3.0	26214400	True
15	Test 5	tasks/posts	2.7	1.2	69206016	True
15	Test 6	tasks/tag/search	2.9	2.4	25600	False
16	Test 0	tasks/category/explore/tag	1.6	1.5	74448896	True
16	Test 1	tasks/main/category	2.9	3.0	65536	False
16	Test 2	tasks/list/tags/explore	2.5	1.8	80896	True
16	Test 3	tasks/category/list	1.7	0.9	46080	True
16	Test 4	tasks/explore/wp-content	2.0	2.5	82837504	False
16	Test 5	tasks/wp-content/tags/blog	2.3	2.2	1048576	False
16	Test 6	tasks/list/categories	1.6	1.8	50331648	False
16	Test 7	tasks/category/tags	2.4	0.5	7168	False
16	Test 8	tasks/main	2.7	3.2	48128	True
16	Test 9	tasks/app	1.6	0.7	26624	True
17	Test 0	tasks/posts	1.0	1.5	25600	True
17	Test 1	tasks/posts/explore	1.5	2.1	9437184	True
17	Test 2	tasks/wp-content	2.9	1.6	7168	False
17	Test 3	tasks/categories/explore/posts	2.4	2.1	41943040	False
17	Test 4	tasks/list	2.6	2.0	67108864	False
17	Test 5	tasks/wp-content/list/search	2.2	3.4	24576	True
17	Test 6	tasks/category	2.4	2.6	10485760	True
17	Test 7	tasks/posts	1.4	2.2	44040192	False
17	Test 8	tasks/search/list/blog	1.2	3.3	14680064	False
18	Test 0	tasks/category	2.3	2.7	32768	True
18	Test 1	tasks/categories	1.9	1.4	76546048	False
18	Test 2	tasks/list/app	2.4	2.2	69206016	False
18	Test 3	tasks/posts/posts	1.1	3.1	89088	True
18	Test 4	tasks/explore/list/posts	2.2	0.9	45056	True
18	Test 5	tasks/categories	2.8	1.3	34603008	True
18	Test 6	tasks/blog/wp-content	2.3	0.8	76800	True
18	Test 7	tasks/posts/tags/explore	1.5	0.7	51380224	True
18	Test 8	tasks/tag/main	1.5	1.0	25600	True
19	Test 0	tasks/tag/app	2.3	2.7	42991616	True
19	Test 1	tasks/wp-content	2.5	2.3	90177536	True
19	Test 2	tasks/wp-content/search	2.5	1.6	33792	True
20	Test 0	tasks/list/list/blog	2.4	1.3	46080	True
20	Test 1	tasks/tag/explore	2.0	2.4	87031808	False
20	Test 2	tasks/posts/categories	2.7	2.2	82944	True
20	Test 3	tasks/app/tag/list	2.2	0.8	14680064	False
20	Test 4	tasks/list/category	1.3	1.4	103809024	False
20	Test 5	tasks/tag/app	1.8	0.8	12288	True
20	Test 6	tasks/search	1.2	0.9	81920	False
20	Test 7	tasks/wp-content	2.9	0.7	88064	False
20	Test 8	tasks/explore/wp-content	1.2	2.2	10240	True
21	Test 0	tasks/main/explore	1.4	2.7	91226112	False
21	Test 1	tasks/blog/posts/app	2.5	0.9	85983232	False
21	Test 2	tasks/posts/posts	2.0	2.4	38912	False
21	Test 3	tasks/explore	1.5	0.7	17825792	True
21	Test 4	tasks/blog	2.9	2.7	22528	False
22	Test 0	tasks/list/category	2.9	1.7	8388608	False
22	Test 1	tasks/app/blog	2.3	1.1	26214400	True
22	Test 2	tasks/blog	2.8	1.7	29360128	True
22	Test 3	tasks/categories	1.7	1.9	99614720	False
22	Test 4	tasks/tag/main/tags	2.0	2.9	65011712	False
22	Test 5	tasks/posts/blog	2.9	1.6	89088	True
22	Test 6	tasks/app	2.7	0.9	48128	True
22	Test 7	tasks/category	2.4	1.7	99328	True
23	Test 0	tasks/explore/categories/list	2.0	2.8	104857600	True
23	Test 1	tasks/categories	1.4	0.7	49283072	True
23	Test 2	tasks/posts/posts/app	2.3	0.6	24576	False
23	Test 3	tasks/tags	1.5	3.0	21504	True
23	Test 4	tasks/wp-content/tags	1.8	3.1	11264	False
23	Test 5	tasks/posts	2.9	2.1	80896	False
23	Test 6	tasks/app/explore/wp-content	2.2	2.3	72704	False
23	Test 7	tasks/blog/categories/category	2.5	0.8	23068672	False
23	Test 8	tasks/tags	2.3	1.3	62464	False
24	Test 0	tasks/blog/tag	1.0	1.2	76546048	True
24	Test 1	tasks/categories/posts	2.7	2.5	9437184	False
24	Test 2	tasks/categories/tag	1.9	3.2	52224	False
24	Test 3	tasks/main/tags/wp-content	2.8	1.7	89088	False
24	Test 4	tasks/category	1.5	2.4	15728640	True
24	Test 5	tasks/list/blog	2.3	3.2	82944	False
25	Test 0	tasks/blog	2.5	2.0	41984	True
26	Test 0	tasks/list	1.7	1.9	38797312	True
26	Test 1	tasks/tags	1.9	1.3	79872	False
26	Test 2	tasks/category/posts	2.6	1.5	80740352	False
26	Test 3	tasks/wp-content/categories	1.3	3.2	25165824	False
26	Test 4	tasks/app/wp-content	1.2	0.7	25600	False
27	Test 0	tasks/category/search/posts	2.0	1.7	89128960	False
27	Test 1	tasks/explore/tag/app	1.4	0.9	92160	False
27	Test 2	tasks/tag/main/tags	2.3	1.7	65536	False
27	Test 3	tasks/search/blog	2.2	3.0	56320	False
27	Test 4	tasks/tag	2.9	2.9	88064	True
27	Test 5	tasks/list/tags	2.2	1.0	104857600	True
28	Test 0	tasks/tag/tags	1.5	3.0	6144	False
29	Test 0	tasks/posts/tag/explore	1.0	1.4	56320	True
29	Test 1	tasks/app	2.7	2.9	82944	False
30	Test 0	tasks/category/explore/search	1.1	2.0	88064	True
30	Test 1	tasks/explore/wp-content	1.3	1.4	12288	False
30	Test 2	tasks/search	2.7	2.6	11534336	True
31	Test 0	tasks/list/posts	2.1	2.4	39845888	False
31	Test 1	tasks/search/category	2.3	1.0	46137344	False
31	Test 2	tasks/category	1.8	1.4	35840	False
31	Test 3	tasks/app/tags	2.7	2.2	102400	True
31	Test 4	tasks/tags/posts	2.9	2.1	92274688	True
31	Test 5	tasks/wp-content	1.1	1.4	63488	True
32	Test 0	tasks/wp-content/tags/posts	1.8	3.0	4194304	False
32	Test 1	tasks/explore	2.0	2.2	48234496	True
32	Test 2	tasks/main/tag/app	2.3	1.5	60817408	False
32	Test 3	tasks/main/categories/tag	2.9	1.2	81788928	True
32	Test 4	tasks/search/main	1.0	0.7	14680064	False
33	Test 0	tasks/app/app	1.0	2.7	57671680	False
33	Test 1	tasks/categories/wp-content	2.1	1.6	94371840	False
33	Test 2	tasks/blog/tag	1.3	3.1	10240	True
33	Test 3	tasks/tags/app	1.4	0.8	82837504	False
33	Test 4	tasks/blog/tag	2.6	1.0	92160	False
33	Test 5	tasks/wp-content	1.2	1.0	59768832	True
33	Test 6	tasks/blog/search	1.8	3.2	81920	False
33	Test 7	tasks/categories/app/wp-content	1.4	2.2	7168	False
33	Test 8	tasks/category	1.2	3.0	28672	False
34	Test 0	tasks/app	2.9	1.5	42991616	False
34	Test 1	tasks/tags/categories	1.0	2.2	10485760	False
35	Test 0	tasks/explore/categories	1.2	2.4	54525952	True
35	Test 1	tasks/categories/explore/main	2.7	1.2	47104	True
35	Test 2	tasks/wp-content/categories/wp-content	2.7	2.3	50176	False
35	Test 3	tasks/list	1.4	1.4	18432	False
35	Test 4	tasks/category/categories	1.1	0.9	68608	True
35	Test 5	tasks/tag/tags/explore	1.3	1.3	18874368	False
36	Test 0	tasks/explore/search/posts	1.1	2.6	54525952	False
36	Test 1	tasks/app	1.9	2.2	72704	False
36	Test 2	tasks/tags/category/category	2.9	1.0	7168	False
36	Test 3	tasks/categories/tag/tag	1.6	2.5	4194304	False
36	Test 4	tasks/categories/blog/app	2.0	1.5	69632	True
37	Test 0	tasks/categories/tags/category	2.0	0.5	56623104	True
37	Test 1	tasks/categories	1.2	2.1	4194304	True
37	Test 2	tasks/wp-content/main	1.1	1.6	32768	True
37	Test 3	tasks/categories	2.7	1.5	49283072	True
37	Test 4	tasks/tags/blog/list	2.6	1.5	73728	True
37	Test 5	tasks/blog/blog	2.8	1.9	8388608	False
37	Test 6	tasks/list/list/search	2.0	0.5	49283072	True
37	Test 7	tasks/posts	1.2	2.7	37748736	False
38	Test 0	tasks/explore/search/tags	2.5	3.0	7168	True
38	Test 1	tasks/app	2.9	3.0	75497472	False
38	Test 2	tasks/tag/posts	1.0	0.8	77824	False
39	Test 0	tasks/categories/list/wp-content	2.5	1.5	87031808	True
39	Test 1	tasks/search	1.2	0.8	15360	False
39	Test 2	tasks/main/list	2.4	2.6	71303168	True
39	Test 3	tasks/category/main/explore	2.0	2.8	8388608	True
39	Test 4	tasks/posts/tag/posts	2.8	0.9	37748736	True
39	Test 5	tasks/tag	1.9	2.5	66060288	True
39	Test 6	tasks/main	2.9	1.7	52224	False
40	Test 0	tasks/tags	1.3	1.1	74752	True
40	Test 1	tasks/categories/app	2.4	3.0	52428800	True
41	Test 0	tasks/list	1.9	3.0	5120	True
41	Test 1	tasks/app	1.6	1.1	63963136	True
41	Test 2	tasks/main/list	1.7	1.7	53477376	False
41	Test 3	tasks/app	1.2	1.8	41984	False
41	Test 4	tasks/category/tag/list	2.2	1.0	101376	False
41	Test 5	tasks/main/app/wp-content	1.8	1.9	83886080	True
41	Test 6	tasks/posts/categories/tags	1.5	2.1	34816	False
41	Test 7	tasks/search/blog/tags	1.2	1.1	83886080	False
41	Test 8	tasks/blog/wp-content/tag	2.6	1.4	48234496	False
42	Test 0	tasks/categories	1.3	2.1	79691776	True
43	Test 0	tasks/search/tag/posts	1.2	1.7	62464	True
43	Test 1	tasks/category/tag	2.7	2.4	90177536	True
43	Test 2	tasks/category/search/wp-content	1.0	2.2	3145728	False
43	Test 3	tasks/main	2.6	1.2	88080384	True
43	Test 4	tasks/app/posts	2.6	0.7	49283072	False
43	Test 5	tasks/explore/explore/category	1.3	2.8	21504	False
43	Test 6	tasks/categories/search/search	2.8	3.0	75776	True
43	Test 7	tasks/blog	2.0	2.3	48234496	False
44	Test 0	tasks/categories	1.3	1.7	26624	True
44	Test 1	tasks/categories/posts	1.6	1.5	57344	True
44	Test 2	tasks/tag/search/categories	2.4	2.7	27648	False
44	Test 3	tasks/tag/wp-content/category	2.6	2.3	18432	False
44	Test 4	tasks/search/explore/tag	2.8	1.5	92274688	True
44	Test 5	tasks/list/posts/category	1.8	1.7	82837504	False
44	Test 6	tasks/wp-content/wp-content	1.6	2.0	35840	True
44	Test 7	tasks/tags/categories/main	1.3	1.1	15728640	False
44	Test 8	tasks/tag/explore	1.3	2.5	71680	False
45	Test 0	tasks/posts/category/blog	2.4	3.0	33792	True
46	Test 0	tasks/search/wp-content	2.3	3.2	8192	True
46	Test 1	tasks/posts/posts/search	1.2	1.5	25600	False
46	Test 2	tasks/tag/app	2.7	1.2	84992	True
46	Test 3	tasks/category	2.0	1.0	44040192	True
47	Test 0	tasks/tag	1.2	3.1	101376	True
47	Test 1	tasks/explore/blog	2.3	0.9	95420416	True
47	Test 2	tasks/category/posts	2.9	3.3	62464	False
47	Test 3	tasks/category/posts	2.3	2.6	39936	False
47	Test 4	tasks/explore	1.8	2.3	27648	True
47	Test 5	tasks/list	2.4	3.4	70254592	False
47	Test 6	tasks/search	2.9	1.0	3145728	True
47	Test 7	tasks/main	2.7	2.4	80740352	False
47	Test 8	tasks/categories	1.8	1.4	12582912	True
48	Test 0	tasks/tags	2.5	2.0	17408	False
48	Test 1	tasks/wp-content/posts	2.2	2.8	95420416	True
48	Test 2	tasks/blog/explore/categories	1.9	2.1	29696	False
48	Test 3	tasks/app/explore/search	1.4	1.2	80740352	False
48	Test 4	tasks/category	2.0	0.8	76546048	True
48	Test 5	tasks/posts/category	2.2	0.7	71680	False
48	Test 6	tasks/tags/categories	2.3	2.3	11264	False
48	Test 7	tasks/search/search	1.8	3.4	57671680	False
48	Test 8	tasks/search/list	2.4	3.1	69632	False
48	Test 9	tasks/list/tag	1.8	0.6	68157440	False
49	Test 0	tasks/wp-content/posts/categories	2.9	2.0	10240	True
49	Test 1	tasks/tag/posts	1.4	0.5	70656	True
49	Test 2	tasks/search/blog/wp-content	1.9	2.0	23068672	True
50	Test 0	tasks/wp-content/posts/explore	1.9	1.1	11534336	True
50	Test 1	tasks/posts/search	1.5	1.6	79872	False
50	Test 2	tasks/wp-content/blog/search	2.6	2.5	68157440	True
50	Test 3	tasks/categories	2.7	1.5	64512	True
50	Test 4	tasks/wp-content/blog	2.8	2.4	96468992	False
50	Test 5	tasks/wp-content/categories	1.0	0.9	11534336	True
50	Test 6	tasks/search	2.4	2.5	100663296	False
50	Test 7	tasks/category/categories/posts	2.2	0.8	27262976	True
50	Test 8	tasks/tag	2.3	0.6	20971520	False
50	Test 9	tasks/main/blog	2.4	1.4	18432	True
51	Test 0	tasks/posts/tags/list	1.7	1.3	55574528	True
51	Test 1	tasks/blog/app	1.2	2.1	52428800	False
51	Test 2	tasks/posts	2.1	1.7	99328	False
51	Test 3	tasks/app	2.5	3.0	69206016	True
51	Test 4	tasks/main/tags	1.5	1.8	36700160	True
51	Test 5	tasks/categories	2.0	2.9	79872	False
51	Test 6	tasks/wp-content/blog	2.5	1.8	71680	True
51	Test 7	tasks/search/categories	1.6	1.4	76800	False
51	Test 8	tasks/blog/tag	1.0	1.6	58368	False
51	Test 9	tasks/app/category	1.0	1.3	4194304	False
52	Test 0	tasks/tag/main/tag	2.6	0.6	98304	True
52	Test 1	tasks/app/tags	2.9	2.6	65536	True
52	Test 2	tasks/list/list	2.0	3.3	85983232	False
52	Test 3	tasks/explore/search/app	2.8	2.8	71303168	False
52	Test 4	tasks/blog	2.0	0.9	70254592	True
52	Test 5	tasks/list/app/tag	1.7	1.5	78643200	True
52	Test 6	tasks/explore/app	1.2	3.1	46137344	True
52	Test 7	tasks/app	1.3	0.5	49283072	False
52	Test 8	tasks/app	2.1	2.9	10240	True
53	Test 0	tasks/categories	1.2	3.2	66560	False
53	Test 1	tasks/app/blog	2.0	0.7	58368	False
53	Test 2	tasks/list	2.7	1.1	47185920	True
53	Test 3	tasks/categories/category/tags	2.9	2.0	28311552	False
53	Test 4	tasks/wp-content/app	2.6	2.8	34603008	False
54	Test 0	tasks/tags	2.1	0.7	27648	True
54	Test 1	tasks/app/tags	2.2	1.9	38912	False
54	Test 2	tasks/categories/tag	1.2	3.2	51380224	False
54	Test 3	tasks/tags	2.7	1.9	85983232	False
54	Test 4	tasks/posts/tags/categories	2.7	3.3	52224	False
55	Test 0	tasks/category/tags	1.6	1.6	80896	True
55	Test 1	tasks/tags	2.2	1.2	4194304	False
55	Test 2	tasks/categories/search/categories	2.6	0.5	25165824	True
55	Test 3	tasks/app/app	2.9	0.8	98304	True
55	Test 4	tasks/list	2.8	0.6	40894464	True
55	Test 5	tasks/categories/app/app	1.4	0.6	86016	True
55	Test 6	tasks/posts	2.4	0.5	53248	False
56	Test 0	tasks/search/category/tags	2.7	0.7	76800	False
56	Test 1	tasks/category/tag	1.4	0.6	99614720	False
56	Test 2	tasks/list/explore/category	1.5	2.9	98304	False
56	Test 3	tasks/tag/category	2.7	0.7	70656	True
56	Test 4	tasks/wp-content/search/category	1.6	2.0	26214400	False
56	Test 5	tasks/list/app	2.1	2.6	49152	False
56	Test 6	tasks/explore/main	1.1	3.0	88080384	True
57	Test 0	tasks/app/search/wp-content	1.5	1.4	52224	False
57	Test 1	tasks/search/app/search	1.5	2.3	88064	False
58	Test 0	tasks/list/categories	1.1	3.3	101376	False
58	Test 1	tasks/search/list	1.2	2.3	57671680	True
58	Test 2	tasks/category/tag	2.2	2.4	96256	True
58	Test 3	tasks/explore	1.8	2.2	47104	False
58	Test 4	tasks/explore	2.7	3.2	23552	True
59	Test 0	tasks/app/list	2.4	1.8	33792	False
59	Test 1	tasks/main/posts	1.2	2.5	84992	True
59	Test 2	tasks/app/app	1.7	1.3	47185920	True
59	Test 3	tasks/wp-content/tags	2.2	2.0	92274688	True
59	Test 4	tasks/explore/blog	1.9	3.0	72351744	True
59	Test 5	tasks/search	1.1	2.3	33792	False
59	Test 6	tasks/tags	1.0	2.5	12288	False
59	Test 7	tasks/categories/wp-content/explore	1.0	0.7	94371840	False
59	Test 8	tasks/app/wp-content	1.3	2.5	72351744	True
59	Test 9	tasks/tag	1.3	0.5	100352	False
60	Test 0	tasks/posts/explore/category	1.4	1.5	12582912	True
61	Test 0	tasks/posts/tag/tag	1.8	0.9	60817408	True
61	Test 1	tasks/tags/list	2.1	1.3	6291456	True
61	Test 2	tasks/tag	1.4	2.4	26624	True
61	Test 3	tasks/app/blog	2.8	2.3	43008	False
61	Test 4	tasks/search/categories	1.4	3.1	79691776	False
61	Test 5	tasks/posts	2.3	2.9	2097152	True
61	Test 6	tasks/category/app	1.8	3.1	32505856	True
62	Test 0	tasks/list/tags	2.0	2.4	41984	True
62	Test 1	tasks/tag	2.9	2.1	51200	False
62	Test 2	tasks/blog/tags	1.5	2.2	20480	True
62	Test 3	tasks/category/tag	1.9	2.0	51380224	False
62	Test 4	tasks/explore/posts/category	2.8	1.1	54272	False
62	Test 5	tasks/list	2.6	2.7	101711872	False
63	Test 0	tasks/tag	2.8	3.0	67108864	True
63	Test 1	tasks/tags	1.9	2.3	27648	False
63	Test 2	tasks/search	1.1	0.5	79872	True
63	Test 3	tasks/explore/app/explore	1.8	1.2	89088	False
63	Test 4	tasks/list	1.0	1.8	1024	False
63	Test 5	tasks/app	2.9	1.8	71303168	False
63	Test 6	tasks/app/list/tags	1.6	3.2	48128	True
63	Test 7	tasks/search/search	1.4	0.9	101376	True
64	Test 0	tasks/blog	2.1	1.2	25165824	False
64	Test 1	tasks/wp-content/blog	1.9	2.2	33554432	True
65	Test 0	tasks/category/app	1.3	1.4	25165824	False
66	Test 0	tasks/app/posts	1.1	2.0	28672	False
66	Test 1	tasks/tags	2.0	3.1	81788928	False
66	Test 2	tasks/categories/list/tag	2.0	1.8	88080384	False
66	Test 3	tasks/posts/main/list	1.3	2.1	53477376	False
66	Test 4	tasks/app/search/tag	1.1	2.3	14336	True
66	Test 5	tasks/main/categories/wp-content	1.0	2.7	62464	True
66	Test 6	tasks/posts/tag	2.0	2.0	91136	True
67	Test 0	tasks/app/wp-content/app	1.3	2.4	13312	False
67	Test 1	tasks/blog	2.6	1.2	51380224	False
67	Test 2	tasks/list/tags	1.2	2.9	36864	False
67	Test 3	tasks/wp-content/tags	2.2	1.8	55574528	True
67	Test 4	tasks/tag/category	1.3	1.3	50331648	False
67	Test 5	tasks/tags/wp-content	2.3	2.5	45088768	True
67	Test 6	tasks/blog/search/app	2.0	1.8	32768	True
67	Test 7	tasks/explore	2.4	2.0	77594624	False
67	Test 8	tasks/tag/main/tag	2.7	2.8	78848	False
67	Test 9	tasks/posts/tags/tag	1.5	2.2	101376	False
68	Test 0	tasks/category	2.0	2.5	65536	True
69	Test 0	tasks/posts/tag	2.4	0.8	68157440	True
69	Test 1	tasks/tag/categories	2.7	1.3	35651584	True
69	Test 2	tasks/wp-content/categories	1.5	3.3	52224	True
69	Test 3	tasks/category	1.5	1.8	73400320	True
69	Test 4	tasks/blog	2.6	2.3	9437184	True
69	Test 5	tasks/wp-content/categories	1.7	2.5	39936	False
69	Test 6	tasks/search/wp-content	1.2	3.0	39845888	False
69	Test 7	tasks/list/category	2.1	2.4	33554432	True
69	Test 8	tasks/tags/main	1.6	0.5	81920	True
70	Test 0	tasks/tag/tag	1.6	2.0	24576	False
70	Test 1	tasks/tag	2.6	2.3	17408	False
70	Test 2	tasks/list/categories/list	2.8	2.7	76800	True
70	Test 3	tasks/category/tag	2.8	2.9	12288	False
70	Test 4	tasks/posts/explore	2.6	3.4	65536	True
71	Test 0	tasks/tags/app/tags	2.6	2.2	58368	False
71	Test 1	tasks/explore/categories	1.2	2.9	38912	False
71	Test 2	tasks/app	1.3	1.8	2097152	False
71	Test 3	tasks/main/blog/explore	2.5	0.5	93184	True
71	Test 4	tasks/posts/explore/list	1.7	1.6	45056	True
71	Test 5	tasks/tag	1.2	1.2	67584	False
71	Test 6	tasks/app/wp-content/categories	1.4	1.0	18432	False
71	Test 7	tasks/search/tags/category	2.3	1.6	101711872	False
71	Test 8	tasks/main/posts	1.4	2.4	56623104	True
72	Test 0	tasks/list	1.6	2.7	63488	False
73	Test 0	tasks/wp-content/tag/tag	2.3	2.3	96256	False
73	Test 1	tasks/main/category	1.3	0.5	37888	False
73	Test 2	tasks/category	2.7	3.1	6291456	True
73	Test 3	tasks/blog/explore/posts	1.2	0.5	57344	True
73	Test 4	tasks/app	2.6	0.5	1048576	True
73	Test 5	tasks/posts/tags	1.4	2.2	45088768	False
73	Test 6	tasks/explore/app/blog	2.1	2.1	75497472	False
73	Test 7	tasks/search/search	2.8	2.9	57671680	False
73	Test 8	tasks/blog	1.0	3.1	94371840	False
74	Test 0	tasks/search/posts/explore	2.7	1.6	2048	False
74	Test 1	tasks/explore/search/tag	1.2	3.0	48128	True
74	Test 2	tasks/categories	1.9	2.6	53248	True
74	Test 3	tasks/blog/tag	1.6	1.7	60416	True
74	Test 4	tasks/categories	1.0	0.5	32768	False
74	Test 5	tasks/tags/tag	2.4	2.6	60416	True
74	Test 6	tasks/tag/explore/explore	1.2	2.1	14680064	True
75	Test 0	tasks/explore	1.8	1.1	1024	False
75	Test 1	tasks/main	1.7	2.3	95420416	False
75	Test 2	tasks/posts	1.6	0.7	77594624	False
76	Test 0	tasks/blog/blog/categories	2.3	1.7	78848	False
76	Test 1	tasks/search/categories	1.7	1.1	80740352	False
76	Test 2	tasks/categories/search/blog	1.7	2.4	43008	True
76	Test 3	tasks/app/app	2.4	2.1	79691776	False
77	Test 0	tasks/wp-content/main	1.2	3.1	59768832	True
77	Test 1	tasks/tag/app	1.4	1.5	71303168	False
77	Test 2	tasks/explore	2.0	1.5	40960	False
77	Test 3	tasks/tags/main	1.0	3.0	102760448	False
77	Test 4	tasks/blog	2.1	2.3	12288	False
77	Test 5	tasks/explore/explore	2.1	0.7	86016	True
77	Test 6	tasks/explore	2.4	1.3	32505856	True
77	Test 7	tasks/category	2.2	3.0	45056	True
77	Test 8	tasks/search	2.3	0.5	5120	False
78	Test 0	tasks/app/wp-content	2.1	0.9	27648	True
78	Test 1	tasks/category/explore	2.9	2.5	77824	False
78	Test 2	tasks/main/categories/wp-content	2.8	3.1	79872	False
78	Test 3	tasks/wp-content/search/app	1.3	0.9	88080384	False
78	Test 4	tasks/tags	1.6	1.0	95232	False
79	Test 0	tasks/wp-content/tags/tags	1.3	1.8	61440	True
79	Test 1	tasks/wp-content	2.5	2.1	39845888	False
79	Test 2	tasks/explore	2.9	1.6	102760448	True
79	Test 3	tasks/posts/list/posts	2.2	2.6	12582912	False
79	Test 4	tasks/posts/explore/wp-content	2.1	2.6	34603008	False
79	Test 5	tasks/category	1.6	0.5	53248	True
79	Test 6	tasks/blog	2.9	1.1	46080	True
79	Test 7	tasks/explore/wp-content/category	1.8	1.7	81920	True
79	Test 8	tasks/category/posts	2.4	3.4	41984	True
80	Test 0	tasks/main	2.4	3.4	33792	False
80	Test 1	tasks/tag	2.6	0.7	71680	False
80	Test 2	tasks/wp-content/tag	2.8	3.2	90112	False
80	Test 3	tasks/blog/main/main	2.9	3.0	19456	True
80	Test 4	tasks/categories	1.5	1.1	45088768	False
80	Test 5	tasks/search/search/blog	1.2	2.2	10240	True
80	Test 6	tasks/categories	2.7	1.5	71303168	False
80	Test 7	tasks/wp-content	1.8	1.5	4096	True
80	Test 8	tasks/categories	2.0	2.5	88080384	True
81	Test 0	tasks/explore	2.5	0.9	45088768	True
81	Test 1	tasks/app	1.8	1.7	58720256	False
81	Test 2	tasks/wp-content/search	2.1	0.8	88080384	True
81	Test 3	tasks/explore	2.9	2.5	23068672	True
81	Test 4	tasks/blog	2.6	2.0	12288	True
81	Test 5	tasks/search/explore	1.5	3.0	62464	True
81	Test 6	tasks/tags/posts	2.5	1.6	95420416	False
81	Test 7	tasks/tags/wp-content/categories	1.5	0.6	26624	False
81	Test 8	tasks/tags/blog/tag	2.0	0.8	17408	False
81	Test 9	tasks/list/search/main	1.3	3.0	18874368	False
82	Test 0	tasks/category	1.0	2.5	47185920	True
82	Test 1	tasks/tag/explore/app	2.6	2.7	3145728	False
82	Test 2	tasks/categories/category/blog	2.2	0.5	40960	True
82	Test 3	tasks/list/category/app	1.4	2.6	12582912	False
82	Test 4	tasks/categories/categories/main	1.3	2.1	6291456	True
82	Test 5	tasks/category/categories/explore	1.3	2.8	39845888	True
82	Test 6	tasks/list/tags/wp-content	1.6	2.4	92160	True
82	Test 7	tasks/search	1.7	1.5	92274688	True
83	Test 0	tasks/category/categories	2.6	1.1	61865984	True
83	Test 1	tasks/main/list	1.5	2.0	8388608	False
83	Test 2	tasks/categories/explore	1.8	1.4	65536	True
83	Test 3	tasks/category	1.5	1.9	98304	False
83	Test 4	tasks/category/categories/categories	1.2	3.2	29696	True
84	Test 0	tasks/search/app	2.2	1.8	20971520	False
84	Test 1	tasks/wp-content/app/category	1.8	0.5	45088768	True
84	Test 2	tasks/categories/blog	2.4	0.6	102760448	True
84	Test 3	tasks/category/posts/main	2.6	2.4	31457280	False
84	Test 4	tasks/main	2.5	1.7	77824	True
84	Test 5	tasks/explore/wp-content/tags	1.6	0.8	74448896	False
84	Test 6	tasks/categories/main	2.5	3.1	74752	True
85	Test 0	tasks/tags/list/main	1.6	2.5	2097152	True
85	Test 1	tasks/explore/blog	2.3	2.3	19456	False
85	Test 2	tasks/main/category	2.2	2.1	38912	False
85	Test 3	tasks/categories/app	1.6	1.5	66060288	False
85	Test 4	tasks/category	1.3	1.4	36864	True
85	Test 5	tasks/category/search/explore	1.4	2.8	101376	False
85	Test 6	tasks/search/wp-content/app	1.1	1.8	26624	True
85	Test 7	tasks/tags/categories/list	1.3	1.4	101711872	True
85	Test 8	tasks/tags/search/posts	2.0	0.6	88080384	False
85	Test 9	tasks/posts/tag/posts	2.6	3.3	26214400	True
86	Test 0	tasks/posts/tag	2.4	3.4	88080384	True
86	Test 1	tasks/main/app/app	1.0	1.6	57671680	False
86	Test 2	tasks/search	2.6	1.5	4194304	True
86	Test 3	tasks/blog/main	2.5	1.5	59392	False
86	Test 4	tasks/explore/wp-content/blog	2.5	2.6	91136	False
86	Test 5	tasks/explore/category/list	1.2	0.9	72351744	False
86	Test 6	tasks/posts/main/category	2.4	0.5	55574528	False
87	Test 0	tasks/posts/main/main	2.9	2.6	62464	False
87	Test 1	tasks/category	2.8	1.9	22020096	True
87	Test 2	tasks/tags	1.1	2.4	5120	True
87	Test 3	tasks/tag	2.3	1.7	78643200	True
87	Test 4	tasks/categories/search/categories	2.0	0.7	93323264	False
87	Test 5	tasks/main/explore/app	1.4	1.5	40894464	True
88	Test 0	tasks/search/categories	2.0	0.5	11264	False
88	Test 1	tasks/wp-content/tag	2.5	3.2	81920	True
88	Test 2	tasks/wp-content/search	1.6	0.6	51200	True
88	Test 3	tasks/main/blog	2.9	1.4	14680064	True
88	Test 4	tasks/categories/search/category	2.3	1.1	18874368	False
88	Test 5	tasks/categories/list/category	1.6	0.9	26624	False
88	Test 6	tasks/tag/search	1.4	1.6	92160	True
88	Test 7	tasks/app/wp-content/category	1.9	1.7	1048576	True
88	Test 8	tasks/tags/list/main	1.7	1.4	88080384	False
88	Test 9	tasks/wp-content	2.5	1.2	32505856	True
89	Test 0	tasks/categories/blog/categories	1.6	1.9	79691776	False
89	Test 1	tasks/wp-content	2.3	1.8	43008	True
89	Test 2	tasks/list/main/app	1.2	0.6	23068672	True
89	Test 3	tasks/category	2.2	1.7	36864	True
89	Test 4	tasks/explore	1.1	1.8	17408	False
89	Test 5	tasks/main	1.7	2.7	63963136	False
89	Test 6	tasks/blog/blog	1.9	2.3	78848	True
89	Test 7	tasks/app/app	2.8	2.2	59768832	True
90	Test 0	tasks/main/tags	1.4	1.4	84992	False
90	Test 1	tasks/list/list	2.7	1.2	44032	False
90	Test 2	tasks/explore/categories	1.6	3.2	40894464	True
90	Test 3	tasks/posts	1.5	3.2	96256	True
90	Test 4	tasks/category/blog/main	2.8	0.6	97517568	False
91	Test 0	tasks/main/explore/list	2.5	1.4	91136	False
92	Test 0	tasks/posts/categories/tag	1.7	1.2	15360	True
92	Test 1	tasks/explore	2.1	1.9	33792	False
92	Test 2	tasks/list/blog	1.1	2.9	22020096	False
92	Test 3	tasks/explore/list/explore	1.2	2.8	85983232	True
92	Test 4	tasks/main	2.4	3.4	102760448	False
92	Test 5	tasks/tags	1.4	1.8	22528	False
92	Test 6	tasks/wp-content/tags	2.1	0.7	7168	False
92	Test 7	tasks/app	1.9	1.6	12288	False
93	Test 0	tasks/list	1.6	1.9	73400320	False
93	Test 1	tasks/blog/blog/list	2.6	2.1	77594624	True
93	Test 2	tasks/tags/category/wp-content	2.6	2.0	98304	True
93	Test 3	tasks/explore/categories	2.1	0.6	8192	True
94	Test 0	tasks/search/search/posts	1.0	2.1	31744	False
94	Test 1	tasks/wp-content/explore	1.4	1.9	35651584	True
94	Test 2	tasks/wp-content	1.5	0.9	31457280	False
94	Test 3	tasks/search/main/search	2.8	0.6	95420416	True
94	Test 4	tasks/categories	1.2	1.2	46137344	False
94	Test 5	tasks/posts/posts/blog	1.4	2.8	66060288	True
94	Test 6	tasks/tag/posts	2.4	0.8	4096	True
94	Test 7	tasks/blog	2.0	0.5	70656	True
95	Test 0	tasks/app	1.1	1.3	69632	False
95	Test 1	tasks/posts/posts/main	2.0	2.7	42991616	True
95	Test 2	tasks/explore	2.2	2.4	14680064	True
95	Test 3	tasks/list	1.6	2.3	7340032	False
95	Test 4	tasks/blog	1.9	1.6	83968	False
95	Test 5	tasks/categories	1.6	1.5	93184	False
96	Test 0	tasks/main	1.4	2.7	51380224	True
96	Test 1	tasks/explore	2.2	1.0	102400	True
96	Test 2	tasks/categories/tag/explore	1.6	0.5	50176	False
96	Test 3	tasks/explore	2.0	1.3	11534336	False
96	Test 4	tasks/posts/list/posts	1.2	2.4	61865984	True
97	Test 0	tasks/app/category	2.5	1.8	81788928	False
97	Test 1	tasks/blog	2.9	1.7	28672	True
97	Test 2	tasks/wp-content/tag	1.2	1.3	92160	True
97	Test 3	tasks/wp-content/list	1.0	1.1	10485760	False
97	Test 4	tasks/posts/main/list	2.9	1.5	79872	True
97	Test 5	tasks/posts	1.0	3.3	64512	True
97	Test 6	tasks/search/explore	2.8	2.9	67108864	False
98	Test 0	tasks/tag	1.1	2.4	17408	False
98	Test 1	tasks/posts	2.9	3.2	8388608	False
98	Test 2	tasks/blog/wp-content/posts	1.2	2.5	55296	False
98	Test 3	tasks/posts	1.9	1.6	75776	True
98	Test 4	tasks/explore	2.2	1.7	79691776	False
98	Test 5	tasks/search	2.8	3.1	77594624	False
98	Test 6	tasks/list/categories/explore	1.6	2.6	9437184	True
98	Test 7	tasks/search/tag/app	2.4	2.1	102400	True
98	Test 8	tasks/explore/explore/list	2.4	1.3	22020096	True
99	Test 0	tasks/categories	2.6	0.5	73728	False
99	Test 1	tasks/posts/tags/blog	1.8	3.0	12582912	True
99	Test 2	tasks/explore/search/main	2.3	2.0	49283072	False
99	Test 3	tasks/category/categories/category	2.1	2.5	60817408	True
99	Test 4	tasks/search	2.1	0.7	95232	True
100	Test 0	tasks/blog	1.0	1.4	76800	False
100	Test 1	tasks/categories/app	1.8	1.9	56623104	False
100	Test 2	tasks/app/category	2.3	0.5	29360128	True
100	Test 3	tasks/main/list	2.9	3.3	103809024	True
101	Test 0	tasks/categories/explore/category	2.7	2.3	12288	False
101	Test 1	tasks/posts/explore	2.9	2.8	69632	True
101	Test 2	tasks/search/categories/tags	2.6	1.2	34603008	False
101	Test 3	tasks/wp-content	1.7	0.5	92160	True
101	Test 4	tasks/app/category/list	2.8	2.6	64512	True
101	Test 5	tasks/main/list/app	2.7	2.8	26214400	True
101	Test 6	tasks/tags	2.7	3.1	43008	False
101	Test 7	tasks/main	2.5	3.1	90177536	True
102	Test 0	tasks/wp-content/tag/tag	2.3	1.7	7340032	True
103	Test 0	tasks/tags/search/blog	1.0	0.8	14336	True
104	Test 0	tasks/categories/posts/tags	2.6	1.1	80740352	False
104	Test 1	tasks/tags/app	2.0	1.0	51200	False
104	Test 2	tasks/explore/explore/blog	1.8	1.9	70656	False
104	Test 3	tasks/app/posts/explore	1.9	1.3	61865984	False
105	Test 0	tasks/search/posts	2.0	1.3	53477376	True
105	Test 1	tasks/categories/wp-content/list	1.6	0.7	5242880	False
105	Test 2	tasks/categories	1.8	0.8	21504	False
106	Test 0	tasks/explore/search	1.5	0.5	101711872	True
106	Test 1	tasks/category/app	1.1	2.2	36700160	False
106	Test 2	tasks/search/explore/posts	2.5	0.5	88080384	False
106	Test 3	tasks/main/wp-content/category	2.9	2.1	6291456	False
107	Test 0	tasks/main/explore/blog	1.0	0.7	8388608	True
107	Test 1	tasks/tag/main	1.8	0.8	34816	False
108	Test 0	tasks/blog	2.5	1.9	85983232	False
108	Test 1	tasks/tags	2.6	1.5	23068672	False
108	Test 2	tasks/list/tags	1.0	1.9	83886080	False
108	Test 3	tasks/category	2.7	1.5	68608	True
108	Test 4	tasks/main/explore	2.1	2.7	63963136	True
108	Test 5	tasks/explore/explore/tags	2.1	0.7	62464	True
108	Test 6	tasks/search	1.2	0.8	46137344	True
109	Test 0	tasks/categories	2.0	1.9	89088	True
109	Test 1	tasks/explore	1.0	0.9	17825792	False
109	Test 2	tasks/app/posts/app	2.1	1.6	17825792	True
109	Test 3	tasks/search	1.3	3.0	57344	True
109	Test 4	tasks/explore	2.4	1.8	24576	False
109	Test 5	tasks/app/posts/search	2.4	2.6	24117248	True
109	Test 6	tasks/tag	2.8	3.1	51380224	True
110	Test 0	tasks/blog	2.8	1.4	56320	False
110	Test 1	tasks/search/main/main	2.9	2.9	60817408	True
110	Test 2	tasks/blog/list/posts	1.4	1.6	50331648	False
110	Test 3	tasks/tags/tags/app	1.7	1.6	39845888	True
110	Test 4	tasks/main	2.6	2.2	8388608	True
110	Test 5	tasks/categories/main	2.6	2.0	79691776	False
110	Test 6	tasks/explore/categories	2.2	3.4	6144	False
110	Test 7	tasks/wp-content/categories/main	2.0	0.5	55296	True
111	Test 0	tasks/blog/tag/tags	1.7	3.1	92160	False
111	Test 1	tasks/search/categories	2.0	2.1	10485760	False
111	Test 2	tasks/explore	2.8	1.5	37748736	False
112	Test 0	tasks/blog	1.4	1.7	103809024	True
113	Test 0	tasks/list/categories/blog	2.7	2.4	1024	False
113	Test 1	tasks/posts	2.4	0.6	7168	False
113	Test 2	tasks/category/app/posts	1.5	1.8	27648	True
113	Test 3	tasks/search	1.2	0.5	69206016	False
113	Test 4	tasks/wp-content/search/app	1.2	0.5	97280	True
114	Test 0	tasks/wp-content/posts	1.3	3.2	89128960	False
114	Test 1	tasks/blog/posts/posts	2.6	3.2	45056	False
114	Test 2	tasks/app	1.6	0.7	51200	True
115	Test 0	tasks/list/tags/main	2.3	1.6	42991616	True
115	Test 1	tasks/tag	2.4	1.1	18432	True
115	Test 2	tasks/posts/blog	2.0	1.1	12582912	False
115	Test 3	tasks/wp-content/wp-content/posts	1.7	0.8	38912	True
115	Test 4	tasks/category/tag/tag	2.0	1.4	17408	False
115	Test 5	tasks/search	2.3	2.3	24117248	False
115	Test 6	tasks/app/posts/blog	2.4	3.4	56623104	True
115	Test 7	tasks/explore/categories/blog	1.1	2.6	78848	False
116	Test 0	tasks/tag	1.2	2.5	50331648	False
116	Test 1	tasks/app	2.1	1.0	65011712	False
116	Test 2	tasks/list/explore	1.8	1.1	80896	False
116	Test 3	tasks/list/search/tags	2.2	0.7	63963136	True
116	Test 4	tasks/explore/category	2.3	1.1	24576	True
116	Test 5	tasks/list/list	2.1	2.8	13631488	True
116	Test 6	tasks/categories/blog	1.1	1.4	16384	False
116	Test 7	tasks/explore/posts/posts	2.6	0.5	2048	True
116	Test 8	tasks/tags/categories/wp-content	1.3	2.2	47104	True
117	Test 0	tasks/category/posts/category	1.0	0.8	67584	True
117	Test 1	tasks/tags	1.9	1.8	88080384	False
117	Test 2	tasks/wp-content/wp-content	2.9	1.0	7168	True
117	Test 3	tasks/list/app/list	1.2	1.5	11534336	True
117	Test 4	tasks/search/list/search	2.4	1.1	68157440	True
117	Test 5	tasks/wp-content/search/blog	2.6	1.1	25600	True
118	Test 0	tasks/list/blog	1.6	1.1	14336	True
118	Test 1	tasks/wp-content/categories/blog	2.5	3.1	6291456	True
119	Test 0	tasks/search/list	1.7	0.9	77594624	False
119	Test 1	tasks/list/app	1.4	2.2	91136	True
120	Test 0	tasks/posts	2.2	2.6	54525952	False
121	Test 0	tasks/main	1.3	3.4	97517568	False
121	Test 1	tasks/main	1.0	1.4	88064	True
122	Test 0	tasks/blog/category/wp-content	1.4	0.7	85983232	True
122	Test 1	tasks/explore	2.7	3.4	59768832	False
122	Test 2	tasks/wp-content	1.4	2.3	73728	True
122	Test 3	tasks/tags/posts/app	2.6	0.9	84992	True
122	Test 4	tasks/main/tag	1.0	3.0	22020096	False
122	Test 5	tasks/search/list	2.6	2.8	79691776	True
122	Test 6	tasks/tags/explore	2.6	2.9	29696	False
123	Test 0	tasks/list	1.1	2.6	31457280	True
123	Test 1	tasks/explore	2.3	1.5	2097152	True
123	Test 2	tasks/search/explore/categories	1.1	3.4	59392	False
123	Test 3	tasks/explore/main/main	2.1	1.5	99328	False
123	Test 4	tasks/main/tag	1.7	2.5	21504	False
123	Test 5	tasks/main/blog/posts	1.6	2.8	88064	False
123	Test 6	tasks/main/list/tags	1.4	3.2	45088768	False
123	Test 7	tasks/main/wp-content	2.0	2.8	32505856	False
124	Test 0	tasks/blog	2.3	2.5	91226112	False
124	Test 1	tasks/main/app	1.2	2.6	47104	False
124	Test 2	tasks/wp-content/blog/posts	1.0	1.2	90177536	False
124	Test 3	tasks/category/tags	2.3	1.8	32768	True
125	Test 0	tasks/search	2.1	1.6	3072	True
126	Test 0	tasks/category/category/list	1.1	1.4	10240	False
126	Test 1	tasks/categories/app/category	1.5	0.9	88064	True
126	Test 2	tasks/category/main/wp-content	1.6	0.5	41943040	False
126	Test 3	tasks/posts	1.1	2.6	31457280	True
126	Test 4	tasks/tags/tag	2.9	1.0	71680	True
126	Test 5	tasks/posts	1.7	3.3	14336	True
126	Test 6	tasks/tag/wp-content/category	2.4	0.5	26624	False
126	Test 7	tasks/wp-content/list	2.1	1.0	98566144	True
126	Test 8	tasks/explore/search/search	1.5	1.3	91136	True
126	Test 9	tasks/tags/list/tags	2.3	3.4	33554432	True
127	Test 0	tasks/blog/tags/search	2.3	0.8	63963136	False
127	Test 1	tasks/app	2.2	0.7	101376	False
127	Test 2	tasks/blog/posts/main	1.1	3.0	47104	False
127	Test 3	tasks/app/tags	2.5	1.8	35840	True
127	Test 4	tasks/main/posts	1.8	2.0	26624	False
127	Test 5	tasks/categories/tag	2.9	2.0	19456	False
127	Test 6	tasks/main/list/explore	1.9	1.7	41943040	True
127	Test 7	tasks/categories/tags/list	1.8	3.3	90177536	False
127	Test 8	tasks/tags/wp-content	2.4	1.2	55574528	False
127	Test 9	tasks/explore/search	1.1	2.9	10240	True
128	Test 0	tasks/app/explore	1.8	3.0	97517568	True
128	Test 1	tasks/app	1.4	0.6	79691776	False
128	Test 2	tasks/wp-content/categories/explore	1.6	3.4	49152	False
129	Test 0	tasks/list	1.5	1.5	88064	True
129	Test 1	tasks/categories/categories	1.5	2.2	101711872	False
129	Test 2	tasks/blog/tag/explore	1.7	3.1	3072	True
129	Test 3	tasks/explore	1.1	1.7	31744	True
129	Test 4	tasks/posts/main	1.5	3.0	68608	False
129	Test 5	tasks/categories/posts/tags	1.7	2.3	102400	True
129	Test 6	tasks/category/tag/search	2.6	2.9	68157440	True
129	Test 7	tasks/wp-content/tag/search	1.1	3.3	50176	True
130	Test 0	tasks/wp-content	2.7	0.8	39845888	False
130	Test 1	tasks/app/blog	2.7	1.6	40960	True
130	Test 2	tasks/tag/explore/blog	2.6	2.0	82837504	False
130	Test 3	tasks/categories/posts	2.0	2.7	25600	False
130	Test 4	tasks/categories/explore/categories	2.3	1.8	69206016	True
130	Test 5	tasks/blog/search	2.8	2.6	76546048	True
130	Test 6	tasks/wp-content/blog	1.5	3.0	94371840	True
131	Test 0	tasks/category	2.2	2.3	63963136	True
131	Test 1	tasks/posts	2.1	2.0	30720	True
131	Test 2	tasks/main/tag/list	2.4	1.2	31744	True
131	Test 3	tasks/tag	1.4	0.6	96256	False
131	Test 4	tasks/wp-content/blog	2.2	2.0	60817408	True
131	Test 5	tasks/tags/explore/main	2.7	2.1	66560	False
131	Test 6	tasks/tag/search/main	2.5	3.3	25600	False
131	Test 7	tasks/main/wp-content	1.9	1.7	40894464	True
132	Test 0	tasks/blog	2.9	1.6	77594624	True
132	Test 1	tasks/main/tag/category	2.0	2.9	98304	False
132	Test 2	tasks/search	2.7	0.8	32505856	True
132	Test 3	tasks/app/list	2.3	2.1	12288	True
133	Test 0	tasks/main	2.9	3.2	50176	True
133	Test 1	tasks/tags	1.9	3.1	12582912	True
133	Test 2	tasks/category/posts	1.6	2.5	73400320	True
133	Test 3	tasks/explore/tag/wp-content	2.8	1.0	22528	True
133	Test 4	tasks/category/explore/tags	1.2	3.2	19922944	True
133	Test 5	tasks/explore/tags/list	2.0	3.2	28311552	False
133	Test 6	tasks/blog/wp-content/category	1.1	2.5	72351744	True
134	Test 0	tasks/explore	1.8	1.0	62914560	True
134	Test 1	tasks/category/search	1.1	1.0	76800	False
134	Test 2	tasks/wp-content	1.8	0.6	5242880	True
135	Test 0	tasks/list/posts/list	1.1	3.2	35651584	False
135	Test 1	tasks/tag/category	2.5	3.3	28311552	True
135	Test 2	tasks/search/main	1.6	2.9	101711872	True
135	Test 3	tasks/list/tag	2.9	2.7	70254592	False
135	Test 4	tasks/main/tags/list	1.6	0.7	76800	False
135	Test 5	tasks/list/wp-content/tags	1.5	1.4	76546048	False
135	Test 6	tasks/categories	2.9	0.9	71680	True
135	Test 7	tasks/main/tags	1.4	3.1	43008	True
136	Test 0	tasks/main/posts/main	1.8	1.3	57671680	True
137	Test 0	tasks/tag/blog	1.2	2.8	23552	False
137	Test 1	tasks/wp-content/tags	2.1	1.0	5242880	True
137	Test 2	tasks/blog/search	2.0	0.5	96256	True
137	Test 3	tasks/posts	2.3	0.7	19456	True
137	Test 4	tasks/posts	1.8	1.5	42991616	False
137	Test 5	tasks/main/blog/explore	1.6	1.6	13631488	True
137	Test 6	tasks/categories	2.4	2.2	32768	True
138	Test 0	tasks/categories/wp-content/wp-content	2.2	2.5	104857600	True
138	Test 1	tasks/wp-content/search/app	2.8	3.1	97280	True
138	Test 2	tasks/search/categories	2.1	2.0	77594624	False
138	Test 3	tasks/categories/app	1.7	0.8	24117248	True
138	Test 4	tasks/tags/search	2.1	3.1	4194304	True
138	Test 5	tasks/posts	2.2	3.4	26214400	False
138	Test 6	tasks/app/wp-content	2.8	1.2	20480	False
138	Test 7	tasks/tag	2.4	2.2	34603008	False
138	Test 8	tasks/explore	2.6	2.1	51200	False
138	Test 9	tasks/tags/tag/posts	2.9	1.4	97280	False
139	Test 0	tasks/posts	1.7	1.9	18432	True
139	Test 1	tasks/app/explore/wp-content	1.6	1.7	69206016	False
139	Test 2	tasks/app	2.7	3.1	32768	True
139	Test 3	tasks/explore/explore	2.0	2.1	92160	True
139	Test 4	tasks/explore/posts/category	2.0	2.4	50331648	False
139	Test 5	tasks/app	1.6	2.7	77824	False
140	Test 0	tasks/explore	1.5	1.9	89128960	True
140	Test 1	tasks/tag/main	1.2	1.7	94208	True
140	Test 2	tasks/categories/wp-content/posts	1.2	3.3	70656	False
140	Test 3	tasks/categories/wp-content/app	2.9	2.9	11264	True
140	Test 4	tasks/category/list/explore	1.1	1.6	33792	True
141	Test 0	tasks/search/search	2.9	3.1	29360128	True
141	Test 1	tasks/main/explore	1.8	2.8	96468992	False
141	Test 2	tasks/main/categories/list	2.5	2.0	53248	True
141	Test 3	tasks/posts/tag	1.2	2.4	16384	False
141	Test 4	tasks/tag	1.0	3.4	6291456	True
141	Test 5	tasks/app/search/categories	1.3	1.2	45056	True
141	Test 6	tasks/app/main/main	2.3	1.9	100663296	True
142	Test 0	tasks/explore/app	1.4	3.1	97280	False
142	Test 1	tasks/explore/tags/explore	1.4	2.1	64512	True
142	Test 2	tasks/posts	2.1	1.8	58368	False
142	Test 3	tasks/search	1.9	0.6	101376	True
142	Test 4	tasks/categories	2.4	2.2	80896	False
142	Test 5	tasks/wp-content	2.9	1.3	38912	False
143	Test 0	tasks/posts/list	2.9	0.5	74752	True
143	Test 1	tasks/search	2.5	2.4	18874368	True
143	Test 2	tasks/main/tag/category	1.2	3.2	47185920	False
143	Test 3	tasks/list/category/categories	1.0	0.5	46137344	True
143	Test 4	tasks/search	1.4	2.6	44040192	False
143	Test 5	tasks/categories/list/explore	2.3	2.9	70254592	False
143	Test 6	tasks/categories/list	2.7	1.5	74752	False
144	Test 0	tasks/main/posts/search	2.8	0.8	81920	False
144	Test 1	tasks/search	1.6	1.2	50331648	False
144	Test 2	tasks/search	2.3	1.9	97517568	False
145	Test 0	tasks/main/main	2.0	1.7	55296	False
145	Test 1	tasks/search/main/categories	1.0	1.2	30720	False
145	Test 2	tasks/list	2.6	3.2	57671680	True
145	Test 3	tasks/explore/blog	1.8	1.7	80740352	False
145	Test 4	tasks/categories/explore/list	1.2	1.9	36864	True
145	Test 5	tasks/posts	2.8	2.8	62464	True
145	Test 6	tasks/tag/app	1.3	1.0	61440	True
145	Test 7	tasks/app/blog	2.5	3.2	82944	False
145	Test 8	tasks/categories/main/tag	2.3	3.2	31457280	True
145	Test 9	tasks/categories/blog	2.6	2.7	47104	True
146	Test 0	tasks/wp-content/categories	1.2	0.7	87040	True
146	Test 1	tasks/main/posts	1.4	2.1	60416	False
146	Test 2	tasks/blog/search	2.3	2.9	31457280	False
146	Test 3	tasks/posts	1.6	1.4	51380224	False
147	Test 0	tasks/app/categories/main	1.3	0.8	101376	False
147	Test 1	tasks/tags/tags	2.2	3.2	80896	False
147	Test 2	tasks/app/posts/tag	1.7	2.9	44040192	True
147	Test 3	tasks/wp-content/search/tags	2.3	2.5	67108864	False
147	Test 4	tasks/list/explore/tags	1.6	2.2	50176	True
147	Test 5	tasks/search/app	2.2	0.5	54272	True
147	Test 6	tasks/list/tags/main	1.3	3.3	102760448	False
147	Test 7	tasks/tag/explore/blog	2.7	2.8	59768832	False
148	Test 0	tasks/explore/tags	2.7	1.6	80896	False
149	Test 0	tasks/search	2.4	3.1	76546048	False
149	Test 1	tasks/category/app	1.3	3.2	2097152	False
149	Test 2	tasks/categories/posts/list	2.4	1.6	29360128	True
149	Test 3	tasks/categories/categories	1.1	1.0	84934656	False
149	Test 4	tasks/app/app	1.9	0.7	64512	False
149	Test 5	tasks/tag/explore/wp-content	1.2	0.5	97280	True
149	Test 6	tasks/search	2.7	1.3	94208	True
149	Test 7	tasks/categories/wp-content/category	1.1	3.0	102400	False
150	Test 0	tasks/explore/explore	2.6	2.2	72704	False
150	Test 1	tasks/app/wp-content/main	1.9	0.6	45088768	True
151	Test 0	tasks/app/explore	2.6	2.2	4096	False
151	Test 1	tasks/tags/main/list	1.4	1.4	12288	True
151	Test 2	tasks/explore/blog/list	2.4	2.5	68608	True
152	Test 0	tasks/blog	2.0	2.3	69206016	True
152	Test 1	tasks/tag/tag	1.1	1.9	66560	False
153	Test 0	tasks/explore/posts	2.5	0.6	83886080	True
153	Test 1	tasks/posts/category	1.9	1.6	71680	True
153	Test 2	tasks/list/wp-content/explore	1.7	2.3	66060288	True
153	Test 3	tasks/main/tags/category	2.0	1.8	27262976	True
153	Test 4	tasks/blog/main	2.2	1.0	69632	True
153	Test 5	tasks/explore/categories	1.1	0.5	79691776	False
153	Test 6	tasks/posts/tags/tag	1.1	1.9	14680064	True
153	Test 7	tasks/category	1.4	1.1	76800	False
153	Test 8	tasks/tags/search	2.6	2.3	15728640	False
154	Test 0	tasks/main	1.6	3.0	65011712	False
154	Test 1	tasks/blog/wp-content	2.0	2.7	104857600	False
154	Test 2	tasks/tags/categories/main	2.5	2.3	46137344	False
154	Test 3	tasks/tags/categories	2.4	1.9	54272	True
154	Test 4	tasks/posts/app	2.3	1.0	32505856	True
155	Test 0	tasks/main/search	2.5	1.7	52224	False
155	Test 1	tasks/main/wp-content	1.2	0.6	32768	True
155	Test 2	tasks/main/main/blog	1.0	3.1	63488	True
155	Test 3	tasks/tag/categories	1.4	2.6	4194304	True
155	Test 4	tasks/app	1.9	2.6	4194304	True
155	Test 5	tasks/category	1.7	1.7	67108864	True
155	Test 6	tasks/search	2.5	0.8	52428800	False
155	Test 7	tasks/list/explore	1.4	2.9	89088	False
156	Test 0	tasks/app/tag	1.0	1.8	88064	True
156	Test 1	tasks/search/wp-content/list	1.3	1.0	31457280	True
156	Test 2	tasks/tag/category	2.6	2.8	87040	True
156	Test 3	tasks/wp-content	2.5	1.1	14680064	True
156	Test 4	tasks/list/app	1.7	2.9	2097152	False
156	Test 5	tasks/app/tags/search	1.1	2.1	33792	False
156	Test 6	tasks/wp-content/wp-content/blog	1.7	1.3	91136	True
157	Test 0	tasks/category	1.2	3.2	101711872	True
158	Test 0	tasks/category/posts	1.8	0.9	9437184	True
158	Test 1	tasks/tag/category	2.0	2.3	91136	True
158	Test 2	tasks/blog/search/posts	1.0	2.4	94208	False
158	Test 3	tasks/category	2.3	1.4	100663296	True
158	Test 4	tasks/explore/list	2.5	2.6	44040192	False
159	Test 0	tasks/explore/category/explore	1.5	1.1	18874368	True
159	Test 1	tasks/tags/posts	2.7	1.4	24576	False
159	Test 2	tasks/app/explore	1.5	1.1	54525952	True
159	Test 3	tasks/category/wp-content/tag	1.8	1.8	71680	True
159	Test 4	tasks/tag/wp-content/search	1.7	0.6	22528	True
160	Test 0	tasks/main	1.4	1.6	67584	False
160	Test 1	tasks/blog	1.2	3.0	44032	True
160	Test 2	tasks/wp-content/app	1.7	2.4	12288	False
160	Test 3	tasks/search	1.1	0.9	60416	False
160	Test 4	tasks/search/posts	2.7	0.7	55296	False
161	Test 0	tasks/search/categories	2.9	0.9	52428800	False
161	Test 1	tasks/blog/tag/explore	1.9	0.6	44032	False
161	Test 2	tasks/main/categories/tags	1.9	2.4	100663296	True
161	Test 3	tasks/blog	2.5	3.4	17825792	True
161	Test 4	tasks/search/posts/category	1.3	3.2	94208	True
162	Test 0	tasks/list/category/wp-content	1.7	1.8	55574528	True
162	Test 1	tasks/wp-content/wp-content	1.4	3.0	101711872	False
162	Test 2	tasks/explore	1.6	2.5	71680	False
163	Test 0	tasks/category/list/wp-content	2.9	1.2	51380224	True
163	Test 1	tasks/search/app/posts	2.5	0.6	17408	True
163	Test 2	tasks/wp-content/app/app	1.7	2.0	88080384	False
163	Test 3	tasks/list	2.1	0.9	20480	True
163	Test 4	tasks/tag	2.1	3.0	16384	True
163	Test 5	tasks/tags	2.9	1.6	33554432	False
163	Test 6	tasks/main/wp-content/blog	2.0	0.8	100663296	True
163	Test 7	tasks/wp-content/wp-content/categories	2.0	2.9	91136	False
163	Test 8	tasks/category	1.0	0.7	10485760	False
164	Test 0	tasks/tags	2.8	0.8	87040	False
165	Test 0	tasks/main/category	2.9	2.1	5120	True
165	Test 1	tasks/search	1.7	3.0	66560	False
165	Test 2	tasks/explore/tags	2.1	1.1	2048	False
165	Test 3	tasks/posts	2.6	2.4	103809024	True
165	Test 4	tasks/explore/category/tag	2.5	3.0	51200	True
165	Test 5	tasks/category/explore	1.8	0.6	46137344	True
165	Test 6	tasks/posts	2.7	3.3	14336	True
165	Test 7	tasks/list/app/explore	2.5	2.3	99614720	True
165	Test 8	tasks/search/wp-content/blog	1.5	1.6	16777216	True
166	Test 0	tasks/category/category	1.8	2.5	36864	True
166	Test 1	tasks/categories/main/posts	2.2	2.1	78848	False
166	Test 2	tasks/category/main/tags	2.9	3.4	102760448	True
166	Test 3	tasks/blog	1.1	1.7	76546048	True
166	Test 4	tasks/categories	1.2	2.6	83968	False
166	Test 5	tasks/wp-content	1.1	0.7	36700160	True
167	Test 0	tasks/search/category/tag	2.2	1.0	31744	True
167	Test 1	tasks/search	1.7	3.4	61440	False
168	Test 0	tasks/main	2.2	0.7	46080	True
168	Test 1	tasks/tags	1.6	2.6	100663296	False
168	Test 2	tasks/app/posts	1.8	1.0	39936	False
168	Test 3	tasks/posts/search/search	2.8	1.3	40960	False
168	Test 4	tasks/main/main/main	2.6	2.3	10485760	False
168	Test 5	tasks/explore/tags/categories	2.6	1.7	44040192	False
168	Test 6	tasks/main/tags/blog	1.6	2.6	49152	True
168	Test 7	tasks/blog/tags/list	2.0	2.5	65536	False
168	Test 8	tasks/app/search	1.1	0.7	53248	True
168	Test 9	tasks/tags/explore	1.8	2.4	51200	False
169	Test 0	tasks/category/blog	2.0	1.6	93323264	True
169	Test 1	tasks/search/app/explore	2.5	1.7	49152	False
169	Test 2	tasks/search/explore	2.4	1.0	9437184	True
170	Test 0	tasks/posts/list/posts	1.0	2.3	69632	True
170	Test 1	tasks/app	2.4	0.5	69632	False
171	Test 0	tasks/categories/wp-content/app	2.8	1.9	56320	True
171	Test 1	tasks/tag	2.5	1.1	68157440	False
171	Test 2	tasks/explore	1.4	2.8	49283072	True
171	Test 3	tasks/wp-content/list	1.8	3.4	90112	True
172	Test 0	tasks/wp-content/main/category	1.2	1.0	38912	True
172	Test 1	tasks/categories/tag/list	2.4	2.8	60817408	False
172	Test 2	tasks/app/blog/search	1.5	3.0	32768	False
172	Test 3	tasks/wp-content/main	2.1	2.9	11264	True
172	Test 4	tasks/blog	2.0	1.0	65011712	False
172	Test 5	tasks/categories	1.9	0.5	95232	True
172	Test 6	tasks/wp-content	2.9	3.0	87031808	True
173	Test 0	tasks/wp-content/tag/categories	2.8	0.8	21504	False
173	Test 1	tasks/tags/app/app	2.9	0.5	56320	True
173	Test 2	tasks/list/main	2.2	0.5	99614720	False
174	Test 0	tasks/posts/tags/search	1.0	2.9	74752	True
175	Test 0	tasks/category/blog/category	2.8	2.1	31457280	True
176	Test 0	tasks/explore/wp-content/list	1.8	1.2	88064	False
176	Test 1	tasks/wp-content/list/tag	1.6	2.7	65011712	False
176	Test 2	tasks/explore	1.3	2.9	35651584	True
176	Test 3	tasks/blog/categories	1.6	2.4	68157440	True
176	Test 4	tasks/category	1.1	0.8	14336	True
176	Test 5	tasks/posts/main/main	1.7	3.4	52224	False
176	Test 6	tasks/blog	2.9	0.6	36864	True
176	Test 7	tasks/tags/posts/search	1.3	1.6	81920	False
176	Test 8	tasks/categories	1.2	1.6	23552	True
176	Test 9	tasks/app	2.4	2.9	73728	False
177	Test 0	tasks/search	1.2	1.3	80740352	False
177	Test 1	tasks/category	1.9	0.9	54272	False
177	Test 2	tasks/wp-content/tags	2.4	1.9	81920	True
177	Test 3	tasks/posts/wp-content/posts	2.4	1.2	24576	False
177	Test 4	tasks/category	1.3	2.0	14680064	True
177	Test 5	tasks/tags/app/tag	2.8	1.8	53477376	False
177	Test 6	tasks/tag/list/main	2.9	1.2	11534336	True
178	Test 0	tasks/tag/posts	2.5	3.1	34816	False
178	Test 1	tasks/app/tag	2.4	1.4	68608	True
178	Test 2	tasks/posts/search	2.2	1.3	45088768	True
178	Test 3	tasks/search	1.6	3.4	98304	True
178	Test 4	tasks/categories/search/posts	2.1	1.8	1024	False
178	Test 5	tasks/search/blog	2.4	2.1	63488	False
178	Test 6	tasks/category/blog/tag	1.8	1.3	9437184	True
178	Test 7	tasks/list	1.9	1.0	74752	True
178	Test 8	tasks/search	2.0	0.5	1048576	False
178	Test 9	tasks/category/app/tag	1.5	2.4	25600	False
179	Test 0	tasks/search/blog/tag	2.4	1.7	98304	False
179	Test 1	tasks/categories/explore/explore	2.1	0.5	25165824	False
179	Test 2	tasks/category/app/wp-content	2.7	1.0	88064	True
179	Test 3	tasks/list/blog/tag	2.5	1.2	92274688	True
179	Test 4	tasks/main/app	1.4	2.8	40894464	False
179	Test 5	tasks/explore	1.9	1.7	9216	True
179	Test 6	tasks/search	1.0	2.9	95232	True
179	Test 7	tasks/list/category	1.3	1.9	3072	False
179	Test 8	tasks/posts/tag/posts	2.7	2.3	49152	True
179	Test 9	tasks/tags/explore/category	2.1	2.3	19922944	False
180	Test 0	tasks/search	1.5	0.5	77824	False
180	Test 1	tasks/tag	1.9	2.0	53248	False
180	Test 2	tasks/app/blog	2.5	1.5	50176	True
181	Test 0	tasks/app/list	1.4	0.7	18432	True
181	Test 1	tasks/tags	2.3	3.2	45088768	True
181	Test 2	tasks/search/list	2.0	1.8	17408	False
181	Test 3	tasks/search/search/posts	2.3	1.7	57344	False
181	Test 4	tasks/list/tag/tags	2.6	2.4	66560	True
182	Test 0	tasks/category/tag	2.9	3.1	9437184	False
182	Test 1	tasks/app/tag	2.0	3.1	67108864	True
182	Test 2	tasks/categories	1.4	2.0	57671680	True
182	Test 3	tasks/explore/main/explore	2.8	2.9	50176	True
182	Test 4	tasks/blog	2.2	0.7	79691776	True
182	Test 5	tasks/tags	1.5	2.3	94371840	False
182	Test 6	tasks/posts/main/blog	2.4	3.4	60416	False
182	Test 7	tasks/categories/explore	1.4	1.4	28672	False
182	Test 8	tasks/search/posts/main	2.6	1.4	48128	True
182	Test 9	tasks/category	2.4	3.2	14680064	False
\.
COPY task_results (submit_id, task_id, status_id, points, summary, execution_time, used_memory) FROM STDIN;
236	898	9	1.0677551280831477	Third learn material.	2.0	6965248
41	643	2	0.6111416627832182	Trade street measure very clear you subject ahead.	0.6	4981760
4	1026	4	0.5634184864432825	Class save us rich or prepare get.	1.0	2511872
217	560	2	0.933630379254993	Bad fear cut economy herself. Hospital expect for girl increase.	1.0	6444032
220	415	6	1.646440469497172	Suddenly evidence recently tree discuss themselves.	0.9	1802240
27	847	8	0.9096043631887775	\N	0.6	889856
223	781	2	0.9259124975172108	\N	1.7	5049344
59	572	6	0.8964672830033389	\N	1.1	6119424
203	228	4	0.5235322535309133	\N	1.8	6413312
206	255	5	1.1950464828712444	\N	0.9	5919744
57	238	7	0.5569086958038135	\N	0.6	3368960
128	765	1	0.0849220101781134	Learn tough glass probably. South pass smile far political coach.	0.8	8166400
56	624	9	1.2564993415776107	\N	1.8	4469760
56	625	3	1.6691194907537774	\N	0.9	7444480
116	135	3	0.2312867656351662	\N	1.0	6765568
168	934	9	1.6602422643416193	\N	1.3	2138112
29	980	9	1.2647254209114842	Set half better American.	1.8	3811328
29	987	7	1.0954616339212544	List Democrat language voice almost part seek. Tree computer word campaign size imagine.	1.1	7162880
190	528	5	2.6248591789047904	\N	1.5	611328
177	182	9	1.9706990479099458	Agreement too teacher never represent. Determine chance program actually traditional head.	1.9	5911552
65	150	10	0.799347555448247	\N	1.8	475136
203	217	7	0.30334694227834835	Edge serious myself discussion billion Mr who.	1.9	7908352
156	11	5	0.09771536569960526	Including whom activity before trouble throw compare. Down politics free situation.	1.9	3332096
190	551	9	0.75942834179563	\N	1.1	6757376
226	755	5	0.41927201505964695	\N	1.2	7565312
103	994	1	0.4314607417922975	Myself deep nor left level.	1.5	7596032
188	701	10	0.4659707838450709	Themselves structure join each sometimes eat. Street area vote few usually tend.	1.3	7384064
210	630	5	1.5964451618438062	Show possible Congress service firm figure class. Somebody chair thank least concern clearly.	1.1	4678656
146	647	7	1.2241794753283937	\N	0.8	8188928
221	467	9	0.9928080620477968	\N	1.4	7884800
69	631	7	0.22712161288760657	\N	0.8	2374656
42	988	5	0.36126578011998733	Trip writer ground present.	0.5	4559872
133	1	9	1.1035125514499138	Pm about different collection end whether.	1.1	4324352
65	162	2	0.7585920305163021	\N	0.9	495616
198	252	2	1.4819217638881046	\N	0.9	2755584
242	145	8	0.23473791255644394	Break particularly age help simple.	0.5	857088
150	59	4	0.5194675631800519	Too well security stand. Doctor leader million five.	1.4	2574336
61	1020	5	1.464965057212615	Wall several particularly trade grow.	1.6	5618688
200	517	9	0.14525615544303272	Alone top rest now sense develop answer.	0.9	7547904
214	481	5	0.9806198506988995	\N	0.9	5096448
200	511	1	0.8354667793522209	\N	0.6	311296
111	806	8	1.9935191775987786	Simple argue little product.	1.6	5628928
50	737	4	1.5358733551924162	\N	0.9	2007040
86	630	4	0.46361042545240716	Provide figure eye.	1.2	7302144
239	128	9	0.16468181281097038	\N	1.5	2004992
155	585	10	0.9051129556531874	\N	1.0	4448256
100	7	3	1.027872351197037	\N	1.3	5504000
174	423	8	1.9692804340518626	Billion few training begin beat have crime.	1.0	7849984
44	917	4	0.739508182777153	Drug form billion job.	0.9	4226048
67	566	1	1.4986769349744955	\N	1.4	5371904
111	782	8	0.15282356297288469	Firm positive town ability. Push watch pass future.	2.0	4589568
47	287	6	0.651182798171705	\N	1.6	3178496
90	250	4	0.6952648914610939	\N	1.3	7399424
87	1036	4	0.6688197758396781	\N	0.8	5073920
119	151	9	1.9816415908329224	Bag president word them scene.	0.9	5040128
195	759	9	0.12619521012125887	\N	1.9	993280
39	392	8	2.598425199837255	\N	1.5	3589120
42	973	1	0.32824696251608215	\N	1.9	6304768
90	247	5	0.5366936489754871	\N	1.5	4759552
166	610	1	0.7148593177530795	\N	1.6	361472
178	989	4	0.3035650076863728	Test government ahead all drive top population.	1.3	1636352
203	229	3	0.31028941577315305	Foot little vote.	0.6	5306368
101	811	10	1.3431156924102485	Camera tough wide general study write.	1.7	8019968
21	634	3	1.4667801243610346	\N	2.0	799744
140	453	2	0.07936542739142648	\N	1.5	4458496
223	810	10	0.28847288261717074	\N	0.6	8134656
80	869	7	0.25941526329676123	Remain benefit hospital group.	1.7	7386112
22	5	8	1.9500588931732359	\N	1.2	4924416
5	556	4	0.19181965706607657	\N	0.8	2279424
217	568	9	2.3691431870354416	Key fine focus nation together door society.	1.9	3236864
4	1010	8	0.5791330375235031	Yard occur agreement practice. Focus method cultural machine travel left.	0.7	2764800
13	97	4	1.9246579062073499	\N	0.9	7052288
15	181	8	0.42161355005637835	\N	0.7	3748864
119	162	8	0.23149948443935348	\N	1.4	5735424
161	146	10	0.5516221848923123	\N	2.0	1163264
105	956	3	0.7394999888970983	From part design reach.	0.6	6470656
214	475	9	2.590199817764375	\N	1.9	6511616
208	620	8	0.1770301348579644	\N	0.8	4014080
223	812	2	1.120937798357773	Property mean final ever ready worker.	0.6	3787776
127	944	1	0.2582147062574577	Admit green in official just receive.	1.7	798720
140	441	8	1.1829670186348031	About hold real.	1.2	5899264
226	748	9	0.6518902864735234	\N	1.9	4350976
23	614	3	2.6032827459212378	Our particular address build toward young. During bag institution thus.	0.6	6460416
194	128	9	1.4307202630050735	\N	1.0	276480
5	530	6	0.18315678768819765	Father finish pass between people three.	1.8	6564864
113	835	9	0.8632411499611424	Something small million remember. From sign collection good.	0.7	4791296
176	580	1	0.5097196641183269	\N	1.8	135168
240	209	2	1.260851602624326	\N	1.2	727040
203	218	6	0.425580773807764	\N	1.6	7396352
197	497	10	0.1915520425893215	\N	1.5	8237056
82	458	3	0.8460656970672178	\N	0.7	7926784
82	467	2	1.696844031066756	\N	0.5	5112832
234	278	10	0.8596600006214131	\N	1.8	2352128
168	935	10	0.7079769904005028	Rock also become recent. Quickly cost about.	0.7	7593984
215	48	3	1.4557087404345554	Son either music most safe agency make. Watch figure cost bank hand development.	1.0	6083584
61	1013	1	1.507964162654304	\N	1.0	7448576
169	1	5	1.2703261600172193	Drug during technology than.	0.6	2191360
170	950	2	0.515111901655527	\N	0.7	4475904
236	897	10	1.3679937782448233	\N	1.3	7300096
66	984	5	2.844330011248549	\N	1.9	7843840
85	350	5	0.7822412948474872	\N	1.0	7410688
132	130	5	1.6151899277366129	\N	1.4	7769088
81	448	4	2.2848820538976975	Talk write Congress wrong.	1.4	2085888
158	683	5	1.6878900156837997	Oil institution guess east young hit building.	1.1	1735680
123	721	6	0.581266436542258	Trouble baby those.	1.8	7774208
108	743	6	0.26651329949112074	Decide adult long.	0.8	267264
62	356	5	0.16757469798577207	Suddenly even head husband likely Republican.	0.5	3781632
113	837	1	2.505487225365453	Cause reality get why much amount shoulder you.	0.8	7870464
125	863	7	1.7371158971809557	Money computer decade.	1.8	5911552
150	82	8	1.6403925170388292	Father experience near.	1.1	3061760
101	810	6	0.6965135043146491	More degree herself. Fill put voice trouble.	1.6	481280
90	260	1	1.2271530905401924	\N	1.0	6119424
70	521	10	0.7808533567405115	\N	1.2	7871488
185	842	4	0.25746329440647364	He want north eye east. Would year beautiful people however beyond.	0.5	4857856
194	125	10	0.5823422472175072	Some city challenge thousand remember.	1.9	7956480
216	708	4	0.8391157933302779	Any account must might arrive.	0.6	7033856
237	784	2	1.2704078731274944	House politics why any city.	1.6	2094080
214	473	3	1.5506753994522031	Play do within condition behavior drive company.	1.1	7627776
213	795	6	0.4128912209919758	\N	1.8	6859776
21	624	2	2.199050826005607	Head agency thus most although this woman.	1.3	6259712
188	715	5	1.4948035652861025	\N	1.5	4681728
116	148	10	0.7818211752387983	\N	1.8	3493888
30	1041	4	2.123699029807594	Painting religious before.	2.0	5357568
111	781	6	0.04925306073289242	Itself color attention plant election teach necessary.	1.9	4953088
66	987	9	0.540152953068192	\N	1.1	5688320
191	708	7	0.9423752012031961	\N	0.5	300032
83	1016	1	0.39880807656303424	He huge threat free.	1.8	3543040
21	625	10	1.4189819665722232	Choose seat pay edge grow tell strong.	1.1	3234816
100	17	6	0.47308753400970976	Somebody Mr describe national important then.	1.3	6258688
87	1030	10	1.3883912375645777	\N	1.3	3348480
176	586	10	0.5980533638389478	Partner prepare this really Mrs.	1.0	5458944
218	841	10	0.7829716996968885	Box down certainly food.	0.7	5015552
5	531	3	0.08749687117416657	\N	1.4	4748288
28	704	7	2.2207459868200212	\N	1.7	1862656
100	27	2	0.8728661963589648	\N	0.5	2230272
61	1025	2	1.7191787234240197	\N	1.0	6802432
199	733	8	0.058171963225191706	Two whether buy pattern necessary though suggest finally.	1.8	6837248
207	498	5	1.3859756454942678	\N	1.9	4716544
184	1014	7	1.4029060937984754	Case collection first within.	1.1	1242112
94	677	6	0.6393948740500125	\N	1.6	542720
111	791	9	0.7137878236608699	Level century note certainly worker.	1.9	6026240
202	606	4	0.2712326983638685	Cold man decide. Close before like.	1.9	2407424
213	794	1	0.1304845320614802	Four their top man expert seven performance. Stop meet have which beat doctor.	2.0	8200192
111	807	6	0.07329189185378175	Either any message star role.	1.5	5781504
141	194	8	1.8271265812905793	\N	2.0	5223424
142	858	2	1.9445399330611342	Staff apply control pretty. Town wife cut sure involve black such ago.	1.1	404480
212	866	9	1.3198630376300569	\N	0.7	425984
173	865	4	0.3986788393123138	\N	1.7	2409472
59	577	1	1.9921077858614147	\N	0.9	5041152
204	1016	6	0.7890654767140972	Music ball him deep.	1.4	153600
217	558	8	0.7173128475908059	\N	1.0	5138432
221	458	7	0.5255554276961286	\N	1.6	6200320
115	766	10	1.5539673240862866	Notice mention top often have.	1.4	6428672
221	479	9	0.2475731161167796	\N	1.7	2031616
199	735	4	0.6560824692250787	\N	1.7	5417984
223	797	1	1.2454732754192854	\N	1.9	1720320
107	862	5	0.5791892462155415	Artist above continue prepare between process tree.	0.6	7667712
3	497	6	1.3175525556138208	Down someone learn.	1.6	7040000
108	733	4	0.7151571609687389	\N	1.9	6499328
91	1031	10	2.0890966598723373	Such law close.	0.6	6221824
199	732	4	1.7334273140343215	\N	0.7	3529728
47	281	9	0.37919385784415494	\N	0.7	7261184
118	347	7	0.06083590583835798	Between sometimes card general clearly watch.	1.5	4099072
195	765	10	0.9809367955918619	Reach star single finish ask such.	1.6	4410368
65	167	6	0.6515653611331781	\N	0.7	2353152
30	1028	3	1.4903269887185675	Firm people for say want story.	0.7	8190976
171	567	8	0.28203314275715874	\N	1.6	6528000
224	673	8	0.40565453296643317	\N	1.0	3352576
98	63	6	1.092612495935281	\N	0.8	626688
154	165	5	0.4643271762351264	\N	0.8	8207360
192	603	3	0.672315486370354	\N	0.6	5907456
140	446	4	1.1444912093680233	\N	1.0	7933952
77	530	4	0.9828099835004441	\N	1.6	6496256
114	1035	9	1.9424770432796858	Back indeed owner forget.	1.5	5383168
118	324	6	0.8487322565650611	Area generation range explain whom. Team decide once international.	2.0	5992448
160	806	6	1.4294179419980757	\N	1.4	4156416
215	36	5	0.5734527026630609	\N	1.2	6950912
179	992	5	0.023975126222842504	Far may vote practice imagine. Machine allow space machine win even market.	0.7	5211136
20	970	2	0.2753344460517096	\N	0.8	6222848
101	794	2	1.351553087380035	Few special able able degree.	1.4	1158144
151	754	7	2.0994069154866692	Course particularly by Democrat her.	1.4	6675456
245	51	9	0.5224565464266848	\N	1.1	4016128
241	763	8	1.5902941193634679	\N	1.8	427008
30	1044	6	1.6131430916872513	Reach or which mention present writer tonight.	1.6	8089600
212	868	6	1.1471844709014642	Tree ever sometimes family.	0.8	430080
31	286	9	1.3545170974591563	\N	0.9	6714368
243	622	4	1.354128250329574	\N	1.7	1244160
143	666	7	0.9296023791150774	\N	1.0	4014080
5	551	1	1.0199421766375947	Training action life military action soon. Style wall trial the green.	1.3	5350400
52	663	8	0.30080130187838977	\N	0.7	4268032
239	147	2	0.4251166098529833	\N	1.2	236544
170	933	1	0.4919229058686253	\N	0.6	546816
232	197	2	2.368708508450443	\N	1.2	3223552
218	843	10	0.5985337908092444	Mind road appear inside future here audience. Sound year avoid like nature young thousand police.	1.1	5368832
82	479	5	0.00543534044234355	Claim message keep Mr artist.	1.2	4219904
127	938	10	0.7563455588609549	Around seven thing move public wife.	0.8	3703808
237	785	5	1.4701031236367776	\N	1.5	7724032
241	772	1	1.2834502646846653	\N	0.7	3277824
191	709	4	1.3079328074240675	\N	1.1	2276352
57	244	3	0.9067927427154944	Daughter purpose around store method forward about talk.	0.5	3101696
58	736	5	2.5825574367934983	Different local second sense drop deal reach.	1.7	4172800
108	736	5	1.8000450313823413	Us other rule edge. Local democratic upon feeling.	0.5	4173824
174	420	9	1.0235476117409366	\N	0.8	2627584
5	557	8	2.2920638639768427	\N	1.5	6882304
46	682	3	0.057841995337632575	Of arm apply suggest economic that.	0.8	6439936
22	6	1	1.1731386526564986	Technology newspaper body notice participant or beyond.	1.4	3260416
236	899	7	1.145512734327022	Reach thousand under on majority rich join.	1.0	1051648
104	6	7	1.588373334521088	Lay could figure.	2.0	3385344
234	289	8	0.4874686521000427	Student certainly authority trouble player.	1.5	5820416
228	700	9	0.9909516917831914	\N	0.7	6234112
109	580	3	2.138574210136864	Blue music why. Month forget whatever figure understand.	1.3	1306624
167	594	1	0.25604095494786894	\N	1.9	5795840
239	123	1	1.2060071891256787	\N	1.0	7333888
29	984	8	2.3763533010513154	Statement lawyer report student material boy skin.	1.6	3736576
8	88	9	0.8843085245218048	Different write affect structure attention.	1.4	3185664
129	9	9	0.8666905603926325	Scene foreign energy describe lead movie six.	0.7	5065728
213	792	7	1.29570555859513	\N	1.0	1306624
169	10	9	0.713150010703034	Too long later cover.	1.7	927744
75	149	4	1.1111404492871975	Sport better usually.	0.8	5504000
137	633	6	1.1399895827055517	\N	0.7	1343488
15	191	8	0.6021580028664751	\N	1.1	8013824
101	798	10	2.5873725354345543	Design kind know represent and hope industry theory.	1.6	1725440
237	812	5	1.446586490984925	Suffer become price investment rich. Network production already have.	2.0	7224320
50	740	1	0.20639985046667675	\N	1.0	5710848
163	68	9	0.3992083883328013	\N	0.6	825344
98	71	2	0.0900111758650417	Across population understand community fine watch.	1.2	523264
154	153	1	1.689361480823058	\N	1.7	5591040
191	702	3	2.4098529081923905	Move fish nation PM easy stop position. Rest reason health particular case task.	0.5	2469888
26	526	2	1.0546695577030984	Church view that school.	1.6	6988800
73	667	9	0.3855754735073816	Out people hot hit. Why pressure travel environmental.	1.4	4883456
82	466	6	1.0134325972007552	\N	1.4	3428352
152	976	2	1.363353700427295	Happy occur be exist first information.	0.6	1753088
156	14	1	2.178722563613865	End fire go.	1.7	216064
132	133	2	1.0314123736290064	\N	0.9	2220032
56	635	5	0.7025418132638473	\N	1.5	4807680
56	629	1	1.1570816001895414	Leader bag provide film gun. Somebody third purpose parent.	0.6	4726784
224	666	7	0.47657443034929453	\N	0.7	4429824
225	758	6	0.7900356611396598	Reality bring western risk voice author he.	1.0	2332672
141	209	4	0.44573835243866045	\N	1.2	4657152
223	788	10	0.5893000414805359	Rich many teach southern cause ask north thank. Recently role direction close.	1.3	2939904
72	453	7	0.7345823936411399	\N	1.1	3697664
158	690	4	2.621219154827952	Inside yes share admit.	1.2	6640640
177	187	6	0.44223392932294114	\N	1.1	7128064
69	632	7	0.8315975662552185	Unit a group respond assume anyone. Nothing doctor deal imagine represent morning employee painting.	0.6	252928
96	566	4	1.2828130788656524	Local dream around west.	1.5	598016
116	123	8	0.5731077590847492	\N	0.9	1094656
129	23	1	0.32644750453956356	\N	1.5	1848320
127	949	2	0.8264129512073639	\N	1.6	2550784
194	119	10	1.2287506605033707	Building continue I give turn focus. Guess reach local off.	1.3	6784000
206	242	3	1.0365740578186906	\N	1.8	588800
194	134	9	1.6692926162099344	\N	1.2	2264064
77	531	9	0.542639236588003	Certain respond or itself.	1.4	337920
13	104	10	0.46038484716837574	\N	1.3	4507648
237	798	9	0.35921346916777813	Whatever anything everyone part concern. Economic word inside that experience cold right.	0.6	1956864
36	521	7	1.3978964635577915	\N	1.5	7908352
117	845	10	1.075807938616551	Such simply cup forward onto drive cold. International idea house.	0.6	424960
141	201	1	1.189894132642026	Turn teach finally however. Kind information network foot house.	1.9	3277824
52	672	6	0.5736908257038229	\N	0.9	5767168
167	590	10	2.157127779457273	Grow kid present product help my.	0.6	6689792
244	83	4	2.34458591270554	Moment would myself degree city.	0.7	7694336
200	518	8	0.7816947903356446	\N	1.1	5993472
196	679	1	0.892091924804455	\N	1.8	840704
16	577	9	1.0670073924593793	\N	1.7	1491968
219	896	10	0.20124738749663942	\N	0.7	7948288
62	349	10	0.5740124155553615	\N	1.8	314368
156	25	1	0.5961714291743072	State fact away continue eight.	0.6	1572864
97	187	8	0.23670863445496323	\N	1.7	826368
10	853	7	1.2405505116305335	\N	0.9	2131968
69	634	1	0.7094578986843807	Hospital movie side official yeah. Food beautiful rock.	1.4	4244480
121	734	10	0.1378889187486096	\N	1.2	7768064
130	845	8	1.168252157406696	Story rise amount prepare.	0.9	6303744
202	601	10	0.4283388058592774	Democrat development would leader price culture. Interview affect wonder several else your southern thing.	1.3	953344
121	741	6	1.2080112664588167	Environment six affect later.	0.8	701440
165	920	7	1.10499150427915	Culture before structure baby another.	1.2	6096896
215	57	4	0.19810495915931917	\N	0.9	2530304
221	461	1	1.1961053312756167	\N	0.7	1533952
154	170	4	0.14359288414656768	Between want pretty under. Country across good name blood maintain leg always.	2.0	5095424
237	782	9	1.4673859455271578	\N	1.5	6082560
239	148	3	1.9756716167508497	Then chair list about relationship day.	1.7	3112960
2	8	7	0.3995245668199964	\N	1.6	7985152
24	791	1	1.2326128474784959	For light memory husband capital suggest.	1.9	3104768
43	822	10	0.39866881733780335	\N	1.6	3657728
125	865	10	1.1569854026686395	Whom pass within western by change off.	0.9	5292032
177	180	9	0.327221838350088	Year actually senior imagine yes which. As really occur operation claim forward.	0.7	4714496
222	627	4	1.8053243001314347	Also interesting worker experience population process usually. Author cup nature respond soon.	0.5	7265280
63	984	6	0.14955814328447073	Time enter traditional cost trip general spend. Condition next successful around.	1.4	1416192
77	536	4	1.0977503656079823	\N	1.9	3507200
8	108	4	1.4813386050582185	\N	0.8	3351552
139	914	4	0.8964178230181965	Least forget administration believe past.	1.1	5910528
206	237	5	0.9767964907290999	Type evening its.	1.8	4401152
174	418	2	0.5669395581408603	\N	0.9	6090752
83	1011	10	0.1819238530178743	Site we training toward. Their tree line challenge condition series.	0.9	5281792
179	994	5	0.9490589954935371	Tax fine line. Citizen interview factor model area wonder may.	1.3	2996224
162	136	2	0.4403690416506073	\N	1.2	1137664
42	986	9	0.18635574731616306	Walk movement its four figure work cultural.	1.2	3869696
2	18	10	0.008206144585193254	\N	1.5	4350976
48	359	6	0.5024010743721223	\N	1.5	4272128
231	161	6	0.010948546781287804	Last American skin do finish.	1.8	7795712
160	797	4	2.18296950113383	\N	1.3	6052864
120	605	5	0.3745440743860046	As catch call sea meet draw usually.	1.6	5784576
57	243	1	1.1054294885086497	\N	0.5	5394432
9	519	3	0.032548499907977924	\N	1.9	911360
30	1036	7	1.0443411398162694	Effect organization heavy anything military list.	1.4	1738752
205	699	4	0.48521153422183283	Opportunity stand along.	0.7	3099648
98	58	10	0.4085869972659472	Method reduce none head hold along draw structure. Whether degree and toward green find.	1.4	6245376
194	127	4	1.9874133493514816	Big that former build.	1.1	680960
87	1032	5	0.8913502420464461	Hospital detail control.	1.3	6963200
102	497	5	0.6682934846644474	While between with another task significant identify.	1.9	2604032
8	104	1	1.3149175540508424	\N	1.9	4690944
52	668	8	0.27558915519926547	\N	0.8	5648384
237	786	3	1.2085887275160605	Capital protect should ask recently.	1.1	2871296
163	59	6	0.9897677656480323	\N	1.2	4575232
6	594	6	0.7137336177371589	\N	1.6	6340608
211	531	8	0.8301662293127576	\N	1.3	2635776
247	733	8	0.6868194456596386	Us mention front likely happy society. Clear hold admit resource mean marriage help main.	1.5	4000768
69	627	4	0.5725970261912338	\N	2.0	761856
194	121	9	0.596627737771333	Time population during fast today final state with.	1.4	3774464
70	524	2	0.643620894888838	\N	0.9	7507968
41	642	8	1.7791316098271688	Along build everybody contain blue music bag.	1.3	3520512
235	568	3	1.0024843052125818	Understand tax may simple.	1.7	3372032
223	783	7	0.7439464920578639	\N	0.7	6159360
147	157	6	1.975979212566829	Significant you five full school rate.	0.9	2253824
64	568	4	2.4839739130766456	Everyone office right pretty else. Once civil fine month each seat.	1.4	4152320
220	416	3	2.003475810275669	Important toward here.	1.3	587776
23	621	8	2.436194890656737	Painting break evening success relationship well high. Feeling item behind born term interview.	0.7	123904
71	1006	2	2.06930155044501	Purpose stage behind compare.	0.8	534528
99	496	4	1.1111037508687738	Size matter give keep television center believe suffer.	1.3	4226048
100	16	8	0.9851882250524208	\N	1.1	7224320
126	624	3	1.0185364949674183	\N	1.2	4046848
5	550	8	1.1163131343917518	Third expert my consumer break. Opportunity race nation until detail civil.	1.7	7435264
121	739	5	2.1346615620967335	\N	0.8	1319936
91	1035	8	2.722088232176417	\N	1.0	2290688
210	632	9	0.0913287333419063	Common guy reach stuff finally choose.	1.5	7754752
129	3	1	2.3791805723023254	Mind remain reflect beat guy employee.	0.6	566272
132	116	2	1.119988135821814	\N	0.9	2214912
140	457	4	0.4892089197570999	\N	1.8	1719296
231	155	8	0.4319394853000612	\N	1.6	2631680
159	844	8	1.048480264511984	\N	1.9	4846592
43	836	6	1.9577077728842112	Thus evidence source wide these lead likely especially.	1.9	2333696
161	132	5	1.1496358777833366	\N	1.4	7001088
28	708	5	0.12470829943198565	Personal law either low audience owner.	1.2	5571584
23	619	6	1.291886606333298	Wait throughout fast store short medical. Interest west able low.	1.4	5959680
194	138	5	1.3945013009872769	\N	1.9	7667712
162	132	3	0.2799583463713847	Soon specific record detail media.	1.7	2010112
146	648	5	0.9271970458865649	\N	1.9	3654656
8	85	2	0.32018633382579464	Onto answer again fact believe million.	1.4	6069248
163	78	5	0.015185880500355754	Anyone carry issue during about.	0.5	3764224
190	530	8	0.08056212206372038	Public effort social experience.	1.8	4749312
218	849	5	1.9414330603834795	World difficult term.	1.6	7123968
219	894	6	0.8234055156104482	Foot nature force participant build chance condition should. Quality course provide drug.	1.3	5238784
47	270	4	0.5364013383960649	\N	0.6	130048
47	282	8	0.3457339734338582	\N	1.3	6115328
237	810	8	1.0506329150561788	\N	1.2	1496064
242	137	7	1.792431022711163	Church national group kitchen thank.	1.4	6689792
90	244	5	1.0219617248950896	\N	1.6	8004608
209	687	2	0.9254903332691036	Determine director maybe threat while whom.	1.9	6344704
11	676	2	1.9710845722806718	Poor central daughter practice organization enter.	1.3	2707456
243	614	3	2.2993984506602434	Design maybe west.	1.7	2445312
132	136	4	0.06741397832900799	Party away seek become right source receive.	1.2	6137856
108	738	1	0.30610387968970726	Charge thank consumer threat food education. Special executive writer water war.	1.4	421888
5	535	2	0.5933242473902239	\N	1.4	2837504
213	812	10	0.7866523211264248	Half five manage employee mention.	1.7	1427456
203	225	1	0.05285686741413931	\N	1.7	6919168
140	434	9	0.3003910921784295	Together fill however after draw.	1.0	3738624
92	493	8	1.7347277820748945	\N	0.7	2811904
177	181	8	2.3779410248129635	There century when generation.	0.6	3509248
234	264	8	0.7041931485930826	Opportunity food seat compare much treat and.	0.6	7444480
82	469	3	0.17283101082307292	\N	1.5	7890944
82	483	5	0.5057336747143528	\N	0.8	5316608
102	493	8	1.8781284565655778	Total plan in white nor city north. Fill game necessary.	0.8	5922816
206	251	5	1.4859440135371738	Career order bring early south. Three region any doctor land ask hear.	0.6	1457152
82	484	9	2.403029681489114	Catch town product successful arm result.	1.0	3312640
143	675	7	1.1681202669337982	\N	1.5	1801216
155	590	5	0.3734527683183815	Heart technology others him.	0.7	1870848
201	479	2	0.5878325703288775	Goal itself eye source career pay nothing care. Deep same statement water relationship size.	0.7	2294784
192	606	5	0.6523767309466513	\N	1.7	1862656
79	414	3	1.9567539981746565	Hand computer evidence during any the. Still play lead check animal return.	1.3	1585152
179	996	4	0.335828667819663	\N	1.2	151552
59	575	4	0.1639336350680806	Happen themselves realize opportunity win arrive weight.	1.7	3884032
8	91	10	0.07742658224919301	\N	1.6	2607104
116	133	9	0.22416228520348386	More site hit not season us.	1.3	3685376
147	168	1	1.183185259606231	Member particular plan recently power. Race trouble will live.	0.8	689152
203	232	1	0.7094661242240321	Leg marriage business land goal wait.	0.5	2652160
188	710	2	0.9170248361052389	\N	1.9	227328
210	633	8	0.28172839070540967	Subject subject account company.	1.7	5778432
79	424	5	0.6538106916482695	Probably general plan work. Radio feeling nearly building matter and help.	0.7	4346880
94	665	10	1.2964772044101665	Some politics study start energy week clear will.	1.0	6868992
132	120	2	2.015211430789148	\N	1.1	4416512
217	566	1	0.23302813820866286	\N	1.1	518144
209	681	2	1.1319415789561624	Add structure dinner process series western agent. Born site ability environment service he.	1.4	3756032
239	137	1	1.4275731198692378	To foreign amount give create. Number my still Congress quickly crime listen mother.	1.8	7425024
165	922	2	0.07341895195960413	\N	1.3	7263232
80	863	7	2.4448453696057997	\N	1.0	2146304
159	840	4	1.9341313434377492	Into only establish rich.	1.7	6248448
20	971	9	0.009815882244372442	\N	0.7	4920320
1	561	1	0.006712203922638382	\N	1.4	4896768
175	570	3	0.9175905344691664	Behind travel industry understand foreign. Can issue after simply issue arrive teach.	1.7	8286208
190	557	3	1.3281637290608606	\N	0.9	164864
198	248	7	0.6715196480712511	\N	1.8	5921792
58	738	1	0.43277361769855954	\N	1.3	4342784
70	522	1	0.6271172615919055	Collection get between choose eye.	0.7	7078912
28	706	8	1.1042159666112883	\N	1.0	7894016
128	777	6	0.6186545585306175	Impact development staff. Only both both have only upon.	1.9	4654080
83	1017	9	0.814539138192165	\N	0.9	6821888
6	589	2	0.07864491930354184	Thing decade economic identify improve. Check ready certain close least.	1.7	1579008
154	151	1	0.7789067812432243	Sit part song.	0.7	6342656
200	515	6	1.0774209914687232	Blue fly response third name discover bar.	1.8	699392
4	1018	10	0.22011600288345393	\N	1.8	6445056
17	563	7	0.4035758185512157	Ago political rather drive light finally.	1.4	3768320
237	811	4	1.7347226391275252	\N	1.0	5258240
2	20	1	2.0542260813245985	\N	1.5	5300224
140	448	4	1.7796844016660722	Wide central statement action father. Arrive either but.	0.7	7642112
248	501	3	1.4255936072782083	\N	1.1	3379200
83	1018	6	0.5359011505022676	Their fine word such citizen hot.	0.6	4349952
216	707	4	0.9043220596421124	Against care scientist deal thing environment country technology.	0.5	2374656
10	861	1	0.9676018056827937	\N	1.0	6078464
81	444	7	0.07988764708536583	This base every employee throw she.	1.2	3891200
190	533	9	0.3337797587172781	Move difficult make above reason economic someone.	0.9	1772544
57	255	4	0.054381102293721104	Drop left significant including news.	1.5	7937024
242	139	3	0.6275420576862465	Store will customer mean seven.	1.4	5650432
22	15	7	1.629007519770549	\N	1.4	392192
50	741	8	1.1451635227930888	\N	1.3	6727680
146	644	8	0.2681918424807699	\N	1.2	1746944
238	737	4	1.3566799672515217	His wait see theory which color phone buy.	1.7	7554048
156	4	8	0.8477882746358226	Radio person pattern single keep that.	0.6	4595712
232	199	3	0.4257730270590252	\N	1.0	3950592
110	738	4	0.88580832100615	Fight piece pass section news consider indeed.	1.3	6006784
204	1014	4	1.7563337719151215	\N	0.9	271360
248	502	9	1.026023054375316	Fund firm where north. Fire woman save finish full which event.	0.9	8051712
115	773	4	1.5131832269322105	\N	0.7	3271680
230	33	8	0.9126176619884123	\N	0.8	4171776
94	662	1	0.015553767405642715	Bank be cause want south. Say quickly lay value camera firm.	0.8	6107136
5	532	2	1.488808436502598	Field development education ready.	1.9	6623232
8	89	4	1.4407680990792149	Forward team under anything enjoy seek service.	1.8	5394432
180	860	4	1.5465250360016314	Head million want phone writer as out.	1.3	5506048
241	770	7	0.45851407610478523	Model draw case enough company.	1.9	1735680
5	538	4	0.5210129040045104	Number note give maintain raise floor well.	1.0	8206336
122	611	3	1.1953966988736466	\N	1.9	6198272
235	567	10	1.8240756391332122	\N	1.0	901120
232	209	7	0.6012372766040432	\N	1.3	6660096
141	208	3	0.7668058709004197	Ahead bar allow oil. End plant alone feel deep push win.	1.8	1315840
92	498	2	1.252743647972463	\N	1.5	1937408
209	694	3	0.16213492804160748	\N	1.2	4550656
24	786	7	1.217696526405044	Enough seem race series tend even special.	1.2	7151616
233	736	8	1.7386110909065753	Simply music answer.	1.4	7956480
53	591	6	0.12402281618428995	Source coach try eat.	1.1	6164480
13	114	3	0.7416779895145473	\N	1.9	2249728
105	962	1	1.0579112422518204	Kind civil care million physical. Hope attack indicate quite affect speak.	1.6	7781376
161	135	8	1.166777482995806	\N	1.4	1914880
234	268	4	1.9833930524945356	\N	1.3	2539520
16	570	2	0.31114047700240666	Box upon research explain health threat.	0.9	1276928
39	399	4	0.39452681053433963	\N	0.9	5675008
120	596	2	0.8380198683670824	\N	1.5	538624
194	139	8	0.99600971448203	Go police process every part look. Sort probably adult reveal improve project wide.	0.6	1811456
187	315	2	0.16507746107600463	Room look sit education daughter people.	1.1	4523008
247	736	10	0.8778919334713353	\N	1.7	3238912
239	121	7	0.5426117531746509	\N	1.4	1505280
133	20	9	2.3501376938226324	Rate move executive north half employee green than.	1.4	3924992
71	990	4	1.513366556892033	\N	1.1	2812928
182	613	7	1.1509557066306193	\N	1.8	7455744
25	511	8	1.33573895284636	Strong unit network baby type cold. Type know cell.	1.0	675840
8	92	10	1.6071740150560723	\N	1.7	4639744
149	971	6	2.1459014533892793	Reveal painting trouble. View else teach many ready business.	0.6	5415936
57	246	1	1.417968449821212	\N	1.7	4904960
88	200	8	1.0039547359057324	Long continue smile lose here.	0.7	3189760
94	670	10	0.4812031593428094	\N	0.9	4432896
209	693	5	0.14582573937905183	\N	1.9	7385088
238	734	6	1.3454522585946824	\N	1.7	8226816
147	164	2	0.8650429306443899	Once true report region lead.	1.8	1443840
8	93	2	1.3938959951848269	\N	0.5	1059840
117	840	4	1.1479647594837918	Positive case suggest grow without local attorney wait.	0.6	111616
152	982	3	1.978329952601701	Surface order letter occur office home her.	1.7	7320576
31	267	9	0.5488559230197481	Including trial moment chair despite something. Perform fish drive low police source probably.	1.4	4140032
111	804	2	1.3774242658674545	Remain window expect between model choice Republican might.	1.9	4660224
241	766	6	1.378613966373161	\N	2.0	1281024
62	350	4	0.72388085188619	\N	1.1	7503872
246	569	6	0.7928398769202629	Four vote week only be either.	1.9	8047616
157	994	3	0.8018657054676025	\N	0.5	2862080
77	553	2	1.7754267578452692	\N	1.9	6459392
60	498	1	0.5319030712931351	Nothing maybe deal reach.	1.8	2593792
167	593	1	1.4033261045830099	\N	0.8	5775360
126	627	6	0.7005972630405203	\N	0.6	942080
82	490	3	0.9595404099644365	Social despite part door bar view.	1.2	6031360
6	586	7	1.0739321322567512	\N	2.0	5299200
52	670	8	1.1843668971147772	\N	0.9	5988352
64	563	4	0.9356599935986935	\N	1.8	3766272
168	946	7	2.229986384150098	Artist responsibility practice begin.	1.6	7703552
65	169	5	0.45852672455150467	Now among those style ability art.	0.6	5800960
85	354	4	0.5263583036734109	Such less toward guy visit.	1.1	4034560
139	916	1	0.6050514718696067	\N	1.9	727040
168	940	7	0.7091447015578658	Month send guess seem again.	0.8	4449280
93	697	9	1.296844669889406	Fear arm economic Mr benefit whom four.	1.1	6297600
112	197	4	0.7075094902293196	Item face of mention meeting start.	1.1	8176640
42	974	7	1.5107871144230876	Physical number risk network grow scene.	0.7	5654528
160	812	7	0.6867188226079677	Position so animal by hear affect. Investment special list away indeed purpose necessary.	1.0	7867392
22	26	4	1.8647921173561235	\N	1.9	1313792
47	286	7	0.01387329119379258	\N	1.1	3963904
39	384	8	0.8563798774136574	Election address drop kid expert woman.	1.5	6738944
192	597	8	1.4265325168831222	\N	0.9	6461440
65	153	6	1.3504241794371286	\N	1.8	3248128
55	26	2	1.7886239402287323	Also mention nature summer protect value how. Bit help within skill close agency wind information.	1.4	6234112
17	568	6	0.905579410644876	Child every fast question unit.	0.5	2511872
65	164	10	0.01730999767483643	\N	1.9	3940352
223	799	3	1.3766210144337465	\N	1.6	3874816
18	215	7	1.862640660278763	\N	1.8	4672512
143	668	9	0.28643270782119384	\N	1.3	6162432
13	88	10	0.9125083951739911	Go we road sometimes my human.	0.7	746496
139	912	6	0.9364089755886037	\N	2.0	2572288
104	5	6	0.5425999116688245	\N	0.9	2395136
31	263	8	0.5462763906479656	\N	0.8	2631680
120	599	9	1.4392120561761474	\N	0.9	312320
213	800	2	1.5625741638268995	\N	1.4	5172224
179	1004	6	0.22435975590468868	\N	1.6	908288
240	195	1	0.8576457974552163	\N	1.9	2828288
244	84	6	1.9513808558555732	Fly something half worry.	0.6	957440
110	732	3	0.49261936710602106	Significant particularly side so beat less.	1.0	7035904
223	795	9	1.4106605436817512	Skill ask summer foreign. Huge off ahead energy.	1.8	467968
7	835	4	1.0151331866245639	\N	1.4	6350848
8	103	2	0.8930194321375449	Organization leader improve reach assume girl modern. Single customer wear medical base.	1.2	7355392
63	975	7	2.4563718141483784	Suddenly land information wear manage.	1.9	3207168
198	250	5	0.14249610552514952	Per house remember who degree too check.	0.8	5463040
82	459	7	0.2725905440710334	\N	1.3	3041280
163	66	1	0.09268081825421405	\N	1.1	4179968
55	12	1	0.22000597796453095	Politics pick money.	1.6	184320
138	606	8	0.16199055986756739	Among us kind four land. Doctor gun answer prevent prevent.	0.8	342016
114	1034	8	0.3006696265547751	\N	1.6	8177664
75	151	10	0.36461762445755297	Material project test down. Act attack different seat direction.	1.5	2821120
130	848	1	0.78740935820957	Stand base dinner spring long dinner.	1.0	7184384
46	683	4	2.1944904171470463	Beat job through fish. Down car house director a these.	1.5	7890944
217	559	8	1.4115584293447412	Travel city respond moment mouth.	2.0	6641664
21	632	3	0.4551767438419916	\N	1.4	766976
74	190	3	1.0234507804944752	Forward concern front option everybody scene.	1.0	384000
158	687	5	0.6892096297324822	\N	0.8	5936128
242	131	1	1.1211573741777665	Finish seem kind red.	1.0	4791296
119	169	8	0.7218444350866879	Money yourself force across student space result.	0.7	6502400
131	195	8	0.42713971025340547	\N	1.4	3635200
193	191	1	1.4305530124699732	Part capital thought reason.	1.2	216064
97	182	5	1.6076974484522168	Great side investment.	1.7	253952
163	77	4	1.1083900852053181	\N	0.7	588800
189	39	8	0.32782548565137526	\N	2.0	146432
192	609	5	0.7170618803410673	Possible explain personal face top accept security.	1.1	5472256
242	136	5	0.3435434950768707	Past image arrive before daughter employee sometimes.	1.4	4682752
48	356	5	0.01861825415977747	\N	1.5	7183360
75	172	10	1.806229813446877	\N	0.9	2500608
24	799	3	0.7591519464480156	Official story democratic thank project for.	0.6	149504
214	467	3	0.11054890948665849	Stand result fall employee tax across.	0.7	7883776
70	525	2	1.1327490284706383	\N	1.6	985088
88	196	1	0.2487780398709455	Day in she popular song from nature. Onto memory lose network hour break house.	1.8	5107712
65	175	6	1.6769046506585112	Hold with pattern here investment purpose.	0.5	4612096
178	1001	8	1.6239976732352808	\N	0.9	633856
201	478	2	1.575737682359397	\N	0.7	4120576
92	496	10	0.4257077670543955	Catch operation yard hour back.	1.4	5053440
176	582	10	1.6620678383345493	\N	0.6	2802688
235	560	3	0.5454608981485822	Tax particular only single drive require really.	1.7	2989056
6	585	6	0.4550719355914072	Personal for seek list appear allow.	1.5	5276672
243	620	2	0.08804987159218582	\N	1.5	1815552
242	147	1	2.0683217011441	\N	1.8	5936128
95	523	10	0.2353265930829266	\N	0.9	3107840
57	259	7	0.7451348679224202	Might set every whom avoid write see entire.	0.6	1843200
16	575	10	0.4505329653869196	Forward machine door state dark office.	1.4	3876864
39	402	10	0.3036415724800399	\N	0.6	7344128
75	174	7	1.9025721091602026	\N	1.5	3097600
43	818	9	0.7487599243895025	\N	1.2	7545856
65	152	10	0.18248098185150252	Clearly best television present despite.	1.0	1137664
82	488	5	1.3684478650458565	Including may child under our stock industry.	0.6	260096
24	794	7	0.7266544725228271	General teacher book pattern act pull bill. Night dinner site.	0.6	7606272
150	67	1	0.7965157982531889	\N	1.8	5412864
246	566	6	0.3576738952435438	Public discuss water own.	0.5	6678528
166	622	3	0.4238562673658828	\N	1.4	1845248
45	925	8	1.0748651566717795	\N	1.2	8266752
72	446	2	1.1538456271526965	\N	2.0	3850240
94	674	10	0.6690129740420627	\N	1.5	1245184
156	21	3	1.0764478099571209	\N	0.7	4288512
198	259	7	0.4500423832620822	\N	1.5	3007488
234	279	7	1.0074580988378683	New get hand possible month run table.	1.9	4269056
235	558	6	0.6996292774724954	Until item this back.	1.5	1847296
219	903	7	0.4488367440736866	Film view four southern set coach. Industry could evidence.	1.1	7642112
117	848	4	1.547546431860924	\N	1.4	4321280
192	598	8	0.6546177207302439	Board college they weight.	0.7	5835776
244	108	9	0.8456520547753565	Agreement source hand spend information agency dinner create.	1.5	6865920
130	844	3	0.02037026272417657	\N	0.6	7907328
237	809	10	0.08420836421061507	Chair usually boy big.	0.8	7395328
187	311	10	1.7565296479557462	\N	0.6	5665792
71	999	5	1.681795748329108	Cultural west key house wrong. Draw agree modern start enjoy.	0.8	5365760
162	148	1	1.2195570605011843	Writer ground organization week.	1.7	7244800
132	139	8	0.7837861973355149	Discuss dog live enjoy. Right peace may someone medical energy.	1.6	6398976
23	622	3	2.0159191420366698	\N	2.0	6298624
118	345	4	1.0022617162698715	\N	0.8	6605824
187	301	7	1.9812256452528771	Hundred policy station idea thought week.	0.6	1665024
227	212	2	2.360103087176198	On the stuff along resource.	1.7	472064
237	797	7	0.8248818077751533	Various scientist account rest care.	1.6	229376
236	900	6	0.9264743463164797	\N	2.0	6406144
223	789	6	0.37051788743151276	\N	1.4	6771712
239	143	7	0.6458389545761901	\N	1.7	2873344
224	675	7	1.97251462128433	\N	1.3	3057664
111	794	1	0.5713475504743581	Forget side decision rule at general.	1.3	436224
161	117	8	0.6946737202452581	Head specific green color professional attorney. Financial image western.	0.9	2415616
48	352	5	0.9254244987117429	\N	1.6	4330496
97	179	6	0.9814631906852798	Machine build take and article. Night make read usually rest present.	0.6	5231616
161	124	6	0.7162799995872956	\N	0.9	5390336
103	995	9	0.6324364176127574	Pull whom allow effect. Stop upon election collection analysis culture have.	1.9	3280896
231	158	9	0.770909995816766	Reason American far environmental from check attack.	1.6	6007808
147	170	1	0.6658555480911172	\N	1.8	1297408
26	524	8	1.8651334474435832	Push claim step even watch strategy main.	1.4	1826816
148	416	10	0.04947788468789132	\N	0.9	2408448
238	742	9	0.6815736606099516	Act whole test behavior.	1.7	2098176
246	561	7	0.16845957616922227	\N	0.6	2500608
90	252	8	1.8023071156264818	Health wife hope available eye.	0.8	6123520
238	733	2	0.48993528754006954	Response baby performance.	1.0	4236288
106	875	7	0.8259026568838135	\N	0.6	2154496
54	764	4	0.36045626910933276	\N	1.3	3997696
138	602	9	0.6754401192988357	City everybody argue let Republican bill.	0.7	6719488
35	909	5	0.313754869402855	Memory author thus its throughout appear employee.	1.9	1487872
21	630	1	0.7847697962988806	\N	0.8	507904
79	421	10	1.0473946643053145	\N	1.9	6030336
73	674	7	0.8363609422461548	Recognize wear before summer maybe. Quite technology source resource season true.	0.9	7700480
115	772	4	1.8877228287178363	\N	0.8	6112256
223	808	8	0.19222200886610372	\N	1.9	7888896
225	749	1	1.4050072653265864	\N	1.2	5687296
244	105	9	1.069544195766866	\N	0.7	7177216
73	672	5	1.3075239698487142	\N	1.5	7077888
18	213	3	1.0926311050863793	\N	1.8	734208
237	801	2	0.33546945874625944	\N	1.9	3953664
2	32	10	0.23931404656297198	\N	1.0	7194624
196	683	9	1.1686583694278727	\N	0.8	1128448
5	542	7	1.5495274201172315	\N	1.4	6089728
109	592	9	0.9072404052047636	Movement whatever close memory up nor drive.	0.9	4075520
128	770	10	1.8911546211474666	\N	0.8	2129920
214	459	1	0.8920995372810065	Color market get ready four low stock computer.	1.2	3790848
115	762	8	0.9757546705849067	\N	0.9	3138560
159	846	2	2.1540095321830304	\N	1.9	1846272
103	998	3	0.38574532170170867	\N	1.2	2307072
242	117	9	2.372970659026422	Laugh consumer if lawyer.	0.9	7898112
194	123	1	0.7542883885258962	Challenge relationship help attack middle name maybe.	1.6	212992
142	862	1	0.8190077476814616	\N	1.5	777216
122	621	6	0.25791875483527876	\N	1.1	2095104
212	865	10	1.100459647100489	Policy energy listen.	1.1	1082368
61	1009	2	1.6184292781780787	Fund interesting anyone little represent level.	0.6	1078272
67	562	7	2.2820092220951707	\N	1.5	6448128
110	736	10	1.6374632202997963	Give simple doctor law deep director.	1.4	7332864
204	1008	8	1.5210750826867347	Simple manager practice which.	1.1	4518912
181	635	4	0.45007366812235106	\N	1.2	2549760
238	740	2	0.45126246187855573	\N	1.0	1265664
201	480	1	0.6818228226543843	Could contain current peace realize arm network. Opportunity girl rate among water star receive.	1.2	1384448
209	686	4	0.6257030046505687	\N	0.6	8260608
133	30	2	0.44251654806519697	Short walk speech late either south baby.	1.6	6680576
203	212	2	1.7371460302571462	Turn adult phone side view book use.	0.8	4624384
139	909	2	1.3516173135152367	\N	1.6	7451648
234	272	8	2.0284524075217782	Class morning major bring.	1.7	6914048
109	586	9	1.3795156842074623	\N	1.0	5739520
57	257	9	1.1387973991158717	\N	1.9	4974592
178	998	1	0.839137177677606	Behavior simple technology range special meeting us require.	1.3	3409920
224	674	1	1.6766180410864608	Play item determine economic reach during miss north.	0.7	1275904
68	609	3	0.32233504585103073	\N	1.4	669696
93	680	8	1.0454913673944743	\N	0.6	6798336
227	220	3	0.9264596725024833	Without participant series.	0.8	132096
140	454	1	0.8183618499682426	\N	1.8	522240
154	150	8	0.10928649877321658	\N	0.9	933888
241	768	6	1.1796754254769517	\N	1.0	3179520
11	671	4	1.4354883245217411	\N	0.9	217088
67	565	10	0.14563588928811985	\N	1.4	7476224
55	3	5	0.003543423234026344	\N	1.2	4642816
198	247	1	0.1639778479860734	Away area true them.	1.3	2217984
57	237	5	1.4983622478563832	Artist concern then important can scene. Carry his gas start change rest actually.	0.9	5571584
24	808	4	0.2161096881103342	Relationship economic budget power big memory choice bed.	1.6	8209408
248	505	3	0.9202404525945678	Many tough view scene. Where radio try time.	1.7	3960832
21	633	8	2.168030106381456	\N	1.5	4584448
239	138	10	1.1503714740674693	\N	1.1	4580352
133	9	10	0.7411883807223277	\N	1.8	1052672
74	178	5	2.5822544977491972	Provide smile color plant quite job.	0.7	1579008
122	622	9	2.2890595257511457	Write left there college. Guy house statement window.	0.5	130048
61	1019	9	2.6994293598988603	\N	0.8	5497856
162	126	5	0.4065883051184585	\N	0.9	6529024
6	583	5	1.5010860580779193	\N	0.6	1847296
43	833	4	0.09812729702160787	Garden start support policy science.	2.0	3420160
2	12	9	0.76358492219092	Service within small take sometimes.	0.9	5065728
154	159	2	1.8646198530335631	Staff send lose important state. Senior paper or more white.	0.9	6368256
128	759	1	1.5608646758166853	\N	1.8	846848
198	258	7	1.4214464442428243	\N	1.4	6241280
204	1011	9	1.0416874495761237	\N	1.1	1524736
161	115	8	0.15732918899127404	Civil practice society bit thing.	1.3	6649856
5	554	4	1.06060149721363	Half foreign field time state.	1.4	924672
161	140	1	0.9733233969707965	\N	1.5	1629184
244	109	7	0.5511473944028009	Head lead quality economic mention human specific foot.	1.1	4203520
236	901	4	0.3319884702660767	Word test rate their send source prevent. Participant look heavy play own character.	1.3	5486592
244	87	9	1.945329247091038	\N	1.4	937984
144	679	2	0.5743731295598467	Not value teach computer.	1.2	3554304
60	495	8	0.0037688619865653417	Production star between dream woman message over.	1.6	7590912
160	787	4	1.154956802322739	\N	0.5	7162880
145	1034	6	1.35966208086448	\N	1.3	7077888
194	136	2	0.9866572578072306	There under detail gun three.	0.8	5429248
167	585	6	1.5289803958689658	\N	0.7	1285120
2	10	7	1.1049810475190176	\N	0.8	1807360
232	204	10	1.0239988624916645	Enough thus tax watch after able wear. Likely out before western group your foot.	1.4	1264640
222	633	8	1.3895637916921642	\N	1.2	3849216
42	975	8	1.882061001521944	\N	0.6	798720
151	756	1	2.0546545137391816	\N	1.1	8154112
55	27	2	1.1453329470261717	Begin people provide each bar brother.	1.0	5768192
71	989	4	2.071656094367082	Of Mr movie coach poor above spend. Wonder day per indicate.	1.0	6720512
206	249	9	1.3406438979401332	\N	1.2	4241408
81	455	9	1.6566264034672298	Above far type relate.	1.0	1226752
169	8	6	1.588030727708896	\N	0.7	2716672
34	870	10	1.4249321901638652	Tv next hotel institution staff.	0.7	7830528
63	988	8	0.16698782920016464	Leg race despite change light attack.	0.7	5714944
241	780	7	0.5363305073772319	\N	0.7	8076288
195	768	10	1.8955939904618784	Family stuff foot change bank us trial.	0.8	664576
194	115	8	0.6715543185321148	\N	0.8	5314560
140	427	4	0.35571832764580835	\N	0.9	7310336
103	1004	10	0.6328553464509186	\N	1.1	7930880
28	702	10	2.2504107020864685	\N	0.6	5144576
106	873	8	1.8832884867580995	Might could send social mother. Apply history better around.	1.9	6536192
109	578	9	1.0247532264706603	\N	1.9	3997696
16	573	9	1.5392294172354908	Decide seven cultural hard toward save mission.	1.3	1285120
1	562	8	0.27409485435511305	\N	1.2	1504256
231	162	4	0.44839278456882403	\N	1.3	919552
15	192	8	0.7435506555303413	\N	1.2	7771136
160	785	9	0.5000371205133834	Perhaps method treat later. Organization cup cold never population blue onto phone.	0.8	1072128
128	771	9	0.21227169875051227	Ask system team describe growth fly. Alone building act including.	0.7	6165504
230	54	7	0.12949736561407518	Audience including onto information watch. Use contain agree social summer go record.	0.5	6261760
4	1013	8	1.7780193026034252	Situation several real forget who.	1.4	788480
7	821	7	0.8087471498599287	\N	0.9	3467264
103	1003	4	0.38127791693739155	\N	1.5	1445888
14	491	3	0.5712837477247446	Condition deal low food explain continue suggest.	0.7	6065152
162	144	10	0.7656557684978349	\N	1.1	5472256
234	267	6	0.9753890223629013	Language serious no threat anyone buy.	0.8	7347200
169	29	8	2.1569806155522007	\N	1.5	5663744
99	491	4	0.4708778936622805	Very simple herself throw. Increase base white set dinner.	0.9	162816
108	740	3	0.8580749551840372	\N	1.1	733184
161	133	10	0.3669523998501228	\N	1.8	1707008
82	464	7	0.28009880608189514	\N	1.5	4330496
153	514	10	1.2489592524798692	Coach admit home put.	1.0	7215104
194	143	6	1.1671886869913102	To require bar. Out foreign news effect hit admit.	1.9	5787648
99	498	5	0.25651375750212363	Name table evidence production.	1.6	5902336
104	22	5	0.3526597257805094	\N	1.5	3813376
136	969	5	0.441680924450486	Nor stage growth house.	0.6	7063552
239	127	8	0.6738899115936907	Address throughout any crime personal. Nor or possible goal.	0.7	6863872
5	553	8	1.6175227783049997	\N	1.2	3235840
122	610	3	0.05677511840627336	Read despite present.	0.5	6032384
204	1019	7	0.4645205242711504	\N	0.9	760832
162	120	6	0.4978345490162865	Protect teach college every money kid movement.	1.4	6710272
196	694	3	0.13618435418436423	\N	1.8	4198400
238	738	1	0.6833566283609065	Ball specific test about everybody school yard. Care thousand leader herself degree.	0.7	7569408
72	444	10	0.6795817282423	\N	1.3	5387264
75	152	8	0.6982526280670864	Mind old ask piece.	0.8	2922496
150	72	10	0.9258231841541471	\N	1.3	2293760
181	628	1	1.8875757915173488	Nation but song model effort doctor.	1.8	3873792
49	509	10	0.2756222274897537	Party center movie stage can oil standard.	0.8	157696
81	440	5	0.3171663708575055	Main citizen somebody difference. You south avoid yard respond special couple.	1.1	2097152
182	622	6	2.016437041931763	They consider out probably.	1.8	4122624
169	24	6	0.7109961063951131	Ability impact no.	1.1	7661568
31	274	10	0.9680697148919756	Listen step black federal stand mouth fine.	1.3	6351872
10	860	3	0.727049974965768	\N	1.6	3751936
203	214	10	0.5237654919409247	\N	0.5	4915200
234	283	9	1.2105193131597212	Available move street fall forget group without.	0.8	5256192
28	710	5	0.7600310716161823	Different million father scene fast himself. Trouble conference could fine.	2.0	1426432
78	930	3	0.05853096521016409	\N	1.5	5338112
52	676	8	1.5839639466383892	Everybody late west require painting sing authority peace.	1.6	3505152
93	684	1	0.8885679815429358	\N	0.6	4965376
231	169	7	0.6050576983924542	Compare tough clear president. This during study almost off interesting participant somebody.	1.9	2079744
142	857	6	0.7002592115616818	\N	1.4	7176192
144	692	1	0.1736346078979328	Outside day it dream.	1.2	137216
156	8	2	0.2036717540184106	\N	1.4	4705280
119	161	3	2.585803949737116	Size challenge maybe son. Its just ahead list else agent recent store.	1.6	8085504
115	774	2	0.16237817570200333	Turn act take although interest.	1.8	3141632
130	846	1	1.3878274545631022	Treat college yeah store real.	1.7	1497088
248	500	9	1.0328821611160692	Product street fund according.	0.7	5185536
218	845	9	0.39821952902347324	Hope fear risk low try. All there concern within fill memory southern thank.	1.0	4107264
31	292	1	1.5159066495120948	\N	1.4	7409664
55	8	7	2.0721198175339355	Season go already do film similar.	0.6	2934784
167	589	8	0.7634224306437531	Sea create home store attack.	1.9	7689216
6	588	6	0.16651567012573545	Either argue none market.	1.9	403456
146	638	4	2.253259019952485	Again paper man radio through month social eye.	1.1	5842944
8	100	6	1.9660146944768513	\N	1.7	3867648
170	935	9	1.7955051361836534	Hospital development it property.	0.6	3183616
204	1022	8	0.0612505125089662	\N	1.2	3691520
140	452	6	0.5637155807155304	Save control whom range focus act.	0.7	7333888
131	203	9	0.5510958784886726	Financial where lead.	1.2	2819072
72	433	4	1.0933489547389847	\N	1.4	5128192
230	42	1	1.359636709084157	\N	1.1	3162112
234	286	9	0.07404320560839446	\N	1.5	1718272
169	23	3	0.9080256100271886	Attention water audience hand.	0.7	4117504
209	695	7	1.1057618768002904	\N	0.9	3433472
31	283	4	1.7514550526055166	Above player anyone election shoulder property.	0.6	478208
148	422	10	0.5485041537053192	\N	1.3	3603456
100	20	10	1.4601970652262386	\N	1.8	7702528
1	560	3	1.0379261887296778	\N	0.8	3096576
243	613	8	2.165547718373715	Indicate natural top author mind no cost middle.	0.8	6460416
4	1025	10	0.6190782074573955	\N	0.6	2839552
119	168	6	1.245412839288804	\N	1.2	7794688
226	753	1	2.2457172889375	New loss town about today.	1.2	5379072
47	293	3	0.505215423791278	\N	0.5	1918976
19	908	7	0.9839428936629591	\N	0.5	766976
48	355	8	0.41541674056068145	\N	1.4	7370752
93	685	3	1.035301112263936	Difference event man should low member pretty.	1.5	3641344
87	1042	6	0.9872291553266855	\N	1.8	3205120
118	346	10	0.26113831691257844	\N	1.7	5897216
215	33	6	0.7403214345676062	Quite green face hair.	1.0	6459392
11	670	6	1.0660813459111502	Quickly it focus region once themselves.	1.7	4516864
47	273	2	2.4827836050364276	\N	0.8	1152000
6	578	10	0.9947765127444023	\N	1.8	4078592
39	410	3	0.8260304631379021	Program ago old from certain.	0.9	4194304
44	916	5	1.2068048224175647	\N	1.5	4740096
105	951	4	0.5835459639748107	Add pay learn always debate care. Campaign personal require.	0.8	7363584
144	690	8	1.1483414816657465	Phone prevent likely suggest admit.	0.7	6767616
211	555	5	0.9896358301970962	\N	0.8	6749184
227	211	5	0.8390628091450563	Enter tree direction Republican southern.	0.5	4387840
110	739	1	1.140273546712272	Lead prove drive responsibility.	0.9	414720
124	738	4	1.4468459077190918	Ten option lawyer.	1.3	7887872
50	743	2	0.5933934956570479	Detail rule unit give choice across.	1.7	4934656
80	870	3	1.8709138432286347	Detail have stock fish.	0.9	5660672
143	677	3	0.7900502665430721	Hard imagine thank.	1.3	464896
24	783	5	1.1267114289580564	Personal surface size good.	1.5	1623040
74	180	9	0.791563737970402	\N	0.6	605184
56	623	9	0.44601119180015836	\N	1.4	6095872
179	1002	1	1.7755339725883499	Hospital information big expect.	1.9	6904832
73	678	9	0.10950248050451325	\N	1.8	7266304
82	475	9	0.5484266371945411	Artist heavy yard election.	0.7	311296
13	98	3	1.429322056224712	\N	0.7	6177792
15	178	8	0.8314062538567678	Enjoy plan ball prepare.	1.9	700416
78	920	3	0.2606963655337711	\N	1.4	6258688
119	172	5	1.1046790054237179	\N	0.7	3040256
135	496	1	0.5645141592563381	Military some position major believe next past. Top often ok focus hold.	1.3	3229696
68	599	3	1.4323612557642365	Hour explain term month important keep present.	2.0	779264
233	734	7	0.7681609072246574	Now really campaign data perhaps go job.	1.2	646144
129	12	4	1.1031567108161384	\N	1.8	3888128
49	508	9	0.6465260883444544	Defense worker again give author.	1.8	4113408
170	939	7	0.8093610968645126	Point make cause production form able first.	1.5	6817792
198	238	4	0.22955187583221484	Position thousand business music.	0.6	5638144
181	632	5	0.923626301555945	\N	2.0	8086528
126	629	4	1.53055994272594	\N	1.1	5928960
195	763	9	0.9949049752816888	\N	1.0	7644160
156	17	6	0.6427802590205716	\N	1.0	2028544
185	844	1	0.26727343058812775	\N	1.2	6098944
209	690	2	1.483531012851821	Politics national everything law he top group off.	1.5	3284992
237	781	10	0.3805943565805127	Matter onto senior shake real general process.	1.9	1071104
204	1018	9	1.7944202471581794	\N	1.7	2392064
247	731	2	0.2436084026006701	Off huge bill know between bag town. Property art before out somebody.	1.1	6235136
106	887	8	1.9158718717351761	Thought enjoy believe serve give do beat data.	0.6	3957760
242	126	3	1.3396833200253897	Resource carry house back first across start.	1.8	1757184
11	675	7	0.6910291870892529	\N	1.0	2435072
114	1042	2	0.6337862474170974	Performance spring character those. Left society strong away there something agreement hope.	2.0	2305024
160	799	9	0.3426409283041344	\N	1.5	4419584
68	598	2	0.7482117604018108	\N	1.3	5623808
5	543	10	0.29225694101522703	\N	1.2	1019904
82	470	2	0.4064094144213684	Simple behind staff prepare office.	1.7	5475328
143	663	2	2.047269797229173	\N	0.8	7305216
63	980	10	0.40195183219126907	Employee half number discover.	1.0	7406592
114	1031	9	1.229197008358995	Know quite give write.	1.1	4027392
116	129	9	0.327434707141307	Throughout decade environmental.	1.4	7506944
91	1044	8	0.9080335421748865	\N	0.6	6402048
209	689	7	0.4466716960196639	Box policy cost if fire lose.	1.6	2174976
193	177	6	0.03582746014290439	\N	0.8	3431424
190	534	7	1.8472952815587245	\N	1.0	6801408
42	979	5	2.1675443304032416	\N	1.3	5376000
134	583	7	1.5126697105436522	\N	2.0	1589248
223	806	9	0.03308647731454465	Likely over still final.	1.7	5313536
22	1	8	1.224357995474535	Them show politics hot. Edge tax something my.	1.9	5423104
24	795	2	0.009710049839405422	Interesting just expect out goal.	1.3	1144832
109	579	5	1.5620998324252284	\N	0.6	5289984
30	1029	6	1.2655253830342654	Story nothing take available back avoid rate every.	0.9	4150272
146	649	7	2.3751797559227055	Yard show foot civil. Response radio blue generation couple six assume.	1.8	4383744
113	829	6	2.1861185490155073	\N	0.8	6810624
204	1021	6	0.8154362996947655	Check however capital might network lose. Hotel bring themselves point prepare care organization real.	1.6	4331520
41	653	8	0.446062920124013	Whole term number share something sit.	1.6	8039424
169	26	10	0.37704324910630627	\N	1.5	3210240
190	549	3	1.6135462660178879	Like speak turn prove agency issue scene.	0.6	1598464
189	40	6	1.4658019646991156	Section discussion positive ok interesting population onto.	1.8	1290240
54	759	3	1.7389752968636687	Sing radio have discussion national enough animal two. Late state type ago oil instead blue.	1.2	4183040
180	856	6	0.43078893049797523	Cover about second seek.	1.8	6525952
131	197	7	0.550756863795656	Six exactly later this leader. List resource police mind short.	0.9	6546432
35	918	1	0.5352087635256604	\N	1.2	5955584
31	273	2	1.815006708919862	\N	1.1	661504
195	766	4	0.8617214351739905	Mention pay week him daughter.	0.8	1376256
242	134	4	2.415093220931698	Difference news various together.	0.9	2098176
138	600	2	1.488386984662436	\N	1.3	8224768
137	626	5	0.7001675450578005	\N	1.3	6592512
139	913	7	1.4198523952181987	Decade certain according yeah no deep. Space picture reality beautiful ability ever.	1.2	5148672
130	843	4	1.0597203290126118	\N	1.4	1494016
160	805	6	2.37386458044959	\N	0.9	5029888
45	920	7	1.1293314403632984	All include kid federal skill.	1.7	8224768
221	470	5	1.5183612697263063	\N	1.1	4860928
231	156	5	0.791548310838782	Play relationship south political.	1.9	4365312
163	62	7	2.0713788985969543	\N	0.6	2586624
134	594	4	0.8178026076905369	\N	1.1	1674240
196	692	8	1.9178241803626104	\N	1.8	3497984
52	671	3	1.6349620438651755	Stop start whatever cold.	1.9	921600
158	696	7	0.665730952898847	\N	0.8	4707328
244	85	5	0.04756061862244876	Consumer theory word old begin music trip. South yard value.	0.8	2325504
242	115	3	0.960446043237498	\N	1.9	3634176
101	812	8	0.6922313147416628	Full end method.	1.6	868352
75	155	7	1.2880343507022303	\N	0.7	3350528
47	292	2	0.042153726090818244	Agency another up physical research. Any sound economic just couple.	1.8	2238464
123	725	4	2.8049518172193366	Indicate mention hospital more you well help.	1.1	3606528
168	943	10	1.3083781749246586	\N	0.6	2842624
29	985	8	1.8971246040915926	Daughter knowledge source.	1.9	2429952
133	8	5	1.8436798754914372	Book opportunity continue yet fast modern car.	1.3	2332672
226	758	4	0.206054877126015	Available protect site smile person service participant. Themselves save box although respond pattern.	1.6	3927040
123	727	1	2.03862791141203	Quite somebody their build.	1.6	4427776
156	18	4	0.9059418770788787	\N	1.2	3509248
158	695	10	2.394828118933712	Face church here onto many. Spring water perform change me.	0.7	4081664
201	471	8	2.2712097394379556	\N	0.6	7074816
225	754	1	0.3210168809885424	Child major respond service quite.	1.2	6204416
230	57	4	0.30334932972706474	Task add sign.	0.6	3956736
120	601	3	2.0846808657974134	Hospital near medical vote side family really.	0.6	3361792
204	1017	2	0.5262114462493732	\N	1.7	204800
144	686	2	1.0152273108158574	Nice brother system mean citizen.	1.8	7445504
111	812	4	0.47135110723352924	Game pattern while down executive draw right. Hard nor place phone that bed.	0.9	379904
225	756	4	2.115935611680719	Unit late on keep first improve.	1.1	2054144
47	285	5	0.05029161985324287	Third process spring child visit school who.	1.5	681984
82	462	4	1.1949469174705822	\N	1.5	6895616
95	524	9	0.7845056277745857	View indeed argue keep mean light where across.	1.8	2211840
122	612	9	0.10119860797659533	\N	0.9	6986752
158	679	3	0.6961826495275308	\N	1.7	7323648
195	771	5	2.2200167770587274	\N	1.4	3500032
22	24	5	0.4175479379700433	\N	0.5	2897920
150	77	6	0.04575857386780056	Fast including again than main off ever.	1.3	7371776
68	604	7	0.05836334703216499	Budget strong care choose. Together then common local meeting.	0.7	2566144
121	731	2	0.1124291079174512	\N	2.0	5816320
245	47	3	1.7898250912266251	\N	1.7	5657600
111	800	3	0.459373321659764	\N	0.9	1559552
46	688	6	0.7897343654326691	Mention same draw base within shake probably.	0.6	6126592
198	241	3	0.26325181868378505	Television attention military conference available somebody owner thus.	0.8	7613440
215	39	9	1.9291991589835087	Media talk mean admit home deal.	0.8	7121920
231	157	8	0.10555792740933646	\N	0.6	3700736
125	869	1	0.8326186458457155	Movie yeah strategy consumer activity.	0.5	5467136
169	3	7	1.3770255626803403	\N	1.6	5104640
228	698	3	0.49379844529575795	\N	1.0	5061632
90	237	3	0.006323193396349669	\N	1.4	3425280
145	1032	4	0.6053398337034659	\N	2.0	969728
162	133	6	0.973525434992537	\N	0.8	382976
207	494	3	1.239982315063323	\N	1.0	4734976
180	854	7	1.414574427840582	Guy road benefit surface political hit room culture. Explain possible defense politics fact most.	1.3	4114432
199	741	10	1.5672131210278926	\N	1.6	2485248
212	871	3	0.13210842153030428	\N	1.2	1584128
43	819	1	0.02107783183235339	Support just movement never which table.	1.7	881664
97	188	10	1.295654510129526	Mention body produce nice left system she.	1.9	6397952
111	799	4	0.14828091594842366	\N	1.8	1562624
45	923	4	0.947102788912198	With condition hand letter.	1.8	6676480
145	1038	5	1.9139198466465681	\N	1.2	2918400
160	788	4	0.4886215151826013	\N	0.5	435200
7	827	6	1.4512436256821024	\N	0.8	2239488
47	296	3	0.9935533524992437	\N	0.9	4003840
55	30	4	2.1787207358705025	\N	1.3	6591488
193	182	9	0.9104684380413306	Wish meeting create could.	1.0	1585152
137	631	5	1.4049288338332888	\N	1.9	6242304
39	406	4	0.05848766887631092	Think page apply put.	0.7	1979392
112	193	1	0.12194649062141394	Few cultural reveal return bad idea.	1.4	4325376
46	681	7	0.8725758544209882	Read issue kid radio.	1.0	4093952
63	987	7	0.11083121772685957	Data suggest surface young.	1.7	1830912
91	1041	8	1.2136213400140619	Conference subject type poor require left analysis.	1.4	2136064
179	1000	9	1.0914123131706361	Economic start wrong term program mind member. Weight together study section card thank.	0.6	6960128
211	552	2	0.7919987254017612	Rest despite ability ask whole heavy.	1.8	7832576
235	559	3	0.8028581076774888	Animal security quality painting.	1.0	2035712
244	102	7	0.005098923253388676	\N	1.0	4559872
7	813	5	0.18581793947967162	Career side son game laugh though early.	1.2	5678080
239	115	2	0.6947305365032543	Even large wall something.	1.7	1671168
195	773	3	0.2300611073176313	Boy current feel they capital news a.	1.6	997376
213	785	10	0.7941055385144573	Activity step contain choice father accept produce.	0.9	1711104
55	25	1	0.679417604278971	\N	0.9	2352128
239	134	7	1.2941915538189728	Major explain seek him development allow. Chance art team sing face kitchen.	1.3	4925440
132	115	1	1.8185792501780147	Speak interview true able tough teacher.	1.7	5022720
196	680	6	1.951182426836889	Radio sea chance.	2.0	4647936
31	272	2	2.1475276855900534	\N	1.9	2195456
60	493	4	1.0269401527358681	Suggest agreement reduce. Size money politics when indicate.	0.7	6658048
28	715	10	0.3496784484527431	Fall company high decide.	1.1	5572608
58	732	8	1.516110959528643	Shake clearly Mr simply name. Institution design so reason religious continue field.	1.6	5325824
72	452	10	0.025118198667271274	Necessary himself painting exist individual wind training.	0.7	3119104
81	429	9	0.6494651581220636	Son myself these free remain number truth. Point move play last.	1.1	1839104
122	613	5	0.6985250629913382	\N	1.8	571392
153	511	1	0.9125495813892481	\N	0.6	755712
227	224	7	0.09828338313161594	Believe anyone then test law anyone ask. Show truth drive bag memory.	0.9	2022400
247	740	4	0.16527435967925064	\N	1.6	2012160
4	1012	2	0.08362993460887314	\N	1.5	7925760
245	37	3	0.679819653217578	\N	1.1	4342784
42	980	4	0.3027606593054786	\N	0.6	4754432
133	12	3	0.6626294843936738	\N	1.2	3007488
86	627	9	1.8523542099386667	Media avoid these hear possible office. Forward economy feeling usually mission picture know.	1.5	5787648
131	208	2	0.12828696799964742	Range knowledge parent state partner ground view.	0.7	5353472
177	190	3	0.3749328702711382	Service work direction ground eat as fear. Stay wonder hold note side very have.	1.0	4660224
67	559	4	1.443789066264983	\N	1.8	6540288
15	188	5	0.6422304039681251	\N	0.7	2890752
57	251	7	2.49642390954906	\N	1.6	2208768
216	709	5	1.8865146578051264	\N	0.7	3500032
86	623	4	0.5123034204563124	\N	1.8	2904064
23	613	7	1.0475424515416007	Nature bank suddenly indicate increase available heavy such. Relate century evening environment performance environment lose.	1.5	4333568
155	592	7	0.4740895234981679	\N	1.6	1565696
104	8	3	0.29822599502323843	\N	1.1	5121024
77	556	6	1.2314711218860632	Certain especially identify rate.	0.7	3821568
239	116	6	1.2854051531785164	Fall expert reflect another mean him. Message race life must still attack more.	1.5	5785600
127	945	1	0.5553995681180108	\N	1.5	1320960
138	608	5	1.8740490708663289	\N	1.3	6650880
10	857	10	0.025780617110088565	\N	1.8	1271808
48	351	7	1.6524229950472893	Land environment relate southern ok measure seek too.	0.8	6325248
94	664	8	0.5476299721731297	\N	1.8	563200
115	769	5	0.7492077872106679	\N	1.8	4499456
137	627	3	0.22527034641548457	Find bag back everything she determine.	1.2	7266304
145	1041	7	0.5845589720871138	\N	1.4	5954560
42	984	4	1.9958251811685244	\N	0.7	5901312
66	981	8	0.6075073595123781	\N	1.1	2594816
245	35	9	1.1607846504088595	\N	1.5	5817344
101	795	10	1.390710571559172	Our cell fish recent. Sing career water own white.	1.2	505856
152	973	7	2.2531833590785744	\N	1.2	7187456
52	675	2	0.8559671483232831	General oil behavior per. Administration only sell know always exactly.	1.8	424960
55	15	9	0.03506453017033038	Administration wall direction myself available detail house gas.	1.8	2293760
82	471	9	1.6975175901769377	Special type country hospital condition.	0.8	3833856
111	803	2	1.9661077705676808	Argue series remain public.	0.8	4563968
194	122	2	0.7491963989777694	Whether window major lay identify. Sense education by financial throughout Mr PM.	0.6	7049216
49	507	5	0.32362327090091847	Hundred across yeah learn within only now scene. Fund trade throughout response.	1.1	5398528
89	908	9	0.05805108494105466	Treatment with bill rate gas rather pull.	1.2	5466112
35	912	7	0.09579331455714199	\N	1.0	1015808
39	403	9	2.1587779910927285	Five huge industry turn military always seem. How wide money beyond husband.	0.7	6884352
156	5	4	1.00770912475287	\N	1.5	6389760
227	227	5	0.19831664935845725	Nature level oil beyond mind compare own.	1.6	4685824
127	933	7	1.3738614197685117	\N	1.9	6292480
37	700	10	0.34003191125860277	Color deep box part.	1.2	287744
227	233	7	1.248496164185614	Example half name hundred. Live light low than along recognize.	1.6	1175552
239	132	3	0.6825072140053223	Bank establish everyone rise somebody finish.	1.0	2311168
223	805	5	1.091947018761659	Meet scene face deep often soldier writer.	0.7	2147328
40	908	7	0.8748524001175952	Record camera base.	1.2	6628352
119	160	1	1.4790899431190223	\N	1.8	3475456
169	30	10	1.2400822230435053	Partner program over civil image class bad.	1.6	8167424
31	269	3	0.16892706477484387	\N	1.2	1672192
183	522	8	0.9767880136309346	\N	0.7	3195904
214	470	6	0.5253520422775163	\N	1.3	4401152
161	119	4	0.3730896911608482	\N	0.9	6350848
7	817	9	0.2529709485390976	Candidate front condition. Go because modern.	1.2	7536640
191	705	9	0.9161503313316413	\N	1.1	4246528
12	496	7	0.592045547945366	Statement guy bad whose group child soon. Check benefit behind thus this song entire.	1.9	1474560
155	591	1	0.1420691918452197	Section effect play where nor.	1.5	1802240
242	141	1	2.063773051145986	\N	1.8	4500480
7	814	6	0.6121919511109929	\N	0.7	2198528
82	477	3	0.1507017713669813	\N	0.8	2709504
3	494	2	0.8387167317044556	Later bad service miss. Public room build.	1.1	403456
65	171	1	0.9639641800825023	\N	0.9	2357248
150	68	2	0.45353729132454706	\N	1.0	4807680
195	770	3	1.5427777403962721	Investment rule join really pick too ability.	0.6	4476928
178	1003	10	2.214149567308158	Enough attention state month.	1.7	447488
44	913	7	0.46761379672147635	\N	1.8	272384
21	629	4	0.09580362052696004	Main run his argue fish beat Democrat.	1.6	4128768
154	152	2	0.811814781963528	\N	1.8	3256320
216	713	5	0.3433225679763922	\N	1.4	1218560
201	475	8	0.2772814939702584	\N	1.9	3116032
73	665	5	0.8401576502389531	Series what measure yard issue.	1.3	5226496
16	574	6	0.989479283161338	Loss push language.	1.4	2924544
22	30	1	1.5935774868345083	\N	1.8	3659776
47	291	3	0.7728861842312504	Suggest raise however effort free community foreign. Might medical late story lawyer light box.	1.7	4205568
55	11	1	0.9183633415345451	\N	1.1	5981184
90	251	2	2.4212778883698376	Race sound something.	1.6	4024320
5	544	8	0.31397830763429263	\N	1.5	6525952
66	985	1	1.9262147458422392	\N	1.1	4874240
73	677	4	0.44384553761119827	\N	0.9	638976
203	216	3	1.1199574334109808	\N	1.6	5167104
211	532	9	0.24298361614954977	\N	1.4	5487616
169	6	7	0.4426062673152862	Whether before art movement surface wonder.	1.8	1792000
100	2	6	0.3017407927802924	\N	1.7	2679808
234	287	3	0.28685653244223874	\N	1.1	3192832
210	628	9	1.103087566728675	\N	1.1	5371904
128	763	7	2.035608901016738	\N	1.9	361472
156	6	9	0.525354762812926	\N	0.8	546816
189	53	9	0.631963896976235	Economy of case trouble practice parent.	1.8	2102272
77	549	4	1.104861165410544	\N	0.5	3492864
87	1044	3	0.0205492259847631	Sort most enter enough seven unit scene. Seven professor occur rate life daughter radio.	2.0	2268160
102	496	7	0.5700125017950923	\N	1.7	4252672
187	312	2	2.502227991112396	\N	1.6	5948416
127	940	1	0.3457530862385053	\N	0.7	1255424
55	4	3	1.4350976942243199	\N	1.7	1861632
147	156	4	1.4652844855766993	Important rate vote act event.	1.2	228352
33	920	2	1.1266863500053892	\N	1.1	8168448
132	132	7	0.348171584544779	\N	2.0	5638144
18	220	9	2.0402164924207793	Up phone address tend former.	1.5	8220672
213	811	3	0.40213752414395776	Item cell tend kid leader.	0.6	3630080
218	850	4	1.7681754636130658	\N	0.7	6982656
73	666	4	1.1374213507386441	But into TV item.	0.9	7144448
116	118	3	0.45553148439053137	\N	1.0	5662720
147	166	2	0.7618633805429857	Race recent institution series wife scene.	1.5	8001536
75	165	6	0.6545766782422717	Any responsibility interesting recently prove.	1.7	7402496
88	193	2	0.9731298110502276	Service away poor sign cost PM say our. Group baby keep interesting story somebody when.	1.9	5569536
128	761	4	0.9830662462472373	Light science box campaign another man.	0.5	8067072
221	487	7	2.4026949875146646	Apply operation according fly argue near. Team herself evidence level fine.	1.8	4230144
98	66	10	0.0165247990534238	Our third hear information standard should have.	1.9	6939648
83	1010	5	1.2759664611049855	Inside notice man light of.	0.9	2902016
31	270	5	1.8004962670645375	\N	0.7	5987328
68	601	7	0.5238250197516753	Admit economy lawyer exactly animal him yourself. Apply skill watch change.	1.8	6456320
48	354	9	0.7381994427584248	Property seem research budget parent wait.	0.9	5660672
132	123	5	1.400877781764815	\N	0.5	5137408
133	7	3	0.12559901745703742	\N	1.5	3741696
138	597	10	0.7350630590357566	Prepare agree wind choice.	1.8	4066304
166	619	6	1.2377226502686556	\N	0.5	2429952
211	545	9	0.315626705500995	\N	0.9	271360
214	479	1	0.7739174709599165	Large paper color.	1.3	5314560
179	991	4	1.2128655386853775	\N	1.2	1783808
224	665	9	0.08766368672150515	\N	0.7	7043072
191	704	9	1.3852057401010305	\N	0.9	6708224
15	179	5	0.3184003760565797	Who wish alone base.	1.8	2331648
55	31	10	0.5394355452156588	Unit cause should pull responsibility kid something. According condition bank allow meet.	1.0	8194048
107	858	6	2.1936349382535236	\N	1.4	7583744
233	737	9	1.7088551295568928	\N	1.4	142336
145	1044	1	1.243175314583611	Buy pull box. Soldier threat child quite.	1.0	6627328
22	29	8	1.8898130045834087	\N	2.0	3814400
156	3	3	2.415263386957045	\N	1.8	3791872
61	1018	10	0.9009072448946367	\N	1.8	2981888
53	592	5	0.8133652534059802	\N	0.7	7129088
47	271	4	1.74816582977965	\N	1.7	7499776
184	1011	9	1.0279943806170975	Too authority story do drop claim bed.	0.6	7445504
213	799	1	0.3445982660925096	\N	0.5	2118656
67	569	2	0.9063797153789238	Force yard lot author painting.	1.3	977920
161	134	1	0.07716878521722936	Environment on firm concern almost positive standard.	2.0	3943424
30	1039	4	0.1712642176086976	\N	1.3	5494784
187	309	6	0.40976112736942	Onto matter main money ago customer.	0.5	1306624
234	297	1	2.1803984322107888	Discussion later rock man past.	0.9	7699456
108	735	7	0.7452146979210668	\N	0.9	3929088
174	412	9	0.6363518582321548	People career ball theory our production.	1.3	6823936
86	628	6	1.6995236994716811	\N	1.5	2653184
150	78	7	1.8043543407413696	National threat outside citizen entire. Firm act thought voice best card between.	1.6	7667712
87	1038	4	0.17006355200934123	\N	1.9	1708032
27	842	3	0.1824650685043312	Stock fight traditional now hand ball rather.	1.9	5389312
187	299	10	0.8990751642002425	Tree class moment use.	0.8	4601856
245	36	2	0.10242602935542867	\N	0.6	6638592
57	254	9	0.39862567989751163	Include throughout speak fight.	0.6	8216576
77	543	6	0.9433415493561579	Firm appear which.	0.7	850944
83	1014	7	0.5016160236795674	Fill occur either design against.	1.9	2049024
33	926	6	1.790249124468806	Why soon hundred read message stay sit investment. Blood contain space community stock case move better.	0.6	5752832
132	144	5	0.47351087780874296	Respond significant whom write.	0.9	2461696
164	916	6	0.9605812377574758	Might sister wonder not five change.	1.0	8162304
242	142	8	0.6370924973727821	\N	1.1	3055616
129	11	4	1.4813918536244963	\N	1.0	3142656
146	661	10	1.0440992507128555	\N	0.6	7256064
180	859	1	1.5451618357812995	\N	1.9	4830208
13	85	2	0.263392473639874	\N	1.2	878592
44	910	6	0.831538960088166	Dinner fine institution pretty hear beyond visit. True person easy run.	1.0	7709696
215	56	5	0.29096311430145266	\N	1.3	2842624
148	423	9	0.038654256896808376	\N	1.3	7786496
44	909	10	1.18641561030329	\N	1.8	1787904
119	152	6	0.47690659990220285	\N	1.7	5694464
74	189	2	0.47880335309561683	Adult identify truth.	0.8	2486272
97	181	8	2.2245473592963814	Employee performance already short material create agree.	1.3	5860352
144	693	7	1.8707113411716174	Act enter yourself human fine matter must. Character citizen glass in international to less.	1.9	7810048
155	593	1	1.4249881103175666	\N	1.6	5685248
1	564	10	0.9049183407249493	Eat minute air it society good.	1.0	5633024
58	740	5	0.9696948779468095	Probably great class course similar beautiful.	0.8	4198400
187	321	7	0.17777043466764228	\N	1.7	7897088
154	172	7	0.7556205925503201	\N	0.7	2648064
163	80	1	0.7458098021306447	\N	1.5	7159808
132	142	5	1.2099019558196193	\N	1.8	3459072
219	900	7	0.6363197846750192	Participant another crime possible western. Ever because better see.	1.6	2156544
223	791	10	0.9840350486599526	\N	0.7	4432896
234	296	5	1.6627643114954145	Resource number policy store decade.	1.5	5330944
155	595	2	0.8562676229347315	Around region animal choice.	1.0	1707008
47	269	6	2.2990509521099596	\N	1.9	2742272
81	436	4	0.6966931663539063	Stand interest write weight.	1.5	1164288
22	2	2	1.3274698977917245	\N	1.7	4732928
223	785	6	0.8910993071414917	Including owner rate tree by suddenly me.	1.1	6169600
117	849	7	1.8714866330216302	\N	0.6	8062976
101	802	3	0.06961498539108482	Care follow voice that.	0.7	2689024
242	146	10	2.6788982820835425	\N	1.1	1893376
134	582	4	1.4821468059430563	Admit during skin turn.	1.0	5866496
38	663	5	1.7446639484831894	Buy section have sister set. Third result particularly just.	1.6	2187264
65	154	6	2.265832933085535	\N	1.3	3868672
52	662	2	0.7580008156387448	Woman stuff approach evening suddenly cover wear.	0.7	4280320
147	172	8	0.9387331259974391	Husband certain trial culture on blue.	1.8	1524736
238	743	10	0.8995601541992116	Yourself to mention loss total rather. Such young cell into fear feel.	1.4	7921664
168	939	5	1.9578884195624293	Likely outside since.	0.8	8288256
200	512	2	1.9467876865596832	Home down me energy door road.	1.3	3485696
154	157	7	0.528979296869156	Law whole decision.	1.6	6433792
7	825	7	0.9824004983323085	\N	1.4	1922048
177	183	3	0.5603128051912718	Yeah watch million paper truth.	1.0	4755456
147	154	5	1.2591242391238058	\N	0.6	2860032
48	349	6	1.9625153316323256	Doctor she after actually think.	0.9	2241536
58	743	5	0.40831790191652434	\N	0.7	5476352
191	707	4	0.9036579604523891	\N	1.6	1983488
63	985	4	1.3898089913390717	He network when former analysis side benefit none.	0.9	8225792
75	159	4	1.714386169587999	Significant marriage professor take nothing.	0.6	1666048
41	659	6	1.5094224903493663	Address develop page knowledge itself.	0.9	1165312
7	831	7	1.057401012535843	Money field account weight.	1.5	6501376
157	997	10	1.143215951367055	Red event specific environmental black main.	1.1	2610176
235	566	2	0.30996581903474496	\N	1.7	3557376
201	477	4	0.22997025894219947	Station effect really young fund cost.	1.6	6745088
219	893	1	1.138700186302988	\N	0.8	2565120
206	243	7	2.2814261607685395	Wear food letter spring now.	2.0	5049344
133	25	7	0.6186913098274315	\N	1.9	6438912
61	1015	4	0.6476586434582938	\N	0.7	3828736
101	785	1	0.3043254228160954	Both tax until such.	1.5	8182784
13	113	9	0.8181647890643813	Hotel quite indicate factor theory necessary. According activity across get something both.	2.0	6635520
78	919	3	1.0172188823749049	Couple piece phone forward young travel crime.	1.9	4653056
127	943	2	1.1410007878335844	Congress economic PM if season.	0.9	2476032
213	805	1	0.7417967995003681	\N	0.6	3136512
208	611	10	1.5174819235197459	\N	0.7	6364160
11	677	4	1.2100273268162718	\N	1.3	4229120
17	569	7	0.8265890841314701	Stand another reduce conference range car.	1.0	7641088
206	257	6	1.6309271550364581	Surface smile main her no simple ready major.	1.0	1635328
151	750	7	1.6604446827884431	\N	1.9	2186240
93	682	6	1.7569579002400573	Tv past determine fear with strong.	1.2	6846464
82	474	3	1.916650288920989	\N	1.7	6596608
98	74	8	0.11221606593729036	\N	1.3	4724736
1	567	2	1.33799519446916	Weight call today from land by adult.	1.5	1615872
67	563	2	1.0909322512769315	Food management man than.	1.3	2365440
111	793	5	1.5220124105645372	Campaign point worry reduce teacher staff whom center.	1.4	7755776
71	997	9	0.8087030193771447	Girl onto happen activity court fly.	0.7	3466240
100	3	5	1.4738354791035226	Long machine believe standard. Expect south quickly between.	1.2	1375232
65	165	2	0.09171838105465067	\N	1.6	2893824
195	777	10	0.04024437217092595	\N	1.8	4911104
24	789	5	0.20679566593337048	Name result stand heart.	0.6	300032
65	173	3	0.4077993049884306	Thus near debate practice safe.	1.8	6938624
174	425	8	0.34611619516679576	\N	0.8	4777984
153	513	2	2.04384430286124	Medical send option fine billion close finally worry.	1.4	4461568
150	66	6	0.7454479334095784	Nearly color game reduce board like those hear.	1.7	4960256
24	804	3	0.05712147494326496	\N	1.9	1441792
60	497	6	0.997957803822859	\N	1.9	1163264
160	802	5	0.4712817690873778	\N	1.7	6548480
17	561	3	0.6348431285213099	Occur country guy language. Offer suggest together face computer.	0.8	7316480
120	603	4	0.5187599976457361	\N	1.6	3052544
104	21	6	0.6231882570773197	\N	0.7	5486592
236	893	7	2.393943843348599	Audience four glass until cultural. Firm music police edge.	2.0	5365760
77	539	7	0.932077857885349	Current machine follow.	1.9	4107264
3	492	5	1.4327792637703165	\N	1.9	8067072
61	1026	6	1.7069522654968003	Choose trouble group owner yard.	1.2	428032
147	158	10	0.19854807693144394	\N	1.1	2988032
91	1033	9	2.015654585813936	Media million interesting rather above toward.	1.2	2749440
87	1037	9	0.2725564231864633	Above teacher nearly start voice wonder.	1.6	4481024
225	746	9	1.50948954523108	\N	1.5	2717696
201	472	6	0.36639552794279984	Standard be man bar dream art.	0.5	5590016
63	983	7	0.27908322426298826	\N	0.7	3079168
245	57	6	0.4930517225450435	\N	1.3	7055360
67	560	2	0.256430200696193	Last drive same whose spring.	0.9	4612096
1	568	1	0.5641501898351174	\N	1.6	3878912
116	147	4	1.5801279016573198	Old role kitchen write church himself condition.	0.9	111616
13	101	4	1.9787109901257773	\N	1.9	1313792
88	204	5	0.609897644446326	\N	1.9	3887104
222	631	9	0.03624253978015762	Life everyone first wide section.	0.7	396288
118	342	5	0.31961160852458737	Defense long reflect president.	0.6	232448
67	561	7	0.9618277815149641	Through vote for party already senior.	0.9	1739776
39	395	8	0.40167212485924614	Leg also sometimes to for expect able dog.	1.7	4498432
184	1020	5	1.1854320604249935	\N	2.0	7067648
230	49	3	1.2752460028174917	Owner executive best happy follow when.	1.2	4924416
81	439	2	0.7339274084156636	Reach purpose happen actually gun age first.	1.5	4356096
41	644	2	0.9047533184410732	Focus almost explain still manage however position.	1.4	6160384
223	803	5	1.3869700765566544	Behind maybe this always fast meet something. Play white professional sense stage.	0.6	6320128
82	472	7	0.06863664587896671	\N	0.9	4017152
97	177	6	0.6321176122304115	\N	0.6	1477632
230	53	1	0.5889984625660711	\N	0.6	7994368
231	150	8	0.9844592166415418	Father open usually. Where energy feel.	1.8	3664896
134	578	7	0.4514094923146135	\N	0.5	6643712
113	828	4	0.6832147498977333	\N	0.9	5285888
211	554	10	0.16318291029971005	\N	1.3	7306240
154	173	1	0.4919741751330594	Parent loss west alone life region recognize.	2.0	6336512
207	492	9	0.08199132369085145	\N	1.8	450560
133	26	9	1.7687886352332345	\N	1.9	2546688
78	925	2	0.4700837813374526	More concern class any because.	1.4	1655808
4	1023	10	0.7582181094692237	\N	1.6	7450624
21	631	4	0.09346320666585828	\N	1.3	6263808
11	672	2	0.931950176650381	\N	1.3	4886528
68	605	8	0.5788292568615885	Return environment participant require. History former table together marriage mean husband.	0.6	6552576
196	681	1	0.49921630279124696	\N	0.9	4631552
6	582	5	0.3827714832646269	\N	1.5	1368064
158	682	7	0.6471060138994097	\N	1.5	4777984
161	130	8	0.9104800270717541	Though light long.	1.7	4059136
49	504	5	0.9303208242862976	\N	1.4	1452032
41	639	2	0.015708935826808768	\N	0.9	3425280
98	67	5	1.0631868416368104	\N	0.6	3645440
166	613	10	1.4394858001319957	\N	0.7	674816
169	31	3	0.9653579093547446	\N	0.5	620544
41	657	9	1.0348790127123653	\N	1.2	7322624
46	697	5	0.977831926784516	Focus agree money increase.	0.7	2170880
142	852	1	0.9148425129290909	Special international whatever big little foreign.	1.6	7701504
10	852	10	1.1922996938062798	Mission may reflect send form make late. City decision nice sell easy city.	1.1	6448128
23	615	10	1.7706943296970337	General age outside heart. Including more full focus open possible letter.	1.9	4527104
191	712	6	0.6814878665709818	\N	0.5	1638400
159	841	2	0.7332252230312177	\N	1.8	5976064
106	877	2	0.3700015257622873	\N	1.2	1954816
52	664	4	0.5188305935160673	Time hot quality you visit order fast military.	0.8	6176768
71	998	10	0.7462049255117705	Stage move most act soldier move.	1.3	3231744
41	640	6	2.688641567107204	Quality letter more with structure significant degree soldier. Think go some drug me.	0.8	2584576
150	74	9	0.1084424603266065	\N	1.8	4884480
145	1040	5	0.8349210639374852	Per inside dog the send production. Nation suggest traditional race part national.	0.8	1338368
55	16	3	0.45426879204588183	\N	0.8	4356096
117	843	9	0.6801780802662157	Within like apply seem.	1.2	1616896
2	9	4	0.8273891585211676	\N	0.7	6046720
187	303	9	0.1757734196543303	\N	0.8	5822464
230	34	6	1.4577406166011135	\N	1.2	2882560
101	792	8	1.4199604079016521	Pattern value city person voice. Lawyer science eye although state.	1.3	5251072
124	736	10	1.1075316225137148	\N	1.4	456704
144	695	6	0.044397369806064846	Around quality if too surface fall court. Experience development view both.	1.9	4763648
104	11	7	1.3964603121570516	\N	2.0	4142080
115	763	10	0.37315596227317027	Program view society so space behind almost.	1.7	2392064
234	273	3	1.7209878561082894	Two body enter expect eat. Mention more who body.	1.9	5978112
129	21	7	0.6999723851094477	Get key Democrat simple.	0.9	6496256
242	133	8	0.6219274403671963	Begin system boy throw important for minute.	0.6	4861952
111	796	5	0.9343745854952261	\N	1.3	2087936
31	288	3	0.527724089853967	\N	1.3	3702784
95	526	5	0.8063066424589146	\N	1.2	6086656
163	72	1	1.3592201858562216	\N	0.5	5471232
214	461	7	0.6870355289230554	\N	0.9	5424128
41	660	10	0.501808217805487	\N	1.2	5812224
61	1008	6	0.8800104448181877	\N	1.5	7677952
122	620	5	1.3687725817707599	\N	1.9	3828736
244	86	8	1.572387229833493	Scientist describe hundred often body enter true. Night resource east up style development else.	1.4	7695360
43	820	7	0.8362090285808919	\N	0.8	1836032
207	496	4	0.41302975428533045	Sing every style religious.	1.3	5951488
211	530	8	0.13863609471308333	\N	1.1	925696
127	934	10	1.2594354280931972	\N	1.6	5139456
140	438	8	0.43537586009937357	\N	1.0	161792
74	191	10	1.1919523049185565	\N	1.1	6358016
140	439	2	0.3703831278758387	\N	1.9	3195904
209	682	4	0.3538967805266175	\N	0.6	929792
171	562	5	1.3413484035393657	\N	1.2	822272
203	224	1	1.5943061156272815	\N	1.7	7126016
116	145	9	1.4211940077929832	\N	1.0	1282048
189	46	8	0.7852832745962876	\N	2.0	1596416
161	141	3	0.9941988582235082	\N	0.8	3826688
104	26	6	1.5394374494682237	Seven really option security mind little.	1.5	4631552
140	426	9	0.39841874818027173	\N	1.4	3352576
61	1010	10	0.568443841145494	Bar might receive citizen hard.	1.1	2476032
24	781	8	0.23399511413375537	\N	0.6	2081792
81	433	4	0.5675146129334501	\N	1.6	205824
209	680	8	0.8523294955658379	\N	1.9	7269376
53	590	7	1.6852220226352648	Floor pattern consider now.	0.9	4582400
144	696	5	0.004772615886658549	Public behavior without very start.	1.4	1944576
107	854	3	0.3493864298513023	\N	0.9	5303296
119	174	10	1.4621187666887179	Itself wait consumer media month check couple.	0.7	7020544
138	599	6	0.8493887470279224	\N	1.6	1690624
97	192	8	0.8878588172776173	Already book single last. Lose outside wind throughout.	0.6	5413888
193	180	8	1.247809275820551	\N	1.9	3043328
101	788	9	1.362668275522698	\N	1.6	6059008
71	991	10	0.4465928790231594	Same before throw suggest resource process learn magazine.	0.9	5020672
72	451	4	0.5104522968321727	\N	1.5	2182144
152	984	4	1.0103300027089896	\N	1.3	6075392
237	799	7	0.5275033644215741	\N	1.6	6478848
122	618	5	2.058673632468314	\N	0.6	7967744
102	492	8	1.60620336414221	\N	1.9	949248
22	23	10	1.3747981857969673	\N	0.5	3829760
54	765	1	2.0463264952672198	List remember food southern son.	1.4	2788352
47	277	1	2.137089965070552	\N	1.8	7975936
170	941	7	0.23875703844161508	School physical sell within speech age begin.	1.6	5416960
57	242	10	0.8693589246107306	\N	1.9	7894016
21	636	2	0.45011044052211974	I behind election soldier table line.	0.7	1127424
24	796	5	2.198367955202662	Report audience central deal nice live.	1.2	2526208
81	426	3	0.42732403277562087	Quite probably return keep family.	0.6	4310016
140	442	3	0.3647764317098557	Boy camera situation summer ok hotel. Ask student low family our decade those.	1.4	1765376
177	178	2	0.22304609190728927	Allow mean science our store week.	0.6	6700032
36	524	7	1.668166425921184	Follow customer challenge happy serve we professor.	0.6	7531520
90	257	5	1.929927785803096	\N	0.9	2702336
133	14	6	0.5927973853942817	\N	1.7	7491584
160	794	6	1.4078461260616217	\N	1.1	546816
72	456	10	0.9907457820695188	Key itself name. Figure room quickly course.	1.2	3366912
41	638	4	0.4280424912481762	Area crime conference baby officer else.	1.6	3674112
113	813	9	0.5631868210855459	Sea nothing white wife now message support.	0.9	8104960
234	280	1	0.8529189233972387	\N	1.4	1841152
13	107	10	1.2885439702451293	Stage no religious.	0.7	7213056
115	764	7	0.788282330237158	Theory people book support begin.	1.6	571392
239	145	9	1.5531521389593086	Fear travel future official.	1.5	8182784
57	262	2	2.164718859236137	Body partner without above color how.	0.7	4174848
148	420	3	0.1250693933456062	Industry reach these realize family father improve mention. Director describe become cold least media.	0.6	7165952
177	179	3	0.803935951403408	World mention owner establish.	1.7	6875136
57	241	3	0.6297889043342384	\N	0.6	1592320
121	735	8	1.5105132248645423	\N	0.9	3559424
75	162	8	1.0146914272400254	\N	1.2	7639040
169	15	6	0.5216703523332052	Billion TV pattern enjoy hour increase law democratic.	0.8	2325504
214	466	10	0.6878667023883827	Item get out just.	1.3	1258496
101	783	7	0.6744321941916595	Per question offer week.	1.3	2055168
87	1035	3	0.7272449004287337	Analysis wait level traditional strong popular.	1.8	7238656
152	986	4	2.1499989150057965	Edge will center less environmental clearly reality.	0.9	1531904
171	564	6	0.40064448858329327	\N	1.6	615424
220	413	6	2.2092368298786775	Mind draw detail study. Catch a candidate up art past peace.	0.5	2391040
52	667	7	0.24796110676221814	Understand about know coach its capital return to. Investment we million rest wait feeling.	1.1	4122624
165	930	3	1.1614157328322403	Particular performance opportunity full agreement bag word.	1.3	4375552
94	673	8	1.8480507397254768	\N	1.6	1196032
185	846	8	1.3533561966106324	\N	0.6	2860032
43	813	3	1.232469698365404	Attack film level guy. Time certainly audience language above particular.	1.6	3800064
211	546	7	0.02250592660267001	Of mind particular tough take physical course.	1.7	237568
42	983	2	0.38513652365547346	Nature everybody not night increase stuff interest central.	0.6	1301504
128	775	10	0.007620529722953195	\N	1.9	7439360
248	510	2	2.3452418736090137	Kind similar know study begin health I.	0.7	7507968
214	477	9	0.5870595312475545	\N	1.1	7705600
211	539	1	1.0290078582244846	Boy figure again learn partner southern.	0.8	7098368
132	131	3	0.8763187332467829	\N	0.7	4728832
174	419	8	2.2220716098747033	Investment process charge marriage describe.	0.9	3314688
84	492	2	2.1264546885357434	\N	1.9	4943872
199	740	9	0.5393564302202976	Perform campaign choose medical Democrat.	1.8	7344128
135	497	10	0.7103043056371826	\N	1.8	527360
169	11	7	0.17999207056112815	\N	1.1	2777088
4	1009	7	1.8351916170683658	Line ahead east station build small character. College visit personal weight but.	1.9	7055360
104	31	1	0.45857801459104913	\N	0.6	3190784
88	194	9	1.2477804882846681	\N	0.7	3309568
96	562	6	1.6201374661261507	\N	0.8	6906880
107	861	4	0.37168854088684555	Law cover hour around learn lot explain hotel.	0.8	8119296
133	28	7	0.8390214395865773	Church piece size eight summer certainly.	0.8	1363968
214	483	2	1.6395351247366639	Hold home purpose forget common current young.	0.6	7092224
75	163	5	1.360176496296517	\N	0.6	7641088
113	822	10	0.05914864354223748	\N	1.6	2744320
113	836	4	0.10228074694416874	Family through page act current affect matter. Make successful body soon practice rock fill.	0.8	595968
242	116	10	1.5771122881082276	Drug finally picture line watch traditional clearly simply.	0.8	2632704
241	776	5	0.5701002643444266	\N	1.5	7986176
84	498	3	1.3217246040117654	\N	0.9	6652928
90	245	9	0.05660272763254839	\N	1.7	6045696
201	459	6	0.9910442162612709	\N	1.6	2625536
83	1012	1	1.3441636508162849	\N	1.4	4326400
159	848	3	2.4410090205728903	\N	1.9	3677184
189	51	6	0.35023738292372464	Model small source. Born worker all Democrat development.	0.8	2482176
53	589	6	1.4293019107549465	Financial establish explain opportunity try stuff. Surface program stuff action central.	0.9	7921664
47	267	7	0.4175978706649753	Those coach music use security.	1.9	2753536
114	1032	8	0.9008090355444631	\N	2.0	6187008
127	932	5	1.5603566104260906	Sometimes interesting help sound cultural or. Similar after matter garden provide pressure board.	0.6	4513792
155	579	9	1.313388563769781	Newspaper cause sound give serious charge then participant. Pay science newspaper.	1.5	4802560
118	336	9	0.11815512767121163	\N	0.7	4269056
215	52	9	0.10743552275268803	Quickly school there others with ability field.	1.0	6879232
55	19	8	0.2657970172207915	Late parent check field human explain head modern.	2.0	406528
49	510	4	0.35231370870875606	When agency model take message middle politics.	1.8	2387968
72	428	3	1.8455386125748057	Notice north strategy tree not admit because.	1.8	1016832
128	780	7	0.4083585177634529	\N	0.8	5002240
234	284	1	2.3592972963005296	\N	0.6	3596288
156	32	4	0.025717822295696812	Newspaper record two west foot.	1.4	872448
127	937	10	2.108776417505978	\N	1.3	1118208
119	153	1	1.6912274218973673	Scene ready prevent ability economic. Wind science on event question city service collection.	0.7	1030144
107	856	7	0.898095651321558	Forward represent politics yes.	1.2	5091328
176	593	6	2.4032960809134116	\N	1.8	3208192
139	915	1	0.42142908003609636	Democratic memory data miss prevent carry or free. Interview Mrs lead we.	1.9	680960
194	116	1	0.30760457561981097	List various language sure.	0.6	6847488
208	614	9	1.5001133803842275	\N	1.3	1079296
18	211	4	0.09872424524078172	Economic quite major small.	1.9	8223744
143	671	4	0.9161502447984523	Age usually pressure take space recently water.	2.0	6612992
110	741	3	0.38247801718723573	Operation own poor deal. Finish tend traditional create.	0.5	2376704
219	898	6	0.8557507926226074	As bank picture will head to see.	1.4	494592
239	120	4	1.071665547425671	Project it avoid project over.	0.8	8271872
141	204	10	0.8068228764570313	\N	1.9	8054784
147	175	4	1.9456025396979795	Budget use brother worry.	1.5	2965504
57	258	3	0.10430932849279066	Debate move develop along sometimes.	1.3	5566464
232	196	4	0.09165888904960874	Toward safe above similar.	1.0	7763968
190	537	7	0.7355528045227697	\N	1.8	4395008
194	145	7	1.9944778037863395	Page remain while truth hope customer list.	0.8	2055168
108	739	6	2.0519465360677254	Nature I loss perhaps issue.	1.7	6067200
24	807	7	1.0728131640615526	\N	1.4	3259392
55	2	7	1.6827307376181686	West really community skin from ability strategy.	0.9	5642240
152	974	5	1.8341363810400937	Discover area letter letter site per under. Her during according bank lawyer receive home manager.	0.7	3292160
152	975	8	2.3472375984819136	Test region high woman summer kid.	1.7	8268800
156	19	10	0.5851699957567071	Leader military really trouble her wish.	2.0	5642240
24	787	2	2.534646356469466	\N	0.6	1384448
187	322	3	0.15817704846432348	And decide perform tell medical.	1.4	6646784
202	608	1	1.2451234721386788	\N	0.6	6813696
115	760	6	0.4384040083066803	\N	0.7	6993920
201	489	4	0.7822373657034676	\N	1.4	3272704
30	1032	3	0.23148017646459418	\N	1.7	7254016
214	468	8	0.8298714879894531	Old positive manager develop everything go child. Relate almost pull PM inside church degree attack.	0.8	1197056
105	961	4	1.3814864576934867	\N	1.4	6228992
72	442	4	1.7536294824500935	\N	2.0	4655104
91	1030	10	0.17283668064674323	\N	0.8	5456896
46	689	1	0.07886929287431561	\N	1.1	3691520
162	118	8	0.5328961620311438	Difficult whom throw opportunity drop happy.	0.9	3185664
201	466	4	0.9019984982338543	Right sea sell physical.	1.5	205824
170	942	2	0.16416303447322367	\N	0.5	1838080
227	219	3	2.1513413634557548	\N	1.9	7251968
226	745	8	0.375278890980593	\N	1.2	5790720
145	1042	7	0.2699476784421969	Within picture feel bit.	0.6	5467136
86	633	3	1.804737976073823	\N	1.9	8135680
129	25	6	0.46700491234637564	Audience special hair none suffer discuss voice.	1.6	2656256
131	193	9	0.7927148402525257	Break poor strong any serve reality four.	0.7	2251776
201	474	7	1.359285896288698	Security budget store lawyer defense hit.	1.5	7527424
219	902	8	0.41564634094193514	Price movement six determine.	1.9	1114112
223	784	7	0.2875952814777171	Central issue eye hit force.	1.0	1302528
139	917	7	1.3531431728843233	Safe few give.	1.6	7114752
133	6	10	1.3095432520557488	\N	0.8	3185664
3	498	1	1.0837422105229138	Stuff personal go benefit discover. Risk account short.	1.4	4263936
231	159	2	0.49695911516087404	\N	0.6	7847936
23	620	9	1.9890029081641272	\N	1.9	3465216
164	910	9	1.3974645927355624	Full number company sound why top nation manager.	1.4	7012352
77	534	1	0.8102723040638578	\N	0.8	2313216
31	280	3	0.5479435891042579	Nothing mind kind do.	0.5	3366912
154	149	2	0.004012845511172314	Add worker free everybody.	1.0	6019072
185	839	2	1.4843196789018522	\N	1.4	3030016
193	178	5	1.60131900533957	\N	1.3	4646912
43	831	1	0.001793174692512789	Low nor more receive.	1.5	4965376
47	272	5	2.1416778888735917	\N	0.7	6275072
53	580	5	0.6362161579786789	Walk care doctor carry song choose.	1.6	2440192
54	769	8	2.2401044046303396	Real simple skill and white part. Economic sing see.	1.6	488448
210	627	8	0.3483952891739547	Sea production however you.	1.9	344064
124	742	10	0.31441224825494685	\N	1.5	455680
31	277	3	0.3816805738514302	\N	2.0	5108736
211	550	5	0.06468219000445424	Car feeling interest hand.	1.7	6488064
74	187	9	0.7839339314906589	\N	0.6	7234560
209	688	8	0.7584489643729798	Perform her skill whose player.	1.2	4805632
8	94	10	0.06498883450959222	Born seat should enjoy house bill become.	1.0	8193024
53	593	10	1.3377340437691159	\N	1.9	1782784
91	1043	4	2.2532379010002144	Sit science less message. Detail always be listen around practice protect different.	1.3	455680
213	797	9	2.100479517612373	Politics receive what than different those growth.	1.0	107520
2	19	2	1.0422430840806869	\N	1.4	1286144
146	641	2	0.2758804410110923	\N	0.6	3980288
100	24	4	0.9177019691245674	\N	1.6	3362816
5	552	9	0.10848522174258128	Position stop various sit production. Trip citizen growth medical statement baby.	1.9	2279424
101	786	4	1.492518089474375	\N	1.3	5869568
188	702	3	0.40087864806405366	Never oil move wear.	1.5	1880064
194	129	4	1.8138845457459165	\N	1.6	3105792
83	1019	1	0.18408034811633128	\N	0.7	3110912
101	787	10	0.7995505351904857	\N	1.0	3492864
28	709	8	1.917323048125507	\N	0.8	1246208
145	1033	2	2.038809876358134	Management bill push court.	1.9	4183040
221	469	7	0.7053629073840118	\N	1.9	1505280
50	736	9	2.406827612224961	\N	1.3	3775488
2	11	4	1.4249784315547562	\N	1.1	2947072
25	519	8	1.3243666542306765	\N	1.4	2225152
69	626	3	0.6838035875457728	Radio tough should receive some yes.	0.5	1681408
100	32	1	0.47913458864255476	\N	0.6	4520960
113	823	10	0.10393382723714877	Material star political animal hour new.	2.0	7838720
88	201	10	0.38728916964314875	With animal deep you heavy feel fish.	0.9	454656
174	415	2	1.7634582637264384	Strategy measure where ago visit attorney. Save local smile hold season family.	1.1	3753984
98	59	6	0.5580367282318773	Box if east upon various.	2.0	7945216
30	1043	5	1.964070696606207	Both research pay speak war. Leg because better sea.	0.6	6379520
199	731	4	1.9166785092096998	Conference hit service surface. For organization two yourself.	0.6	8220672
114	1028	1	0.9142623482208405	\N	0.6	1712128
55	6	1	0.897200745542215	Space long state success.	1.9	751616
18	218	8	0.2369316988123768	Candidate total support suffer.	1.3	3231744
77	546	2	0.9158166122286455	Knowledge create trouble six. Standard somebody teacher new matter offer rise.	0.9	4369408
100	6	4	1.3984984669320266	Believe right member newspaper. Staff approach Congress moment buy position.	0.8	4022272
183	524	7	1.9839677722426694	\N	1.4	1710080
206	238	2	0.3575434945206782	\N	1.8	3048448
52	669	3	0.4138453996639799	\N	0.5	6823936
109	587	7	1.3261608907157463	\N	1.7	5636096
31	291	3	1.3298511948892606	Together show affect land ok ten. Physical ever civil wait.	1.1	5712896
58	741	9	1.1198936892044842	\N	0.9	7751680
115	765	1	1.5555356401175549	\N	1.4	2640896
171	566	4	0.46533141807952616	Race large report chance part often top trade. Music especially event brother magazine high.	0.7	6918144
156	1	6	0.2701996748049229	Nor mean operation least serve Congress certain whether.	1.2	1901568
74	177	10	0.9091565700258649	Else identify describe final when military dream.	1.3	8017920
129	29	5	1.3001192439971905	Still environment party debate thousand. Act picture me edge exactly difference class.	1.3	4402176
162	147	2	1.9886347368810153	Along office support wind hour avoid individual.	0.8	1555456
209	697	6	0.6024807330591403	\N	1.3	7727104
116	117	3	1.0010954269900652	Whether system wind window PM.	1.1	5924864
91	1040	4	0.8697681051482045	Despite than through today little cause.	1.8	1088512
214	465	8	0.6470807768664313	Wife career pull suffer. Lawyer maybe floor common carry.	0.8	1705984
130	847	5	0.23814010627574186	\N	1.0	7144448
206	254	1	1.4197900702173305	Traditional hot simply have although save.	0.8	3923968
201	481	5	0.41291243617299356	\N	1.0	5876736
123	716	7	2.2390098062981236	\N	1.5	1591296
129	30	2	0.04775732254901261	\N	1.5	2402304
169	18	1	0.11188536702883572	\N	1.0	5250048
58	742	9	1.238364568749465	\N	1.4	1422336
113	826	3	0.3908995274456556	\N	1.3	3995648
42	976	10	0.16031419625546928	\N	1.0	8042496
116	138	8	0.16370518145779767	Sure feeling record first.	1.5	3691520
244	113	2	0.9171253613341446	\N	1.0	4663296
158	689	2	1.1572302144782722	Performance growth then design.	1.7	684032
131	196	9	0.3668861448456552	\N	1.6	2576384
117	844	1	0.7823001065187917	\N	2.0	747520
4	1008	5	1.7413455616554123	\N	1.4	3540992
147	174	3	0.96949034609231	\N	1.2	7676928
18	231	10	1.0501544619291268	Live least herself Congress perform control kind.	1.1	3288064
238	731	5	0.9271325076658661	\N	1.6	920576
26	527	8	0.8232243261674339	\N	1.8	5127168
92	495	3	0.29636404302194264	\N	1.2	7364608
117	847	9	0.8737653267893895	\N	1.8	1675264
29	972	4	0.3798290437900108	Yard this anything first them great.	0.7	2298880
223	807	5	0.7574690322333298	Charge myself business employee. Local some stage approach people suggest.	1.4	4546560
85	357	3	1.2639044790484362	\N	1.3	7308288
91	1029	1	1.1655187116335017	\N	1.7	4453376
185	840	2	0.9358174901099281	Pull we shoulder teach just. Answer view structure ready drug activity see design.	1.5	3482624
140	444	9	1.4297367162240964	Store animal similar college north front similar.	1.6	1179648
142	856	3	2.1443758667720627	Month maybe time letter upon.	1.3	2592768
151	744	1	1.302858058022328	\N	1.9	6528000
154	168	5	0.5895047879420914	Myself including break investment either say song.	1.6	1661952
197	496	6	1.2490099509768808	Gun might team once husband speak.	1.1	506880
215	53	8	0.6103151317870764	Friend network network memory everything. This wear late national.	1.1	6331392
133	2	6	1.199027420645934	Two among entire explain.	1.0	4100096
31	278	9	0.44021209996617583	\N	1.7	6234112
12	493	6	0.03637932315794293	Laugh charge grow.	1.1	179200
182	619	4	2.2577098835109672	\N	1.3	3186688
160	790	1	0.2727536120840813	Suddenly alone culture future I reduce certain.	1.8	1747968
219	905	9	1.316880840182881	\N	1.8	5526528
9	513	3	1.9475352022626955	\N	1.5	3500032
39	389	7	0.9183273684310994	\N	0.9	1157120
75	150	2	0.46662479141384505	\N	1.9	7644160
128	768	3	0.850871765327937	Nature land hundred.	2.0	6289408
140	450	7	1.312733868360423	Window television machine each. Crime not their player several claim too collection.	1.3	1830912
22	17	10	0.4212103316480664	\N	1.9	8230912
39	390	5	1.8832626005688973	High in certainly idea you behind million choose.	1.2	390144
208	616	2	2.528129953492747	\N	0.8	4707328
215	45	9	0.33725040553067753	\N	2.0	4444160
235	564	5	0.7155152172752424	\N	0.9	7643136
53	581	6	0.8169129301391106	\N	1.1	2455552
184	1008	5	1.3588229414757553	\N	1.0	747520
152	987	2	1.592779414088307	National recent stock live.	1.3	2778112
230	52	10	1.479055460769712	\N	0.9	7670784
172	970	8	2.0097403695763774	Sometimes walk that carry author science those.	0.6	1064960
243	611	1	1.5055149715609375	Between us own president treat create of.	1.2	1805312
196	687	5	0.3458638107960032	\N	0.5	4540416
237	789	7	0.2610121135278099	\N	1.8	1653760
88	197	3	1.3155858212190363	\N	2.0	1295360
119	166	7	0.5008279757262819	\N	1.2	6213632
192	601	9	1.1563551437902464	\N	1.3	906240
215	41	7	0.2331265575179587	Spring sound family attorney for require among. Represent former knowledge sometimes southern power keep year.	1.6	647168
193	184	7	0.7413330621727077	\N	1.1	226304
217	562	2	2.0673070300110323	\N	1.8	6651904
101	799	9	0.9410945717746891	\N	0.8	231424
90	253	10	0.013357776427666635	East spring raise democratic.	1.6	6007808
172	971	8	1.9821774027075687	\N	1.5	552960
189	38	2	0.23418598142122748	Deal chair represent write else something.	1.8	4331520
113	824	3	0.9146828529010035	\N	1.5	2243584
243	621	4	2.3500263131530343	Enjoy share force care stand style speak.	1.6	7472128
118	338	6	2.4140718261529783	Practice painting goal lead.	1.8	5534720
31	290	6	0.14245981540932195	\N	1.2	7587840
162	119	9	1.2597536717426123	Record remain however worry sit. Large respond hot.	1.3	3958784
147	159	10	2.1818815294733884	Indicate win enjoy one or.	1.8	1425408
157	991	1	0.2293139502260603	Young civil ability Republican within inside.	0.5	5946368
192	599	7	1.5273873146614472	\N	1.1	7658496
206	245	2	0.018379477314260484	\N	1.3	286720
203	222	9	0.03576301943420152	Bed billion provide arm music.	1.4	1336320
100	31	4	0.9164905747479141	Commercial reality base business source issue dark public.	1.3	3376128
140	456	9	1.4323923645659722	\N	0.5	5897216
35	916	5	0.6235455174401809	\N	0.6	8145920
78	927	3	1.7565867756362263	Miss hotel any anyone thus. Job reveal central significant wear professional.	0.5	3751936
175	571	2	0.6225151054377757	\N	1.9	4638720
213	787	3	0.0037031826256065047	\N	1.4	4532224
2	1	2	1.2609858582902982	\N	1.3	7350272
86	629	3	1.2874698702417446	Interview food law man economy. Rather open performance race daughter direction white.	1.8	6551552
22	27	5	0.2801088092198606	Term first side.	1.0	4374528
97	180	8	1.2594083524448827	Organization series beautiful land tough keep.	0.7	7118848
245	49	4	0.878060720860831	Structure class much young fill. Say close pick film.	1.4	8010752
151	757	9	0.8477042819578	By environment put sport serve.	0.6	5240832
231	154	8	1.662644528784808	Consider prevent explain never.	1.7	1403904
52	665	4	1.463030917689813	\N	1.8	1041408
119	163	4	0.8495499152243436	\N	1.8	5791744
166	614	7	1.4923006464004325	\N	0.6	6630400
81	447	4	1.4965879942238614	\N	1.6	7048192
55	17	5	1.069055648940775	Oil everybody certain tonight day TV begin church. Assume guy there benefit teach Mrs rather.	1.3	5787648
140	437	3	1.6829311313392048	\N	1.6	6018048
237	800	2	1.15542734645519	While trade close development.	1.2	374784
234	292	7	1.8299452214235319	Ground parent remember sign.	0.9	4546560
161	129	6	0.966653360066704	Moment size reflect.	1.3	6070272
13	106	3	0.23826299550147179	Partner great break its.	0.5	8269824
218	846	3	1.177792918073146	\N	2.0	5272576
51	908	1	0.410782500813908	\N	0.6	2119680
6	584	7	1.0242680067030197	Close mission house he start join specific list.	1.8	3196928
69	628	8	0.7559820482550135	\N	1.1	1795072
2	15	6	0.2772903309485332	Them light citizen health hour matter rest.	1.6	5325824
118	327	4	0.8491814526243474	\N	1.4	6503424
190	544	10	0.7030640292460947	Relate knowledge day where good civil thousand.	1.3	1929216
203	234	5	1.06419407707332	\N	1.9	1349632
213	808	5	0.2754193307834534	\N	1.6	2954240
246	564	5	0.7019224378753635	Ten beautiful employee throw sure structure size charge. Leave while different other sound onto last shoulder.	1.7	2821120
107	859	9	0.5858294841464673	\N	1.4	3933184
214	463	7	0.1728741544741268	\N	1.9	3471360
2	13	6	0.7831034559196388	\N	0.7	1643520
150	58	4	0.27766538686499914	Kitchen discuss well look authority church.	1.8	230400
13	83	5	0.8372586786223037	Election pressure leave allow husband agreement. Federal peace new far center at.	1.2	5431296
79	417	6	0.5504949759805299	\N	1.3	4498432
33	924	4	2.4259712938829368	Democratic hard ready fight black learn by. Hospital citizen condition realize marriage.	1.7	3326976
165	925	10	0.15895692769650832	Seek soldier seek need. Create nice street space believe quality hour.	1.9	851968
170	945	2	1.1440018072296838	\N	1.4	5781504
93	691	5	0.035448437194169145	Society again clearly employee.	1.1	863232
22	3	6	2.0756425287011138	Concern make yourself.	1.0	7206912
188	708	1	0.08246878949119152	So easy participant resource analysis manage quickly. Sometimes decade some son take method.	0.8	4702208
57	252	4	0.12083172836504241	Military education add town letter present.	1.2	2969600
134	592	10	0.8424239940952761	\N	0.7	1032192
81	437	7	0.5694621535169911	Song cause center method long way table.	1.1	852992
53	594	1	0.7256848188171198	\N	1.3	2063360
38	678	9	0.6509345726836206	\N	1.9	408576
75	157	3	1.2525082484287335	\N	1.4	7265280
156	20	9	1.941963223025443	\N	1.5	8181760
176	579	4	0.5977800821284471	\N	1.6	2824192
208	617	2	1.4236488487588732	\N	1.6	1536000
71	1001	10	0.003853390008277546	Our answer special responsibility wait else effect. Establish interview add effect skin.	1.8	6801408
93	688	3	0.33213144503284453	\N	1.8	7221248
72	445	5	0.3727753724009868	\N	1.3	2836480
154	163	6	1.0157916384453085	Evening west much left.	1.7	7687168
214	489	3	1.9309213344364102	Many policy our.	0.6	7949312
109	582	6	0.5822368491237987	Bill single community energy.	0.9	3856384
244	94	10	2.6304646960689073	\N	0.7	2402304
223	796	4	1.1247123967790804	Task hot suggest character since certain particular occur.	1.7	5245952
143	673	10	0.11496021310194093	\N	1.4	3964928
160	803	4	1.6868654626268191	\N	1.4	1973248
96	560	2	0.017101896031702413	Dinner technology ability national which plan program.	1.6	4453376
158	691	2	1.193745844897157	Course course head nearly.	1.0	6608896
221	481	5	1.1371206681070105	\N	1.1	6010880
184	1017	7	1.5620654797508744	\N	1.2	8069120
5	539	10	0.4200041514730492	\N	1.7	2383872
66	974	8	1.307847498834943	\N	0.5	3980288
160	809	7	1.4681286117401102	Enter firm while weight option against.	0.8	8216576
8	101	4	0.8152142630690037	Series each staff require exactly. Yes election hand result.	1.7	3178496
55	28	5	0.8547867651683569	Window style almost.	0.6	7843840
217	561	10	0.8517398947957381	\N	0.5	7663616
53	595	5	0.17227292267098096	Speak less lead professor.	0.9	3726336
106	879	5	1.3538807992148596	\N	0.9	2057216
59	570	8	0.8928724409624821	\N	1.7	7664640
239	119	3	1.0434384042528144	Special yet impact baby.	1.4	2134016
201	487	1	2.322811358002289	\N	0.7	604160
214	485	10	0.877817651843503	Relationship such produce necessary before school. Century street her building professor put apply smile.	0.6	5407744
248	499	6	1.675226021231973	\N	0.5	785408
4	1022	6	1.6244148908176392	Their job yard charge responsibility.	1.7	3822592
187	319	6	0.3888480663824949	Push likely likely class soon full trouble.	1.7	4971520
152	977	6	1.2077577630349772	\N	0.9	841728
103	989	1	0.531597015599578	\N	1.2	6754304
123	729	2	0.7597360773819157	Put last best plan sit yes.	1.1	8281088
86	635	6	0.3460799495948319	\N	0.8	360448
82	463	9	1.1454666591043392	\N	0.9	7015424
126	634	9	2.394279848790252	Future arm example cultural maybe. Take region same good.	1.8	3937280
55	9	6	1.145265538811392	\N	1.2	587776
129	32	5	0.745366420444248	Dark walk look ball ready.	0.8	1772544
42	978	1	0.7851693385464495	\N	1.5	6971392
119	173	3	0.6603956087302051	Ahead experience serious family.	1.8	4431872
213	786	9	1.2772022005892372	\N	1.8	4974592
203	213	6	0.15818351259245952	\N	1.6	7178240
133	29	9	1.5509173021876155	\N	1.4	4318208
132	117	10	0.03165813951348939	\N	1.9	5711872
115	775	4	0.385024398488346	\N	1.1	8153088
34	866	6	0.9966733738608253	Media reveal choice add.	1.7	2019328
55	1	10	0.3439473313753623	\N	1.2	206848
5	547	4	1.9568298672630424	Whom require center anyone allow push.	0.6	7669760
184	1018	2	1.2853717006347622	Decide six as down.	1.2	5768192
242	148	1	0.25056930250348014	Fast tax population painting.	0.8	2611200
179	1001	10	1.2956845333746971	\N	0.5	227328
167	584	1	0.6387938226907995	Candidate factor generation down much thus.	1.7	979968
154	160	4	1.2633657706761876	\N	1.0	7815168
230	56	10	1.3873871031248877	\N	0.7	2718720
85	353	8	1.810620095053861	\N	1.0	278528
160	784	3	2.438349016840859	\N	1.9	7959552
206	258	6	1.4188462877389785	\N	2.0	4116480
104	25	8	0.402301253222225	\N	0.8	1541120
233	732	2	1.7256386021662122	Before order organization ten.	1.6	1052672
100	15	2	0.8956374613522183	Likely base peace company. Natural expect center.	0.7	7112704
124	734	7	2.1509176026746326	\N	1.3	6446080
8	106	1	0.9505170207600785	\N	1.6	1216512
244	101	7	1.585206969170493	Product lawyer seem property relationship.	0.7	351232
163	58	9	1.2132581609054296	Exactly prove clearly.	1.6	4270080
173	863	3	0.7260609244016691	Common field parent forget meet simply.	1.2	6310912
167	582	6	1.163171469589233	Include appear gun recent economy everything situation.	1.4	1719296
22	13	2	0.6556169642652906	\N	0.9	5830656
56	628	10	1.7246719883878479	\N	1.7	6339584
116	127	1	0.1978745785212941	Short song force next.	1.5	2594816
239	142	9	1.9706319631864175	Still trouble head.	1.9	6093824
200	513	7	1.1031634405845203	\N	1.0	7080960
195	780	5	0.9808834819046224	Real painting cup face.	1.9	4339712
24	790	2	0.39594205414565314	Conference when ten particular avoid. This professional time region to.	0.7	912384
217	567	9	1.7170935329785644	\N	1.1	2792448
203	211	3	1.5082023121938393	\N	1.4	2140160
18	226	8	0.011027715636159063	Begin between use want continue day.	2.0	8188928
81	446	8	0.8104093896805517	\N	0.7	8172544
176	591	8	0.04828058747338208	\N	0.7	2880512
17	567	8	1.3061611593321787	Name know catch start world green.	1.8	5311488
236	906	4	0.037078464272309236	\N	1.8	7565312
156	16	3	1.662799069979112	Doctor early forward his play until.	1.8	2229248
90	254	8	0.8972181216452809	\N	1.1	648192
57	240	6	0.12118520226145613	Lay hit more my hotel.	1.0	7530496
3	493	8	1.2381254128160566	\N	0.8	6856704
86	634	5	1.0640732992741195	\N	1.1	216064
116	115	6	1.5081921498415982	There natural police mention process analysis strategy.	1.6	7813120
38	676	3	1.511711422063371	\N	1.2	1894400
106	876	6	0.21331544013382678	\N	1.8	6152192
43	821	4	0.6914109621507659	\N	2.0	6315008
140	440	6	1.4770498356136093	\N	1.3	1904640
131	201	3	1.0646885577386564	\N	1.9	3364864
162	139	6	0.15871639331956316	Sense decide cut skill fly. Plan character report deal.	1.1	6104064
225	750	5	2.568626010306799	\N	0.9	404480
240	204	1	0.9230679521435784	Democrat receive also than song realize.	1.3	2050048
188	713	1	0.2590034215713494	\N	0.9	4087808
151	753	9	0.08138995671055271	Positive reflect owner parent we.	0.6	970752
124	741	1	1.2275755332736173	Yes pass budget outside fund phone subject. Month threat these politics personal five.	1.2	4617216
96	561	10	0.934470609635342	\N	1.6	5916672
140	433	8	0.08435550886478009	In present low hair act nothing consider cold. Common drive society.	1.9	6097920
115	771	9	1.2418753621820422	\N	0.7	4469760
183	527	2	0.028972105571671222	Local loss list bed thought write financial. Interview small season thank range expect hand.	0.7	7479296
67	558	10	0.15620777208196204	\N	1.8	1503232
114	1033	1	2.0175851621245573	\N	1.4	3660800
90	243	10	2.2675666144720137	\N	0.5	4553728
214	464	1	0.24167691672026398	\N	1.4	2131968
98	79	8	1.5036488154009093	\N	1.6	162816
214	490	4	1.0835541818418346	\N	1.3	8275968
73	673	3	1.7737400573898592	\N	1.4	2444288
191	706	2	1.7374877160899247	\N	0.8	5282816
124	731	7	2.2124083022762764	\N	0.9	7718912
28	701	3	0.9944644058971425	Color wrong however clear tell writer.	1.5	5406720
53	588	7	0.6107441579079723	Road decide dream service respond.	0.8	376832
201	463	3	0.19306969900676416	\N	0.7	732160
204	1026	2	0.03346645952305679	\N	2.0	2280448
237	804	10	1.6248662411072423	Space the machine have.	2.0	4307968
169	28	1	0.12990695574073446	\N	1.0	6572032
208	610	2	0.2674961302858878	\N	0.8	5693440
139	911	6	0.3560042189598587	\N	1.9	6068224
242	121	7	0.7277870856691041	\N	1.4	1539072
224	676	6	0.25330125186057745	\N	1.4	3543040
62	359	3	0.21968676529927084	\N	1.5	3560448
170	932	8	2.708679332690146	Free claim minute both peace could growth brother.	1.1	624640
222	626	7	0.1430204876953706	\N	0.7	2023424
191	715	3	0.10981124325075142	Anyone wonder me save suddenly.	0.9	630784
182	618	5	1.2164085323058613	\N	1.7	1822720
164	918	4	0.9454825249778092	\N	1.4	6468608
65	149	2	0.5655825545466502	Toward every short mouth.	0.7	638976
162	121	3	2.0165762908741343	Parent success also food system itself.	0.9	6657024
105	968	8	0.08161853939677777	\N	1.8	5141504
203	233	9	0.15402104695179544	Admit interview real bad note lose tax.	1.0	1471488
211	537	9	2.3719512620123298	Political lawyer draw Mrs need different never lay. After into forward wish boy remain.	0.6	2194432
128	779	6	0.37131714822361334	\N	1.5	4646912
100	8	1	0.5589160745061826	Easy stuff expect nor free. Style Mrs organization hold president food total.	1.3	6243328
154	166	8	1.609522289836442	Concern window yet house left upon.	0.9	4342784
143	667	7	0.18095757664123013	Win writer stand cup window.	1.3	4202496
80	867	5	0.15761754356262314	Wind between themselves reason right prevent. Him school every boy sometimes keep figure.	0.6	4056064
138	609	1	1.5136851189920555	\N	1.8	8037376
138	605	2	1.7995758877848007	Somebody wait century despite condition.	1.9	5594112
152	978	5	1.1472398504946377	Movie company capital nice glass reflect.	1.6	2094080
203	220	6	1.373272338528203	Forget class meeting matter produce offer.	0.9	2016256
59	574	6	0.2802651261919155	Rise certainly safe age remain find.	1.9	5389312
227	226	1	1.2551438135256934	Pick computer dark direction year prevent score.	0.6	6827008
246	563	10	0.7389123171853681	Admit later pick rest try.	1.2	8184832
147	173	10	1.3832282634533866	\N	1.2	1492992
37	699	7	0.8511095192712691	\N	1.8	4784128
168	949	3	1.862859767442619	\N	1.1	1531904
180	858	2	1.3243516522441547	\N	0.7	5898240
234	281	10	0.15337694769521967	\N	1.3	1383424
144	682	9	0.9420695411594032	\N	0.9	6076416
12	492	4	1.4491574154311473	\N	0.6	647168
103	990	4	0.631258379212354	\N	0.9	6075392
198	245	6	1.1018894400968293	Page upon off far.	0.9	1668096
234	288	6	0.6863452504199259	\N	0.6	1371136
49	505	5	0.7879723127840823	\N	1.6	5913600
118	348	5	0.20063259611368417	Science various level hard.	1.7	2326528
157	1001	9	0.04431668472790997	Brother idea management again.	1.0	2255872
169	32	10	0.3337365935149089	Produce loss catch ready each.	1.6	6410240
190	529	8	0.7271666453999829	\N	1.0	2551808
244	112	5	0.9159823888568435	\N	1.9	6974464
21	628	4	1.7308771795600875	Improve support alone phone fill though art tough.	0.7	7874560
177	191	2	2.756944497525449	\N	1.0	4397056
46	691	4	0.32383836313417436	Budget though accept.	1.3	7852032
117	839	1	0.3308487751736351	Bill ground down note.	1.7	8052736
153	512	4	1.3204813687335388	Inside later job true.	1.1	1484800
104	30	10	2.764679593969155	\N	1.7	4973568
106	872	7	1.321912854305656	\N	2.0	1443840
13	87	3	1.0473961634879665	\N	1.9	2359296
35	913	2	0.32031520196116575	\N	0.7	3936256
5	534	8	0.9122521604018794	\N	0.8	3944448
109	593	8	2.847368641043098	\N	1.8	4255744
184	1007	10	1.9984183284597126	\N	0.6	6639616
176	594	7	0.4167035774551727	\N	1.6	3494912
230	37	1	1.1979664310026241	\N	1.5	7324672
154	158	2	0.8992043013949692	\N	1.5	124928
216	705	2	0.9358174840819549	\N	1.5	8217600
208	621	2	0.6675815509292155	Trade return future blood already not thousand unit.	0.9	1362944
157	993	4	0.2923717367295726	\N	0.9	2683904
86	636	2	0.13251337013478523	Item total by else. As community among involve.	0.7	380928
238	741	1	1.6667873771690807	\N	1.8	7975936
155	580	4	1.0112842611220343	Explain theory part player writer center everyone country.	1.3	809984
151	746	5	0.3966091302510582	Contain among back government save own.	1.9	3194880
238	736	10	1.6495388794954395	\N	1.4	4976640
101	800	1	1.122375144449575	\N	1.7	3608576
213	809	7	1.5050098327489092	Forget kitchen knowledge either stand site bag city. Present wrong trial factor air bar group.	0.6	6540288
201	465	7	0.8004654054406379	College section leave enter because black.	0.6	1588224
74	186	5	1.612091078554027	Cultural specific use price say lawyer.	1.6	4910080
107	860	6	0.7398075300410627	\N	1.7	6903808
114	1038	2	2.5836235347044254	\N	0.6	3216384
75	167	7	0.6936480401880462	\N	0.6	6011904
175	574	2	0.14112880005662384	\N	1.8	4293632
5	545	4	0.5051932127544444	\N	0.6	2542592
164	914	4	0.5987897027788558	Back style sure itself interesting kitchen tough name. Inside major land article.	0.6	5306368
7	819	6	1.5549576831787328	Piece administration ball than. Poor born guess.	1.1	1411072
64	565	8	1.885022258372495	\N	0.6	7413760
220	414	8	2.6495878721874555	Build hope southern continue.	0.9	4442112
157	996	2	0.34298991081116403	Collection popular push foreign yourself rule serious local.	1.4	1260544
164	913	8	0.7719324066684816	Machine economic follow.	1.6	6782976
191	711	7	0.5836604873859519	Light across store specific.	0.9	1584128
181	625	9	0.602128936824506	\N	1.4	4770816
77	552	8	0.5631463697484724	With indeed upon stand rule chair her.	0.8	6973440
6	592	8	0.2668500275914165	Medical staff future such knowledge.	1.9	7994368
237	787	9	1.3500733628970492	Break tax lot some really. Education learn cost similar probably.	0.6	8208384
161	122	4	0.3406234314381817	Sing country difference huge performance film.	1.4	3232768
235	563	1	1.3567491184418832	Teach but girl.	1.5	6926336
150	75	8	1.4509076497002105	Business care dark politics. Last compare wait financial responsibility add strong.	1.2	4999168
58	737	1	0.5495795732082196	\N	1.0	1857536
52	666	7	0.8690389223199565	Commercial respond black my defense occur.	1.1	2678784
189	48	5	2.4020662554104955	\N	1.4	4115456
237	792	2	1.0256505083680911	Now event admit.	0.5	6545408
173	867	4	0.5583651411135384	Development skin visit.	0.6	1820672
194	117	9	0.5763432217111779	\N	1.3	5652480
104	4	8	1.0416838582743277	\N	1.1	7060480
153	519	7	1.0064879369236055	\N	1.8	2132992
104	17	2	0.24083619053563704	\N	0.8	1515520
163	64	5	0.140186425585455	\N	1.9	5453824
13	89	7	1.413829480547005	\N	1.6	3502080
27	838	3	0.9390789915783292	\N	1.4	1595392
194	133	2	0.2939467931817467	\N	0.7	3348480
231	171	7	0.9081685613777817	Behind hard ever national collection yet great child.	1.5	3149824
33	927	3	0.7193170430657116	\N	0.5	8037376
118	340	2	1.6571884249869664	Until rate defense appear.	1.5	3810304
23	611	2	0.7033298384316089	Expect Republican consumer yet event.	1.9	797696
53	584	2	0.7285544388598856	Fight present over side cut wear.	1.9	5937152
245	42	2	2.4532726673832954	From special others national away.	1.5	6092800
78	926	8	1.8384937247368942	Five debate run.	1.0	7168000
14	498	6	1.651404306432737	\N	0.6	1372160
140	432	9	1.967820429399825	Increase attention well hot parent lawyer media eight.	1.2	2453504
194	118	6	0.5225634819360209	\N	0.8	4780032
221	471	2	1.9785874648339008	\N	1.3	5555200
3	496	1	1.0823509770653952	Card author none between against.	1.7	2714624
104	20	8	1.3929352529832681	\N	1.1	916480
112	205	3	0.624652667151223	Quite on attack.	0.6	5227520
147	151	6	1.5995546810865833	Pick live set who design describe turn.	0.6	3783680
88	198	5	0.20248982300835042	\N	0.7	4952064
80	866	4	0.47780170195309163	\N	1.5	2774016
178	1006	1	1.4445102961000724	Successful leader above mention next draw.	1.6	7769088
157	990	7	0.2863883662627894	Middle president same and maybe. Yes cell store usually marriage type.	1.1	8252416
31	282	9	0.3986538183831426	\N	0.7	6018048
144	688	7	0.2807162034677686	\N	1.3	3448832
38	672	6	0.2921459418631987	Much address somebody management similar wife street parent.	1.3	7502848
111	802	8	1.7642200094455078	All challenge maintain claim pass allow.	1.2	5626880
178	994	10	0.8406603763837812	Believe charge wind discover room. Purpose stuff song up bar.	0.7	3280896
13	103	5	0.37008561699092357	\N	1.2	5212160
188	704	8	0.6287882325722456	Human theory thank fact manager score box.	1.0	3149824
120	607	6	1.4643628624883565	President he certainly husband employee.	1.0	6038528
130	842	3	0.31461783231805607	Step PM shake simple. Sister current institution main right.	0.7	3675136
198	261	1	0.29701729776130653	\N	1.7	5148672
76	970	2	1.443864839055899	Open sense discover large crime.	0.8	1029120
105	967	7	0.2796532988048947	\N	1.5	2050048
47	280	7	1.7188805532133729	\N	1.4	7074816
161	145	2	0.37498598634315883	\N	0.9	6419456
201	484	10	2.493976253294769	Since wait professor assume single list.	0.6	1347584
22	10	2	0.8588931332593233	Car set wonder tax prove huge sing.	1.3	3849216
118	344	9	0.4758561191663741	Across moment grow house need guy. Field yet whole girl letter.	1.1	7247872
247	734	6	0.8019653392275374	Seek writer operation know. Reduce physical movement me away dog lawyer.	1.2	4032512
113	834	4	0.7092192560516694	Senior moment minute truth.	1.1	1265664
7	816	10	2.7721423384239317	Eat somebody other international. Throw bar process most people step movie.	0.5	3776512
169	14	3	2.5090950257683264	\N	1.4	7115776
201	469	3	0.9768291400159276	\N	1.4	1506304
30	1035	7	0.2951298723841062	\N	1.2	5600256
5	548	7	0.60739440300541	\N	1.3	6306816
216	704	3	1.5457748552902077	Matter world cost issue my.	1.4	5766144
162	124	1	1.5748637967391534	\N	1.5	6463488
230	50	9	1.561551466775333	\N	1.0	2676736
103	993	4	0.18412856734342428	\N	1.7	7276544
9	514	1	0.2874516232919092	\N	1.5	3837952
224	663	6	0.03527689043347984	\N	0.7	4811776
63	973	8	1.9203388247281543	Room foot source yard financial until run no.	1.1	1739776
196	685	10	0.6487154692702027	\N	1.1	4496384
204	1007	2	1.1927272596916918	\N	0.6	2654208
115	770	6	0.9146318776066317	Decide physical trial church administration real able.	0.8	7680000
160	808	1	1.240473420980375	Somebody blue cultural night specific.	0.9	7413760
237	803	1	0.2965706548137536	House rest major among join oil pay big.	1.2	7994368
91	1027	4	0.15871286829913495	\N	1.8	4492288
194	142	7	0.836568483262965	\N	1.3	3622912
44	914	5	0.5273563687743879	\N	1.5	7031808
122	619	5	0.11390022915523547	Pm product three affect I once. Finish friend not let positive its stuff design.	0.9	2886656
126	630	1	0.5650699437421292	\N	0.8	855040
115	776	4	1.5758434413868116	\N	1.2	5793792
176	584	9	1.384440474605085	\N	2.0	2922496
214	480	3	0.5253423585836419	Thank military provide time discover woman commercial. Threat consider life turn record do feel indeed.	1.5	6768640
109	581	5	0.3232172498815986	Special statement modern become month.	1.8	3339264
234	276	3	1.1581304193867679	While say at one think serve.	1.2	4590592
126	625	7	0.3254753458674815	Capital attorney book section individual. Produce budget ready up bed standard three prove.	1.3	8205312
163	63	3	0.4768431096704513	Real us education recent audience record character. View laugh knowledge end huge long your.	0.9	2681856
165	924	8	2.7313811257757217	High contain with prepare subject movement member agree.	0.9	4383744
236	895	5	0.5441040770235421	Amount herself peace wrong book. Listen thought might perform information apply.	1.3	5011456
232	194	10	1.2524385550674717	Take most position science consumer.	1.4	2718720
222	624	2	2.2676957301919223	\N	1.0	1707008
162	125	4	0.8574351855658358	\N	1.4	2604032
146	637	10	1.2955157678186606	\N	1.0	6896640
4	1016	10	1.0588723580979558	Little behind keep performance clear smile including prove.	1.8	7490560
105	963	6	0.5155909767450011	\N	1.7	4471808
110	735	6	1.1381416570853755	Likely camera behind science prove between week. Fill room pass everyone authority important work.	1.4	7719936
95	527	9	0.22395893075563106	\N	0.5	1922048
141	205	2	0.22909076485450117	Offer officer continue heart drive.	1.4	3227648
39	386	4	1.9389996891021657	\N	0.9	1760256
248	504	2	0.11039898492443202	\N	0.8	1527808
239	144	9	0.07044674735632704	\N	1.6	2962432
190	542	4	0.8410362479942	\N	1.2	671744
38	669	2	1.7469872482717512	\N	1.0	217088
194	120	1	2.5049663477321245	Product success have.	1.6	4824064
58	733	7	0.28091116569295116	News record somebody over reflect ready the central.	0.9	3084288
206	236	10	1.2397626923912988	Conference black gun concern opportunity assume.	1.6	7638016
161	126	10	2.1735806074334407	Nice natural explain purpose method special discuss.	1.3	4501504
149	969	9	0.30690925470666897	\N	0.8	1652736
25	517	10	0.5557811692468335	\N	1.9	3848192
1	569	4	0.5085141335564456	Think might adult notice political way newspaper.	1.8	717824
7	832	2	1.3474521391408587	\N	1.5	7480320
38	665	8	0.38382422877501615	School forget put military many certain.	1.3	4481024
63	986	7	2.7357053209885573	Structure human rise summer color produce certain.	1.5	5537792
206	246	9	0.39899486403803014	\N	1.6	5556224
206	261	2	0.7175657776890747	\N	1.7	7887872
160	796	2	1.1818727041117765	Debate direction time success seat value.	1.2	6730752
168	936	1	0.5242694147681571	Account attention care defense green choose care western.	1.6	7635968
35	910	4	1.4469854405998617	Population cover live believe alone.	2.0	1448960
174	416	6	1.1356358657861996	Feel society light.	1.1	6396928
13	109	7	0.06077568800776136	Time indeed find control common whatever staff.	0.9	6676480
132	140	4	1.9983652858097292	\N	0.9	6098944
116	121	5	1.9019680754558326	\N	0.8	5867520
233	735	4	1.132982061479176	Family care be some production station.	0.8	5025792
182	612	9	1.2996958761027961	\N	1.1	2357248
177	177	4	0.9711275435610611	\N	1.9	3429376
63	981	2	0.4492940214858877	\N	1.5	7310336
109	589	7	0.02927965097796109	Or model before rather fish support.	0.7	4227072
118	343	5	1.4723870839170243	\N	1.0	6358016
246	565	4	0.255826848839401	\N	1.3	1561600
116	139	8	0.2160843132577575	Drug important course table.	1.4	4911104
198	256	4	2.0999716286853327	\N	1.8	5857280
31	279	8	0.8065362404456917	Assume up back land brother reflect.	0.8	628736
114	1041	10	0.890558230617558	None tell west provide seek worker space.	1.5	1274880
28	703	9	0.6921845405405362	Could responsibility either fill when how.	1.1	6992896
41	661	3	2.7388118343072385	\N	0.5	4013056
78	923	9	0.22078877592665572	With federal effect.	0.5	1231872
90	236	9	0.19041954270880712	\N	0.8	6437888
171	559	5	0.26052464989409435	\N	0.5	1878016
202	597	8	1.5347703933157757	\N	1.2	1645568
133	24	5	0.9015975499028307	\N	0.7	2494464
218	839	10	1.1754081931326812	Energy night turn partner wall activity.	1.1	6634496
90	256	2	1.0241547555797421	Realize yourself data sign nation cup report.	0.5	4313088
242	140	7	2.0849909543953613	\N	0.5	1251328
171	568	7	1.171468151232837	\N	1.6	1938432
241	773	5	1.3919538294979699	\N	1.4	5410816
128	773	5	1.418374214277704	\N	0.8	2817024
13	108	8	0.24874641796577665	High foot great fight.	1.6	7395328
77	554	8	0.20294055892087715	Impact today watch school federal threat thought.	0.6	6504448
77	544	6	1.5796395247630233	\N	1.6	1889280
81	456	1	0.21811066743212165	Attack trip beat budget finally.	1.4	5652480
93	690	6	0.2642969108284426	Film list find rule staff better. Around prepare get late fill buy represent.	0.7	8052736
198	257	4	0.21778175898515298	Simply case ground whether image tell. Live same example.	1.0	1575936
176	595	8	1.5349761624466962	Successful natural against better program benefit.	0.8	2669568
224	678	10	0.783124867732362	By series her wear be effect agency.	1.7	4370432
77	540	4	0.44957376781582936	\N	1.0	4004864
68	603	1	1.6979754710526183	\N	1.3	2311168
207	493	6	0.43593384537640933	Never inside pattern tree light whatever design.	0.6	1412096
83	1020	5	2.4969218064961822	Each item with control serve.	1.0	6751232
133	22	2	1.3483406825635709	\N	0.9	5153792
65	158	3	0.5177080254518873	Per story mission skin several interest they.	1.2	4899840
147	169	5	0.41865311454620524	Attorney term medical prove food say media.	0.9	3763200
211	556	3	2.055691687341858	Story simply respond artist around market quite.	2.0	1519616
81	432	7	0.8901259970396199	\N	0.8	4890624
147	155	7	1.6273173160455154	\N	0.6	5200896
94	667	8	0.5795456234061037	\N	0.8	7890944
185	850	2	0.4253368576367114	\N	0.8	413696
45	927	10	1.8955507282293067	\N	1.1	4644864
138	604	7	0.9158527333883985	\N	1.3	2019328
105	953	6	2.021047658516325	Really friend again.	1.8	4785152
182	614	1	2.1368138917002515	\N	1.9	5161984
193	176	5	0.4204740590161015	Rich low manage writer. Central color move happen.	1.2	3128320
237	805	2	1.10793596080271	Leg here cold vote.	1.1	6187008
189	43	8	2.150363112929755	Tree her song.	1.8	6190080
74	185	1	0.8176613672763221	Walk stuff religious.	1.8	5148672
152	988	8	0.3116493592955202	Thank concern yes book remain station challenge.	1.5	8026112
223	809	2	2.4606402562548424	\N	1.2	6024192
76	971	10	1.5009184755400284	\N	1.3	6066176
140	451	7	0.021322830191390585	Indicate technology major.	2.0	4096000
140	455	6	0.0055922323804707295	\N	1.5	8118272
101	790	9	0.6420841876914408	Contain arrive within be we a learn.	1.5	8190976
111	789	8	1.739018339650722	Democrat both smile catch left.	0.7	5676032
209	679	2	0.42914143178669883	\N	0.5	3442688
151	755	10	1.6735662265665188	Certain easy during happy head laugh.	0.8	3366912
109	585	1	0.5548301460060318	\N	1.8	275456
131	194	7	1.763364699644904	Social perform store reduce. Between article travel.	1.2	3654656
4	1021	3	0.683755103939843	\N	0.5	2926592
34	863	9	1.426810318743676	Though weight listen prepare.	1.2	1241088
113	816	1	2.724846295047881	\N	0.7	4612096
154	154	10	2.879288772062624	\N	1.3	8262656
11	678	4	0.9411842426002239	The western value administration water great. Score evening choice wonder room.	0.8	6830080
134	587	3	1.8972117098038315	\N	1.3	2114560
70	527	4	1.5424016874200701	\N	1.2	366592
150	69	1	0.22870879213287182	\N	1.4	2454528
112	194	7	1.4463880106675375	\N	0.8	4321280
151	745	6	0.7306380484496967	\N	0.9	4550656
204	1012	3	0.270911177988197	Home answer describe reality.	1.6	3916800
25	512	4	0.9730754855998464	\N	1.9	3066880
142	854	2	0.2336214380377042	\N	1.1	6281216
18	228	1	1.0369550855409975	Sometimes figure pressure.	0.7	4691968
72	432	3	0.8443724753043462	\N	1.8	2484224
230	41	10	1.714754622560357	\N	1.5	1683456
85	359	4	0.04473259554458131	At knowledge show model. Future should see itself partner leader soldier career.	1.9	8245248
198	246	3	1.4367692457945305	\N	1.0	3771392
72	455	9	0.851158721279469	Stage hope from coach recognize forget.	1.6	1106944
44	918	9	0.9263170229111958	Benefit idea raise Democrat response.	1.2	8133632
121	736	1	2.6435476832792	Material professional relationship all. Pretty force management today mission west explain.	0.5	7441408
61	1016	7	0.07341602925670804	\N	0.9	1230848
83	1023	6	0.5228611522172585	Blood thank west available.	0.5	4285440
66	983	2	1.6414419144151868	Model key return least particular.	1.5	2078720
134	589	9	1.501211142236309	\N	1.6	316416
195	769	10	0.4499196444391067	Image significant area improve thousand big decision moment.	1.8	8054784
148	421	5	0.11239140525911862	\N	1.1	6876160
188	711	5	1.3229469871723398	\N	1.7	6035456
157	1005	8	0.22654013321363284	Hold war take cut Democrat success.	1.6	2004992
202	603	7	2.2584564640315534	Shake appear investment company read.	0.8	6089728
232	195	6	0.7597972630333787	Pattern avoid act form worker debate.	1.5	4477952
2	3	3	0.08964400693586817	Pull official resource third.	0.7	2993152
24	803	4	0.7709464177076202	\N	0.7	2198528
92	492	7	0.006239810732340235	End she military eat dinner provide. Appear strategy measure travel force cultural.	1.9	5458944
39	405	9	1.0880267410011926	\N	1.5	713728
198	244	9	1.06822285367526	\N	1.7	6577152
31	275	6	1.717774054386081	Fish middle fill area break prepare space while.	0.9	976896
47	268	3	1.4590487445962583	This conference movie wife its north.	1.8	551936
230	46	1	1.3866179637269997	Agreement movie western policy rest it.	1.1	5649408
162	145	3	0.9045877758206127	\N	1.3	2587648
174	413	5	1.9518073573838637	\N	0.8	4500480
240	207	8	1.2893674641538297	\N	1.8	8031232
129	16	6	1.2622852830763254	\N	0.6	2878464
91	1039	5	0.7738560605477417	Laugh remain else white. How hour keep direction play candidate.	1.2	1988608
145	1037	5	0.5268262449212183	\N	0.7	2444288
232	200	5	0.9027212292718163	Four same beyond possible.	0.5	3644416
41	655	9	0.8550429441492092	\N	0.9	4354048
38	673	2	0.9388451412885177	\N	1.6	6456320
41	637	7	1.9245135136865863	Military check raise off.	1.1	5033984
215	55	9	1.1793521892368393	\N	1.5	4621312
13	100	3	0.5559783572957238	\N	1.6	4631552
122	616	7	1.549875665491585	\N	0.6	6159360
54	763	9	1.556964452146601	\N	0.5	1339392
119	159	10	2.0084075228514044	Issue often we miss.	1.9	834560
8	110	1	0.2980628640518163	\N	0.8	2702336
148	414	10	0.9958648937228943	\N	1.1	5489664
195	778	6	1.1568804427830295	\N	1.9	4919296
154	175	5	0.03159717898327881	Until end mouth end court board read.	1.9	6583296
50	738	8	1.0428010623429418	\N	1.1	5823488
42	972	3	0.4433654457233762	Rich result never nor most pressure.	1.9	2338816
133	3	1	0.4824228289381074	Writer much last effort loss agree usually.	1.6	7997440
25	515	9	0.5786732268504814	\N	0.8	7144448
77	541	2	0.47344843528551284	\N	1.5	2714624
111	786	9	0.7742457015748949	Ok beyond mean whose expert defense south. Choice science citizen me front.	1.2	752640
80	871	10	1.0653176896095413	\N	0.8	7839744
111	787	3	2.51340942682375	\N	1.2	5901312
8	96	2	1.5442762200913096	\N	0.6	4929536
2	14	1	1.4783864803574682	\N	1.9	4303872
81	443	3	0.13910758848397575	Fund defense well professor pretty tax other. Hospital style author stage stand late.	2.0	455680
115	759	2	1.423612941266774	\N	0.8	1210368
178	992	9	1.0963503636710266	\N	0.7	282624
83	1008	10	1.4959189600461547	\N	1.7	6446080
58	735	1	0.6781862595525774	\N	1.0	6287360
196	697	1	0.3085821327257075	Central economy skill bring need.	0.7	7771136
13	102	9	1.3355272343178137	Newspaper experience entire water pretty fear.	1.1	6395904
61	1007	9	1.2898934194792244	\N	0.7	4014080
170	940	8	0.8820273342693989	Thus tree agent way.	1.5	6888448
25	516	5	1.3944651243098125	Reason approach message rock staff tonight source. Father send end information.	1.1	7152640
90	241	1	0.16014658290531664	\N	0.8	4016128
110	743	1	0.6377905241926914	\N	0.9	484352
53	585	1	0.779782303680738	Produce consider thus pretty across even able.	0.9	1357824
31	287	1	0.21286931435791534	\N	0.6	3328000
116	131	6	0.05429903005188802	Include program hundred sense dark option whose.	0.6	6116352
18	227	2	1.1685381061720017	Woman sure get them table involve now painting. Remember south himself generation a.	1.8	5939200
225	748	7	0.2588541295629386	Three generation feeling every month.	1.1	666624
100	26	6	0.11268519059546378	\N	1.2	959488
11	669	1	0.2970926719132727	\N	0.6	6356992
232	202	2	2.295568247382068	Apply along term strong probably road four.	1.7	928768
104	29	5	1.4318013161557732	\N	1.4	7122944
222	634	8	0.4097983435991531	\N	0.7	985088
242	119	8	0.7176382972833886	\N	1.6	354304
155	589	3	1.1347176507958725	Mrs final as direction above increase.	0.7	2101248
215	47	1	2.7291481956688397	\N	1.3	8264704
237	788	3	0.6142373575810012	\N	1.7	3134464
53	579	10	0.24537410847854102	\N	0.8	5360640
241	777	2	0.45985428233491166	\N	1.2	5975040
245	46	3	1.2791118731969415	\N	1.1	2827264
184	1013	8	0.9421321087566416	System around ten early realize and itself.	2.0	6332416
234	298	1	0.97598568509582	Thank food himself kitchen administration himself. Your court eye.	1.1	297984
206	262	4	0.19623992998491477	Sense produce personal serve develop operation example.	1.9	2677760
50	733	8	1.0186130678919383	\N	0.7	4629504
41	658	5	1.9449831240166728	\N	1.6	1872896
130	839	10	0.22371481242540076	Clear task third represent leg for majority seven.	1.5	5174272
167	581	7	0.30815536171302027	Such like beyond turn wait later expert.	0.8	6610944
210	626	5	0.29395580793655296	\N	0.8	6002688
242	138	2	0.8069339940192477	\N	1.3	6887424
80	864	4	1.1461904282615116	Two sometimes project left.	1.0	6825984
215	38	2	0.42394045781952283	Type network cultural.	1.2	7499776
4	1019	10	1.4675259931578457	\N	1.3	5919744
11	664	3	2.026194591602392	Such each stay consider. Despite main enjoy mouth bed current.	1.0	6766592
113	817	4	0.9704086408619235	\N	0.9	1127424
100	18	8	0.2836861581506773	Since wish leader live wide stuff some decide.	1.4	2357248
12	498	1	0.2164529524700574	\N	1.5	5606400
43	815	2	0.662194356060793	Few life both possible the just degree.	0.7	104448
133	17	2	0.28414649279471677	\N	1.5	2411520
227	210	5	0.5990292832808337	Treat he same ago move young that.	1.1	7336960
82	478	4	1.8378618333100734	Eye wear per computer itself.	0.8	6581248
61	1021	10	1.0997020526018217	Worker painting collection college money hundred.	1.3	6945792
118	337	7	0.44016874669521466	\N	1.4	5617664
27	841	10	0.5680919052863276	\N	1.6	2823168
169	2	7	0.48691840012438914	View me writer hour senior.	0.6	3056640
33	919	6	0.7741906569000045	Three them these success.	2.0	6294528
116	122	4	0.4889908964299463	\N	0.5	1328128
74	181	10	1.275580743277844	\N	0.7	570368
180	853	6	0.7651390965715588	Congress course staff against student far.	1.5	5312512
65	156	2	1.8707098465129532	\N	1.1	7284736
74	184	6	1.679324017036699	Blood statement during watch either show.	1.5	8153088
31	264	10	0.23931036457102864	\N	0.7	2116608
136	970	1	1.2881227115048475	\N	1.2	6712320
201	486	10	0.35093493350999155	Past player suggest else study.	1.4	6942720
154	174	3	2.5261510779746597	Response either herself than because.	1.4	7792640
167	588	3	0.0926682419459174	Recent particular different reason this stuff doctor.	1.2	6467584
237	806	9	1.4496607375022958	President gas daughter media resource student.	0.6	5803008
132	127	5	1.443473348805112	\N	1.1	1268736
210	624	10	0.8920803060045674	\N	0.9	7647232
148	419	4	1.1769050062587256	\N	1.2	6488064
75	175	9	0.9514369171855489	\N	1.1	5530624
105	964	7	0.47831914092069716	Account few develop sometimes knowledge now. Agree we detail within reality throw already.	1.7	2765824
156	2	5	0.05540291193745763	\N	1.0	7982080
87	1031	3	0.13761003967264035	Building sense likely end these news.	0.6	8071168
167	595	4	0.8986918953304217	Me hope white case.	1.7	4955136
147	161	3	1.1217333918553307	\N	1.6	2772992
185	849	5	0.4056306774331863	Wide bag body certainly wear.	0.8	5672960
220	420	9	1.6013329499901852	Save news at activity word clear business. Public season feel almost bar rock.	0.6	7393280
53	587	1	1.0625451132739119	Likely type eat laugh group environmental south. Threat book nor police.	1.9	1504256
232	201	1	0.6457598807009186	\N	1.2	7957504
140	445	5	1.3263103604857616	Seat figure them couple yeah big.	1.5	2314240
28	711	9	2.096175814924899	\N	1.8	7047168
68	596	9	0.14594727534865168	\N	1.4	488448
189	42	3	0.45441203282075976	\N	0.9	2613248
118	341	6	0.874241761732676	\N	0.8	1299456
223	801	9	0.45817175799812143	Tv win technology partner subject reason.	0.7	5252096
83	1021	6	0.014105031068968743	Very media which.	1.6	5897216
174	421	2	0.3903955461963565	Pattern and century model property leader national.	1.4	2211840
191	703	4	0.9282673533984842	\N	1.4	4813824
236	905	2	0.26312142034791663	Condition home film budget sing movie small great.	0.8	5270528
57	249	4	1.32131379198439	Policy dog type push increase kind.	0.7	5114880
31	281	3	2.153819033034345	Institution strong down.	1.1	7037952
129	26	5	0.4914229036431108	\N	1.3	4384768
230	47	8	0.8819916456352461	\N	0.8	1646592
186	908	3	0.10001119292679413	\N	0.9	5460992
244	114	10	0.811693075449048	Who member answer.	2.0	2491392
11	668	9	1.2455373978715985	\N	0.7	5040128
200	514	5	1.3785734824986078	\N	1.7	281600
161	136	7	1.226405810662594	\N	2.0	5977088
61	1011	2	1.0482461654615844	Fight theory during might.	1.8	800768
101	782	3	0.26590010665394903	\N	1.0	5318656
137	636	2	0.32074104186772584	\N	1.9	4528128
161	125	9	1.181202692215852	International letter when goal keep room.	1.0	6713344
135	494	5	0.9591210396887202	\N	0.7	206848
195	775	7	0.06817237658303865	\N	1.2	7162880
195	760	8	0.0024499348935345445	Option success most appear specific.	1.3	5796864
199	737	5	1.149497063945681	\N	2.0	1356800
116	136	7	1.3695344794585778	Author factor away game collection.	0.7	215040
221	463	6	0.5027820178919146	Foot certain toward moment firm society program morning.	1.0	5170176
72	436	3	0.04358922860624692	\N	1.7	1893376
134	593	10	2.1464184209590944	\N	1.6	6146048
129	19	6	0.658064914002709	\N	1.9	3289088
57	261	7	0.6288021395032268	\N	0.9	4784128
8	98	7	0.49512631330272117	Prevent evening power lead.	0.5	5078016
11	663	2	0.05720028128383595	\N	1.9	8069120
120	600	2	1.4284870755516446	\N	1.0	1125376
128	762	9	1.1295193687755327	\N	0.9	3204096
223	787	1	0.4201197170713474	Possible reason doctor box shoulder result even.	0.9	854016
69	629	10	0.7415676386631536	Allow look agree blood.	1.6	2893824
162	115	9	1.8633528900061163	Democratic note born act even specific.	1.8	2958336
117	842	3	0.0912487812724373	\N	1.9	3179520
9	517	10	0.5150778658851178	Main break score reality finally stand moment.	1.2	6045696
211	538	3	1.0839774323198264	Big image husband different sister.	1.5	2760704
100	13	2	1.5917688966577217	\N	0.6	3572736
242	120	7	2.458292374444264	That test wait nor more defense.	0.5	3535872
234	270	1	1.8279407517696056	Peace professional show plant similar play. Enjoy all majority learn heavy.	1.3	3972096
232	198	2	0.162742409677097	\N	1.2	4214784
104	12	5	0.44431102649845133	\N	2.0	2216960
201	476	2	0.5442963290140066	Citizen college reach five.	1.1	2104320
224	668	4	0.20375819780801888	Bad art seek investment spend.	0.7	3733504
97	191	3	1.8117596304202177	\N	1.0	6580224
30	1033	8	1.1392756598889113	\N	1.7	3983360
96	565	3	0.43293276463051755	\N	1.3	6226944
35	914	3	0.22555337788128849	\N	1.4	2633728
6	579	3	1.7488675877736441	Its dog same.	1.5	2914304
120	598	9	0.9221249987687418	Build wrong everything could its far himself.	1.5	5060608
71	1003	6	1.1989948717123171	True situation myself body population alone.	1.5	6403072
170	947	1	1.3775967759368835	\N	0.8	3044352
164	909	1	0.029090253600004723	\N	1.1	477184
179	997	10	1.0847006264664705	\N	1.7	2682880
144	680	4	1.1242724368976438	Clear yard up no be.	0.6	6664192
124	743	8	1.4334910319370135	Scientist land director economy vote officer deep.	1.7	6709248
22	19	5	0.9491729723960197	Because magazine sing a sister of.	0.5	2069504
208	622	8	0.2557156560628476	Method field reach one together business age.	0.9	458752
216	712	8	1.6534773646642913	\N	1.2	1703936
75	164	10	0.7998660512375366	\N	1.3	2283520
190	550	9	1.4730217966421035	Investment TV number growth will. Focus writer political job red finish fight.	1.2	3012608
65	161	4	0.7274862441041685	Myself front senior.	1.0	6238208
48	353	4	1.3194589182390104	\N	0.7	5258240
26	523	2	1.9376662929394612	\N	0.9	5612544
242	143	4	1.732524148754786	Clear need know final last clear.	1.3	5833728
211	549	10	0.5584681056722887	\N	1.6	7890944
45	919	4	0.43332384765751647	Event international reveal only.	0.8	4130816
2	4	9	0.7322855952703877	\N	0.8	1398784
187	305	6	1.8992305341580247	\N	1.8	4125696
82	486	2	1.4445407439519526	A class run scientist audience. Collection determine or.	0.8	4671488
112	202	9	0.030971005357845326	\N	0.9	1026048
150	60	2	1.8166280227888434	\N	1.7	5086208
147	149	6	0.579419583348536	\N	1.5	1019904
237	796	5	1.3470013509034306	Fund production watch court miss effect. Author hit prevent identify activity total young.	1.6	6461440
215	44	2	0.5424017527474996	Step plant artist nothing smile who both. Building future accept movement more not perform.	1.3	5622784
39	398	9	1.0941858422308703	With affect sport whom discussion threat.	1.6	6122496
46	693	2	1.5666967274432388	\N	2.0	7116800
77	535	10	1.3142206375020835	\N	0.8	1852416
147	167	10	1.5587368146394538	Paper arm read policy. Visit company suggest pressure wonder arrive.	1.0	2500608
9	511	5	0.6646295222288297	Finish for sister number could move picture.	1.0	6313984
56	630	2	0.14772052084661816	\N	1.7	3993600
131	199	4	0.20169330501015212	Than important question head.	0.7	514048
131	202	2	2.1084623548117403	Main work current town prevent defense relate.	1.6	4232192
104	2	6	0.24045245378025906	\N	1.4	5312512
61	1014	3	0.26153378281009715	Thousand son thank old including late.	1.3	6032384
95	522	1	0.3366090785674306	\N	1.6	980992
137	629	2	0.02815345042480786	\N	1.2	3947520
176	590	4	1.74265580519803	Find million eye big return.	1.2	7024640
45	928	5	0.613363189865221	\N	0.9	6262784
20	969	2	1.57476787366475	\N	2.0	4928512
146	640	8	0.48348666195581275	\N	1.1	837632
167	578	9	0.08165048648871634	Also couple view live expert area new mouth.	1.0	6894592
203	231	1	1.346041959725325	Quickly price market difference responsibility. Anyone purpose whose.	1.7	7273472
77	551	9	0.6386647537846425	Let great next tonight here. Son wind traditional western population.	1.5	8169472
242	128	10	0.4616499724481262	Scene available southern middle.	1.2	4917248
63	977	9	0.5440927295519505	\N	0.5	3340288
102	495	4	0.86158880622911	\N	1.1	7103488
134	579	8	0.6403354683277445	\N	1.3	2153472
241	764	10	2.536025581088261	Total exactly life plant story his. Own box turn yourself government explain.	0.7	2951168
26	522	8	0.7564279483996471	Take science compare. Product positive get sometimes agree.	1.7	8086528
15	184	8	0.8708836291826593	Those themselves the article under door account.	0.6	2576384
79	420	3	0.04126661051578767	\N	1.4	3813376
234	285	8	0.43856422853992344	\N	0.9	1376256
167	591	6	0.11462765373364289	Scene with become born apply.	1.7	6116352
66	976	9	0.6583780708775903	Indicate whose yet letter enter.	1.3	5243904
103	996	2	0.8850149882102999	Around determine again mention step organization system. Surface glass loss story.	1.0	171008
239	133	7	0.3983147527386685	High power black turn.	2.0	7407616
70	526	8	0.4013059392894387	\N	1.2	3123200
48	357	6	0.9466658419375064	Fill seem which daughter leave.	1.0	4684800
201	488	8	0.8073896304277559	\N	0.5	2266112
140	430	6	1.4740081804720306	Make recognize understand take get agree.	1.6	2085888
129	7	9	0.12282658808693629	\N	0.7	3299328
46	684	6	0.6664398225992502	Page begin hundred answer. Inside seek something.	1.8	385024
123	723	6	1.3085523072378533	With set marriage institution yard.	1.9	5918720
24	785	5	0.9714795288262299	\N	1.1	8074240
22	21	1	0.41527753387019195	Most father agent about. Book similar just.	0.8	8126464
115	778	7	1.55971310308761	\N	0.9	5866496
5	540	8	0.3228830304404652	Improve may would interview little. Truth sing big.	1.2	1999872
100	14	2	0.1366338603903653	\N	1.2	4307968
195	761	8	1.7147261565331393	\N	1.4	3771392
173	864	9	1.881061381801122	Place staff community rate surface will.	1.9	2890752
69	630	10	0.5347161520834612	\N	1.8	1404928
195	772	1	0.8304045868602767	Economy pull building help become one population.	0.7	2173952
224	667	2	0.4075381501972518	\N	0.6	4604928
8	86	4	0.8039757070167428	Play sit top wall.	0.6	6684672
75	153	1	0.9255093081950355	Start card not information. Above cut arrive involve if teacher.	0.8	6085632
81	428	3	1.2239913084372824	\N	1.2	6432768
55	21	8	0.7917129255435846	\N	1.6	3015680
190	543	4	0.30964865484667675	\N	0.7	2377728
215	35	7	1.3599074698107327	Marriage loss the response blood interest.	1.7	2297856
184	1016	4	0.6995375048177328	\N	1.3	4279296
110	731	9	0.36038690491664943	Music decision cut garden.	0.6	5837824
29	982	10	1.6045511761368165	Challenge along almost animal image economic. Who plant budget cup support pass.	0.7	4213760
93	679	5	0.9831470856882878	\N	1.0	1392640
142	861	9	1.2536568772844396	\N	1.3	2307072
87	1040	8	0.9464116005194811	Section senior full begin family last community. Election for writer.	1.0	2045952
156	9	10	0.6309214773768009	Leg trouble step father.	1.1	1314816
146	645	3	0.766836658028637	Carry enough hit traditional.	0.5	3283968
129	10	2	1.1432621324553125	\N	1.3	5938176
223	782	8	0.7640572272462581	\N	0.9	7583744
37	698	9	0.8092540259647973	\N	0.9	2981888
213	802	6	1.9216472878537314	With moment value I step carry.	0.9	6663168
64	566	1	1.3346798831975977	Election throw to beyond light.	1.0	3817472
156	7	3	0.2293163939075021	\N	1.8	4109312
190	547	4	1.0497197210019442	Out former of skin unit.	1.9	2155520
144	697	7	1.3333688854866377	Sea generation main coach.	0.9	7118848
209	696	9	0.5145000394565493	\N	1.5	666624
223	804	9	0.7386164720344646	\N	1.6	2209792
63	974	6	1.4366558192539158	\N	1.4	3851264
124	740	6	0.48702500787628056	Other music risk hope card take.	1.8	4678656
13	91	9	1.1755423777535048	Girl contain why art environmental west. Provide test indeed lead allow country entire.	1.3	6213632
24	788	3	1.1900990956413509	Third mission others almost impact brother heavy go. Huge teacher because never minute admit.	0.6	3552256
72	427	9	1.0549437681653786	\N	0.8	373760
43	817	5	0.49489317134777044	Manage set computer edge themselves learn. Visit remember outside task most remember.	1.9	2570240
206	244	10	0.5461064461057096	Dream body may process.	1.9	2319360
157	1000	10	0.07845929042994716	Run very wish soldier.	0.6	1350656
148	411	4	0.06889991230293956	\N	2.0	1144832
2	6	2	0.5407292635721854	\N	1.2	7459840
134	586	10	0.4097147857751935	Where present conference call everyone deep expert. Talk must glass more.	2.0	5204992
49	499	3	1.2146846127550657	\N	1.7	7188480
66	972	7	0.3644182352493399	\N	1.9	2332672
2	28	3	0.45476578758287706	\N	1.9	6104064
162	134	9	2.414324182501642	Believe everybody staff culture beat.	1.8	2811904
218	847	9	0.281046909979209	Society technology be fund.	1.1	5003264
247	741	2	1.3669980461889597	\N	1.0	7326720
213	804	3	0.8160509955365691	Operation game industry choice already painting dog.	0.9	3706880
215	50	3	0.44215237488295916	\N	1.5	999424
202	609	6	0.7837650660303473	\N	1.7	5298176
13	96	3	1.3319233415696459	\N	1.2	815104
194	132	6	1.5493548430280641	\N	1.0	6483968
97	178	7	2.2856357447176765	\N	0.9	8269824
152	983	3	1.0848977088144216	\N	1.3	4272128
227	218	3	0.5380847019848848	\N	0.8	3927040
68	600	9	0.7413893193351783	\N	1.7	3804160
29	975	5	0.810441013771793	\N	1.2	930816
113	818	7	2.1664706294476517	Improve our figure.	0.8	7897088
121	737	10	0.1052848466623863	Wife newspaper clearly way author tough brother stop.	1.7	3041280
27	846	3	0.1950295316912064	Page song college could under miss.	1.9	6319104
137	632	6	0.3170533101721665	Degree man up scene before interesting herself agent. Right drug surface threat water adult bring.	1.5	3334144
221	483	7	1.5570155287906386	\N	1.1	177152
26	525	5	2.1084768298630543	Join environmental society term avoid but organization.	1.9	3505152
178	995	5	1.4377720708494455	Professional director herself consider model.	0.9	7793664
216	711	7	1.8927041946676575	\N	0.8	1053696
133	21	5	1.2294236543479307	\N	1.6	3231744
211	544	10	0.056890554375405245	Director address person decision various.	1.0	487424
44	912	3	1.8509429159062514	Place see mouth better begin guy meeting collection.	0.5	231424
172	969	5	1.7737641886698274	\N	1.5	3478528
156	23	4	1.4410571858043797	Player audience along room mission. Best chance director open.	0.7	5483520
92	494	3	0.833785857799247	\N	1.7	1520640
239	124	10	0.9663718781367626	Physical raise difference hold should.	1.2	7061504
183	525	1	0.6115824490779315	\N	1.0	439296
190	535	4	0.7923294816256485	\N	1.7	3469312
154	171	5	0.6901142074828115	\N	1.9	8093696
211	543	9	2.1170374107645293	Tell daughter trial participant white hold.	0.5	7917568
21	635	10	0.6462961343701538	\N	0.5	8178688
188	706	1	1.132317050263566	\N	1.3	2390016
57	248	10	0.5438711592258703	\N	0.8	1624064
246	568	9	0.22105980753525442	Game economy audience fine guy week assume often. Line section president worry.	0.8	2297856
54	767	8	1.4842050468227808	War provide industry know model dog. Their agree from value.	1.4	7482368
5	533	6	0.8596768387834696	\N	1.6	7574528
11	662	4	0.0750086054759589	Moment foreign eat people sense.	0.9	2311168
137	630	2	1.1413797990238053	\N	0.6	4663296
171	565	9	0.3295399857230403	Decade education back follow.	1.7	6887424
203	230	8	0.43434360835649966	\N	1.5	2332672
211	551	3	2.5496503785354454	\N	0.7	8031232
13	112	7	2.0872311287977423	Thus yard want any because assume. Boy beat space heart.	1.3	4021248
52	673	7	0.868267184642189	His economy politics chair especially must.	1.2	3664896
163	60	2	2.0686407806475016	\N	1.1	3089408
214	458	10	1.2163967359646255	\N	1.8	2731008
30	1031	6	0.8568122958419873	\N	1.6	8210432
243	616	2	0.8929032126817028	Third drug power majority concern lay between.	1.5	6489088
47	278	4	0.1916344918844149	\N	1.2	2715648
50	732	6	1.0366795510620062	\N	1.3	6705152
169	27	4	0.41454787606147375	Dream coach turn anything.	2.0	6684672
203	219	1	1.0091404024046322	\N	0.6	577536
98	80	10	0.9498174977955693	Leg finish production. Her happen situation color.	1.7	1717248
132	119	4	0.9296828605442455	Scene include who.	1.3	494592
132	121	9	0.9976937027258245	\N	1.4	2325504
206	260	4	0.23481496483137024	\N	1.9	6678528
77	555	10	0.19789581026391528	\N	1.7	1896448
185	843	2	0.0063997326159832115	\N	1.5	4139008
156	29	6	0.46963833547402706	\N	1.0	1479680
104	13	6	0.3614106595235114	Page security present rest tax economic.	0.7	5433344
123	730	6	0.04982759048296746	\N	0.6	317440
24	798	5	0.3750420626061268	\N	1.6	5606400
22	18	5	1.455677723910922	\N	1.2	1257472
189	56	2	0.020050873987787265	Or order nice quite factor particular.	0.9	2577408
150	62	3	0.013681164750599106	Less event painting professional.	1.8	6625280
169	17	9	0.04324645660472052	Summer fine can support six. Image certainly reveal often throughout join significant.	1.1	3679232
179	1003	10	1.2415196034434968	\N	1.1	1265664
178	990	2	0.503833655761807	\N	1.4	7187456
181	636	6	0.5151693360277922	Forward technology present claim.	1.7	6992896
119	171	8	0.05334589127784373	Public recently surface usually question.	0.6	4862976
182	611	1	0.9497407372612672	First pull move class.	0.8	5773312
115	780	10	1.2526566735592717	\N	1.4	6187008
189	35	5	1.747461866496322	\N	0.7	4372480
242	144	1	1.072012513759941	\N	0.9	3805184
138	603	5	0.7556861249510358	\N	1.2	8150016
162	116	7	1.3803266880930545	\N	0.7	1635328
221	464	1	2.008080834746331	\N	0.7	696320
169	9	6	0.3280217624375983	Several edge reach drive collection prepare.	1.0	2118656
137	628	3	1.897583865767898	\N	0.8	6434816
106	882	4	0.9209806342362232	Majority financial protect animal member everybody control.	1.5	7847936
152	980	6	0.9836429810225955	Success last gas site offer teach.	0.8	6756352
65	172	2	2.21631957001126	\N	0.6	5582848
221	459	2	1.806379879570629	All quite require staff.	0.9	524288
124	739	1	1.4858301924126742	Occur focus cost. Because fish new fight control stop leave.	0.8	5069824
8	111	7	1.363075266778341	Explain blood put piece style commercial picture.	0.8	1160192
182	616	10	0.2552929079075789	All others rich research agent music.	0.8	5421056
156	26	6	1.1100922864277298	\N	0.6	4154368
189	36	4	0.52247064043681	Discussion court fall source board southern out environment.	0.8	5005312
178	997	9	0.7357987131585046	Item open bed piece.	0.6	3642368
138	596	8	0.4898674100239072	Special back task national effort view need.	1.0	2578432
175	575	5	1.2701423228589641	Group peace article.	1.0	4780032
60	492	6	0.5299235263737451	Central bit simple quite.	0.6	5220352
239	139	8	0.47902407605172864	\N	1.6	7874560
116	134	2	0.5177191195814553	Heavy through million administration that religious traditional out.	1.2	6788096
101	807	6	0.8199894432932556	\N	0.7	4064256
247	742	8	1.1677345169077558	Crime now pretty claim professional most argue.	0.6	1406976
195	774	10	0.3387785797016891	\N	1.9	7398400
225	753	5	1.900716817774872	Night program inside throughout senior next.	0.9	7817216
198	253	5	0.8148488743528064	\N	1.5	4005888
142	853	7	1.720005715691192	\N	1.8	5103616
147	162	5	0.1966711286693446	\N	1.9	308224
192	604	3	0.3401345797002424	\N	1.0	329728
30	1027	3	0.7005020858383109	\N	1.4	5029888
184	1012	6	1.6504936571655928	Travel difference station mention particular campaign.	1.1	1689600
93	694	6	0.10627505243280898	Local message sort there course treatment since. Form indeed price good.	1.9	129024
155	581	4	0.1876748127154514	\N	1.7	2178048
114	1027	5	0.4719917898937756	Machine while heart later.	1.4	5393408
156	30	10	1.9608072004490353	\N	1.4	2071552
163	75	3	1.0773803315815622	\N	1.4	1597440
203	215	3	0.27573686095105776	\N	1.8	961536
229	698	6	0.4046152394114156	\N	1.6	749568
180	852	3	1.2933938559278164	\N	2.0	2835456
141	195	10	1.0524296462048541	Western interesting fly particularly beautiful show ago.	0.8	6405120
163	71	7	0.21020807808844322	Continue art near suddenly.	1.0	3811328
81	427	6	0.7344351253235999	Collection health garden risk interview party.	1.4	7415808
101	801	4	0.9587036286509689	\N	1.3	8046592
195	762	9	0.7327659407955228	\N	0.7	6253568
226	747	6	0.9668158824045878	\N	1.5	1200128
125	868	4	0.24940668185523374	\N	1.1	2948096
72	435	6	1.9371736255068215	Field increase task environment.	0.8	643072
87	1041	1	1.8384213043640334	\N	0.5	2831360
146	655	10	1.2809907022448306	Enjoy sister safe maintain.	1.4	5650432
232	203	2	0.8239296460376531	Travel store race hair. Reach trouble each still.	1.4	6694912
233	738	2	1.762553268481436	\N	1.5	1815552
153	520	5	1.8018271537466677	Himself work most yet.	1.3	5879808
108	742	9	1.1257243685679428	\N	0.6	1566720
100	25	6	0.7815148153177076	\N	0.8	5292032
240	196	9	1.3889828189431321	\N	1.8	6447104
206	252	2	1.395652634707313	\N	1.5	1362944
54	766	7	1.0270207551673334	\N	1.6	5278720
133	11	7	0.8423856899015892	Movement would argue artist five size civil continue. Miss than set heart society.	1.3	3616768
141	197	2	1.7840008880976428	Discuss reveal general. Than guess western necessary color decision necessary.	1.3	4279296
161	139	9	0.25682374656172186	General bank beyond building.	1.0	5312512
200	519	8	0.42179518091197954	\N	0.9	6547456
211	541	1	0.7446562653956839	Character raise might eat sort chair question particular. Himself federal decade star.	1.3	6575104
246	558	9	1.6546076377555874	Attorney foot owner white these organization reflect issue.	0.6	4480000
231	174	8	2.114609450039225	Positive law administration it test write effect last.	0.5	1709056
106	891	4	1.6703783030042676	Two side book child speak. Father expect you with feel.	1.0	3237888
216	701	10	1.032662872625707	World visit subject. Mean term total.	0.9	2481152
161	131	2	0.18918307783871757	\N	0.9	5563392
169	25	10	0.1608095479059597	Effect share some shoulder discover risk task.	1.0	3981312
78	931	6	0.5835609400823885	\N	1.6	6902784
191	710	3	0.8836421172384896	\N	1.8	3331072
215	43	8	2.2171792831411206	\N	1.3	796672
230	48	2	2.3651210954707933	\N	1.8	2991104
39	388	6	0.41133074308444956	\N	1.8	7695360
173	866	5	1.8724865890067637	\N	1.5	6132736
226	756	1	1.5076803401389431	\N	1.7	1256448
73	670	9	0.502200347139125	\N	0.5	3484672
183	523	9	0.22181974828612064	\N	1.0	6968320
38	675	3	0.10335598259535739	Authority tonight yard hand.	0.8	7694336
116	142	9	2.0984414790226458	\N	1.1	5508096
148	415	4	2.3759976691464875	Box management list newspaper.	2.0	4173824
46	696	6	0.8446624731756391	\N	0.9	3999744
123	728	6	1.6098898366261447	Trouble worry stuff prove.	0.8	6467584
226	749	3	1.6778610546669488	Member three family particularly analysis fear.	0.8	3955712
5	541	4	0.3461163275900947	Too step during explain off turn writer this. Among machine most front economic share be weight.	1.7	6118400
18	219	3	0.7415941323955957	\N	0.8	3016704
214	486	6	0.1827787354675085	Each soon cup keep line material true according.	0.8	7246848
72	454	7	0.026923639960638002	\N	1.7	339968
58	731	7	0.0843373187403777	\N	1.2	910336
97	185	1	2.209745887033462	Growth trip success age drop.	1.7	6355968
41	651	7	0.09021209302099735	\N	1.6	1796096
126	628	3	0.0007977578946860575	\N	1.8	3612672
119	170	8	0.8061688679946772	City boy organization worker free animal.	1.7	6039552
21	626	2	1.7958913444235656	Way have which remain use blue.	1.8	7836672
65	163	9	2.1331571578571498	Decision their college house thus. Picture including build concern.	1.1	1858560
131	205	1	2.3515355119510053	Resource few tonight prevent his director just.	1.5	549888
224	671	7	0.15312954222050032	\N	1.3	4784128
244	99	9	1.4757506946873231	\N	1.0	745472
24	809	3	1.983229777023819	Significant financial adult despite. Happen ball total story but camera modern.	1.8	400384
244	111	3	0.246997365800419	\N	1.5	4418560
185	838	5	1.4991748697436804	Give among institution other reason per.	1.7	5225472
234	275	4	1.739676476987286	\N	1.5	119808
234	263	6	1.0269783753855786	\N	0.9	5320704
39	407	10	1.2321645307305977	Become low himself.	1.0	2786304
142	855	1	1.1298446909290227	\N	1.8	2782208
97	186	1	0.2607214209901279	Recent just investment. Serve political recognize issue various wind strategy guy.	1.6	4315136
79	423	3	1.7728011227190377	\N	1.0	773120
93	695	4	0.6580856622438527	No production day consumer oil. Tv pull make whose policy others.	1.6	793600
187	308	1	0.6274974350632753	Ready again hot into me most.	1.6	3153920
239	129	5	1.1734623855648707	\N	0.9	5008384
57	236	1	1.1999225890439167	Give change art over lead while new size.	0.5	5516288
81	442	1	0.044307426303790365	\N	1.0	2668544
209	692	8	0.10797855926543658	\N	0.6	7131136
206	248	1	1.2953134076054214	\N	2.0	3174400
23	618	5	2.305017119209866	\N	1.6	3592192
235	561	10	0.922829570991198	\N	1.0	6468608
117	838	7	0.6679835487294186	Data record book mission Congress. People shoulder article process claim thing.	1.1	4371456
133	19	7	0.01956583622318672	Much blood alone. True defense you draw entire onto.	1.4	7785472
38	670	2	0.45086601517219904	\N	1.8	7110656
216	710	4	0.6161332298821717	Reflect list room coach. Change late fish.	2.0	5510144
227	225	4	0.5586069475855506	\N	1.4	2024448
118	331	4	0.9239543338483411	\N	1.7	2570240
119	165	1	0.15222262574764886	\N	1.8	1726464
215	51	4	1.042297322857419	\N	1.3	6334464
5	555	8	0.4386873523724414	Also data if question general off speak whole.	1.8	4100096
146	652	1	0.3835928389630018	\N	1.8	1908736
18	232	7	2.103297273988425	Care challenge question third indeed. Skill you animal kid.	1.3	1580032
42	981	7	2.0937257968981586	\N	1.0	4525056
230	44	5	0.6095633173125383	\N	1.2	4111360
242	135	4	0.3542712909745544	\N	1.1	2879488
150	63	5	1.3881432254626462	\N	1.1	6477824
154	167	7	1.334576671287879	Compare just information camera relationship political. War lot simple suddenly join.	1.1	5595136
119	155	8	0.4594529637674323	Ask listen loss material fear account can.	1.2	5357568
34	867	3	0.7585212045529427	\N	1.8	4780032
245	53	1	0.920460320618748	\N	1.5	5442560
47	297	3	1.9077625713318322	\N	0.6	6617088
161	116	7	0.5779330776221951	\N	0.8	1330176
82	481	7	0.07163595849531051	\N	1.7	1284096
132	125	8	1.9852706469555381	\N	1.9	5134336
169	20	1	2.4839561389414424	Action five simply consider season her. Worry reduce machine down school movement meet.	1.6	2315264
226	751	7	0.33294655171794313	Boy rich increase yeah PM movement sort. Policy a know upon yet necessary all.	0.6	4937728
227	229	1	1.4421904995850414	Director economy none his edge they.	2.0	760832
150	64	7	1.6144896625356655	Morning so building never coach.	0.8	3942400
14	492	3	1.5277538207809305	West against easy parent ten.	0.9	7926784
109	583	10	0.6658727621136702	\N	0.9	1648640
224	677	3	0.2641260840529382	Seven difference next carry us call.	0.8	2111488
103	1002	3	0.3649702745771091	Forward able identify poor score too.	1.9	2247680
90	246	4	0.5038291341838637	\N	1.4	1525760
158	686	6	1.0051666583116734	Address attention economic clearly speak tough.	1.3	6235136
182	620	7	1.012759635819323	\N	1.5	6903808
113	825	10	0.8112254712481233	\N	1.6	691200
204	1023	7	0.33263665199952397	\N	1.9	5908480
17	565	1	0.4590694689940519	\N	0.7	1080320
226	750	7	0.388754039171763	Everyone fire within win surface coach decide. Rate history character hot.	0.8	2258944
98	72	8	1.4946863481825265	\N	1.1	148480
140	443	4	0.7624147934406507	\N	0.8	4447232
25	514	1	0.11828846853326383	Also value magazine somebody husband bed. Material rich good enjoy tree somebody.	1.7	6298624
52	677	3	1.7470289101637708	Floor inside shake this notice customer air.	0.7	4549632
99	492	4	2.2473504919232443	Left property finish card pattern wonder reality.	1.3	5084160
8	87	5	0.6799273749481012	Truth billion base magazine newspaper.	0.8	657408
245	55	1	1.0335787442417534	Nearly left learn gas sport live. Worry page like course.	1.5	281600
1	558	1	0.8523066160869871	Me health employee everyone discover help respond.	1.8	848896
87	1027	4	0.493644402097329	\N	1.4	5339136
11	666	4	0.2402663695436672	Window themselves century writer.	1.4	4855808
22	32	3	1.0244028136631942	\N	1.1	5052416
227	221	9	1.5247585898006266	\N	1.0	2539520
166	620	2	2.332766746336442	Nature high group rock.	1.2	4918272
158	692	2	1.7023159395665877	\N	1.9	7870464
234	265	5	2.561954426574605	\N	0.5	7315456
123	726	4	0.4897661956421504	Produce figure think star life shoulder begin.	0.5	3159040
159	849	3	0.9312605240371599	\N	0.7	8112128
193	190	4	1.6082003251577126	Debate method past. Simply site deep eight whatever art bad.	0.9	6695936
219	901	1	0.14330324005948547	\N	1.8	6872064
128	776	5	0.46940758321941023	Modern former more hair receive Mr type center.	1.1	907264
28	714	10	1.3674821047129782	\N	0.7	4833280
39	397	4	1.2747923619303811	\N	1.8	4709376
174	417	1	0.429651572671739	Customer without read feel move class through.	1.2	4527104
225	744	9	1.4907512983526603	\N	1.2	1123328
244	95	10	2.1822117378097112	\N	1.9	1798144
170	934	3	0.8354586255841117	\N	1.0	2270208
46	690	2	1.5523897460501155	Night rise southern bank garden. According with mother maybe condition risk sea middle.	1.2	8140800
18	234	2	0.5534862435566514	\N	0.8	776192
13	99	10	0.48862804752102823	Close agreement population maybe blood.	1.6	6213632
60	496	9	0.7831003787851069	\N	1.9	7669760
238	739	8	1.803255718599026	\N	1.6	513024
79	419	5	2.3250239780771347	When difficult third political key. Car food thing picture music make.	1.6	823296
91	1036	1	1.6078169218821705	\N	1.3	7483392
242	125	1	1.3508886291402045	\N	2.0	1399808
116	141	10	1.6137102831952543	Explain actually able after ok save effect.	1.7	8140800
163	73	9	0.26626382498092144	\N	1.8	2691072
64	569	10	0.9787302026279493	\N	2.0	1159168
197	491	7	0.6853001050563754	\N	1.4	1795072
187	302	2	1.9135884109574939	\N	1.3	7086080
5	528	3	2.7410237576851615	Assume production seat everyone agree challenge no.	0.6	3703808
38	666	5	0.7201937274377407	\N	1.9	3438592
81	445	9	1.909340581267108	Power light determine control.	1.0	4017152
134	590	2	2.761374838028011	Move practice try.	0.8	6900736
192	608	2	1.888341584430717	\N	1.4	4174848
84	493	10	2.171649588787959	\N	1.9	3202048
223	811	7	1.9682213417970007	Land throw five his offer discuss but difference.	0.9	3388416
4	1024	6	0.4997834828895959	\N	0.7	7936000
240	205	2	1.7538861013581268	\N	1.6	6391808
138	601	3	1.3221010894096263	View Mr apply rate growth have sometimes.	1.6	6729728
239	117	1	2.253263688494416	\N	1.2	7944192
22	31	10	1.2374841574000885	\N	1.2	8169472
178	1000	4	0.3950487951821751	Keep difference crime finally thousand forward industry.	1.9	3358720
241	761	6	1.1259803929337906	Room age laugh among school and rise.	1.3	1591296
43	816	1	0.8268385128950486	\N	1.3	5152768
79	425	7	1.2023060296640473	Face probably remember along.	1.5	1772544
163	70	6	1.8535445841460885	\N	1.3	4313088
226	757	10	1.0083766900230298	\N	1.5	5818368
193	181	9	0.7900032761440614	\N	2.0	8160256
79	416	8	1.6755316944816598	\N	1.7	4504576
27	848	10	0.15170924782487688	Top difficult degree leg type cold. Fill no than determine.	1.7	2807808
223	793	3	1.317590752289307	Behavior oil glass far event successful when.	0.7	5386240
226	752	2	0.9364929320177728	\N	1.8	3572736
162	131	1	0.856462677138867	Present on defense tough.	1.5	6222848
106	874	2	0.19208143050995005	\N	1.5	6856704
83	1015	10	1.0185727920686103	\N	1.0	4500480
81	431	8	0.6836234148825889	Across near around around other.	1.5	2622464
43	835	6	0.7093737723130694	Set as type movement.	1.2	7041024
241	759	3	1.2374731380254291	\N	1.0	2752512
242	124	8	0.08165126201617738	Food person simple there.	0.8	2045952
163	67	8	1.3130323760404714	\N	1.0	4483072
234	294	6	0.22583771267381492	\N	0.7	2696192
219	907	9	0.7088813311089848	Quickly worker five production.	1.6	7624704
150	80	5	0.9392209284441655	\N	1.6	778240
3	491	7	0.30088169028687084	\N	1.1	1540096
77	550	10	1.1103402068260264	Executive practice ground education.	0.6	5114880
157	1004	5	0.7944996183918951	Discover step along financial.	0.8	1045504
161	142	3	0.7145884431747292	Rock economic back. Whether himself data require computer.	1.3	2663424
190	540	10	0.8709621383857461	Himself instead guess use. Through director wrong.	1.9	5079040
146	658	1	0.9690975301224842	\N	1.1	5487616
100	10	2	0.7513660386296245	Behind garden finish everybody common pretty.	0.8	2442240
227	215	2	0.9894870854927666	\N	1.6	7673856
75	173	6	0.6236909766699829	\N	2.0	3260416
165	923	2	0.9685522057549837	\N	1.6	3079168
118	335	4	1.8619102032115713	Spring base doctor high understand sense. Administration bank security better manage body.	1.3	3339264
220	422	6	1.2144502306160327	Executive buy forward prevent.	1.3	6470656
244	103	2	0.8624453109405575	Here strong important. Issue become necessary listen bed bag.	2.0	3771392
7	820	6	0.6118132233394319	Cell player right.	1.4	1070080
8	105	6	1.5855119356215888	\N	1.5	3349504
83	1007	6	0.48064951410029727	\N	1.1	6989824
233	731	9	2.1639301887380293	Relate network protect somebody. Realize up operation discussion.	1.2	6433792
169	7	2	0.5722571734392895	Baby skill face girl man. Enough process national foot western night political.	1.7	885760
78	922	4	0.4329112751249852	Ok over red western half statement participant.	1.8	2443264
130	840	2	1.8638645477606752	\N	1.6	1725440
137	634	9	1.744345230310826	Image increase wind behavior anyone voice begin.	1.8	1039360
39	387	9	0.3271147514287991	Green consider pretty trip nature place. Charge use cover just final business carry.	0.9	430080
46	694	10	0.8931862429298395	Hit officer could adult.	0.9	1403904
71	1004	10	1.0904335644837861	\N	1.7	8243200
44	915	3	1.9529627905820384	Throw whom operation audience staff environmental fine reflect.	0.8	4328448
132	124	3	0.08213148349923034	\N	1.1	2067456
9	518	5	1.242952523203344	\N	1.7	4212736
98	69	9	0.7145426040106184	\N	1.0	7892992
132	146	6	0.13170426360575418	Character her education dog.	0.9	4592640
199	742	1	0.7023550453447827	\N	1.7	2301952
104	32	9	0.8404131608632393	\N	0.6	2637824
22	16	4	2.1166382283189216	\N	1.3	5358592
86	624	10	0.49467514406008045	Why blood law long stock service just. Which list rule behind.	0.9	206848
141	199	2	1.006065158060361	Front special citizen teacher.	1.4	337920
160	807	6	1.2508835017379563	\N	0.5	3494912
220	411	1	0.6661118536324653	Region conference month smile effect institution citizen. Necessary question order particular.	1.9	4123648
9	512	3	1.9576792860692032	Including either win six region decide administration myself.	0.5	6695936
195	776	10	0.48224178505567883	\N	1.8	149504
167	580	8	1.8805154695156934	Our only hope range else into none.	1.7	553984
239	140	8	0.10171357046204225	Make put want unit coach many community. Finally draw drug continue believe which sell why.	1.0	7050240
105	958	4	1.2720343423247105	\N	1.9	3023872
181	634	3	2.806272207379862	\N	1.3	4054016
11	674	6	0.4359196410256405	\N	1.3	5076992
180	851	6	0.3406811713575354	Radio it security something.	1.2	8104960
5	549	6	1.2923870144696514	This Mrs three view report.	1.9	7445504
227	230	1	1.9211838116182396	Budget any respond decide eye current risk.	1.2	5898240
160	783	1	1.3960946768310534	\N	1.1	7345152
47	263	2	1.308010690630082	\N	1.4	6224896
24	811	10	0.309770401476932	\N	0.9	5737472
221	472	3	0.1847342916578957	Kitchen likely of probably voice.	1.3	447488
138	607	2	1.150063312265397	Trial sort professor best bag.	1.2	4417536
210	634	10	2.0923721431521876	Employee your assume everybody eight.	0.5	2226176
148	424	9	0.5718335223743648	Republican relate night business heavy at improve.	1.4	3924992
189	54	1	1.08085865597934	\N	1.7	7419904
103	1000	2	1.0476791943145378	Million main service.	1.2	6233088
119	175	3	0.22764307069976264	Local worry everything study truth as.	1.3	6115328
208	619	7	1.4493495758794757	Nearly any month ready prepare matter defense development.	0.8	2798592
147	150	8	0.5862981348284833	\N	1.2	5605376
163	76	1	0.07172081414209615	\N	0.7	4356096
189	34	8	1.2416179553531939	\N	0.7	1180672
146	660	2	0.31729231764326626	Season can firm maybe social concern.	0.7	5214208
113	819	8	1.5158888535225998	\N	1.8	5980160
196	691	5	0.827641301778584	\N	0.8	8034304
184	1021	9	0.8269179979306103	\N	1.7	3835904
159	839	5	0.7557346684738268	\N	0.7	7010304
158	693	1	1.7324478076424457	During sing skill save church.	1.8	7330816
24	801	3	1.4280275226617094	\N	0.7	3502080
42	977	7	1.1550654430218787	Certainly everyone indeed reveal offer some pressure within.	1.7	7714816
133	4	1	1.5844308588104645	\N	1.8	5878784
184	1025	5	1.6166977979337747	\N	1.1	436224
206	235	7	1.3714548467100967	Say cold per. Page there approach.	1.7	6733824
13	84	4	1.1699014575889581	Move law upon front six life third.	0.5	3596288
62	352	10	0.8030627052637931	Fish pay late floor wind public. Laugh understand summer situation lose safe degree.	0.8	3780608
112	195	2	0.13209147156807508	\N	1.0	7151616
22	12	6	0.8156799562614492	\N	1.3	2524160
207	491	9	0.8457319692450896	Any far unit prove.	1.9	4029440
112	201	7	1.0917443318840796	\N	1.5	6669312
209	691	7	0.9339986918307622	\N	1.3	6787072
54	776	3	0.28881193094203783	\N	1.2	1089536
101	789	2	0.21176761572120847	Person series responsibility outside push chance.	1.4	4598784
196	690	2	2.4056148117869243	Go election wrong attack far.	1.2	8077312
214	484	7	0.44102059822096884	Ground trade probably whom low sit along.	1.7	7321600
177	189	3	0.7859389389051981	Stock from former television people what.	1.9	5085184
244	96	3	1.0969804475873761	\N	1.8	434176
46	686	9	2.294201539687994	Plant administration thought part wide.	1.8	3293184
151	748	2	0.020505901666848292	\N	0.8	4399104
15	183	4	1.610844268623882	Service scientist visit beautiful.	1.0	5422080
200	520	3	0.709643567108547	\N	1.2	5969920
53	586	7	1.102918528365526	\N	1.8	4383744
202	600	7	0.16070941565633315	\N	1.9	2706432
189	49	2	0.6659971377301542	\N	1.3	3858432
77	528	3	2.738535560606147	\N	1.1	7120896
2	22	9	0.40919181523237186	\N	1.3	4352000
49	501	8	0.8284568207956294	General open author material.	0.7	2847744
118	328	5	1.2329785300774527	\N	1.0	5853184
177	192	5	0.5914178693453505	Purpose understand person that but book with.	0.8	2342912
156	15	4	1.5714448102711913	\N	0.6	7497728
139	910	9	0.9997913404135674	Role me only yeah.	1.8	7183360
187	313	5	0.9864917103759971	Draw west heavy near executive car.	1.9	1481728
8	99	5	0.9169568010523154	Candidate sure quite he hear meeting worker here. Finish here result seem seek thousand sure.	1.3	7968768
220	423	3	1.126700299650415	Story size identify enjoy.	1.9	2507776
102	494	4	1.3197051493056309	Anyone left wind street within.	1.8	4487168
129	17	3	0.7576902483452336	Great drop relate.	0.7	7930880
222	635	2	0.19765921552360755	\N	1.6	6576128
170	938	5	0.30622861127686574	Value knowledge decision heavy happen partner place.	1.1	6084608
43	832	5	1.6759589895987652	\N	0.8	2642944
118	339	3	1.5028439610683169	\N	0.8	3891200
10	858	10	1.368618132581632	\N	0.8	2646016
143	670	8	0.6497154578129907	\N	1.2	3589120
185	848	10	1.9246233318367214	Or value adult despite everything.	1.0	7275520
231	175	3	1.233651221799373	Place meeting buy range miss able turn.	0.5	3855360
244	89	5	0.5226359170853766	Visit truth maintain people event. Myself short specific win.	2.0	3332096
192	602	5	1.2778746545529944	This production event.	0.9	6215680
188	714	2	0.21577626419989873	\N	0.6	4592640
72	441	3	0.7870158518139213	\N	0.9	5601280
8	95	10	0.9234833929226063	\N	1.1	4019200
134	584	2	0.850893625689296	\N	1.4	4705280
134	588	6	0.5018238680463876	Much way necessary structure test.	1.3	6731776
94	671	5	0.9439808850427349	\N	0.7	133120
232	206	10	2.685874273124933	\N	0.9	1282048
98	65	3	1.8229650941573738	\N	1.2	6910976
66	988	5	0.6291669730254847	Level million also describe.	1.5	6531072
194	141	10	0.7449525589167252	Thing great accept art nation small conference. Trade put road.	1.3	1576960
72	450	8	0.41109269787550823	\N	0.8	4288512
241	765	9	0.7720545506964114	\N	1.6	2581504
206	247	7	0.11587030057001224	Trouble positive score continue. Step interest out choice.	0.5	616448
213	782	7	0.14767268994997418	Window security go source behavior.	1.3	594944
181	623	7	0.14830883227277514	Set toward look campaign state meeting pattern.	1.3	1624064
221	477	10	0.452263758628951	Value share consumer.	1.1	2642944
158	680	6	1.3095336018310775	\N	1.0	1721344
159	843	9	1.6892357051838784	\N	1.7	6232064
90	238	10	1.1923354207949073	\N	2.0	4545536
98	62	1	1.5676311421960585	Seven brother voice report loss product effect.	1.9	4791296
132	138	2	0.8696125720577399	Strong piece look project machine whose eight degree. Oil their color.	0.5	731136
224	670	8	0.9419254053349921	Production minute election instead city firm loss.	0.6	3512320
50	739	1	1.16062186163711	\N	1.8	3987456
193	188	10	0.8391656844667709	Us husband heavy culture training number probably. Political tend door kind left traditional local.	1.5	4536320
85	355	3	0.48551513169819815	\N	0.6	3367936
47	279	7	1.2340544280246952	Family where while movie kid national scientist.	1.7	195584
146	643	3	0.40244228652180075	Country newspaper risk. I reveal himself interview knowledge start and.	1.1	3679232
93	687	10	1.0622361960560065	Fine church difficult teach. Take success operation list fight.	1.7	1610752
61	1017	10	0.5249993939024012	Former over choice administration agent into. Build discuss role body nice idea doctor.	1.7	6135808
50	731	7	0.4408709828352291	\N	1.6	7768064
116	124	4	2.260951999587615	That body carry health.	0.6	3342336
56	626	8	0.7649227939929089	\N	0.6	2447360
163	74	9	1.2070123391840843	\N	1.4	7997440
221	465	3	1.2954613218699453	Boy every Republican us stand federal add mind. Lead can break someone go senior special accept.	0.6	2802688
120	604	3	1.7281435323952565	\N	1.8	1958912
10	854	10	1.1276017274376462	\N	1.7	3091456
30	1030	3	0.8512757023495694	\N	1.7	1559552
63	976	3	0.6455081819945097	\N	1.1	2479104
104	19	8	0.9797998641931364	\N	2.0	2876416
227	232	5	0.7041634897636624	Continue improve election hear conference practice daughter.	1.3	5719040
230	43	3	2.375143332051202	Certain ok apply social we sell already police.	0.7	3432448
152	979	6	1.165753794135666	\N	1.0	1540096
191	714	1	1.0741764489692511	\N	1.2	3063808
115	768	1	1.9966869636942182	\N	1.3	4076544
188	707	10	2.0621533003480845	Policy happy speech.	1.2	1378304
88	207	10	0.6804834672159712	\N	0.7	7891968
162	142	10	0.44306771295195907	\N	1.0	770048
111	795	4	1.0536734118088582	\N	1.3	1471488
187	316	4	0.5446520383858132	Through picture figure everybody. Their myself candidate pressure within car.	1.0	799744
150	70	10	0.49188659661781653	Sister result party.	1.0	2140160
184	1024	9	1.287870612504173	Meeting machine condition history record.	1.2	3056640
29	976	1	0.18076279331405234	\N	0.8	821248
13	93	9	2.1408875112390686	\N	1.3	1304576
149	970	10	1.3424712937590462	Prove fill main hotel subject office.	2.0	7035904
157	999	4	0.48072419668762145	\N	0.6	6286336
159	838	1	2.1227133849486743	\N	2.0	2690048
6	593	4	0.13583427804422693	\N	1.2	1632256
98	60	8	1.2767046793335308	Use know view cause dream player notice exactly.	0.8	5970944
118	323	7	2.0844237144856694	Police song some word follow relate enjoy. Still building rock support prepare.	0.8	7662592
25	518	5	1.2473220199071418	Animal arm fish sit hard.	0.5	809984
132	122	2	0.8491113315297862	\N	0.8	428032
110	734	6	0.7912887752306788	Commercial though strategy.	1.4	5515264
162	127	4	1.5796975610826416	Move spend worker growth anything star question.	1.9	6078464
213	798	10	1.2366722117633888	General issue yet rock book role trip. General peace compare nation wait.	0.9	4994048
224	669	7	1.0785732767200076	\N	1.0	6677504
9	515	5	0.6553072551715945	\N	1.6	2500608
210	631	6	1.475767753701894	\N	1.2	6071296
90	261	9	0.6959784112778098	Street soon already sense. East throughout give happy.	1.9	3000320
206	250	5	0.6895088209294773	Difficult consider brother. Way me participant couple try pick move.	1.4	3079168
187	300	6	0.6744725947507003	\N	0.8	2278400
35	917	7	1.1204196360025407	Piece own approach go century bit. Laugh reality side friend less create assume action.	1.8	6791168
4	1015	3	1.2828202849976733	\N	1.4	3037184
206	241	7	1.3102780476854732	Respond social sometimes spend hear institution.	1.5	5669888
194	146	6	0.9361279941202897	Buy or population establish offer nothing suffer.	0.5	4349952
5	536	2	0.5703455895252981	\N	0.5	3563520
106	889	6	1.948673993169651	Military school specific traditional area hold research.	1.1	2003968
218	840	8	2.121314181016886	\N	1.9	6340608
211	557	6	1.7616979598439944	Tell small rest benefit term.	0.6	3303424
151	752	10	0.6909244951374562	Manager third follow school decade behind leg. Woman much good you street condition only move.	1.4	2156544
160	792	3	0.30670637447292637	Crime ever well eat. Include store condition thought during.	0.5	7072768
144	694	10	0.027580668642238317	Maybe difficult institution number brother. Several former itself check weight.	1.4	6439936
154	156	3	1.3618536681275863	Upon then section drop language.	1.8	4174848
133	10	8	0.2654555055984017	Cost military challenge present meeting old.	0.6	7361536
196	688	7	0.6974728604842823	Necessary term building where even agency. Not record their well simple.	1.8	1933312
91	1028	7	0.7653986300565926	\N	1.0	1645568
168	948	3	2.0498324266542873	Can identify too simple now easy.	0.5	208896
22	20	8	2.4674402901775903	Industry bill between coach left. Into time push.	0.9	5667840
62	357	2	0.7958207250337642	Win firm weight paper effort activity activity.	1.5	4306944
83	1022	3	1.8391764713264334	\N	1.0	4301824
122	617	8	0.7035458518139729	Whether site at onto person central.	0.7	6265856
152	981	10	0.5647772181796222	Attorney give prove home affect follow. Film wide crime report.	0.6	6572032
194	144	10	0.3872307018981364	Foreign other once system quality relationship maintain without.	1.9	4797440
221	484	10	1.3337332966375686	Than indeed difference ball recent group.	0.8	2890752
90	240	7	0.24276282998393325	Light happy money usually reflect watch.	1.6	7240704
87	1039	4	1.4462581547282003	\N	0.6	6216704
110	737	5	0.39137776068529034	Wall ever information once. Choice example treat citizen some task.	0.7	805888
146	657	2	0.4994242164611811	Age deep major huge agreement sister policy.	1.7	167936
192	605	5	1.9805651344227844	\N	1.1	2886656
170	949	7	2.4446363133744757	\N	0.9	2055168
247	737	6	1.1173653490558881	\N	0.6	5005312
18	223	4	2.4321414895860842	\N	2.0	3004416
198	236	10	1.3488464529723927	\N	0.9	8185856
29	978	8	0.6413416980064538	Specific address follow finish seven school.	1.8	6140928
157	1002	9	0.5550078333845121	Later lead program far open office natural.	0.8	2159616
202	605	5	1.9787152479849885	\N	0.8	963584
222	630	6	1.7990130287937796	Air by only art allow per.	2.0	3907584
124	732	6	0.6914626686373361	\N	1.0	4921344
187	320	1	2.31598030192966	Across already offer cup low air.	1.0	4429824
17	560	1	0.1638953137053375	\N	1.8	3093504
27	840	6	0.3574197471360419	\N	0.7	4937728
108	731	9	2.232729513771646	Kid without beautiful they nor direction ok low.	1.3	773120
112	198	1	0.0022729786670038	School discover true enjoy them ahead shoulder. Cup wind happy few second information owner.	1.9	8194048
204	1024	7	0.513559205571182	\N	1.3	5751808
218	838	8	0.5826268955800855	Difficult how travel society try commercial.	1.5	4304896
87	1034	7	0.35392826396391236	\N	1.8	1764352
143	669	6	0.2451673335144824	\N	1.7	378880
217	565	7	0.269652971225909	\N	0.7	6802432
214	471	5	2.1416307280686535	\N	1.2	844800
65	151	3	1.1475506214870126	\N	1.2	5056512
153	515	2	0.3131617956026397	\N	1.1	3621888
168	942	1	0.23822933141493782	\N	1.7	648192
132	137	1	0.47306250458532373	\N	0.6	898048
153	517	9	1.0577878310794837	Moment return anything them including animal.	0.9	377856
144	691	6	0.8014185885241263	Form various become dark.	1.8	2538496
82	480	3	1.9899166922885774	\N	1.5	2042880
77	533	8	0.7804808191292468	\N	0.6	5683200
104	23	1	1.2910283034524859	East long structure single. Firm cost institution miss enough.	1.8	4942848
227	228	5	2.2154510272024015	Face late lay gun.	1.3	4157440
239	131	1	0.6056443424235098	Forward own physical kitchen general analysis lawyer.	1.8	825344
30	1040	8	0.05390135727254025	Resource with into create color.	1.9	125952
42	985	1	2.130207778233857	\N	1.8	1605632
194	130	4	1.7667152986592662	\N	1.4	6790144
217	564	2	1.3820143109866976	Specific north least. Evidence long mother sound.	1.0	6760448
231	160	6	0.7612465522920785	On back service local trip sense. Whose energy political race protect identify off.	0.7	5787648
94	663	7	0.6198628741533653	\N	1.5	651264
243	612	7	1.0065795201684653	\N	1.5	8002560
34	864	2	0.886454639590197	\N	0.6	5790720
77	545	5	0.8513077933354872	\N	1.0	7618560
190	554	4	0.6232764533285412	Wear this mean information.	0.7	6212608
178	1002	3	0.8509343955300356	Minute PM worry smile fight. Send hope bank purpose ten different.	0.8	3985408
142	851	2	0.7638348938446109	Cover despite ground fill add million series.	1.2	5199872
145	1043	4	2.552828252189654	Understand anything security up bad well.	1.5	6123520
163	69	9	1.8115874301658175	Public analysis garden can realize cover simple.	0.7	648192
190	531	6	0.7744442187935715	\N	1.5	1217536
54	774	3	1.193732855516218	Race interest direction score deep field.	1.9	703488
211	547	1	2.0648167148560304	Thing growth field. Help policy list trip story size.	1.2	8035328
193	185	1	2.2503985734784053	\N	1.6	2043904
100	22	3	0.3635466315947924	Your class candidate office test social.	1.2	2952192
1	563	1	0.34469977348101566	\N	1.5	5780480
194	131	6	0.9153123233583161	\N	0.6	5101568
75	156	3	2.314607279487498	Religious such establish do.	0.8	1622016
86	625	5	1.0673840770748941	\N	0.8	6809600
54	768	2	1.4722036764254167	Dinner rate serious million force.	1.8	5028864
198	254	6	0.28473403215558957	\N	1.7	3052544
230	55	3	0.3136217164142525	\N	1.6	1564672
234	290	10	0.7121708150371182	End produce receive society or.	1.4	4599808
105	965	2	1.1850255923098865	\N	0.5	1654784
68	597	1	1.6548626648302607	Finally work concern. Education detail now phone.	2.0	2831360
245	56	1	0.4622339967329479	Clearly far respond help.	0.7	2761728
31	276	1	2.1872833904776505	Full forward each subject choice society. Force direction note wife however.	0.5	7479296
36	526	5	0.1977629816566735	\N	1.9	5910528
68	602	5	0.7646137293389206	\N	1.7	1693696
26	521	5	0.12275832553164835	\N	1.1	5911552
220	417	6	0.34346899585545854	\N	1.6	7757824
27	845	7	0.5895773832472017	\N	0.6	6192128
189	44	4	0.45380199407465005	\N	1.9	7127040
96	563	10	0.2325192229722153	\N	0.9	5335040
240	193	3	0.034704134375655116	\N	0.7	1622016
199	736	3	0.9436917435764436	Staff amount may station interesting suffer maintain.	0.9	5833728
204	1009	2	0.1840232804169148	\N	1.0	2831360
234	293	8	1.1642716731379719	Recognize sport hot season realize. Game official fund player.	1.0	5841920
245	52	6	0.6706323368609837	Often student movement special no.	1.3	3822592
154	164	3	0.990239603080604	Single several these send worry chance certainly table.	0.7	5246976
97	176	3	0.6863267972364788	Goal receive way machine place without way.	0.7	3211264
77	532	9	1.6094153246677236	Fear picture deep take matter series.	1.9	7964672
28	705	5	0.4471773973498693	Glass management course role specific.	0.7	5337088
245	44	10	1.8973018113606304	Amount cause wrong out agreement their.	0.8	4641792
183	526	4	1.0759540040747737	Off able their rather especially.	1.0	6737920
105	955	3	1.0901256413193943	\N	1.0	5203968
8	97	7	2.043402778864489	Medical well sing area measure head lead.	1.5	1837056
43	825	6	1.064446168283516	Go most body ready check.	0.8	1637376
155	588	3	1.0285904718391754	\N	1.8	4550656
233	741	1	0.6169168815249274	Situation feel interview teacher place hear.	1.3	5241856
175	572	1	1.3602331188085037	\N	0.5	4111360
146	639	8	0.7375972627125852	Friend sell reality can whatever a say.	1.8	2733056
97	190	5	1.6091703475198476	Item religious certain budget time small available.	1.0	7368704
128	769	5	2.5189916333830396	Employee operation chance bit step gun song challenge.	1.3	6694912
94	668	3	0.032239502576785775	Way important find rise. Break sit themselves agreement cut.	1.4	8015872
160	782	7	0.5183323655226818	\N	1.6	1628160
83	1024	10	0.6652922034618458	\N	1.9	543744
194	147	5	1.9797581961600357	Plant edge one similar first film.	1.7	2466816
244	91	10	1.1818838952589974	Worker avoid world any factor.	1.5	7077888
162	128	8	1.0908875617606395	\N	1.9	4306944
144	683	1	2.2359786669531934	However condition ability natural indicate they idea stage. Present possible board gun figure in make common.	1.8	3501056
88	203	9	0.35575045413342077	Deep glass trade argue. Feeling read your.	0.7	2095104
166	616	8	1.9502764607488754	Require kid event. Area worker front offer involve budget Mr can.	1.7	4964352
244	93	6	2.591256392441717	Machine support baby turn language reach quickly. Must open hold.	1.7	2180096
87	1029	3	1.9262406913817987	Group fast more that step.	1.5	2355200
141	198	4	0.30195957621746206	\N	0.6	2615296
45	926	8	0.3220374225343856	Million weight heart notice.	0.5	5566464
82	487	4	0.11467268298239519	\N	1.0	3271680
160	789	7	0.9357346976300912	\N	1.8	4569088
127	941	10	1.782912991346412	\N	1.7	6072320
134	585	3	0.7658833370688661	Accept item tree begin. Effect pull ahead role road show.	1.1	3963904
206	239	7	1.7535032526476155	\N	1.4	1560576
133	27	10	1.1003053835654375	Year nearly avoid night nearly little outside though.	1.3	7174144
49	502	9	1.3978661250936824	\N	0.8	1075200
145	1036	3	0.906824137415779	\N	1.3	2275328
18	216	6	0.9050752558797098	Order fly resource enter when say single training.	0.7	5571584
60	494	8	0.7443391875243678	\N	0.7	6517760
54	771	4	0.6905832707252176	Large medical deal standard mention.	0.6	867328
29	988	9	0.1506446469861228	Girl set themselves allow myself smile. Television individual suddenly article anyone art address.	1.6	8050688
247	735	6	0.6883777597742201	\N	1.4	5528576
111	783	3	1.1681937001101512	\N	1.0	8289280
140	447	8	0.05733523714285175	\N	1.5	6408192
188	709	3	0.4963910399923235	\N	1.5	1536000
91	1042	8	0.26788403618721013	Democratic image box cold miss center.	0.8	7327744
6	587	9	1.496362118545082	Current my point store small. Environment important wrong ask natural purpose natural.	0.7	6607872
8	114	2	0.5174770366713021	Model garden mission land improve firm these sense.	1.6	7642112
96	568	1	0.6140610638983022	Buy this safe oil.	1.1	3957760
177	186	8	1.0080361007944192	It kind contain system sea election.	1.3	6610944
227	217	10	0.4136298747254718	\N	2.0	1130496
182	621	3	1.690575236799304	\N	1.1	7640064
245	33	5	1.4538336333945392	\N	1.3	8225792
233	740	6	0.5790297436994756	Decade reason bag.	1.8	3479552
115	767	1	2.48510275722571	Billion others total job car. Walk lose soldier recognize yes over.	1.9	6835200
41	652	10	2.5681220247861556	\N	1.1	4692992
73	662	7	0.05034569587807449	\N	1.3	1418240
93	689	7	1.3359177321572464	\N	1.8	874496
109	591	5	0.6993553783477823	Shoulder water probably type government.	0.6	4535296
237	791	10	1.7648760151071825	\N	1.5	3393536
184	1010	5	1.4255687507715162	\N	1.9	2055168
85	356	4	0.4360570644889311	Lose glass political full. Participant imagine cover and.	1.9	3022848
144	681	2	1.5423899666463063	\N	0.9	4931584
245	39	3	0.5207988722719865	Few assume keep kitchen light remain.	1.2	2718720
93	693	6	1.9884933566261311	Together structure forget right plan performance.	1.5	1532928
6	591	4	0.6998716000004777	Common cold notice bit during actually.	1.6	8077312
5	529	2	0.7838867836391872	By buy keep listen. Because rule have.	0.8	4501504
27	844	4	0.23545300501107388	\N	0.8	1657856
80	868	7	0.6948776650051898	Situation short language head seem. Physical agree especially management value hour foreign.	1.5	1921024
125	867	6	0.45128149636840326	Position draw low age card street alone. Something feeling sport lose environment will.	1.8	1543168
162	143	8	0.9789672940229003	Economy mission artist speak say affect three military.	1.6	488448
133	31	8	1.2334829256095106	Note general money.	0.8	6598656
143	674	7	1.283894665835594	\N	1.2	1567744
160	810	8	1.269717859791619	Choice news magazine yourself that.	1.2	7721984
231	163	4	1.6559642557879302	Couple face almost plant red.	1.8	5324800
113	827	5	1.7810693528522985	\N	0.9	608256
128	772	8	1.6652809476816395	\N	1.7	7925760
65	166	9	1.4676384862453473	South just PM specific car.	1.7	3808256
227	216	3	0.1801867154533638	\N	0.6	1134592
194	140	7	0.9414373798845961	\N	1.8	2786304
178	996	2	0.6326926195170991	\N	1.7	6769664
47	295	4	0.4845070424403885	Nor and onto civil.	1.1	2803712
177	176	6	0.784159396388044	\N	2.0	2866176
59	576	8	0.43512094323667866	\N	1.7	4388864
173	869	6	0.1595805207699858	Factor cultural house chance effect.	0.7	4396032
240	199	5	0.13863802125866762	Forget weight article economic.	1.3	659456
8	102	2	0.8108980807563034	During across world assume.	1.7	7072768
8	113	5	0.17893168256618483	\N	1.0	5281792
188	712	1	0.40691042519149667	Spring scene military responsibility key real let. Nothing nation break grow fall laugh dark.	1.0	7870464
112	206	1	2.2690470211703246	Technology campaign or evidence thank.	0.6	2718720
200	516	9	0.9305631557557628	Sound war board agent hand.	1.9	304128
143	664	10	2.2768412377651304	Couple maintain management help care short know material.	0.9	4319232
18	212	5	1.2934585788715363	Any minute impact somebody.	1.2	5486592
8	109	2	1.3508171593332454	\N	1.8	1545216
146	659	3	1.2366802931482415	Daughter begin score sing send appear future responsibility.	1.4	1452032
141	202	10	1.671641664944544	Recently writer can cultural of rise I staff. Quickly group whole necessary fish enough fear.	1.8	2721792
55	29	9	0.053945995265851206	\N	1.1	5440512
231	149	7	0.7547163938915877	Wish song question natural. Home clearly its detail notice effort.	0.5	5529600
102	498	4	1.1945688211668262	Suffer hard nothing spend.	1.5	791552
242	132	6	0.6810763897573383	\N	0.7	2688000
11	665	4	0.037824823936264074	\N	1.0	7629824
179	1005	2	0.3479414883296903	Light wonder sea different.	1.9	3648512
39	385	7	1.7216209134974187	\N	1.8	2269184
211	540	8	0.6312207246148097	Account voice wish difficult order.	0.7	2309120
47	288	7	1.885899186834014	\N	0.7	2859008
211	529	10	0.1849797814409151	I cost take bar.	1.6	5087232
118	325	2	0.17252566704071862	Mrs system indicate first sport full floor.	1.2	7535616
189	47	10	1.9350031689631868	Home yet available white figure according organization.	0.9	2965504
236	907	6	1.5886888708923719	\N	1.7	7854080
174	422	5	1.0623462267103891	\N	1.4	719872
190	555	7	1.412859510617625	Seven nice participant green high recognize.	1.8	1386496
206	259	2	1.362675090600332	\N	1.0	2894848
211	535	2	0.9928440973944247	Direction green consumer down toward still civil politics.	0.8	8285184
77	529	10	1.1951832678127772	\N	1.3	378880
124	733	3	0.6804505257542366	Particular total threat rule window nothing.	1.7	1808384
185	847	5	0.25505387272727054	Different human rich interview improve.	1.0	5496832
211	528	6	2.776957853569996	\N	1.3	4321280
214	476	7	0.9006861443255072	More like note raise dark close.	0.9	847872
39	393	4	0.7609809942932473	Business pick rate card election party rather.	1.6	176128
2	17	6	0.3665573205737969	\N	0.7	3330048
4	1017	6	0.5344336707626144	Mind exactly return series. Someone call grow similar yard cut.	0.6	4518912
31	293	1	2.704096591249691	Would star use sea series study bed.	1.4	4430848
43	827	8	0.4493835129048851	\N	1.4	5285888
225	755	8	0.3005110115067178	\N	1.0	5656576
233	743	8	0.40938568309221335	\N	1.1	1382400
241	771	3	0.10732576301882676	Small world guess.	1.7	5993472
213	807	5	1.5502311705931837	Student item name reduce song music child.	0.9	3552256
118	329	4	0.46881692128655494	Despite read PM rise generation act sport wait.	1.8	425984
43	823	10	0.8949711224026392	Recognize positive decade actually heavy.	1.4	2589696
234	277	10	0.15255568096426764	\N	1.7	5703680
61	1023	3	0.4923029767233168	That movement those rich he. Notice citizen remain speak reduce cover evening.	1.4	858112
67	564	7	0.6016429381393903	Support race draw whom. Simple successful choice could fire even.	1.8	7015424
221	490	7	0.09022156961304666	Project within member appear international.	0.7	3460096
223	798	10	0.9971699822560915	\N	1.3	8026112
14	497	6	0.877250563626644	My song task woman.	0.8	5504000
143	662	10	0.8327183710919682	Budget not point center free clearly training.	1.7	1452032
243	618	5	1.267402877110097	Other today process foot. Sign will another much several.	1.6	3186688
155	586	4	0.43891394262162375	\N	0.9	1792000
165	921	9	0.8118731657345368	Shake picture available try table. Yourself soon yard wear quite what.	1.9	973824
6	590	8	1.2924264231244331	Wind accept official response.	0.6	6594560
55	5	5	1.723743023859081	Sign my raise professor.	0.7	4132864
214	488	4	0.34401690182299527	\N	1.1	4610048
231	168	7	0.8160197370860308	Eye term forward quite democratic. Almost trip cultural hair.	1.6	795648
92	491	5	0.799656726337236	Four every agent finally sea.	1.0	2084864
15	190	10	1.1231519849990454	Write order near education budget leave.	1.1	1348608
59	571	9	0.9478078852517254	\N	1.9	7933952
179	989	3	0.9685108543818963	Mr night people whether.	0.9	8186880
240	201	2	0.1922995694268009	Skin respond while.	0.5	5304320
162	122	5	1.4761913157223685	\N	1.2	7413760
64	564	4	0.3965087890266119	\N	0.6	6414336
62	358	1	0.04144966640159025	\N	2.0	7088128
81	435	3	1.4135935027617395	Chance mean evening woman.	1.2	3971072
152	972	4	0.5844711143076285	Present section letter can.	1.4	6267904
222	623	10	0.47352539543977457	It science image or establish provide.	0.7	8200192
146	653	10	1.0390709119435917	\N	0.7	3857408
103	992	6	0.1266617042508359	\N	0.8	1293312
55	13	2	0.30281699224312714	\N	1.7	4729856
231	151	1	2.151720044662025	Close theory blood course girl fill.	1.2	7931904
132	145	5	1.1699587093081223	Over end baby approach upon miss serve.	1.7	4377600
90	259	9	1.308247993853388	Pattern degree up itself thousand. Available true garden inside beat magazine.	1.1	5744640
176	583	6	1.2041178564065669	\N	1.5	3219456
243	617	4	1.1317113851796754	\N	1.0	1762304
31	265	1	1.191667010193457	Sense enjoy water single skill. Southern news wish news approach detail vote other.	0.8	6925312
123	718	4	0.8118831970672769	\N	0.7	5320704
135	498	6	1.3514930388226132	Answer game effect hospital month ten air. Their agreement discuss worry huge.	0.8	2216960
237	794	2	0.6853819298205278	\N	1.4	1008640
96	569	4	1.4635369175079354	\N	0.9	4597760
221	473	6	0.5869368534660687	\N	0.9	420864
173	871	2	0.0656285631532863	Effort eye evidence imagine watch step.	1.0	1252352
50	734	8	1.7950221424697244	Say respond box party fact.	0.5	6820864
227	234	10	1.9020091419611365	Year try yes mention artist something continue worker.	1.5	424960
214	487	1	2.205781250480826	\N	1.2	4191232
219	906	10	0.39461475928957923	\N	1.2	6937600
151	751	5	0.6573318905369365	Eat difference assume early second nice.	0.6	7263232
160	786	7	0.5473168175562364	\N	1.2	156672
7	828	8	0.9593014317583423	Wear whole let describe local away. Popular keep edge all occur above opportunity.	1.1	7413760
187	310	7	2.2514079365207125	Toward believe style significant ever may idea.	1.7	3150848
235	562	10	1.8472379294820227	He indeed tree stuff which pass whether.	1.5	2288640
160	801	8	1.8864413283910175	\N	0.9	1712128
180	857	1	1.4367487150936087	\N	0.5	3094528
190	548	3	0.04660892155618214	\N	1.7	267264
204	1010	5	0.14373170147701764	Reality health religious during.	1.4	3234816
224	662	6	0.4797867539161662	Find break life.	1.8	6189056
93	683	6	1.2452067217876346	Key always ahead mission itself little other chance.	1.8	5741568
237	802	8	1.2670503363409795	\N	1.2	5555200
239	130	4	2.095996473630347	Agreement with gun the boy.	1.2	2619392
48	350	6	0.49071636911840943	Every new board compare hand.	0.7	7566336
126	633	8	1.6786208928431363	\N	1.6	6412288
24	793	1	1.8583007506998048	\N	1.7	7256064
103	991	4	1.5754713529558768	\N	1.0	7865344
117	850	6	2.018537774399582	Bit truth painting interview where.	1.0	4672512
191	713	2	0.9080484993345694	Husband fact also choice movement necessary.	0.7	5186560
129	2	6	1.8763521689685796	\N	1.7	6096896
64	561	10	1.1913596054828592	\N	1.8	2340864
111	809	7	1.5133721085709448	Pass order while necessary after store town player.	0.9	7589888
24	812	4	0.7597932750609004	\N	1.7	4113408
150	61	3	1.0026563926617402	Star arm budget wall Republican answer TV Mr.	1.8	4200448
194	137	1	0.3613824372613608	Whole citizen world radio fine upon true.	1.2	6213632
99	497	10	0.8200090240784352	\N	2.0	249856
132	147	4	1.3101246980658385	\N	1.0	3072000
153	518	5	0.5437808380655995	\N	1.4	1810432
116	144	3	0.30001957682318414	\N	1.6	3446784
91	1034	1	1.512872236380772	Ok pretty visit health leave evening threat.	0.6	267264
29	981	10	0.10856222699300881	\N	0.6	5063680
197	493	4	0.34003576134916313	\N	1.2	3101696
201	490	8	0.5605568327480662	Class offer season.	1.3	2604032
88	205	7	0.2672980862422622	\N	1.5	3805184
22	9	9	0.9988198266160694	Nice break evening past experience cultural.	1.4	2100224
221	460	8	1.696069834517631	Easy right behavior project avoid arm certainly.	1.7	6779904
43	830	10	0.7905431494368305	\N	0.7	1100800
240	203	2	0.6077389735276283	\N	1.6	6950912
122	614	7	1.1594334669454878	\N	1.2	4316160
46	680	10	1.385341290385871	\N	1.8	5218304
212	863	2	1.8876961782309754	She eight while to direction here.	1.4	4755456
243	610	1	0.2452065945683587	Teach simple hotel special second article.	2.0	1943552
120	606	9	1.484837923951563	\N	1.3	1881088
226	754	4	0.49936226283856067	Executive toward very television.	1.6	7799808
43	837	6	1.1079917736694735	\N	0.5	146432
90	248	1	1.5468369560997028	\N	1.8	2634752
106	883	8	1.836663308040685	Check democratic east meeting free thing.	0.6	3461120
125	864	2	1.9841251374858544	Writer even stay mean investment also.	1.9	5666816
86	631	7	0.9849998777337486	Hear no reveal market sense cost change leave.	1.2	2958336
47	294	9	0.6193433539460682	\N	0.8	6290432
103	997	5	0.4574976045955037	Guy leader open bar writer before.	0.7	1842176
75	166	2	0.5731743900976495	Already society most subject exist give production.	1.6	655360
210	625	2	1.0773824944000885	\N	0.9	737280
41	656	6	1.9944429691660421	\N	1.1	4384768
206	256	1	0.8671213746304032	\N	1.0	2641920
10	856	9	1.4123463315883706	\N	1.9	3873792
38	662	5	1.2920605146366027	\N	1.4	7389184
209	685	9	0.16944859702623855	\N	1.5	3022848
162	140	9	0.6134628763802537	\N	1.9	1657856
39	409	3	0.5550288425459531	Soldier despite require.	2.0	6950912
75	158	2	0.9327772115511901	\N	1.8	1978368
213	790	7	1.128839229160441	Tough attention agree young campaign bill forget.	0.6	1656832
222	636	8	0.4569005855219975	Attack sort vote likely upon tend person. Professional pick product.	1.5	8071168
57	253	1	0.6818267722326792	\N	1.3	7128064
77	542	4	1.4357783128125992	Bad matter bad outside space item side. Approach country ready top deal.	1.2	561152
168	941	1	2.553251343202581	Really past maybe leave both.	1.7	4346880
90	235	7	0.2851768854351403	\N	1.0	4838400
184	1015	10	0.254472942713837	American wait author own city.	0.7	1852416
31	285	4	1.0708546117377826	Loss question else better player decision college.	1.0	6620160
128	774	9	1.6339118269884716	Western wide attention surface leader speak.	0.8	7027712
199	739	10	2.087403027326138	Eight really wait concern.	0.8	2072576
101	809	8	1.5278775863291103	\N	0.6	1887232
36	523	9	0.7378353478350047	Item long have indicate effect list majority.	1.4	6032384
134	581	1	0.02910010625903521	President individual test country according.	0.6	4196352
88	199	3	0.9432788878746172	\N	1.5	5984256
33	921	7	0.9987670893091961	\N	1.4	7631872
90	239	6	1.6351390485988577	\N	1.7	7255040
164	915	6	1.5670223952312874	Enough close along leave. Sport charge always next citizen manage.	1.2	7003136
115	761	3	2.1975508369161445	\N	0.9	4685824
120	602	10	1.4318661505846813	\N	1.2	4513792
29	977	5	1.2373267839109086	Student box peace political campaign task maybe political.	1.9	4489216
2	24	7	0.13353779061353832	Over officer be movie same language nature.	0.8	5088256
123	717	4	0.22051522126231132	Together form eight.	0.9	721920
227	214	2	1.9177312907448072	Open consider skill assume win.	1.6	4182016
168	933	4	1.3070542187788798	\N	2.0	7386112
13	111	5	1.7753268913527134	Author item scientist improve me industry science.	0.6	5787648
215	37	4	1.5394228946939241	Success very house learn industry.	1.7	7318528
79	411	8	1.4190257726967113	\N	1.5	6379520
237	807	8	0.06337765404432645	\N	1.4	6162432
111	790	7	0.2299187583700839	\N	1.7	7257088
135	493	10	1.0162053611506823	\N	1.2	2004992
135	495	7	0.47926117139679986	\N	1.5	1854464
165	919	4	0.023315239226434456	Product keep kid by huge situation.	1.3	6819840
85	352	4	0.6132213446441354	Defense building size hotel political someone.	0.8	972800
157	989	7	1.00074785783167	Research mind grow there image mind often near.	1.2	3646464
140	449	2	1.1539119385889243	\N	1.1	5849088
120	609	10	0.49347980000373676	\N	0.6	2704384
244	107	10	0.003201994000578301	Friend sometimes word computer mention talk mouth manage.	0.6	4550656
75	171	7	1.0336887070044638	\N	0.6	7950336
234	295	8	0.26047579676957394	\N	0.9	4996096
90	249	7	1.0780172673899293	\N	0.6	251904
13	94	4	0.15057076601460587	\N	1.6	7680000
87	1043	6	1.3568607380849513	\N	1.1	685056
189	33	8	0.676999883601923	Painting age stop heavy character prepare. New bed loss avoid poor if.	2.0	8132608
217	563	1	0.17764134617491525	Certain big five police.	0.9	3909632
94	672	9	0.9057548467982306	Yeah night tax.	1.4	3391488
123	720	3	1.0398271501853362	Behavior group per organization.	0.8	8211456
214	462	5	0.376754795925946	Across stock mother agree.	1.6	1931264
194	126	8	0.3071731517602039	Exist keep billion finish machine than.	2.0	8116224
150	81	1	0.2915376700631812	\N	1.4	2132992
198	235	7	0.5623438800194563	Cut another seek especially detail herself.	1.0	7309312
86	626	4	0.1252808486428478	\N	0.8	4623360
246	567	1	0.9472623528788163	\N	0.7	7976960
199	734	5	0.13261656000481986	Government career although treat.	1.1	448512
111	784	7	1.0216389788733191	City ever long you peace.	1.8	1328128
49	500	5	0.14160424597664634	\N	1.7	6410240
163	79	3	1.5718608253281479	Executive challenge else animal figure such culture.	1.5	2888704
163	82	3	1.1062180739363128	Page my road experience traditional view. Lead east be half stand population Mrs.	1.9	1620992
50	742	3	1.16105207148506	Civil just knowledge four issue.	1.8	6478848
15	189	2	1.706222566860096	Against help defense near music many society.	1.2	1660928
56	636	5	1.1262051445956807	\N	1.2	3794944
216	702	5	0.9399610772184266	Safe way physical despite your political.	1.1	3116032
119	158	1	0.3574364689916999	Smile religious throw institution than. Fact market health customer.	0.6	2326528
113	830	3	2.67879710071568	Move draw impact tend.	2.0	3926016
93	681	3	1.4404365329976039	\N	1.0	1730560
54	780	4	1.6985155179827927	Debate could hair current.	2.0	5569536
145	1028	9	1.0968032585019396	President water executive total decade style.	0.8	1457152
162	117	9	1.6081737115820103	Health report read meeting.	0.8	3352576
115	777	1	0.6898321419177098	\N	0.9	8276992
236	903	10	1.0194167001207712	Want claim would everyone example meet ever. Yard popular explain.	1.7	6861824
231	164	4	0.9235665685946087	Child forget something course newspaper.	1.1	465920
45	924	1	1.3637530396203588	\N	1.6	7949312
41	650	1	1.7091939567213736	Apply store structure recently listen arrive decade. Him subject mean method simply.	0.7	2653184
57	247	2	0.6878455123545639	\N	1.5	6686720
179	998	10	0.7103267774315866	\N	0.9	2600960
113	820	10	1.803245258579339	\N	1.8	331776
88	208	4	0.6779252073785486	To ahead shake wait sure.	1.2	7119872
112	196	3	0.218739637156876	\N	1.5	670720
237	790	8	0.6272840864096801	\N	1.5	5493760
145	1035	4	1.8002166961478592	\N	1.1	6927360
104	18	3	0.7876385564638668	Include scientist action such.	1.0	2430976
105	960	9	0.5208322978115263	Skill friend behavior in government case answer. Less marriage check he.	1.5	3736576
245	38	10	0.33445528687561876	\N	1.2	1917952
18	233	8	0.3815638462685911	\N	1.9	8148992
131	204	1	1.0846093537122732	\N	1.1	7495680
38	677	3	0.16139567111411351	\N	0.6	1905664
62	351	9	0.07591371040480233	Rest question work beat debate.	0.7	7186432
184	1026	8	2.0355303812256467	Benefit hard difference should low seven.	1.0	7204864
43	814	9	1.121134303562357	\N	1.7	7090176
121	742	9	0.07753552851319347	Goal feel other easy better order dream.	1.4	2637824
199	743	10	0.5781567650976849	\N	2.0	824320
225	757	6	0.3680438410801904	Anything win performance summer agency. Bar she mean nation near.	0.9	5298176
84	497	4	0.951098066876726	Wait gun doctor short difference discussion.	0.7	2378752
161	121	8	1.349367102512287	\N	0.7	619520
201	462	6	1.56807833514553	\N	1.5	7879680
229	699	9	0.6278221619544766	Reflect help threat art.	1.6	7885824
112	204	1	0.8478984051244242	\N	0.6	688128
227	213	9	1.3536274543385218	House create someone magazine over bad respond nothing.	1.0	8086528
91	1038	7	1.9020338921317228	\N	0.7	1174528
47	265	9	1.159684973220876	\N	1.2	6334464
45	922	6	0.1888915781786988	Others heart family former black operation other.	1.2	2710528
55	24	10	0.7686451585178806	Skill pattern image instead.	1.8	3378176
36	522	8	0.6461155177370506	\N	1.2	4368384
114	1030	7	1.1914178229026025	\N	1.5	1088512
24	797	9	1.8768213451880513	\N	1.0	5696512
100	21	7	1.4379501520966818	\N	1.0	565248
158	684	7	1.6613804664519272	Degree learn least on. School drug culture stuff democratic.	1.8	765952
35	915	2	1.5155087202944593	\N	1.9	4375552
146	646	3	0.5360235439616073	\N	1.8	720896
242	129	2	0.40695973261372104	\N	1.1	3533824
222	625	7	1.8570797467577709	Through arm instead message day treat. Hand want worry rate.	0.6	4329472
7	829	7	1.1116670118895982	\N	2.0	7949312
237	783	2	0.5077508484689032	\N	0.6	2692096
77	548	7	0.42787794324822653	Crime sit administration positive often black.	0.6	6227968
90	262	9	1.150931391170949	Behavior usually character power building edge dog.	1.1	5980160
94	675	8	1.3759416222157224	Customer a little raise weight.	0.7	1710080
30	1034	9	1.727737583227666	\N	1.4	4609024
97	183	1	2.2811194707401494	Gas girl writer.	1.9	6851584
170	948	10	0.1899802889957982	Current fire whether arrive allow.	1.4	478208
18	222	4	0.003939541970471927	Law themselves against thought theory approach.	1.9	6316032
207	497	7	1.1158167087155564	Pull rise catch possible unit cause.	1.2	6877184
206	253	3	0.4420032788128771	\N	1.0	816128
72	437	7	1.0109790051539376	Offer course grow send. Shake market back me.	1.2	2137088
108	737	1	0.6676448330309065	Model history rise friend represent feeling after. Eight read bad six information center once.	1.0	8184832
231	172	1	0.7205756826468782	Whether none certain phone foot mission building. Evening street long skin.	0.6	945152
118	332	8	1.1174021433598844	Number either staff trade hot player.	1.0	1582080
33	930	8	0.3846614132086478	\N	1.9	1941504
162	141	7	2.315642642569633	\N	0.8	2812928
246	560	2	1.050446269578287	\N	1.8	3750912
102	491	5	0.14519777177400262	\N	1.5	1204224
184	1022	10	1.6334354072938018	\N	0.9	7296000
50	735	9	0.4596504823885636	Spend decade crime factor health.	1.0	6884352
119	157	2	0.18716405779368409	\N	1.2	4759552
129	28	8	0.22805821408271446	Responsibility board lose focus society world thing. Plan stuff security art both gas couple.	0.6	5405696
21	623	8	0.31275021771625555	\N	0.6	1234944
106	878	10	0.6766757610523448	\N	1.3	1030144
23	616	4	1.3326047671886778	\N	1.9	1071104
22	8	8	0.6410421664597841	Thousand agent civil.	1.2	4235264
156	13	2	1.0717737455801275	\N	1.8	812032
24	782	7	2.1663733200072586	Purpose sea how ground present understand.	0.9	6002688
119	149	4	0.7400114917792364	Work employee sign yard learn. Within be remember.	0.6	3264512
177	185	2	1.905135919534411	Across ground social let. Management style thank indeed leader expert miss.	1.2	4593664
72	426	10	1.9663329381383046	Accept arm song brother.	0.8	1765376
55	14	7	2.4445871815229006	Quality question close hospital article six. Where camera television tend.	0.6	4391936
72	448	10	0.40850142842592035	Suddenly use response kid. These wide build point focus.	1.2	2392064
159	845	5	0.7052160111809446	\N	1.7	3621888
128	767	8	0.5216959880316123	\N	1.8	5702656
247	739	10	1.2340204758566198	\N	0.7	2938880
\.
COPY submit_results (submit_id, score, status) FROM STDIN;
142	0.7065790370447144	2
131	0.8988676786445009	10
138	0.8280397962912951	4
235	0.8030125427973097	7
154	0.7745339985337291	6
119	0.28992476996784866	8
122	0.3771925875732385	4
246	0.6001036749446811	8
27	0.5858194598471449	8
218	0.20572114480408543	3
135	0.6557691232433441	2
145	0.18750987214237902	9
160	0.26580499724611717	4
44	0.5829134539892835	2
231	0.4219641205107786	9
242	0.8734949270861231	10
128	0.5070213439362461	8
1	0.04520212637409027	9
26	0.5395554679331148	6
65	0.9811991260167225	8
95	0.05313508789186361	8
205	0.6033948239087408	3
229	0.6416394225073412	6
45	0.416841492818506	1
130	0.6049013934454047	3
36	0.1691131613028981	3
103	0.6981419306169013	9
240	0.2550468663774518	2
78	0.236862042628036	10
136	0.009034807124584043	7
41	0.5106643204285433	10
223	0.2063257297157972	3
23	0.8889346300632753	5
49	0.509809713867491	7
107	0.4983154030039708	4
196	0.8912477915423316	1
11	0.4467965529609257	1
87	0.024368495268072055	6
85	0.4534447345145458	1
148	0.6797272267536044	8
163	0.5210367116294644	6
199	0.9517203995406107	8
221	0.9649155680828225	9
64	0.9197912525268161	8
72	0.27270547457107763	4
194	0.22572013888282294	1
102	0.9216034129355336	8
245	0.889846257977253	1
56	0.8400653242291948	9
70	0.9902890837965496	1
207	0.33140905658285047	8
77	0.490940818171708	7
230	0.7932099135837475	8
96	0.6346271404741082	7
3	0.08725494556464275	4
37	0.00446052312192835	7
172	0.7497455248204784	2
20	0.8551814674963759	10
81	0.37858435341639385	5
180	0.3835140105722765	6
161	0.6062846476661031	5
159	0.3249036608337663	10
21	0.7267782925062114	7
74	0.9423744655931606	5
50	0.9977162465263781	10
66	0.6333797150488831	3
52	0.9113924431125345	1
144	0.4517212456349071	9
177	0.00038392714430668384	1
184	0.6836277950427486	2
202	0.9158439597374138	1
31	0.8102347495902701	10
219	0.9187712737996231	9
149	0.5228615209834107	4
13	0.9921425061996645	4
175	0.33033496956947095	1
112	0.5365825080352062	8
51	0.25475838157794284	10
155	0.5132079795575656	3
123	0.6582856797299097	5
233	0.5849203117015179	3
9	0.8757855135701703	8
200	0.25313241911021955	6
4	0.45613100288329755	2
179	0.5700951170387454	6
62	0.6216377795273996	5
91	0.9558098056645276	3
150	0.8610652557091014	6
58	0.3942052010329682	2
226	0.056990826722690735	10
63	0.8785825622452763	10
143	0.5477820270582701	3
30	0.10668285207366668	3
115	0.7298782057717481	6
125	0.07767755946024002	5
127	0.7117377423894496	1
168	0.5092015716174583	5
28	0.05032183349503361	8
60	0.6165218608181566	1
224	0.22403070494790023	3
40	0.4319949763212345	8
69	0.0508800234490312	9
84	0.15828445789695744	8
68	0.8745624611267976	5
104	0.40421966423759814	5
146	0.26507491847506426	2
14	0.7513044264977738	2
99	0.6965454810753796	3
201	0.9684743639267503	5
42	0.33779045403768904	3
6	0.3456708315651139	4
171	0.7694651864039534	7
46	0.30990732218282446	2
57	0.2979572589677678	1
12	0.5613731449786791	5
47	0.04777103673627836	7
237	0.9363771773297271	10
105	0.7232294245107894	7
176	0.7271055250727066	5
117	0.7699474212119051	3
22	0.7166251071817173	7
187	0.8719636015774727	3
228	0.7062233324905748	9
140	0.4409791175349934	5
82	0.019482649009711306	1
153	0.9156154588741436	2
8	0.5937333513407399	8
211	0.0018871229080043017	4
244	0.3785373217862855	4
208	0.19319965256692162	8
15	0.8003755787039295	6
183	0.8961894184241012	8
241	0.696564681679673	2
197	0.5474547905587861	8
111	0.8626515293824952	10
71	0.6670289789865693	7
94	0.6501777364925896	4
93	0.15007974287623693	10
236	0.41654373773057307	2
76	0.748723917713669	6
108	0.14989372019380154	2
98	0.1054228523937566	4
10	0.2810819973432912	3
33	0.8704815013967427	4
166	0.06615422647475444	10
126	0.5652187685553228	7
212	0.2427946901183824	7
97	0.08430709317971541	3
174	0.21862695920434583	2
53	0.01550533313071667	8
19	0.7326828646384009	9
29	0.561039011342573	6
88	0.5635634208790753	8
86	0.5060742998528176	8
121	0.6363628500690551	5
222	0.17619209937586744	8
139	0.6251894293900585	9
157	0.739891704961815	10
114	0.49098004483549285	2
43	0.07121578945426565	8
165	0.6025326147956197	1
248	0.9972798074038585	5
89	0.5425070046130543	3
61	0.9004184953133306	8
206	0.022768049568566928	6
100	0.0887560295762988	8
32	0.42760877701198863	9
169	0.9978100451137802	3
209	0.18179227963495437	4
220	0.0030367408110006933	6
109	0.8052691718247863	1
225	0.9721165924690267	3
141	0.785908805005015	5
116	0.8076829374739753	8
59	0.5596955221160589	1
156	0.3579301676143837	4
182	0.9118936457321135	1
210	0.4096957564313398	4
132	0.46122927603651553	1
181	0.8532475177389546	1
170	0.09638752030881181	9
190	0.5941604333809498	8
73	0.44768174464019805	3
120	0.0556059261617049	9
2	0.1484945536701885	7
5	0.6031038487787551	4
134	0.8905170039876182	5
186	0.46592185444813905	9
18	0.3934517843705545	5
178	0.19375116524657554	3
173	0.017979220540329854	8
192	0.3987050213389095	10
213	0.2637577786740274	4
67	0.21445803210955228	9
110	0.7089351633114788	7
\.
