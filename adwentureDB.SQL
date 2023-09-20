--1) Funktsiooni loomine
select * from DimEmployee

create function fn_ILTVF_GetEmployess()
returns table
as
return (select EmployeeKey,FirstName,cast(BirthDate as Date) as DOB
from DimEmployee);

select * from fn_ILTVF_GetEmployess();

create function fn_MSTVF_GetEmployees()
returns @Table Table(EmployeeKey int, FirstName nvarchar(20),DOB date)
as
begin
insert into @Table
select EmployeeKey,FirstName,cast(BirthDate as date)
from DimEmployee
return
end

select * from fn_MSTVF_GetEmployees()


update fn_ILTVF_GetEmployess() set FirstName='Rob123' where EmployeeKey=5;
select * from fn_ILTVF_GetEmployess();

--2) Funktsiooni loomine
create function fn_GetEmployyeNameById(@EmployeeKey int)
returns nvarchar(20)
as
begin
return (select FirstName from DimEmployee where EmployeeKey=@EmployeeKey)
end

select dbo.fn_GetEmployyeNameById(5);



alter function fn_GetEmployyeNameById(@EmployeeKey int)
returns nvarchar(20)
with encryption
as
begin
return (select FirstName from DimEmployee where EmployeeKey=@EmployeeKey)
end

alter function fn_GetEmployyeNameById(@EmployeeKey int)
returns nvarchar(20)
with schemabinding
as
begin
return (select FirstName from dbo.DimEmployee where EmployeeKey=@EmployeeKey)
end

go
exec sp_helptext 'fn_GetEmployyeNameById'
go

--3) Ajatabelite loomine
create table #PersonDetails(
Id int primary key,
Name nvarchar(20)) 

insert into #PersonDetails values(1,'Mike')
insert into #PersonDetails values(2,'John')
insert into #PersonDetails values(3,'Todd')
select * from #PersonDetails

select name from tempdb.sys.all_objects
where name like '#PersonDetails%'

drop table #PersonDetails

create procedure spCreateLocaltempTable
as
begin
create table  #PersonDetails(Id int, Name nvarchar(20))

insert into #PersonDetails values(1,'Mike')
insert into #PersonDetails values(2,'John')
insert into #PersonDetails values(3,'Todd')
end	
select * from #PersonDetails

exec spCreateLocaltempTable

create table ##EmployeeDetails(Id int,Name nvarchar(20))
select * from ##EmployeeDetails

--4) Indexi käsitamine
select * from DimEmployee where BaseRate > 35 and BaseRate < 50

create index IX_DimEmployee_BaseRate
on DimEmployee (BaseRate ASC)

exec sys.sp_helpindex @Objname = 'DimEmployee'

drop index DimEmployee.IX_DimEmployee_BaseRate
drop index DimEmployee.FirstName_LastName
