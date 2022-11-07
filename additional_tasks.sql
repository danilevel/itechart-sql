use Company;

--1 (I completed this task when creating the table)
alter table			Salary
add check			([month] > 0 and [month] < 13),
check				([year] > 2002 and [year] < 2016);


--2
if not exists(select * from sys.default_constraints where name = 'DF_currentDate')
begin
	alter table			Career
	add constraint		DF_currentDate default getdate() for [start_date]
end;


--3
if not exists(select * from sys.indexes where name = 'emp_index')
begin
	create index emp_index on Employee ([name], [surname])
end;

--4
if not exists(select * from sys.all_columns where name = 'email')
begin
	alter table Employee
	add email nvarchar(100)
end;

if not  exists(select * from sys.indexes where name = 'UQ_email')
	begin
	create unique index UQ_email on Employee(email) where email is not null 
	end;


--5
if exists(select * from sys.views where name = 'EmployeesDepartments') 
begin
	select * from EmployeesDepartments
end;

--6
declare @employee nvarchar(100);
set @employee = 1

declare @year int;
set @year = 2015

if exists(select * from sys.procedures where name = 'jobHistory') 
begin
	exec jobHistory @employee
end;

--7
select * from getAccruedSalary(1, 2015)

--8
