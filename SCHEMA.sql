-- Create a new Table
CREATE TABLE titles ( 
	title_id VARCHAR (30) NOT NULL,
	title VARCHAR (30) NOT NULL,
	Primary Key	(title_id)
);

SELECT * FROM titles

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