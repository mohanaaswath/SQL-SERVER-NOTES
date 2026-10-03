--Triggers : A trigger in SQL is a special stored procedure that runs automatically when an INSERT, UPDATE or DELETE operation occurs on a table. 
           --It helps automate actions and keep data consistent.

--Tybes of Triggers : Data Definition Language DDL ,Data Manipulaction Language DML and	Logon Trigger

--example : Example: Automatically Create an Employee Audit Log
CREATE TABLE Employees
(
    EmployeeID INT PRIMARY KEY,
    EmployeeName VARCHAR(100),
    Salary INT
);

CREATE TABLE Employee_Audit
(
    AuditID INT IDENTITY(1,1) PRIMARY KEY,
    EmployeeID INT,
    ActionType VARCHAR(20),
    ActionDate DATETIME
);

CREATE TRIGGER trg_Employee_Insert
ON Employees
AFTER INSERT
AS
BEGIN
    INSERT INTO Employee_Audit
    (
        EmployeeID,
        ActionType,
        ActionDate
    )
    SELECT
        EmployeeID,
        'INSERT',
        GETDATE()
    FROM inserted;
END;

INSERT INTO Employees
VALUES (101, 'Arun', 40000);

SELECT * FROM Employee_Audit; --1	101	 INSERT  2026-10-03 21:11:03.887

