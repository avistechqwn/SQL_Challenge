LIST...
1)-- the employee number, last name, first name, sex, and salary of each employee. 
--Employees and Salary Tables (joins by employee no)

SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
FROM employees
INNER JOIN salaries ON
salaries.emp_no = employees.emp_no

2)--the first name, last name, and hire date for the employees who were hired in 1986.
--employee table

SELECT employees.first_name, employees.last_name, employees.hire_date
FROM employees
WHERE hire_date = 1986;


3)--the manager of each department along with their department number, department name, employee number, last name, and first name.
--department manager, departments, titles, and employee tables (joins by dept no and emp. no, & titles)

SELECT dept_manager.emp_no, dept_manager.dept_no, departments.dept_name, departments.dept_no, employees.emp_no, employees.last_name, employees.first_name, employees.emp_title_id,
FROM dept_manager
INNER JOIN departments ON
departments.dept_no = dept_manager.dept_no
INNER JOIN departments ON
employees.emp_no = dept_manager.emp_no;

4)--the department number for each employee along with that employee’s employee number, last name, first name, and department name.
--department employee (name and number) and employee tables

SELECT dept_emp.emp_no, dept_emp.dept_no, employees.emp_no, employees.last_name, employees.first_name, departments.dept_name, 
FROM dept_emp
INNER JOIN employees ON
employees.emp_no = dept_emp.emp_no
INNER JOIN departments ON
departments.dept_no = dept_emp.dept_no;


5)--first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
--employee table
SELECT employees.last_name, employees.first_name, employees.sex,
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';


6)--each employee in the Sales department, including their employee number, last name, and first name.
--departments (sales) and employee tables
SELECT employees.emp_no, employees.last_name, employees.first_name, dept_emp.emp_no, dept_emp.dept_no, departments.dept_no, departments.dept_name, 
FROM employees
INNER JOIN dept_emp ON
employees.emp_no = dept_emp.emp_no
INNER JOIN departments ON
departments.dept_no = dept_emp.dept_no
WHERE departments = 'Sales';

7)--each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
--department (sales & develoment) and employee tables

SELECT employees.emp_no, employees.last_name, employees.first_name, dept_emp.emp_no, dept_emp.dept_no, departments.dept_no, departments.dept_name, 
FROM employees
INNER JOIN dept_emp ON
employees.emp_no = dept_emp.emp_no
INNER JOIN departments ON
departments.dept_no = dept_emp.dept_no
WHERE departments = 'Sales' AND departments = 'Development';

8)--the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
--employee table (order by-desc, share last name)
SELECT employees.last_name, COUNT(last_name)
FROM employees
GROUP BY last_name 
ORDER BY DESC
WHERE last_name = LIKE 'last_name%';