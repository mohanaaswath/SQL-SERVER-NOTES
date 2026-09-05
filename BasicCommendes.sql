--create database databasename 

create database portfolio 
use portfolio 

--backup database portfolio
--to disk 

Alter database portfolio modify name = mohanaaswath




 --The database name 'mohanaaswath' has been set.
 --Completion time: 2026-08-11T08:41:20.4524949+05:30



-- create database sqlserver
-- create database aifullstackdeveloper 
-- create database datascience 
-- create database startup

-- use sqlserver
 --drop database aifullstackdeveloper
 --drop database datascience

 --use startup
 --drop database mohan
 
 --drop database sqlserver

 use startup

 --create table tablename
 CREATE TABLE [Employname](
    [EMPNO] [varchar](50),
    [EMPNAME] [varchar](50)
   );

-- rename table = sp_rename employname , empinfo

sp_rename Employname , EmployeInfo;

--rename colume = sp_rename employeinfo.empno , EmployeNumber, column

sp_rename 'EmployeInfo.EMPNO' , 'EMPLOYENUMBER' , 'COLUMN' ;


--insert into tablename values or column ('',''),('','')

insert into EmployeInfo 
values ('101','Mohan'),
('102','RamKumar'),
('103','Awath');

--select * from tablename where employenumber = 105  like condication based see the row 

 select * from EmployeInfo where EMPLOYENUMBER = 102;

--see the table ==> select * from tablename 

select * from EmployeInfo

-- select columnname as dupilicatename from tablename 


--update 

UPDATE EmployeInfo 
SET EMPNAME ='Mohana' WHERE EMPLOYENUMBER =101;

--Delete 

DELETE from EmployeInfo WHERE EMPNAME = 'Awath';


--rollback tran , begin tran , commit tran

BEGIN tran 
UPDATE EmployeInfo SET EMPNAME = 'simbu' WHERE EMPLOYENUMBER =101;
select *from EmployeInfo
ROLLBACK tran;  --empname change mohana to simbu 

select *from EmployeInfo -- now run this does not affect table name have only mohana 

--existing table to new table 
SELECT * into COMPANY from EmployeInfo where 1 <> 1 ;
SELECT * from COMPANY ;
Insert into  COMPANY Select * from EmployeInfo ;

--add column 
ALTER TABLE EmployeInfo
Add Email varchar(20) ;

SELECT * FROM EmployeInfo;

ALTER TABLE EmployeInfo
Add PhoneNumber INT ;

Alter Table EmployeInfo 
Add DEPARTMENT varchar(30) ;

--change column data type 
   -- alter table tablename
   --alter column columnname varchar(100)

--see table simple format : 
           sp_help EmployeInfo;
           
--drop the column :alter table tablename drop column column

ALTER Table EmployeInfo 
DROP Column Email;


select * from EmployeInfo ;


--select empno as employeeno from besant where id=106 and name='sameer';
 use startup

