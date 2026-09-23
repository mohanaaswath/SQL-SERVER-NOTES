--Data Function 

CREATE TABLE EmployeeJoiningDate
(
    EmpID INT PRIMARY KEY,
    EmpName VARCHAR(50),
    JoiningDate DATE,
    LastLogin DATETIME,
    Salary DECIMAL(10,2)
);

INSERT INTO EmployeeJoiningDate VALUES
(1, 'Ravi', '2022-03-15', '2026-08-01 09:30:00', 50000),
(2, 'Priya', '2023-11-20', '2026-08-05 14:15:00', 65000),
(3, 'Amit', '2021-01-05', '2026-07-28 18:45:00', 45000),
(4, 'Sneha', '2024-05-10', '2026-08-05 08:00:00', 72000);

use WorldCountry 
Select * from EmployeeJoiningDate

SELECT GETDATE() AS CurrentDateTime; -- 
SELECT CAST(GETDATE() AS DATE) AS Today; -- 



SELECT 
    EmpName,
    DATEPART(YEAR, JoiningDate) AS JoinYear,
    DATENAME(MONTH, JoiningDate) AS JoinMonth,
	 DATEPART(MONTH, JoiningDate) AS JoinDPARTMonth,
    DATEPART(DAY, JoiningDate) AS JoinDay
FROM EmployeeJoiningDate;

-- How many days/months/years since joining
SELECT 
    EmpName,
    DATEDIFF(YEAR, JoiningDate, GETDATE()) AS YearsInCompany,
    DATEDIFF(DAY, JoiningDate, GETDATE()) AS DaysInCompany,
	 DATEDIFF(Month, JoiningDate, GETDATE()) AS MonthInCompany,
	  DATEDIFF(WEEK, JoiningDate, GETDATE()) AS WeekInCompany
FROM EmployeeJoiningDate;


select * from EmployeeJoiningDate
-- Employees who will complete 1 year next month
SELECT EmpName, DATEADD(YEAR, 1, JoiningDate) AS OneYearAnniversary
FROM EmployeeJoiningDate;

-- Add 30 days to LastLogin
SELECT EmpName, DATEADD(DAY, 30, LastLogin) AS NextReminderDate
FROM EmployeeJoiningDate;

SELECT 
    EmpName,
    CONVERT(VARCHAR(20), JoiningDate, 103) AS DD_MM_YYYY, -- 15/03/2022
    FORMAT(LastLogin, 'dd-MMM-yyyy hh:mm tt') AS FormattedLogin -- 05-Aug-2026 02:15 PM
FROM EmployeeJoiningDate;

--Common format codes: 101=MM/DD/YYYY, 103=DD/MM/YYYY, 112=YYYYMMDD

SELECT 
    EmpName,
    EOMONTH(JoiningDate) AS MonthEnd,
    EOMONTH(JoiningDate, -1) AS PreviousMonthEnd
FROM EmployeeJoiningDate;

SELECT DATEFROMPARTS(2026, 12, 25) AS Christmas2026; -- 2026-12-25

SELECT * FROM EmployeeJoiningDate 
WHERE YEAR(JoiningDate) = 2023;

SELECT * FROM EmployeeJoiningDate 
WHERE CAST(LastLogin AS DATE) = CAST(GETDATE() AS DATE);

SELECT EmpName, JoiningDate 
FROM EmployeeJoiningDate 
WHERE DATEDIFF(YEAR, JoiningDate, GETDATE()) >= 2;



 -----------------------------------------------------------------------------------------------------------
CREATE TABLE PersonInfonewDetails (
    Personid int IDENTITY(1000,1) PRIMARY KEY,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int
);

select * from PersonInfonewDetails
INSERT INTO PersonInfonewDetails
(LastName,FirstName,Age)
VALUES('Biswal','sameer',30)

select * from PersonInfonewDetails

CREATE TABLE PersonDetailsbesant (
    Personid int IDENTITY(1000,2) PRIMARY KEY,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int
);

INSERT INTO PersonDetailsbesant
VALUES('Technologies','Besant',32)



select * from PersonInfonewDetails
delete from PersonInfonewDetails 

INSERT INTO PersonInfonewDetails
(LastName,FirstName,Age)
VALUES('DARWIN','ALEX',31);

