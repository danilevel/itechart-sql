use Company;

if not exists(select * from sys.tables where name = 'Department')
begin
	create table [Department](
		[id] int primary key identity,
		[name] nvarchar(100) unique not null,
		[address] nvarchar(100) not null
	)
end;

if not exists(select * from sys.tables where name = 'Employee')
begin
	create table [Employee](
		[id] int primary key identity,
		[name] nvarchar(100) not null,
		[surname] nvarchar(100) not null,
		[birth_date] date check([birth_date] > '1900-01-01' and [birth_date] < '2005-01-01') not null
	)
end;

if not exists(select * from sys.tables where name = 'Job')
begin
	create table [Job](
		[id] int primary key identity,
		[name] nvarchar(100) unique not null,
		[min_salary] decimal(10,2) not null
	)
end;

if not exists(select * from sys.tables where name = 'Career')
begin
	create table [Career](
		[id] int primary key identity,
		[start_date] date check([start_date] > '1990-01-01' and [start_date] < getdate()) not null,
		[end_date] date check([end_date] > '1990-01-01' and [end_date] < getdate()) null,
		[id_employee] int not null,
		[id_job] int not null,
		[id_department] int not null,
		constraint [FK_employees] foreign key(id_employee) references [Employee] (id) on delete cascade,
		constraint [FK_jobs] foreign key(id_job) references [Job] (id) on delete cascade,
		constraint [FK_departments] foreign key(id_department) references [Department] (id) on delete cascade
	)
end;

if not exists(select * from sys.tables where name = 'Salary')
begin
	create table [Salary](
		[id] int primary key identity,
		[id_employee] int not null,
		[month] int check([month] > 0 and [month] < 13) not null,
		[year] int check([year] > 2002 and [year] < 2016) not null,
		[salary] decimal(10,2) not null,
		constraint [FK_employees1] foreign key(id_employee) references [Employee] (id) on delete cascade,
	)
end;