if not exists(select * from sys.databases where name = 'Company')
begin
	create database Example
end;
go
