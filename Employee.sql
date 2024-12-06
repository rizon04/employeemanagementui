create database EmployeeDetails
use EmployeeDetails 



create table tblUserLogin(
 employeeID int unique,
 username varchar(30), 
 password varchar(30)
)

insert into tblUserLogin values (001,'kristian', 'bayot')
select * from tblUserLogin
insert into tblUserLogin values (002,'rico', 'gwapo')

alter table tblUserLogin
add role varchar(30) null;


update tblUserLogin
set role = 'Junior Developer'
where employeeID = 001

create table tblAdminLogin(
adminID int primary key,
employeeID int 
foreign key(employeeID) references tblUserLogin(employeeID)
)

insert into tblAdminLogin (adminID, employeeID) 
values (1,2)

select * from tblAdminLogin



