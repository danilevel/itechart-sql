use Company;

create table #tempEmployee(
[id]			int,
[name]			nvarchar(100),
[surname]		nvarchar(100))

insert into #tempEmployee([id], [name], [surname])
select [id], [name], [surname] from Employee

select * from #tempEmployee

drop table if exists #tempEmployee