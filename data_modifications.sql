use Company;

--a

update Job
set Job.[min_salary] = Job.[min_salary] * 1.5;

--b

delete from Salary
where Salary.[year] > 2015