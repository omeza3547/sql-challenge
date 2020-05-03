--1. List employee number, last name, first name, gender, and salary.
SELECT e.emp_no,e.last_name,e.first_name,e.gender,s.salary
FROM employees as e
INNER JOIN salaries as s
ON e.emp_no=s.emp_no;

--2. List employees who were hired in 1986.
SELECT * FROM employees
WHERE DATE_PART('year',hire_date)= 1986;

--3. List the manager of each department with the following information: department number,
--department name, the manager's employee number,last name, first name, and start and end employment dates.
SELECT dm.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name, e.hire_date, dm.to_date
FROM employees AS e
INNER JOIN dept_manager AS dm
on e.emp_no= dm.emp_no
INNER JOIN departments AS d
on d.dept_no= dm.dept_no;


--4. List the department of each employee with the following information: 
--employee number, last name, first name, and department name.
SELECT de.emp_no, e.last_name, e.first_name, d.dept_name
FROM departments AS d
INNER JOIN dept_emp as de
ON d.dept_no=de.dept_no
INNER JOIN employees as e
ON e.emp_no=de.emp_no


--5. List all employees whose first name is "Hercules" and last names begin with "B." "LIKE STATEMENT"
SELECT * 
FROM employees
WHERE first_name= 'Hercules'
AND last_name LIKE 'B%'


--6. List all employees in the Sales department, including their employee number,
--last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM departments AS d
INNER JOIN dept_emp AS de
on d.dept_no= de.dept_no
INNER JOIN employees AS e
on de.emp_no= e.emp_no
WHERE dept_name='Sales'



--7. List all employees in the Sales and Development departments, including their employee number, 
--last name, first name, and department name.
SELECT e.emp_no,e.last_name,e.first_name,d.dept_name FROM departments AS d
INNER JOIN dept_emp AS de
ON d.dept_no= de.dept_no
INNER JOIN employees AS e
on e.emp_no= de.emp_no
WHERE d.dept_name IN ('Sales','Development')
ORDER BY e.last_name; 


--8. In descending order, list the frequency count of employee last names,
--i.e., how many employees share each last name.
SELECT last_name, count(last_name) FROM employees
GROUP BY last_name 
ORDER BY count(last_name) DESC;

--Epilogue
SELECT *
FROM employees
WHERE emp_no= 499942

