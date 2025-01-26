use CompanyDB;
--List All Departments and Their Employees.
SELECT departments.department_name,employees.name
FROM departments
LEFT JOIN employees
ON departments.department_id = employees.department_id;

--Find Projects Without Assigned Departments.
SELECT projects.project_name,departments.department_name
FROM projects
LEFT JOIN departments
ON projects.department_id = departments.department_id
WHERE departments.department_id IS NULL;

--List Departments Without Employees.
SELECT departments.department_name
FROM departments
LEFT JOIN employees
ON departments.department_id = employees.department_id
WHERE employees.department_id IS NULL;

