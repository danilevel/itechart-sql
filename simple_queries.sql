use Company;
go

select		*
from		Employee
go

select		Job.[id], Job.[name]
from		Job
where		Job.[min_salary] < 500
go

select		avg(s.[salary])
from		Salary as s
where		s.[month] = 1 and s.[year] = 2015
go