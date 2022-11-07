
--5
--if not exists(select * from sys.views where name = 'EmployeesDepartments') 
--begin
--end; - with this block i get error!!!
create view EmployeesDepartments as
select		emp.[id], emp.[name] as empName, dep.[name] as depName, job.[name] as jobName
from		Employee as emp, Department as dep, Career as car, Job as job
where		car.[id_department] = dep.[id] and
			car.[id_employee] = emp.[id] and
			car.[id_job] = job.[id] and
			car.end_date is null