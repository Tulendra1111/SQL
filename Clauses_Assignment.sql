CREATE DATABASE company_db; 
USE company_db; 
CREATE TABLE employees ( 
emp_id INT PRIMARY KEY AUTO_INCREMENT, 
name VARCHAR(50), 
department VARCHAR(50), 
salary DECIMAL(10,2), 
age INT, 
city VARCHAR(50), 
joining_date DATE 
);

INSERT INTO employees (name, department, salary, age, city, joining_date) VALUES 
('Amit', 'IT', 60000, 28, 'Delhi', '2022-03-15'), 
('Riya', 'HR', 45000, 25, 'Mumbai', '2021-06-10'), 
('John', 'IT', 75000, 32, 'Bangalore', '2020-01-20'), 
('Sara', 'Finance', 50000, 29, 'Delhi', '2023-02-12'), 
('David', 'IT', 80000, 35, 'Mumbai', '2019-11-05'), 
('Neha', 'HR', 47000, 27, 'Delhi', '2022-07-19'), 
('Raj', 'Finance', 52000, 31, 'Bangalore', '2021-09-23'), 
('Priya', 'IT', 62000, 26, 'Delhi', '2023-01-01');
SELECT * FROM employees; 
TRUNCATE employees;

## Basic SELECT & WHERE 
# 1. Display all employee details  
SELECT * FROM employees;

# 2. Show only employee names and salaries  
SELECT name, salary FROM employees;

# 3. Find employees with salary > 60000  
SELECT * FROM employees WHERE salary > 60000;

# 4. Find employees from Delhi  
SELECT * FROM employees WHERE city = 'Delhi';

# 5. Find employees aged between 25 and 30  
SELECT * FROM employees WHERE age BETWEEN 25 AND 30;

### ORDER BY 
# 6. Sort employees by salary (ascending)  
SELECT * FROM employees ORDER BY salary ASC;

# 7. Sort employees by age (descending)  
SELECT * FROM employees ORDER BY salary DESC;

# 8. Show employees sorted by department, then salary  
SELECT name, department, salary FROM employees
ORDER BY department ASC, salary ASC;

#### DISTINCT 
# 9. List unique departments  
SELECT DISTINCT department FROM employees;

# 10. List unique cities  
SELECT DISTINCT city FROM employees;

##### LIMIT 
# 11. Show top 3 highest paid employees  
SELECT * FROM employees 
ORDER BY salary DESC LIMIT 3;

# 12. Show 2 youngest employees 
SELECT * FROM employees
ORDER BY age ASC LIMIT 2;

###### Aggregate Functions 
# 13. Find total number of employees  
SELECT COUNT(*) FROM employees; 

# 14. Find average salary  
SELECT AVG(salary) AS average_salary FROM employees;

# 15. Find maximum salary  
SELECT MAX(salary) AS maximum_salary FROM employees;

# 16. Find minimum salary  
SELECT MIN(salary) AS minimum_salary FROM employees;

# 17. Find total salary of all employees  
SELECT SUM(salary) AS total_salary FROM employees;
 
####### GROUP BY 
# 18. Count employees in each department  
SELECT department, COUNT(*) FROM employees GROUP BY department; 

# 19. Find average salary per department  
SELECT department, AVG(salary) AS average_salary
FROM employees GROUP BY department;

# 20. Find total salary per city  
SELECT city, SUM(salary) AS total_salary
FROM employees GROUP BY city; 

######## HAVING 
# 21. Show departments with more than 2 employees  
SELECT department FROM employees 
GROUP BY department HAVING COUNT(department) > 2;

# 22. Show departments where average salary > 60000  
SELECT department, AVG(salary) AS average_salary FROM employees 
GROUP BY department HAVING AVG(salary) > 60000;
 
######### LIKE Operator 
# 23. Find employees whose name starts with 'A'  
SELECT * FROM employees WHERE name LIKE 'A%';

# 24. Find employees whose name ends with 'a'  
SELECT * FROM employees WHERE name LIKE '%a';

# 25. Find employees whose name contains 'i'  
SELECT * FROM employees WHERE name LIKE '%i%';

########## IN / NOT IN 
# 26. Find employees from Delhi or Mumbai  
SELECT * FROM employees WHERE city IN ('Delhi', 'Mumbai');

# 27. Find employees NOT in IT department  
SELECT * FROM employees WHERE department NOT IN ('IT');

######## BETWEEN 
# 28. Find employees with salary between 50000 and 70000  
SELECT * FROM employees WHERE salary BETWEEN 50000 and 70000;

# 29. Find employees who joined between 2021 and 2023  
SELECT * FROM employees WHERE joining_date BETWEEN '2021-01-01' and '2023-12-31';
 
######### UPDATE 
# 30. Increase salary of all IT employees by 10%
UPDATE employees SET salary = salary + (salary * 0.10) WHERE department = 'IT';
SET SQL_SAFE_UPDATES = 0;
SELECT * FROM employees;

########## DELETE 
#31. Delete employees with salary < 45000  
DELETE FROM employees WHERE salary < 45000;
 
########### CASE Statement 
# 32. Categorize employees:  
#  • Salary > 70000 → 'High'  
#  • 50000–70000 → 'Medium'  
#  • < 50000 → 'Low'
SELECT name, salary,
	CASE
		WHEN salary > 70000 THEN 'High'
		WHEN salary BETWEEN 50000 AND 70000 THEN 'Medium'
		ELSE 'Low'
	END AS salary_category
FROM employees;