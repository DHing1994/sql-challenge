DROP TABLE departments, dept_emp, dept_manager, employees, salaries, titles;
SET datestyle = "ISO, MDY";
show datestyle;

CREATE TABLE titles (
	title_id VARCHAR (5) primary key,
	title VARCHAR (40)	
);

CREATE TABLE departments (
	Dept_no VARCHAR (4) primary key,
	Dept_name VARCHAR (40)	
);

CREATE TABLE employees (
	Emp_no INT primary key,
	Emp_title_id VARCHAR (5) references titles(Title_id),
	Birth_date DATE,
	First_name VARCHAR (50),
	Last_name VARCHAR (50),
	Sex VARCHAR (1),
	Hire_date DATE
);

CREATE TABLE salaries (
	Emp_no INT primary key references employees(Emp_no),
	Salary INT
);

CREATE TABLE dept_emp (
	Emp_no INT references employees(Emp_no),
	Dept_no VARCHAR (4) references departments(Dept_no),
	PRIMARY KEY(Emp_no, Dept_no)
)
;

CREATE TABLE dept_manager (
	Dept_no VARCHAR (4) references departments(Dept_no),
	Emp_no INT references employees(Emp_no),
	PRIMARY KEY(Emp_no, Dept_no)
);



