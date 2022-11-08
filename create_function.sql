use Company;
go

create or alter function getAccruedSalary(@employee int, @year int)
returns decimal(18,2)
begin
return	(select			sum(sal.[salary])
		from			Salary as sal, Employee as emp
		where			sal.[id_employee] = emp.[id] and
						emp.[id] = @employee and
						sal.[year] = @year)
end;
go