--List the employee number, last name, first name, sex, and salary of each employee.

SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees e
INNER JOIN salaries s ON s.emp_no = e.emp_no;  

--List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT e.Emp_no, e.Last_name, Hire_date
From employees e
Where hire_date >= '01/01/1986' AND hire_date <= '01/01/1987';

--List the manager of each department along with their department number, department name, employee number, last name, and first name.
SELECT dt.dept_no, dt.dept_name, e.emp_no, e.last_name, e.first_name
FROM employees e
INNER JOIN dept_manager d ON d.emp_no = e.emp_no
INNER JOIN departments dt ON d.dept_no = dt.dept_no;

--List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
SELECT dt.dept_no, dt.dept_name, e.emp_no, e.last_name, e.first_name
FROM employees e
INNER JOIN dept_emp d ON d.emp_no = e.emp_no
INNER JOIN departments dt ON d.dept_no = dt.dept_no;

--List the first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT  e.first_name, e.last_name, e.sex
FROM employees e
WHERE e.first_name = 'Hercules' AND e.last_name LIKE 'B%' ;

--List each employee in the Sales department, including their employee number, last name, and first name.
SELECT e.emp_no, e.last_name, e.first_name
FROM departments d
INNER JOIN dept_emp d1 ON d1.dept_no = d.dept_no
INNER JOIN dept_manager d2 ON d2.dept_no = d.dept_no
INNER JOIN employees e ON d1.emp_no = e.emp_no OR d2.emp_no = e.emp_no
WHERE d.dept_name = 'Sales';

--List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name
FROM departments d
INNER JOIN dept_emp d1 ON d1.dept_no = d.dept_no
INNER JOIN dept_manager d2 ON d2.dept_no = d.dept_no
INNER JOIN employees e ON d1.emp_no = e.emp_no OR d2.emp_no = e.emp_no
WHERE d.dept_name = 'Sales' OR d.dept_name = 'Development';

--List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
SELECT last_name, COUNT(last_name) AS "Number of Employees with this name"
FROM employees
GROUP BY (last_name)
Order BY "Number of Employees with this name" desc;
