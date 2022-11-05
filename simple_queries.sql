use Company;

select		*
from		Employee


select		Job.[id], Job.[name]
from		Job
where		Job.[min_salary] < 500


select		avg(s.[salary])
from		Salary as s
where		s.[month] = 1 and s.[year] = 2015