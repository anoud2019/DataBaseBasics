use CompanyDB;
/*Find all departments and their projects along with the employees 
working in each department.
Include departments 
with no employees or projects.*/
SELECT employees.name, departments.department_name, projects.project_name
FROM departments 
LEFT JOIN employees  ON departments.department_id = employees.department_id
LEFT JOIN projects  ON departments.department_id = projects.department_id;

/*Retrieve a list of employees who are part 
of departments that have projects assigned.
Include employees from departments with no projects.*/
select departments.department_name,employees.name, projects.project_name
from employees
inner join departments
on departments.department_id=employees.department_id
left join projects
on departments.department_id=projects.department_id;

/*List all departments and the number of employees
in each department. Include departments with no employees.*/
select departments.department_name ,
count(employees.employee_id)AS Number_Of_Employees_Each_Department
from departments
left join employees
on departments.department_id=employees.department_id
GROUP BY departments.department_name;

/*Find all employees and display their
department names along with project names, 
even if the department or project is missing.*/
select departments.department_name,employees.name, projects.project_name
from employees
left join departments
on departments.department_id=employees.department_id
left join projects
on departments.department_id=projects.department_id;

/*List all employees, their department names, 
and the total budget of projects in their department. 
Include employees without a department
or a department without projects.*/
select departments.department_name,employees.name,
SUM(projects.budget) AS total_budget
from employees
left join departments
on employees.department_id=departments.department_id
left join projects
on employees.department_id=projects.department_id
GROUP BY employees.name, departments.department_name;

/*Display all departments and their employees, 
including departments with no employees.*/
select departments.department_name,employees.name
from departments
left join employees
on employees.department_id=departments.department_id;

/*Find all employees along with their department names 
and the projects they are working on.
Include employees who are
not assigned a department or project.*/
select departments.department_name,employees.name,projects.project_name
from employees
left join departments
on employees.department_id=departments.department_id
left join projects
on employees.department_id=projects.department_id;

/*List all projects along with the department names
Include projects that are not linked to any department.*/
select departments.department_name,projects.project_name
from projects 
left join departments
on departments.department_id=projects.department_id;

/*Find all employees along with their department names. 
Include employees without a department.*/
select employees.name,departments.department_name
from employees
left join departments
on departments.department_id=employees.department_id;

