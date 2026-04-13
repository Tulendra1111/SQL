# DDL Practical Questions :-

# 1. Create a table Student with columns:
CREATE DATABASE Collage_1;
USE Collage_1;
CREATE TABLE Student(
student_id INT PRIMARY KEY AUTO_INCREMENT,
student_name TEXT,
student_age INT,
student_email VARCHAR(30) UNIQUE
);
SELECT * FROM Student;
INSERT INTO Student
VALUES(101, 'Tulendra', 23, 'tulendra111@gmail.com');

# 2. Create a table Course with:
USE Collage_1;
CREATE  TABLE course(
course_id INT PRIMARY KEY AUTO_INCREMENT,
course_name VARCHAR(100) NOT NULL,
duration INT
);

# 3. Add a column phone_number to the Student table. 
ALTER TABLE Student ADD COLUMN phone_number TEXT;

# 4. Change the datatype of age from INT to SMALLINT. 
ALTER TABLE Student MODIFY student_age SMALLINT;

# 5. Rename the table Student to Students. 
ALTER TABLE Student RENAME TO Students;

# 6. Drop the column duration from the Course table.
ALTER TABLE course DROP COLUMN duration;
SELECT * FROM course;

# 7. Add a CHECK constraint to ensure age >= 18.
SELECT * FROM students;
ALTER TABLE students MODIFY student_age TINYINT NOT NULL CHECK(student_age>=18);

# 8. Create a table Employee with a foreign key referencing Course(course_id). 
CREATE TABLE Employee (
    emp_id INT PRIMARY KEY AUTO_INCREMENT,
    emp_name VARCHAR(50) NOT NULL,
    emp_email VARCHAR(100) UNIQUE,
    course_id INT,
    
    FOREIGN KEY (course_id) REFERENCES Course(course_id)
); 

/*
SELECT CONSTRAINT_NAME
FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE
WHERE TABLE_NAME = 'Employee'
AND COLUMN_NAME = 'course_id'
AND REFERENCED_TABLE_NAME IS NOT NULL;
*/

# 9. Remove the foreign key constraint from the Employee table. 
SHOW CREATE TABLE Employee;
ALTER TABLE Employee
DROP FOREIGN KEY employee_ibfk_1;

# 10. Delete all rows from Employee without deleting its structure. 
TRUNCATE TABLE Employee;
SELECT * FROM Employee;

# DML Practical Questions 
-- 1. Insert 5 records into the Students table. 
SELECT * FROM Students;
INSERT INTO Students VALUES
(102, 'Mohan', 22, 'mohan111@gmail.com', '9191912192'),
(103, 'Soham', 23, 'soham222@gmail.com', '9191912241'),
(104, 'Tushar', 24, 'tushar333@gmail.com', '9191456532'),
(105, 'Aman', 23, 'aman444@gmail.com', '8124566789'),
(106, 'Ram', 24, 'ram333@gmail.com', '6214882994');

-- 2. Insert multiple records into Course using a single query. 
INSERT INTO Students VALUES
(107, 'Madhav', 22, 'madhav111@gmail.com', '9191412192'),
(108, 'Suraj', 24, 'suraj222@gmail.com', '9612455890'),
(109, 'Tilak', 22, 'tilak333@gmail.com', '8181818181');

-- 3. Display all records from Students. 
SELECT * FROM Students;

-- 4. Display only name and email from Students. 
SELECT student_name, student_email FROM Students;

-- 5. Update the email of a student whose student_id = 3. 
UPDATE Students SET student_email = 'shm123@gmail.com' WHERE student_id = 103;

-- 6. Increase age of all students by 1 year. 
SET SQL_SAFE_UPDATES = 0;
UPDATE Students SET student_age = student_age + 1;

-- 7. Delete a student record where student_id = 5.
DELETE FROM Students WHERE student_id = 105;
 
-- 8. Display students whose age is greater than 24. 
SELECT * FROM Students WHERE student_age > 24;

-- 9. Display students sorted by age in descending order. 
SELECT * FROM Students 
ORDER BY student_age DESC;

-- 10. Display only the first 3 records from Students.
SELECT * FROM Students LIMIT 3;


