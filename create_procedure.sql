use Company;
go

create or alter procedure jobHistory
	@employee nvarchar(100)
as
select		emp.[id], emp.[name], job.[name] as Position
from		Employee as emp, Career as car, Job as job
where		car.[id_employee] = emp.[id] and
			car.[id_job] = job.[id] and
			emp.[id] = @employee;

