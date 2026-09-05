--SQL CONSTRAINTS:
   -- sql constraints are used to specify rules for data in a table 
   -- contraints can be specified when the table is created with the create table statement or after  the table is created with the alter table statement 

--syntax : 
   --create table tablename (
   --column1 datatybe constraint,
   --column2 datatype constraint
   --);

--constraints are commenly used in sql 
   --notnull => ensures that a column cannot have a null value 
   --unique => ensure that all values in a column are different  


use startup


--Unique key :

Create Table EmployeDetails(
 ID int UNIQUE ,
 RollNO SMALLINT UNIQUE ,
 EmailId Varchar(25),
 FirstName varchar(30),
 LastName varchar(30) NOT NULL ,  --one column unique
 Age int
) 

--another method 
Create Table StudentDetails(
 ID int ,
 RollNO SMALLINT  ,
 EmailId Varchar(25), 
 FirstName varchar(30),
 LastName varchar(30) NOT NULL ,  --one column unique
 Age int
 CONSTRAINT UK_ID UNIQUE(ID),
 CONSTRAINT UK_age UNIQUE(Age)
 --CONSTRAINT UK_age UNIQUE(ID,Age,LastName)  UK means unique key 
) 

--Alter Table StudentDetails
--ADD UNIQUE (ID); Wrong method

--Alter Table StudentDetails
--ADD CONSTRAINT UK_StudentID UNIQUE(ID);

--Alter Table StudentDetails
--Drop CONSTRAINT UK_StudentID;

--PRIMARY KRY : does not allow duplicate 
Create Table UserInfo(
 ID INT,
 FirstName varchar(15),
 LastName varchar(15) NOT NULL ,
 Age INT,
 CONSTRAINT PK_UserID PRIMARY KEY(ID) --PK means primary key 
 -- CONSTRAINT PK_UserID PRIMARY KEY(ID , LastName)
)

--Alter Table UserInfo
--ADD Primary Key (ID); Wrong method

--Alter Table UserInfo
--ADD CONSTRAINT PK_UserID PRIMARY KEY(ID , LastName);

--Check :

Create Table VoteRules (
 ID INT NOT NULL ,
 FirstName varchar(20) NOT NULL,
 LastName varchar(20),
 Age INT CHECK(Age >= 18)
)

Create Table VoteRules1 (
 ID INT NOT NULL ,
 FirstName varchar(20) NOT NULL,
 LastName varchar(20),
 Age INT ,
 Salary int,
 CONSTRAINT CHK_AgeSalary CHECK(Age >= 18 AND Salary >= 25000)
)

--Alter Table VoteRules1
--ADD CHECK (Age >= 18); ok but Wrong method

--Alter Table VoteRules1
--ADD CONSTRAINT CHK_AgeSalary CHECK(Age >= 18 AND Salary >= 25000);

--Alter Table VoteRules1
--Drop CONSTRAINT CHK_AgeSalary;

--Default
use startup 

CREATE TABLE PersonCityDetailsCityWise2 (
    ID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int,
    City varchar(255) DEFAULT 'Bangalore'
);

select * from PersonCityDetailsCityWise2

INSERT INTO PersonCityDetailsCityWise2
(ID,LastName,FirstName,Age,City)
VALUES(102,'Sameer','Biswal',31,'Mumbai')

INSERT INTO PersonCityDetailsCityWise2
(ID,LastName,FirstName,Age)
VALUES(102,'Kevin','CREW',30)

select * from PersonCityDetailsCityWise2


CREATE TABLE Orderdatedetailsnew (
    ID int NOT NULL,
    OrderNumber int NOT NULL,
    OrderDate date DEFAULT GETDATE()
);

select * from Orderdatedetailsnew

insert into Orderdatedetailsnew
(ID,OrderNumber)
values(104,12345678)

select * from Orderdatedetailsnew

--ALTER TABLE PersonCityDetailsCityWise2
--ADD CONSTRAINT df_City DEFAULT 'Bangalore' FOR City;

--ALTER TABLE PersonCityDetailsCityWise2
--ALTER COLUMN City DROP DEFAULT ;


--FOREIGN KEY : use one time , allow dupilicate 
Create table Country(
 CountryID INT PRIMARY KEY,
 CountryName VARCHAR(50) NOT NULL
 );

Create Table State(
 StateID INT PRIMARY KEY,
 StateName varchar(50) NOT NULL ,
 CountryID INT NOT NULL,
 CONSTRAINT FK_CITY_STATE FOREIGN KEY(StateID) REFERENCES Country(CountryID) --ON DELETE CASCADE 
);


