CREATE DATABASE office;
USE office;
CREATE TABLE Departments ( 
dept_id INT PRIMARY KEY, 
dept_name VARCHAR(50) 
); 
INSERT INTO Departments VALUES 
(1, 'HR'), 
(2, 'IT'), 
(3, 'Finance'); 
SELECT * FROM Departments;

CREATE TABLE Employees ( 
emp_id INT PRIMARY KEY, 
emp_name VARCHAR(50), 
dept_id INT, 
salary INT, 
FOREIGN KEY (dept_id) REFERENCES Departments(dept_id) 
);
INSERT INTO Employees VALUES 
(101, 'Amit', 1, 30000), 
(102, 'Neha', 2, 50000), 
(103, 'Raj', 2, 45000), 
(104, 'Simran', 3, 40000), 
(105, 'Karan', NULL, 35000); 
SELECT * FROM Employees;
INSERT INTO Employees VALUE(107, 'Tulendra', 2, 50000);

CREATE TABLE Projects ( 
project_id INT PRIMARY KEY, 
project_name VARCHAR(50), 
emp_id INT, 
FOREIGN KEY (emp_id) REFERENCES Employees(emp_id)
); 
INSERT INTO Projects VALUES 
(1, 'Website', 102), 
(2, 'App', 103), 
(3, 'Audit', 104), 
(4, 'Recruitment', 101); 
SELECT * FROM Projects;
DELETE FROM Projects WHERE project_id = 5;
INSERT INTO Projects VALUE(5, 'Data Scientist', 107);
SELECT * FROM Employees;

## Basic Level 
-- 1. Show all employees along with their department names. 
SELECT e.emp_id,emp_name,dept_name FROM Employees e
JOIN Departments d
ON e.dept_id = d.dept_id;
 
-- 2. List all employees who do not belong to any department.
SELECT * FROM Employees WHERE dept_id IS NULL;
  
-- 3. Display all departments and their employees (including empty departments).
SELECT e.emp_name, d.dept_name FROM Employees e
LEFT JOIN Departments d
ON e.dept_id = d.dept_id;
  
-- 4. Retrieve employee names and their salaries along with department names. 
SELECT e.*, d.dept_name FROM Employees e
LEFT JOIN Departments d
ON e.dept_id = d.dept_id;
 
-- 5. Show all projects with assigned employee names.
SELECT p.project_name, emp_name FROM Projects p
LEFT JOIN Employees e
ON p.emp_id = e.emp_id;
  
-- 6. List employees who are not assigned to any department.
SELECT e.emp_name, d.dept_name FROM employees e 
LEFT JOIN Departments d  
ON e.dept_id = d.dept_id
WHERE d.dept_id IS NULL;
  
-- 7. Display all employees and project names (including employees without 
-- projects).
SELECT e.emp_name, p.project_name FROM employees e 
LEFT JOIN Projects p  
ON e.emp_id = p.emp_id;

-- 8. Show departments that have no employees.
INSERT INTO Departments VALUE 
(4, 'Marketing');
SELECT d.dept_id, d.dept_name FROM Departments d
LEFT JOIN Employees e
USING (dept_id)
WHERE e.dept_id IS NULL;

### Intermediate Level 
# 9. Find employees working in the "HR" department.  
SELECT e.emp_id, e.emp_name, dept_name FROM Employees e
LEFT JOIN Departments d
USING (dept_id)
WHERE d.dept_name = 'HR';

# 10. Display employee name, department name, and project name.  
SELECT e.emp_name, dept_name, project_name FROM Employees e
JOIN Departments d USING (dept_id)
JOIN Projects p USING (emp_id);

# 11. List employees who are assigned to more than one project.  
INSERT INTO Employees VALUE(108, 'Tushar', 2, 45000);
INSERT INTO Projects VALUE(6, 'Development', 107);
SELECT e.emp_id, emp_name, COUNT(project_id) AS project_count FROM Employees e
JOIN Projects p USING (emp_id) GROUP BY e.emp_id, e.emp_name
HAVING COUNT(project_id) > 1;

# 12. Show the total number of employees in each department. 
SELECT d.dept_id, dept_name, COUNT(emp_id) AS total_emp FROM Departments d
LEFT JOIN Employees e USING(dept_id) GROUP BY d.dept_id, d.dept_name;

# 13. Find departments with more than 2 employees.
SELECT d.dept_id, dept_name, COUNT(emp_id) AS emp_count FROM Departments d
LEFT JOIN Employees e USING(dept_id) GROUP BY d.dept_id, d.dept_name
HAVING COUNT(emp_id) > 1; 

# 14. Display employees who are not assigned to any project.  
SELECT e.emp_id, emp_name FROM Employees e
LEFT JOIN Projects p USING (emp_id)
WHERE project_id IS NULL;

# 15. Show all projects that do not have any employee assigned. 
INSERT INTO Projects(project_id, project_name) VALUE(7, 'Sales'); 
SELECT project_id, project_name, emp_id FROM Projects WHERE emp_id IS NULL; 

