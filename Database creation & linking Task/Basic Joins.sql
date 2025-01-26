use CompanyDB;
--Find Employee and Their Department Name.
SELECT employees.name,departments.department_name
FROM employees , departments
WHERE employees.department_id = departments.department_id;

--List Projects and Their Department Locations.
SELECT projects.project_name,departments.location
FROM projects , departments
WHERE projects.department_id = departments.department_id;

--Find Employees Without Departments.
select employees.name
from employees
where department_id is null;

--List All Projects and Assigned Departments.
select projects.project_name,departments.department_id
from  projects
left join departments
on projects.department_id=departments.department_id;