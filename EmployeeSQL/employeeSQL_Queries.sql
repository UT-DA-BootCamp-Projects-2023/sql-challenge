--1. List the employee number, last name, first name, sex, and salary of each employee
SELECT 
	E.emp_no "employee number",
	E.last_name "last name",
	E.first_Name "first name",
	E.sex,
	S.salary salary
FROM Employees E	
INNER JOIN Salaries S 
ON E.emp_no = S.emp_no
ORDER BY E.emp_no

--2. List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT
	first_name "first name",
	last_name "last name",
	hire_date "hire date"
FROM Employees
WHERE date_part('year', hire_date) = 1986
ORDER BY hire_date

--3. List the manager of each department along with their department number, department name, employee number, last name, and first name.
SELECT
	T.title Title,
	D.dept_no "department number",
	D.dept_name "department name",
	E.emp_no "employee number",
	E.last_name "last name",
	E.first_name "first name"
FROM dept_manager DM
INNER JOIN Departments D
	ON DM.dept_no = D.dept_no
INNER JOIN Employees E
	ON E.emp_no = DM.emp_no
INNER JOIN titles T
	ON E.emp_title_id = T.title_id

	
--4. List the department number for each employee along with that employee’s employee number, last name, first name, and department name.

SELECT 
	D.dept_no "department number",
	E.emp_no "employee number",
	E.last_name "last name",
	E.first_name "first name",
	D.dept_name "department name"
FROM dept_emp DE
INNER JOIN Departments D
	ON DE.dept_no = D.dept_no
INNER JOIN Employees E
	ON E.emp_no = DE.emp_no
ORDER BY D.dept_no

--5. List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.

SELECT
	first_name "first name",
	last_name "last name",
	sex
FROM Employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%'
ORDER BY sex, last_name

--6. List each employee in the Sales department, including their employee number, last name, and first name.

SELECT
D.dept_name Department,
E.emp_no "employee number",
E.first_name "last name",
E.last_name "first name"
FROM Dept_Emp DE
INNER JOIN Employees E
	ON DE.emp_no = E.emp_no
INNER JOIN Departments D
	ON D.dept_no = DE.dept_no
WHERE D.dept_name = 'Sales'
ORDER BY E.emp_no


--7. List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT
DISTINCT E.emp_no "employee number",
	E.last_name "last name",
	E.first_name "first name",
	D.dept_name "department name"
FROM Dept_Emp DE
INNER JOIN Employees E
	ON DE.emp_no = E.emp_no
INNER JOIN Departments D
	ON D.dept_no = DE.dept_no
WHERE D.dept_name IN ('Sales','Development')
order by D.dept_name, E.emp_no

--8. List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).

SELECT
last_name "employee last name",
COUNT(1) AS "Frequency Counts"
FROM Employees
GROUP BY last_name
ORDER BY 2 DESC

