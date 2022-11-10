use Company;
go

create or alter function GetHistoryOfJob (@employee int)
returns table
as return
(
	select		job.[name], datediff(YY,
									car.[start_date],
									isnull(car.[end_date], getdate())) as workExperience
	from		Career as car, Employee as emp, Job as job
	where		car.[id_employee] = emp.[id] and
				emp.[id] = @Employee and
				car.[id_job] = job.[id]
)
go

select * from GetHistoryOfJob (1)