create database SchoolDB;
use schoolDB;

create table students ( student_id int primary key, name varchar(50),
email varchar(50), phone varchar(15),city varchar(30));


create table Courses ( course_id int primary key, course_name varchar(50), duration_month int, fees decimal(10,2));

    
create table Marks (
marks_id int primary key, student_id int, course_id int, total_marks int, obtained_marks int, exam_date date);


create table Fees ( fees_id int primary key, student_id int, course_id int, amount_paid decimal (10,2), payment_date date,
status varchar(20));


insert into students values 
(1,"ram","ram@gmail.com","8103570132"," bhopal"),
(2,"aman","aman@gmail.com","8103570321","delhi"),
(3,"shayam","shayam@gmail.com","8103540786","pune");
 select * from students;


insert into Courses values
(101,"Data analytics",4,15000),
(102,"web devlopment",6 ,20000),
(103,"python programming",3,10000);

select * from Courses;

INSERT INTO Enrollments VALUES
(501, 1, 101, '2025-01-05'),
(502, 2, 102, '2025-01-07'),
(503, 3, 103, '2025-01-10');


select * from Enrollments;

insert into marks values 
(901 , 1, 101 , 100 , 88 , '2025-01-05') , 
(902 , 2 , 102 ,100 , 72 , '2025-02-18' ),
(803 , 3 ,103 , 100 ,91 , '2025-02-20');

 insert into Fees values 
 (701, 1 , 101 , 15000 , '2025-01-05', 'paid'),
 (702 , 2 , 102 , 10000 , '2025-01-08','pending'),
 (703 , 3 , 103 , 10000 , '2025-01-11', 'paid');

select * from fees;



CREATE TABLE Enrollments (
    enroll_id INT PRIMARY KEY,
    student_id INT,
    course_id INT,
    enroll_date DATE,
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);

  select * from students; 
   select * from courses;
 select * from  enrollments; 
 select * from  fees;
 select * from  marks;
 
 -- show  students , courses and marks 
 SELECT s.name, c.course_name, m.obtained_marks
FROM Marks m
JOIN Students s ON m.student_id = s.student_id
JOIN Courses c ON m.course_id = c.course_id;

-- students with pending fees 

SELECT s.name, c.course_name, f.amount_paid
FROM Fees f
JOIN Students s ON f.student_id = s.student_id
JOIN Courses c ON f.course_id = c.course_id
WHERE f.status = 'Pending';

 -- course wise average marks ( group by)
 
SELECT c.course_name, AVG(m.obtained_marks) AS avg_marks
FROM Marks m
JOIN Courses c ON m.course_id = c.course_id
GROUP BY c.course_name;
   
  -- top scoring students (order by ) 
   
SELECT s.name, m.obtained_marks
FROM Marks m
JOIN Students s ON m.student_id = s.student_id
ORDER BY m.obtained_marks DESC;

 -- insert new students 
INSERT INTO Students VALUES (4, 'Sakshi', 'sakshi@gmail.com', '7894561230', 'Indore');

-- update marks 
set  sql_safe_updates = 0; 

UPDATE Marks SET obtained_marks = 95 WHERE student_id = 1;


