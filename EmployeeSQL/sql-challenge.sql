----1) List the employee number, last name, first name, sex, and salary of each employee-----
CREATE TABLE employees_and_Salary AS
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees e
JOIN salaries s ON e.emp_no = s.emp_no;
--check yuorself---
SELECT * FROM employees_and_salary;


-----2) List the first name, last name, and hire date for the employees who were hired in 1986.---
CREATE TABLE Employees_hired_in_1986 AS
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';
--check yuorself---
SELECT * FROM Employees_hired_in_1986;

-----3) List the manager of each department along with their department number, department name, employee number, last name, and first name.----
CREATE TABLE department_managers AS
SELECT dm.dept_no, e.emp_no, e.last_name, e.first_name
FROM dept_manager dm
JOIN employees e ON dm.emp_no::INTEGER = e.emp_no;  -- Cast to INTEGER if dm.emp_no is VARCHAR
--check yuorself---
SELECT * FROM department_managers;

---4) List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
CREATE TABLE employees_full_info AS
SELECT 
    de.dept_no,
    e.emp_no,
    e.last_name,
    e.first_name,
    d.dept_name
FROM 
    dept_emp de
JOIN 
    employees e ON de.emp_no = e.emp_no
JOIN 
    departments d ON de.dept_no = d.dept_no;
--check yuorself---
SELECT * FROM employees_full_info;

--5) List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
CREATE TABLE hercules_b_info AS
SELECT 
    first_name,
    last_name,
    sex
FROM 
    employees
WHERE 
    first_name = 'Hercules' 
    AND last_name LIKE 'B%';
--check yuorself---
SELECT * FROM hercules_b_info;

--6) List each employee in the Sales department, including their employee number, last name, and first name.
CREATE TABLE sales_department AS
SELECT 
    e.emp_no,
    e.last_name,
    e.first_name
FROM 
    employees e
JOIN 
    dept_emp de ON e.emp_no = de.emp_no
JOIN 
    departments d ON de.dept_no = d.dept_no
WHERE 
    d.dept_name = 'Sales';
--check yuorself---
SELECT * FROM sales_department;

---7) List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
CREATE TABLE sales_and_development_departments AS
SELECT 
    e.emp_no,
    e.last_name,
    e.first_name,
    d.dept_name
FROM 
    employees e
JOIN 
    dept_emp de ON e.emp_no = de.emp_no
JOIN 
    departments d ON de.dept_no = d.dept_no
WHERE 
    d.dept_name IN ('Sales', 'Development');
--check yuorself---
SELECT * FROM sales_and_development_departments;

---8) List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
CREATE TABLE frequency_last_name_counts AS
SELECT 
    last_name,
    COUNT(*) AS frequency
FROM 
    employees
GROUP BY 
    last_name
ORDER BY 
    frequency DESC;
--check yuorself---
SELECT * FROM frequency_last_name_counts;

