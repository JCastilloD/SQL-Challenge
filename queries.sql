-- List the following details of each employee: employee number, last name, first name, gender, and salary.
SELECT e.emp_no, e.birth_date, e.first_name, e.last_name, e.gender, s.salary
FROM employees e
	LEFT JOIN salaries s ON e.emp_no = s.emp_no;


-- List employees who were hired in 1986.
SELECT * FROM employees WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';


-- List the manager of each department with the following information:
-- department number, department name, the manager's employee number, last name, first name, and start and end employment dates.
SELECT  dm.dept_no,  dm.emp_no, dm.from_date, dm.to_date, d.dept_name, e.first_name, e.last_name        
FROM dept_manager dm
	INNER JOIN departments d ON dm.dept_no = d.dept_no
    INNER JOIN employees e ON dm.emp_no = e.emp_no;


-- List the department of each employee with the following information:
-- employee number, last name, first name, and department name.
SELECT  dm.dept_no, dm.from_date, dm.emp_no, dm.to_date, d.dept_name, e.last_name, e.first_name 
FROM dept_manager dm
    INNER JOIN departments d ON dm.dept_no = d.dept_no
    INNER JOIN employees e ON dm.emp_no = e.emp_no;



-- List all employees whose first name is "Hercules" and last names begin with "B."
SELECT * FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';


-- List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT  e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees e
    INNER JOIN dept_emp de ON e.emp_no = de.emp_no
    INNER JOIN departments d ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales';


-- List all employees in the Sales and Development departments, including their employee number, last name, 
-- first name, and department name.
SELECT  e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees e
    INNER JOIN dept_emp de ON e.emp_no = de.emp_no
    INNER JOIN departments d ON de.dept_no = d.dept_no
WHERE d.dept_name IN ('Sales', 'Development')
ORDER BY e.emp_no;


-- In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name, COUNT(last_name) FROM employees
GROUP BY last_name
ORDER BY COUNT(last_name) DESC;