use Company;
go

declare @id_emp int
declare @email nvarchar(100)
declare @name nvarchar(100)

declare autocursor	cursor global scroll for
select		c.[id_employee], e.[email], j.[name]
from		Career c, Job j, Employee e
where		c.[id_job] = j.[id] and
			c.[id_employee] = e.[id]
order by	c.[id_employee]

open autocursor
fetch autocursor into @id_emp, @email, @name
while @@FETCH_STATUS = 0
begin
	print cast(@id_emp as nvarchar(100)) + ' ' + @email + ' ' + @name
	fetch next from autocursor into @id_emp, @email, @name
end;

close autocursor
deallocate autocursor