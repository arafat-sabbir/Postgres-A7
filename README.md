1. What is PostgreSQL?
   PostgreSQL is a powerful, open-source database system. It’s known for handling complex data workloads efficiently and supports both SQL and NoSQL data operations. It’s also ACID-compliant, meaning it ensures data integrity with Atomicity, Consistency, Isolation, and Durability.

2. What’s the Purpose of a Database Schema in PostgreSQL?
   A database schema organizes and groups tables, views, indexes, etc., within a database. Think of it as a folder structure that keeps things organized, prevents name conflicts, and manages data access for different users or applications.

3. Primary Key vs. Foreign Key
   Primary Key: A unique identifier for rows in a table. Every row must have a unique, non-null primary key. Each table has only one primary key, but it can be made up of multiple columns.
   Foreign Key: A column that links one table to another by referencing the primary key of another table. This helps maintain referential integrity between tables, ensuring that values match up.

4. CHAR vs. VARCHAR
   VARCHAR (variable-length): Stores text up to a max length you specify. It only takes up as much storage as it needs, so it’s efficient.
   CHAR (fixed-length): Takes up the full space you define, padding shorter values with spaces. It’s useful when you need consistent length, like country codes.

5. Using the WHERE Clause in SELECT
   The WHERE clause filters rows that meet certain conditions. It’s used in SQL to only get back data that matches what you need.

sql
Copy code
SELECT \* FROM students WHERE age > 18;

6. LIMIT and OFFSET Clauses
   These are super handy for pagination:

LIMIT: Sets the max number of rows to return.
OFFSET: Skips a specified number of rows before starting to return rows.
sql
Copy code
SELECT \* FROM students LIMIT 10 OFFSET 20;
This retrieves 10 rows, but only after skipping the first 20.

7. How to Modify Data with UPDATE
   The UPDATE statement changes existing records in a table. You can set specific columns to new values based on a condition.

sql
Copy code
UPDATE students
SET age = 20
WHERE student_id = 1;
This sets the age for student_id 1 to 20.

8. Why JOINs are Important
   JOINs combine rows from multiple tables based on related columns:

INNER JOIN: Only returns rows that match in both tables.
LEFT JOIN: Returns all rows from the left table and matches from the right.
RIGHT JOIN: Returns all rows from the right table and matches from the left.
FULL JOIN: Returns all rows where there’s a match in either table.
sql
Copy code
SELECT students.name, enrollments.course_id
FROM students
INNER JOIN enrollments ON students.student_id = enrollments.student_id; 9. GROUP BY and Aggregation
The GROUP BY clause groups rows with the same values in specified columns. It’s essential for aggregation operations, letting you calculate totals, averages, and other stats per group.

sql
Copy code
SELECT course_id, COUNT(student_id) AS student_count
FROM enrollments
GROUP BY course_id; 10. Aggregate Functions
PostgreSQL has built-in functions to calculate totals and averages:

COUNT(): Counts rows or specific non-null values.
SUM(): Adds up numeric values.
AVG(): Calculates the average of numeric values.
sql
Copy code
SELECT COUNT(student_id) AS total_students,
SUM(age) AS total_age,
AVG(age) AS average_age
FROM students;
