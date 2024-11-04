-- Query (1).Insert a new student record with the following details:
insert into
    students
VALUES (
        7,
        'Arafat Sabbir',
        21,
        'arafat8@gmail.com',
        60,
        60,
        NULL
    )

    -- Query (2).Retrieve the names of all students who are enrolled in the course titled 'Next.js'.:
select *
from enrollments
    join students on students.student_id = enrollments.student_id
where
    enrollments.course_id = (
        select course_id
        from courses
        where
            course_name = 'Next.js'
    )

    -- Query (3).Update the status of the student with the highest total (frontend_mark + backend_mark) to 'Awarded'.:
update students
set
    status = 'Awarded'
where (frontend_mark + backend_mark) = (
        select max(frontend_mark + backend_mark)
        from students
    );
    
-- Query (4).Delete all courses that have no students enrolled.:
delete from students
where
    student_id not in (
        select student_id
        from enrollments
    );

-- Query (5).Retrieve the names of students using a limit of 2, starting from the 3rd student.:
select student_name from students limit 2 offset 2;

-- Query (6).Retrieve the course names and the number of students enrolled in each course.:
SELECT courses.course_name, COUNT(enrollments.student_id) AS student_count
FROM courses
    JOIN enrollments ON courses.course_id = enrollments.course_id
GROUP BY
    courses.course_name;

-- Query (7).Calculate and display the average age of all students.:
SELECT AVG(age) AS average_age FROM students;

-- Query (8).Retrieve the names of students whose email addresses contain 'example.com'.:
select * from students where students.email LIKE '%example.com'