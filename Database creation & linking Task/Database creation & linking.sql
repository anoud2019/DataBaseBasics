--Database Setup
create database CompanyDB;

use CompanyDB;

-- Create the departments table
CREATE TABLE departments (
    department_id INT IDENTITY(1,1) PRIMARY KEY,
    department_name VARCHAR(50) NOT NULL,
    location VARCHAR(50) NOT NULL
);

-- Create the employees table
CREATE TABLE employees (
    employee_id INT IDENTITY(1,1) PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    salary DECIMAL(10, 2) NOT NULL,
	department_id INT,
	FOREIGN KEY (department_id) REFERENCES departments(department_id),
	hire_date DATE NOT NULL
);

-- Create the projects table
CREATE TABLE projects (
    project_id INT IDENTITY(1,1) PRIMARY KEY,
    project_name VARCHAR(100) NOT NULL,
	department_id INT,
	FOREIGN KEY (department_id) REFERENCES departments(department_id),
	budget DECIMAL(10, 2) NOT NULL
	);

-- Insert data into the departments table
INSERT INTO departments (department_name, location) VALUES
('HR', 'Oman'),
('IT', 'Riyadh'),
('Finance', 'Dubai'),
('Marketing', 'Cairo');

-- Insert data into the employees table
INSERT INTO employees (name, salary, department_id, hire_date) VALUES
('Ali', 60000.00, 1, '2020-05-15'),
('Omar', 70000.00, 2, '2021-07-01'),
('Sara', 50000.00, 3, '2022-01-10'),
('Fatma', 55000.00, NULL, '2023-03-20'),
('Noof', 75000.00, 4, '2019-11-25');

-- Insert data into the projects table
INSERT INTO projects (project_name, department_id, budget) VALUES
('HR Automation', 1, 150000.00),
('Cloud Migration', 2, 250000.00),
('Budget Planning', 3, 100000.00),
('Marketing Campaign', 4, 180000.00);

-- Retrieve all records from the departments table
SELECT * FROM departments;
-- Retrieve all records from the employees table
SELECT * FROM employees;
-- Retrieve all records from the projects table
SELECT * FROM projects;