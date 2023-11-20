CREATE DATABASE Stud_test;
use Stud_test;

CREATE TABLE Student(
rn int primary key auto_increment,
name varchar(20),
age tinyint 
);
insert into Student (Name, Age) values ('Nguyen Hong Ha', 20);
insert into Student (Name, Age) values ('Truong Ngoc Anh', 30);
insert into Student (Name, Age) values ('Tuan Minh', 25);
insert into Student (Name, Age) values ('Dan Truong', 22);

CREATE TABLE Test (
test_id int primary key auto_increment,
name varchar(20)
);
insert into Test (Name) values ('EPC');
insert into Test (Name) values ('DWMX');
insert into Test (Name) values ('SQL1');
insert into Test (Name) values ('SQL2');

CREATE TABLE Student_test (
rn int,
foreign key (rn) references Student(rn),
test_id int,
foreign key (test_id) references Test(test_id),
date_ date,
mark float 
);
INSERT INTO Student_test (rn, test_id, date_, mark) VALUES (1, 1, '2006-07-09', 9);
INSERT INTO Student_test (rn, test_id, date_, mark) VALUES (2, 2, '2006-05-15', 8);
INSERT INTO Student_test (rn, test_id, date_, mark) VALUES (3, 3, '2006-11-21', 7);
INSERT INTO Student_test (rn, test_id, date_, mark) VALUES (1, 2, '2006-03-04', 10);
INSERT INTO Student_test (rn, test_id, date_, mark) VALUES (2, 1, '2006-09-18', 6);
INSERT INTO Student_test (rn, test_id, date_, mark) VALUES (3, 3, '2006-08-27', 9);
INSERT INTO Student_test (rn, test_id, date_, mark) VALUES (1, 3, '2006-02-12', 8);
INSERT INTO Student_test (rn, test_id, date_, mark) VALUES (2, 2, '2006-10-30', 7);
INSERT INTO Student_test (rn, test_id, date_, mark) VALUES (3, 1, '2006-04-23', 10);
INSERT INTO Student_test (rn, test_id, date_, mark) VALUES (1, 1, '2006-06-07', 8);

alter table Student
add constraint check_age check (age > 15 and age <55);

alter table Student_test
alter column mark set default 0,
add constraint pr_key primary key (rn, test_id);

alter table Test
add constraint check_name unique (name),
drop constraint check_name;

