use Company;
go
--1 (I completed this task when creating the table)
if exists(select * from INFORMATION_SCHEMA.TABLES where TABLE_NAME = 'Salary')
begin
	alter table			Salary
	add check			([month] > 0 and [month] < 13),
	check				([year] > 2002 and [year] < 2016);
end;
go


if OBJECT_ID('DF_currentDate') is null
begin
	alter table			Career
	add constraint		DF_currentDate default getdate() for [start_date]
end;
go


--3
if not exists(select * from sys.indexes where name = 'emp_index')
begin
	create index emp_index on Employee ([name], [surname])
end;
go

--4
if not exists(select * from INFORMATION_SCHEMA.COLUMNS where TABLE_NAME = 'Employee' and COLUMN_NAME = 'email')
begin
	alter table Employee
	add email nvarchar(100)
end;
go


if not exists(select * from sys.indexes where name = 'UQ_email')
	begin
	create unique index UQ_email on Employee(email) where email is not null 
	end;
go

--5
if OBJECT_ID('EmployeesDepartments') is not null
begin
	select * from EmployeesDepartments
end;
go

--6
declare @employee nvarchar(100);
set @employee = 1
go

declare @year int;
set @year = 2015
go


if OBJECT_ID('jobHistory') is not null
begin
	exec jobHistory @employee = 1
end;
go


--7
DECLARE @result nvarchar(100);

if OBJECT_ID('getAccruedSalary') is not null
begin
	exec @result = getAccruedSalary @employee = 1,  @year = 2015
	select @result as AccruedSalary;
end;
go