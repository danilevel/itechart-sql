use Company;
go

-- a
select			Salary.[id_employee], sum(Salary.salary) as accruedSalary
from			Salary
where			Salary.[year] = 2015
group by		Salary.[id_employee]
having			count(Salary.[id_employee]) > 1
go

-- b
select			Salary.[id_employee], avg(Salary.salary) as averageSalary
from			Salary
where			Salary.[year] = 2015
group by		Salary.[id_employee]
having			count(Salary.[id_employee]) > 1
go