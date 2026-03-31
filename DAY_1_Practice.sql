# DDL Data Definition Language
/*
How to create a database
*/
CREATE DATABASE HelloWorld;
# SQL is not case sensitive we can also write it like "create database HelloWorld"

# How to delete a database
DROP DATABASE sys;

CREATE DATABASE Collage;
#This is how we select Database
USE Collage;
# How to create table
CREATE TABLE BTech_Student(
Student_id INT,
Student_name TEXT,
Student_address TEXT,
Student_Mobile TEXT
);
# How to add a new column
ALTER TABLE BTech_Student ADD COLUMN Student_email TEXT;
# Decribe table
DESCRIBE BTech_Student;
# How to dalete column in a table
ALTER TABLE BTech_Student DROP COLUMN Student_Mobile;
# How to change the Dtype of a column?
ALTER TABLE BTech_Student MODIFY Student_id TEXT;

CREATE TABLE Emp(
Emp_id INT,
Emp_name TEXT,
Emp_email TEXT
);
ALTER TABLE Emp ADD COLUMN Emp_mobile TEXT;

DESCRIBE Emp;

ALTER TABLE Emp MODIFY Emp_mobile BIGINT;

ALTER TABLE Emp ADD COLUMN Emp_address TEXT;

DESCRIBE Emp;

ALTER TABLE Emp DROP COLUMN Emp_address;

DROP TABLE Emp;

