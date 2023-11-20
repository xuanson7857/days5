CREATE DATABASE QLSV;
SET SQL_SAFE_UPDATES = 0;
use QLSV;

CREATE TABLE Students(
student_id int auto_increment primary key,
student_name varchar(50) not null,
age int check(age>0) not null,
email varchar(100) not null
);

CREATE TABLE Classes(
class_id int auto_increment primary key,
class_name varchar(50) not null
);

CREATE TABLE ClassStudent(
class_id int not null,
foreign key (class_id) references Classes(class_id),
student_id int not null,
foreign key (student_id) references Students(student_id)
);

CREATE TABLE Subjects(
Subjects_id int auto_increment primary key,
Subjects_name varchar(50) not null
);

CREATE TABLE Marks(
Subjects_id int not null,
foreign key (Subjects_id) references Subjects(Subjects_id),
student_id int not null,
foreign key (student_id) references Students(student_id),
mark float not null
);

INSERT INTO Students (student_name, age, email)
VALUES 
  ('Student1', 20, 'student1@example.com'),
  ('Student2', 22, 'student2@example.com'),
  ('Student3', 21, 'student3@example.com'),
  ('Student4', 23, 'student4@example.com'),
  ('Student5', 19, 'student5@example.com');

-- INSERT INTO Classes
INSERT INTO Classes (class_name)
VALUES 
  ('ClassA'),
  ('ClassB'),
  ('ClassC'),
  ('ClassD'),
  ('ClassE');

-- INSERT INTO ClassStudent
INSERT INTO ClassStudent (class_id, student_id)
VALUES 
  (1, 1),
  (1, 2),
  (2, 3),
  (2, 4),
  (3, 5);

-- INSERT INTO Subjects
INSERT INTO Subjects (Subjects_name)
VALUES 
  ('Math'),
  ('English'),
  ('Science'),
  ('History'),
  ('Programming');

-- INSERT INTO Marks
INSERT INTO Marks (Subjects_id, student_id, mark)
VALUES 
  (1, 1, 85),
  (1, 2, 78),
  (2, 3, 92),
  (2, 4, 88),
  (3, 5, 95);
  -- --------
-- 1
select * from Students;
-- 2
select * from Subjects;
-- 3
select AVG(mark) from marks;
-- 4
select s.*, m.mark as mark
from subjects s
left join marks m
on s.Subjects_id = m.Subjects_id
where m.mark = (select MAX(mark) from marks) ;

select ROW_NUMBER() OVER (ORDER BY mark desc) AS stt, Subjects_id, student_id, mark 
from marks
order by mark desc;

ALTER TABLE Subjects
modify column Subjects_name NVARCHAR(255);

Update Subjects
SET Subjects_name = CONCAT('Day la mon hoc ', Subjects_name);

alter table Students
add Constraint age check(age > 15 and age< 50);

alter table marks
drop foreign key marks_ibfk_1, drop foreign key marks_ibfk_2;

alter table classstudent
drop foreign key classstudent_ibfk_1, drop foreign key classstudent_ibfk_2;

delete from students where Student_id = 1;

alter table students
add column status bit(1) default 1;

update students set status = 0 where status <> 0;