-- Project 2: Crowlugi Resort
-- By: Kathleen Pflugi and Zack Crowley
-- Table Schema for loading data into db in postgreSQL

-- Creating the database named "resorts_db":
CREATE DATABASE resorts_db
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;

-- Make Tables to import data from csv files using sqlalchemy:
-- Create country table:
CREATE TABLE country (
    city_ID INTEGER NOT NULL,
    city VARCHAR(255),
    country_ID INTEGER NOT NULL,
    PRIMARY KEY (city_ID)
);
-- Import data from country_df using sqlalchemy.
-----------------------***************


-- Create dept_emp table with both columns as pk:
CREATE TABLE dept_emp (
    emp_no INTEGER NOT NULL,
    dept_no VARCHAR(255),
    PRIMARY KEY(emp_no, dept_no)
);
-- Import dept_emp.csv using pgAdmin GUI.

-- Create dept_manager table with both columns as pk:
CREATE TABLE dept_manager (
    dept_no VARCHAR(255),
    emp_no INTEGER NOT NULL,
    PRIMARY KEY(dept_no, emp_no)
);
-- Import dept_manager.csv using pgAdmin GUI.

-- Create employees table:
CREATE TABLE employees (
    emp_no INTEGER NOT NULL,
    emp_title_id VARCHAR(255),
    birth_date DATE NOT NULL,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    sex VARCHAR(255),
    hire_date DATE NOT NULL,
    PRIMARY KEY (emp_no)
);
-- Import employees.csv using pgAdmin GUI.

-- Create salaries table:
CREATE TABLE salaries (
    emp_no INTEGER NOT NULL,
    salary INTEGER NOT NULL,
    PRIMARY KEY (emp_no)
);
-- Import salaries.csv using pgAdmin GUI.

-- Create titles table:
CREATE TABLE titles (
    title_id VARCHAR(255),
    title VARCHAR(255),
    PRIMARY KEY (title_id)
);
-- Import titles.csv using pgAdmin GUI.

-- Add foreign keys to all of the tables now that all the tables are added:
ALTER TABLE dept_emp ADD CONSTRAINT fk_dept_emp_emp_no FOREIGN KEY(emp_no)
REFERENCES employees (emp_no);

ALTER TABLE dept_emp ADD CONSTRAINT fk_dept_emp_dept_no FOREIGN KEY(dept_no)
REFERENCES departments (dept_no);

ALTER TABLE dept_manager ADD CONSTRAINT fk_dept_manager_dept_no FOREIGN KEY(dept_no)
REFERENCES departments (dept_no);

ALTER TABLE dept_manager ADD CONSTRAINT fk_dept_manager_emp_no FOREIGN KEY(emp_no)
REFERENCES salaries (emp_no);

ALTER TABLE employees ADD CONSTRAINT fk_employees_emp_no FOREIGN KEY(emp_no)
REFERENCES salaries (emp_no);

ALTER TABLE employees ADD CONSTRAINT fk_employees_emp_title_id FOREIGN KEY(emp_title_id)
REFERENCES titles (title_id);

--Check all tables:
SELECT * FROM departments;

SELECT * FROM dept_emp;

SELECT * FROM dept_manager;

SELECT * FROM employees;

SELECT * FROM salaries;

SELECT * FROM titles;

