use CompanyDB;
--show tables
select*from employees;
select*from departments;
select*from projects;
--Find all employees earning a salary higher than the average salary of all employees
select *from employees;
select * from employees
where salary > (select AVG(salary) from employees);

--List the names of employees working in departments located in 'Oman'.
select * from departments;
select name 
from employees
where department_id IN(
select department_id
from departments
where location ='Oman'
);

--Find employees whose salaries are greater than the average salary of their respective department.
select employee_id,salary,department_id from employees
where salary > (select AVG(salary) from employees
where department_id = employees.department_id);

--Retrieve the names of employees who are not assigned to any department.
select * from employees;
SELECT name
FROM employees
WHERE department_id IS NULL;

--List the names of departments that do not have any associated projects.
select*from projects;
select * from departments;
SELECT department_name
FROM departments d
WHERE NOT EXISTS (
    SELECT *
    FROM projects p
    WHERE p.department_id = d.department_id
);

--Identify the department name with the highest number of employees.
SELECT department_name 
FROM departments 
WHERE department_id = (
    SELECT TOP 1 department_id 
    FROM employees 
    GROUP BY department_id 
    ORDER BY COUNT(employee_id) DESC
);

select *from employees;
select* from departments;

--List the names and salaries of the highest-paid employees in each department.
SELECT name, salary, department_id
FROM employees
WHERE salary = (
    SELECT MAX(salary)
    FROM employees
    WHERE department_id = employees.department_id
);

--Find projects whose budgets exceed the total salaries of all employees in their respective departments.
select* from projects;
select *from employees;
SELECT project_name, budget, department_id
FROM projects
WHERE budget > (
    SELECT SUM(salary)
    FROM employees
    WHERE department_id = projects.department_id
);

--Find the names of employees working in departments that manage projects with a budget greater than $200,000.
select*from employees;
select* from projects;
SELECT name
FROM employees
WHERE department_id IN (
    SELECT department_id
    FROM projects
    WHERE budget > 200000
);

--List the names of employees who work in departments located in 'Dubai'.
SELECT name
FROM employees
WHERE department_id IN (
    SELECT department_id
    FROM departments
    WHERE location = 'Dubai'
);

--Identify employees who earn more than the average salary across all departments.
SELECT name, salary
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees);

--Retrieve the name of the department that manages the project with the highest budget.
SELECT department_name
FROM departments
WHERE department_id = (
    SELECT department_id
    FROM projects
    WHERE budget = (SELECT MAX(budget) FROM projects)
);

--Display the department ID and the total number of employees in each department.
SELECT department_id, COUNT(employee_id) AS total_employees
FROM employees
GROUP BY department_id;


--List employees who are in departments that do not have any projects.
SELECT e.name
FROM employees e
WHERE e.department_id NOT IN (
    SELECT p.department_id
    FROM projects p
    WHERE p.department_id IS NOT NULL
);
select *from employees;
select*from departments;
select *from projects;

--List the names of projects that have a budget higher than the average project budget.
SELECT project_name
FROM projects
WHERE budget > (
    SELECT AVG(budget) 
    FROM projects
);

--Find the department IDs of departments that have fewer than three employees.
SELECT department_id
FROM employees
GROUP BY department_id
HAVING COUNT(employee_id) < 3;

--Find the name of the employee with the highest salary in the company.
SELECT name
FROM employees
WHERE salary = (SELECT MAX(salary) FROM employees);

--Find the names of departments that manage projects with a budget of less than $100,000.
SELECT department_name
FROM departments
WHERE department_id IN (
    SELECT department_id
    FROM projects
    WHERE budget < 100000
);
select * from departments;
select*from projects;

--Identify the name and hire date of the most recently hired employee.
select name,hire_date
from employees
where hire_date=(select MAX(hire_date) from employees);
