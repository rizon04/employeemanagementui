--create database test5
--use test5

create table EmployeeDetail(
EmployeeID int primary key identity(1,1) not null,
Lastname varchar(30) not null,
Firstname varchar(30) not null,
Middlename varchar(30) not null,
DoB date not null,
PhoneNumber varchar(30) not null,
Gender varchar(30) not null,
Email varchar(30) not null,
Position varchar(30) not null,
[Status] varchar(30) null default '-'
)



create table EmployeeEmail(
EmailID int primary key identity(1,1),
Email varchar(100) not null,
EmployeeID int, 
foreign key (employeeID) references EmployeeDetail(employeeID)
)

create table EmployeePhone(
PhoneID int primary key identity(1,1) not null,
EmployeeID int,
PhoneNum varchar(30),
foreign key (employeeID) references EmployeeDetail(employeeID)
)

create table Account(
AccountID int primary key identity(1,1),
Username varchar(30) not null,
[Password] varchar(30) not null,
EmployeeID int, foreign key(employeeID) references EmployeeDetail(employeeID)
)

update EmployeeDetail
set Status = '-'
where EmployeeID in (1,2,3,4)




insert into EmployeeDetail (Lastname, Firstname, Middlename, DoB, PhoneNumber, Gender, Email, Position) values ('Rizon','Lorenz', 'Taborada', '1996-09-28','09123456789' ,'Male','lorenzrizon@gmail.com', 'Manager')
select * from EmployeeDetail

declare @newemployeeID int;
set @newemployeeID = SCOPE_IDENTITY();

insert into Account (username, [password],employeeID) values ('lorenz','bayotko',@newemployeeID)
select * from Account

dbcc checkident ('EmployeeDetail',RESEED,0)
dbcc checkident ('Account',RESEED,0)
delete from account
where employeeID in (4)

delete from EmployeeDetail
where employeeID in (4)

	


	DECLARE @maxEmployeeID INT;
    DECLARE @maxAccountID INT;

	-- Get the maximum employeeID from EmployeeDetail
    SELECT @maxEmployeeID = ISNULL(MAX(employeeID), 0) FROM EmployeeDetail;

    -- Get the maximum accountID from Account
    SELECT @maxAccountID = ISNULL(MAX(accountID), 0) FROM Account;

	dbcc checkident ('Account',RESEED,@maxAccountID)
	dbcc checkident ('EmployeeDetail',RESEED, @maxEmployeeID)

	dbcc checkident ('Account',RESEED,@maxAccountID)
	dbcc checkident ('EmployeeDetail',RESEED, @maxEmployeeID)


select * from EmployeeDetail

select * from Account

--rename later
--exec sp_renamedb test5, EmployeeManagement

drop table account
drop table EmployeePhone
drop table EmployeeEmail
drop table EmployeeDetail








