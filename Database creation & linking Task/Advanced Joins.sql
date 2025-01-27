use CompanyDB;
--Find Employees Working in Departments Handling Projects With Budgets Greater Than 5000.
select employees.name,projects.project_name,projects.budget
from employees
inner join projects
on employees.department_id=projects.department_id
where projects.budget>150000;

--Find Employees and Their Projects With Department Details.
select employees.name,projects.project_name,departments.department_name,departments.location
from employees 
inner join departments
on  employees.department_id=departments.department_id
inner join projects 
on departments.department_id=projects.department_id;

--Find Total Budget Managed by Each Employee’s Department.
select departments.department_name, SUM(projects.budget) AS total_budget
from departments 
LEFT JOIN projects 
ON departments.department_id = projects.department_id
GROUP BY departments.department_name;

--Identify Departments With More Than 2 Employees.
select departments.department_name
from departments
inner join employees
on departments.department_id=employees.department_id
group by departments.department_name
having COUNT(employees.employee_id)>2;

--Employees in Shared Locations.
SELECT e.name AS EmployeeName, 
       d1.department_name AS EmployeeDepartmentName, 
       d2.department_name AS SharedDepartmentName, 
       d1.location AS Location,
       d1.department_id AS EmployeeDepartmentID,
       d2.department_id AS SharedDepartmentID
FROM departments d1
INNER JOIN employees e ON d1.department_id = e.department_id
INNER JOIN departments d2 ON d1.location = d2.location AND d1.department_id != d2.department_id;
