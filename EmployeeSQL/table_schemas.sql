Create a .sql file of your table schemata.

-- Table: titles
CREATE TABLE titles (
    title_id VARCHAR(10) PRIMARY KEY, -- Unique identifier for each title
    title VARCHAR(50) NOT NULL -- Title name
);

-- Table: departments
CREATE TABLE departments (
    dept_no VARCHAR(5) PRIMARY KEY, -- Unique identifier for each department
    dept_name VARCHAR(50) NOT NULL -- Name of the department
);

-- Table: employees
CREATE TABLE employees (
    emp_no INT PRIMARY KEY, -- Unique identifier for each employee
    emp_title_id VARCHAR(10) NOT NULL, -- Foreign key for titles
    birth_date DATE NOT NULL, -- Birth date of the employee
    first_name VARCHAR(50) NOT NULL, -- Employee's first name
    last_name VARCHAR(50) NOT NULL, -- Employee's last name
    sex CHAR(1) NOT NULL, -- Employee's sex
    hire_date DATE NOT NULL, -- Hire date of the employee
    FOREIGN KEY (emp_title_id) REFERENCES titles(title_id) -- maintain consistent relationships between tables
);

-- Table: dept_manager
CREATE TABLE dept_manager (
    dept_no VARCHAR(5) NOT NULL, ----------------- Department #
    emp_no INT NOT NULL, ------------------------- Employee # 
    PRIMARY KEY (dept_no, emp_no), ----------------Composite primary key
    FOREIGN KEY (dept_no) REFERENCES departments(dept_no), --- maintain consistent relationships between tables
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no) -------- maintain consistent relationships between tables
);

-- Table: salaries
CREATE TABLE salaries (
    emp_no INT PRIMARY KEY, -- Unique identifier for each employee
    salary INT NOT NULL, -- Employee's salary
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no) -- maintain consistent relationships between tables
);

-- Table: dept_emp
CREATE TABLE dept_emp (
    dept_no VARCHAR(5) NOT NULL, -- Department number
    emp_no INT NOT NULL, -- Employee number
    PRIMARY KEY (dept_no, emp_no), -- Composite primary key
    FOREIGN KEY (dept_no) REFERENCES departments(dept_no), -- maintain consistent relationships between tables
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no) -- maintain consistent relationships between tables
);
