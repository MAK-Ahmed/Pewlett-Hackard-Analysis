Select 
e.emp_no,
e.first_name,
e.last_name,
t.title,
t.from_date,
t.to_date
INTO retirement_titles
from employees as e
JOIN titles as t on t.emp_no = e.emp_no
where e.birth_date between '1952-01-01' and '1955-12-31'
order by e.emp_no


Select * from retirement_titles
-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title
INTO unique_titles
FROM retirement_titles
WHERE to_date = '9999-01-01'
ORDER BY emp_no, last_name DESC;

Select * from unique_titles

select count (title), title
INTO retiring_titles
from unique_titles
group by title
order by count (title) DESC

Select * from Retiring_titles

--------------------------Create Mentorship Eligibility table---------

Select Distinct on (e.emp_no)
e.emp_no,
e.first_name,
e.last_name,
e.birth_date,
de.from_date,
de.to_date
into mentorship_eligibility
FROM employees as e
JOIN dept_emp as de on e.emp_no = de.emp_no
JOIN titles as t on e.emp_no=t.emp_no
Where de.to_date = '9999-01-01'
AND e.birth_date between '1965-01-01' and '1965-12-31'

Select Distinct ON (m.emp_no)
m.emp_no,
m.first_name,
m.last_name,
t.title
into distinct_mentorship_title
from mentorship_eligibility as m
JOIN titles as t on m.emp_no = t.emp_no


Select count(title), title
from distinct_mentorship_title
group by title
order by count (title) desc