SELECT * FROM employees;
SELECT * FROM departments;
SELECT * FROM dept_emp;
SELECT * FROM dept_manager;
SELECT * FROM salaries;
SELECT * FROM titles;

-- 1. List the following details of each employee: employee number, last name, first name, sex, and salary:
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees AS e
JOIN salaries AS s
ON (e.emp_no = s.emp_no)
ORDER BY "last_name" ASC, "first_name" ASC;

-- 2. List first name, last name, and hire date for employees who were hired in 1986:
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31'
ORDER BY hire_date ASC;

-- 3. List the manager of each department with the following information: 
--    department number, department name, the manager's employee number, last name, first name.
SELECT d.dept_no, d.dept_name, e.emp_no, e.last_name, e.first_name
FROM employees AS e
JOIN dept_manager AS dm
ON (e.emp_no = dm.emp_no)
JOIN departments AS d
ON (dm.dept_no = d.dept_no);

-- 4. List the department of each employee with the following information: 
--    employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees AS e
JOIN dept_emp AS de
ON (e.emp_no = de.emp_no)
JOIN departments as d
ON (de.dept_no = d.dept_no)
ORDER BY "dept_name" ASC;


-- 5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."



-- 6. List all employees in the Sales department, including their employee number, last name, first name, and dept name.



-- 7. List all employees in the Sales and Development departments, including their employee number, last name, 
--    first name, and department name.



-- 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.