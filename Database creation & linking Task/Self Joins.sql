use CompanyDB;
--Find Employees Hired After Their Colleagues in the Same Department.
	SELECT e1.name AS employee_name, e2.name AS colleague_name
			FROM employees e1
			INNER JOIN employees e2
			ON e1.department_id = e2.department_id
			WHERE e1.hire_date > e2.hire_date;

--List Employees With the Same Salary in the Same Department.
SELECT e1.name AS employee_name, e1.salary AS same_salary,e1.department_id AS same_department
FROM employees e1
INNER JOIN employees e2
ON e1.department_id = e2.department_id
WHERE e1.salary = e2.salary AND e1.employee_id != e2.employee_id;


