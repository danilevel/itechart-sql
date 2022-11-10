
   declare @sql_query nvarchar(100)
   declare @employee_id int

   set @employee_id = 2;
   set @sql_query = 'select * from Employee WHERE id = ' + cast(@employee_id as nvarchar(100));

   exec (@sql_query)