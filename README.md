# SQL_Challenge
Employee_SQL_Challenge

BACKGROUND:
As a data engineer at a fictional company, the first major task is to do a research project about people whom the company employed during the 1980s and 1990s. All that remains of the employee database from that period are six CSV files.

For this project, one will design the tables to hold the data from the CSV files, import the CSV files into a SQL database, and then answer questions about the data. This tasks includes performing data modeling, data engineering, and data analysis, respectively.

DATA MODELING
![Employee_ERD](https://user-images.githubusercontent.com/107156165/236832006-03762ebd-eff5-445d-a6a3-d1d2e276bfb2.png)

DATA ENGINEERING- SCHEMAS
-- Create a new Table
  CREATE TABLE titles ( 
	  title_id VARCHAR (30) NOT NULL,
	  title VARCHAR (30) NOT NULL,
	  Primary Key	(title_id)
  );

  CREATE TABLE employees ( 
	  emp_no INT,
	  emp_title_id VARCHAR (30) NOT NULL,
	  birth_date DATE,
	  first_name VARCHAR (30) NOT NULL,
	  last_name VARCHAR (30) NOT NULL,
	  sex VARCHAR (30) NOT NULL,
	  hire_date DATE,
	  FOREIGN KEY (emp_title_id ) REFERENCES titles (title_id),
	  Primary Key	(emp_no)
  );
	
	CREATE TABLE departments (
		dept_no VARCHAR (30) NOT NULL,
		dept_name VARCHAR (30) NOT NULL,
		Primary Key	(dept_no)
); 

  CREATE TABLE dept_emp (
	  emp_no int,	
	  dept_no VARCHAR (30) NOT NULL,
		FOREIGN KEY (dept_no ) REFERENCES departments (dept_no),
		FOREIGN KEY (emp_no ) REFERENCES employees (emp_no ),
		Primary Key	(emp_no, dept_no)
  ); 

  CREATE TABLE dept_manager (
		dept_no VARCHAR (30) NOT NULL,
		emp_no int,
		FOREIGN KEY (dept_no ) REFERENCES departments (dept_no),
		FOREIGN KEY (emp_no ) REFERENCES employees (emp_no ),
		Primary Key	(dept_no,emp_no)
  ); 
	
  CREATE TABLE salaries (
		emp_no int,
		salary int,
		FOREIGN KEY (emp_no ) REFERENCES employees (emp_no ),
		Primary Key	(emp_no)
  ); 


DATA ANALYSIS-QUERIES
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

