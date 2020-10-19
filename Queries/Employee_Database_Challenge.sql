SELECT * FROM departments;
SELECT * FROM titles;
SELECT * FROM employees;
SELECT * FROM salaries;
SELECT * FROM dept_emp;
SELECT * FROM dept_manager;

DROP TABLE retirement_titles;
-- Deliverable 1
SELECT employees.emp_no, employees.first_name, employees.last_name,
titles.title, titles.from_date, titles.to_date
INTO retirement_titles
FROM employees
INNER JOIN titles
on employees.emp_no = titles.emp_no
WHERE birth_date BETWEEN '1952-01-01' AND '1955-12-31'
ORDER BY employees.emp_no;

SELECT * FROM retirement_titles;

DROP TABLE unique_titles;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) retirement_titles.emp_no,
retirement_titles.first_name,
retirement_titles.last_name,
retirement_titles.title
INTO unique_titles
FROM retirement_titles
ORDER BY retirement_titles.emp_no ASC, retirement_titles.to_date DESC;

SELECT * FROM unique_titles;

--Title counts
SELECT COUNT (title), title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY COUNT(title) DESC;

SELECT * FROM retiring_titles

-- Deliverable 2
SELECT DISTINCT ON (emp_no) e.emp_no,
e.first_name,
e.last_name,
e.birth_date,
de.from_date,
de.to_date,
ti.title
INTO mentorship_eligibility
FROM employees as e
INNER JOIN titles as ti
on e.emp_no = ti.emp_no
INNER JOIN dept_emp as de
on e.emp_no = de.emp_no
WHERE birth_date BETWEEN '1965-01-01' AND '1965-12-31'
ORDER BY e.emp_no;
