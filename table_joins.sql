use Company;

--a

select			Salary.[salary], Employee.[name]
from			Salary
join			Employee
on				Salary.[id_employee] = Employee.[id]
where			Salary.[year] = 2015 and
				Salary.[month] = 1 and
				Salary.[salary] > 1000;


--b

select			Employee.[name],
				datediff(YY,
						Career.[start_date],
						isnull(Career.[end_date],
						getdate()))
						AS workExperience
from			Employee
join			Career 
on				Career.[id_employee] = Employee.[id]