# 16. List employees whose salary is greater than 40,000 along with their department.  
SELECT e.*, dept_name FROM Employees e
LEFT JOIN Departments d USING (dept_id) WHERE salary > 40000;

# 17. Display employee names along with their manager (self join if applicable).
ALTER TABLE Employees
ADD manager_id INT;

UPDATE Employees SET manager_id = NULL WHERE emp_id = 101; -- Amit (top manager)
UPDATE Employees SET manager_id = 101 WHERE emp_id = 102; -- Neha reports to Amit
UPDATE Employees SET manager_id = 101 WHERE emp_id = 103; -- Raj reports to Amit
UPDATE Employees SET manager_id = 102 WHERE emp_id = 104; -- Simran reports to Neha
UPDATE Employees SET manager_id = NULL WHERE emp_id = 105; -- Karan (no manager)

SELECT e.emp_name AS employee, m.emp_name AS manager
FROM Employees e LEFT JOIN Employees m
ON e.manager_id = m.emp_id;

#### Advanced Level 
# 18. Find the highest salary in each department.  
SELECT d.dept_name, MAX(e.salary) AS highest_salary FROM Employees e
JOIN Departments d USING (dept_id)
GROUP BY d.dept_name;

# 19. Show the second highest salary in each department.  
SELECT dept_id, MAX(salary) AS second_highest
FROM Employees e
WHERE salary < (
    SELECT MAX(salary) 
    FROM Employees e2 
    WHERE e2.dept_id = e.dept_id
)
GROUP BY dept_id;

# 20. Display employees earning more than the average salary of their department.  
SELECT emp_name, dept_id, salary AS grt_then_avg_salary
FROM Employees e
WHERE salary > (
    SELECT AVG(salary)
    FROM Employees
    WHERE dept_id = e.dept_id
);

# 21. Find departments where the average salary is greater than 45,000.  
SELECT d.dept_name, AVG(e.salary) AS avg_salary
FROM Employees e
JOIN Departments d
USING (dept_id)
GROUP BY d.dept_name
HAVING AVG(e.salary) > 45000;

# 22. List employees who work in the same department as 'Amit'.
INSERT INTO Employees VALUE(109, 'Aman', 1, 40000, 101);  
SELECT emp_name
FROM Employees
WHERE dept_id = (
    SELECT dept_id
    FROM Employees
    WHERE emp_name = 'Amit'
); 

# 23. Show employees who are working on the same project. 
SELECT p1.emp_id, p2.emp_id, p1.project_id
FROM Projects p1
JOIN Projects p2
ON p1.project_id = p2.project_id
AND p1.emp_id <> p2.emp_id;

# OR

SELECT e.emp_name, p.project_name
FROM Projects p
JOIN Employees e ON p.emp_id = e.emp_id
WHERE p.project_name IN (
    SELECT project_name
    FROM Projects
    GROUP BY project_name
    HAVING COUNT(emp_id) > 1
);

# 24. Find employees who are not working on any project but belong to a department.  
SELECT emp_name, dept_id, project_name FROM Employees e
LEFT JOIN  Projects p USING (emp_id) WHERE dept_id IS NOT NULL
AND p.emp_id IS NULL; 

# 25. Display department-wise total and average salary.  
SELECT d.dept_name, SUM(e.salary) AS total_salary, 
AVG(e.salary) AS avgg_salary FROM Employees e
JOIN Departments d USING (dept_id)
GROUP BY d.dept_id;

# 26. List employees whose salary is the highest in the company.  
SELECT emp_name, salary AS highest_cmp
FROM Employees ORDER BY salary DESC LIMIT 3;

# 27. Show departments that have no projects assigned.
SELECT DISTINCT dept_id, dept_name, project_name FROM Employees e
LEFT JOIN Departments d USING (dept_id)
LEFT JOIN Projects p USING (emp_id)
WHERE project_id IS NULL;

##### Foreign Key Focus 
# 28. Insert a record in Employees with a department_id that does not exist. What happens?  


# 29. Delete a department that is referenced by employees. What error occurs?  


# 30. Update a department_id in Departments that is referenced in Employees. What happens?  


# 31. Modify foreign key to use ON DELETE SET NULL and test behavior.  


# 32. Modify foreign key to use ON UPDATE CASCADE and test updates.  


# 33. Try inserting a project with a non-existing employee_id.  


# 34. Delete an employee who is assigned to a project and observe behavior.  


# 35. Add a foreign key constraint after table creation and test violations. 


###### Challenge Level  
# 36. Find employees who have worked on all projects.  


# 37. List employees who share the same salary in the same department.  


# 38. Find the department with the highest total salary.  


# 39. Display top 3 highest-paid employees in each department.  


# 40. Show employees who are assigned to the maximum number of projects.  


# 41. Find departments where no employee earns less than 30,000.  


# 42. List employees who are not in the IT department but work on IT projects.  


# 43. Show project-wise employee count and average salary.  


# 44. Find employees who have never worked on any project.  


#45. Display employees who changed departments (if history table exists). 
 
 
 