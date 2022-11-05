use Company;

-- a

select sum(accruedSalary) as accruedSalary
from		(select			sum(Salary.salary) as accruedSalary
			from			Salary
			where			Salary.[year] = 2015
			group by		Salary.[id_employee]
			having			count(Salary.[id_employee]) > 1) AS Query;

-- b

select sum(averageSalary) as averageSalary
from		(select			Salary.[id_employee], avg(Salary.salary) as averageSalary
			from			Salary
			where			Salary.[year] = 2015
			group by		Salary.[id_employee]
			having			count(Salary.[id_employee]) > 1) AS Query;	

