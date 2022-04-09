begin;

create table contests (
    id integer primary key,
    name varchar(50),
    description varchar(100)
);

create table users (
    id integer primary key,
    login varchar(20)
);

create table submits (
    id integer primary key,
    contest_id integer references contests,
    user_id integer references users,
    problem char(10),
    status char(5)
);

insert into contests values (1, 'Foo 2022', 'Contest Foo w roku 2022');
insert into contests values (2, 'Bar 2022', 'Contest Bar w lecie 2022');

insert into users values (1, 'Jasiek');

insert into submits values (1, 1, 1, 'A', 'ok');
insert into submits values (2, 1, 1, 'B', 'tle');
insert into submits values (3, 2, 1, 'X1','cme');

commit;