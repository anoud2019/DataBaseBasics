use CompanyDB;

--Find Employees in the IT Department.
select employees.name ,employees.department_id,departments.department_name
from employees
inner join departments
on employees.department_id=departments.department_id
where departments.department_name='IT';

--List Employees Working on Projects.
select employees.name,projects.project_name
from employees
inner join projects
on employees.department_id=projects.department_id;

--Find Employees and Their Projects.
select employees.name, projects.project_name
from employees 
left join projects 
on employees.department_id = projects.department_id
WHERE employees.department_id IS NOT NULL AND projects.department_id IS NOT NULL;


