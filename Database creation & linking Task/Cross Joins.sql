use CompanyDB;

--Pair Employees With All Projects
SELECT employees.name, projects.project_name
			FROM employees
			CROSS JOIN projects;

--Generate a List of Department-Project Pairs.
SELECT departments.department_name, projects.project_name
			FROM departments
			CROSS JOIN projects;