-- Create A Students Table Using The Required Field;
create table students(
    student_id INTEGER PRIMARY KEY UNIQUE,
    student_name VARCHAR(50),
    age INTEGER,
    email VARCHAR(20),
    frontend_mark INTEGER,
    backend_mark INTEGER,
    status VARCHAR(10)
)

-- Create A Courses Table Using Those Required Fields;
create table courses(
    course_id INTEGER PRIMARY KEY UNIQUE,
    course_name VARCHAR(50),
    credits INTEGER
)


-- Create A Enrollments Table Using Those Required Fields;
create table enrollments(
    enrollment_id INTEGER PRIMARY KEY UNIQUE,
    student_id INTEGER REFERENCES students(student_id),
    course_id INTEGER REFERENCES courses(course_id)
)


-- Insert Given Example Student Info To Students TABLE;
insert into students(student_id, student_name, age, email, frontend_mark, backend_mark, status)
            VALUES
            (1,'Sameer',21,'sameer@example.com',48,60,NULL),
            (2,'Zoya',23,'zoya@example.com',52,58,NULL),
            (3,'Nabil',22,'nabil@example.com',37,46,NULL),
            (4,'Rafi',24,'rafi@example.com',41,40,NULL),
            (5,'Sophia',22,'sophia@example.com',50,52,NULL),
            (6,'Hasan',23,'	hasan@gmail.com',43,39,NULL)


-- Inset Given Example Courses Into Courses Table;
INSERT INTO courses (course_id, course_name, credits)
VALUES
    (1, 'Next.js', 3),
    (2, 'React.js', 4),
    (3, 'Databases', 3),
    (4, 'Prisma', 3);


-- Inset Given Example Enrollments Into Enrollments Table;
INSERT INTO enrollments (enrollment_id, student_id, course_id)
VALUES
    (1, 1, 1),
    (2, 1, 2),
    (3, 2, 1),
    (4, 3, 2);


-- Query (1).Insert a new student record with the following details:
insert into students VALUES(7,'Arafat Sabbir',21,'arafat8@gmail.com',60,60,NULL)

-- Query (2).Retrieve the names of all students who are enrolled in the course titled 'Next.js'.:
select * from enrollments
join students on students.student_id = enrollments.student_id
where enrollments.course_id = (select course_id from courses where course_name = 'Next.js')


-- Query (3).Update the status of the student with the highest total (frontend_mark + backend_mark) to 'Awarded'.:
update students 
set status = 'Awarded'
where (frontend_mark+backend_mark) = ( select max(frontend_mark+backend_mark) from students); 

-- Query (4).Delete all courses that have no students enrolled.:
delete from students 
where student_id not in (select student_id from enrollments);


-- Query (5).Retrieve the names of students using a limit of 2, starting from the 3rd student.:
select student_name from students limit 2 offset 2;



-- Query (6).Retrieve the course names and the number of students enrolled in each course.:
SELECT 
    courses.course_name,
    COUNT(enrollments.student_id) AS student_count
FROM 
    courses
JOIN 
    enrollments ON courses.course_id = enrollments.course_id
GROUP BY 
    courses.course_name;


