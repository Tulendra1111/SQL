/*
DML :- Data Manipulation Language
*/
# CHAR (0-255 Character) #Fixed size data
# VARCHAR (0- 65K Characters) # We need to give length
# TEXT (0 - 65K Characters) Fied size
# PRIMARY KEY => UNIQUE, NOT NULL, FOREIGN KEY
# UNIQUE => UNIQUE

CREATE DATABASE Collage;
#This is how we select Database
USE school;
# How to create table
CREATE TABLE BTech_Student(
Student_id INT,
Student_name TEXT,
Student_address TEXT,
Student_Mobile TEXT
);

# INSERT INTO table_name VALUE(val1,val2,..);
INSERT INTO BTech_Student(Student_id, Student_name, Student_address, Student_Mobile)
values(101, 'Tulendra', 'Noida', '9299811910');

# SELECT col1,col2,.. FROM table_name;
SELECT Student_id, Student_name, Student_address, Student_Mobile FROM BTech_Student;
SELECT * FROM BTech_Student;
INSERT INTO BTech_Student
VALUE(102, 'Tanish', 'Delhi', '9191391999');	

INSERT INTO BTech_Student VALUES
(103, 'Aman', 'Bhubneshwar', '8326372829'),
(104, 'Harsh', 'Bangaluru', '6238449339');

INSERT INTO BTech_Student VALUES 
(105, 'Pritam', NULL, '7233333889');

SELECT * FROM BTech_Student;
SELECT Student_id,Student_name FROM  BTech_Student;

# How to use Where Clause
SELECT * FROM BTech_Student WHERE Student_address = "Noida";
SELECT * FROM BTech_Student WHERE Student_id > 102;

# How to use DELETE
DELETE FROM BTech_Student; # It will erase all the data of this table
DELETE FROM BTech_Student WHERE Student_id=105;
SELECT * FROM BTech_Student;

# How to ues update command in sql
UPDATE BTech_Student SET Student_address = 'Noida' WHERE Student_id=102;

# For removing sql safe mode
SET SQL_SAFE_UPDATES = 0;

USE school;
CREATE TABLE trainer (
    tid INT AUTO_INCREMENT PRIMARY KEY,   -- primary key + auto increment
    tname VARCHAR(30) NOT NULL,
    tadd VARCHAR(100) NOT NULL,
    temail VARCHAR(30) UNIQUE NOT NULL,
    tmob VARCHAR(15) UNIQUE,
    tsalary DECIMAL(8,2)                  -- total 8 digits, 2 after decimal
);

SELECT * FROM trainer;

INSERT INTO trainer(tid, tname, tadd, temail, tmob, tsalary)
values(101, 'Rahul', 'Noida', 'tulendra123@gmail.com', '9299811910', 12000);

INSERT INTO trainer(tid, tname, tadd, temail, tmob, tsalary)
values(102, 'tulendra', 'Noida', 'tulendra1111@gmail.com', '9999999999', 50000),
(104, 'sudhanshu', 'Delhi', 'sudhanshu123@gmail.com', '9191919191', 60000);

SELECT*FROM trainer WHERE tid <104;

UPDATE trainer SET temail = 'tulendra1111@gmail.com' WHERE tid = 102;

