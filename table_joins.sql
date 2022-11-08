use Company;
go
--a

select			Salary.[salary], Employee.[name]
from			Salary
join			Employee
on				Salary.[id_employee] = Employee.[id]
where			Salary.[year] = 2015 and
				Salary.[month] = 1 and
				Salary.[salary] > 1000;
go

--b

select			Employee.[name],
				cast(datediff(YY,
							Career.[start_date],
							isnull(Career.[end_date],
							getdate())) as varchar(4)) + ' year ' +
				CAST(datediff(MM,
							dateadd(YY,
									datediff(YY,
											Career.[start_date],
											isnull(Career.[end_date], getdate())),
									Career.[start_date]),
							isnull(Career.[end_date], getdate())) as varchar(2)) +' month '
				AS workExperience
from			Employee
join			Career 
on				Career.[id_employee] = Employee.[id]
go