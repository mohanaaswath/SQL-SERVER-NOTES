--Cursor 

--Cursor lets you loop throught rows one by one instead of procssing the whole set at once.
--use it only when you really need row by row logic.
--set based queries are usually faster  

use mohanaaswath

CREATE TABLE Employees
(
    EmployeeID INT,
    EmployeeName VARCHAR(50),
    Salary INT
);

INSERT INTO Employees
VALUES
(1, 'Arun', 25000),
(2, 'Bala', 30000),
(3, 'Kumar', 35000),
(4, 'Ravi', 40000), 
(5, 'Vijay', 45000);  

--Declare variables 
DECLARE @EmployeeID INT;
DECLARE @EmployeeName VARCHAR(50);
DECLARE @Salary INT;

--Declare the cursor 
DECLARE EmployeeCursor CURSOR
FOR
SELECT EmployeeID, EmployeeName, Salary
FROM Employees;
--Create a cursor that will go through the Employees table

--open the cursor 
OPEN EmployeeCursor;  --Now the cursor is ready to read rows.

--Fetch the first row
FETCH NEXT FROM EmployeeCursor
INTO @EmployeeID, @EmployeeName, @Salary;

WHILE @@FETCH_STATUS = 0
BEGIN

    PRINT 'Employee: ' + @EmployeeName;
    PRINT 'Salary: ' + CAST(@Salary AS VARCHAR);

    FETCH NEXT FROM EmployeeCursor
    INTO @EmployeeID, @EmployeeName, @Salary;

END;

--close the cursor
CLOSE EmployeeCursor;

DEALLOCATE EmployeeCursor; --This removes the cursor from memory/resources. 



DECLARE @EmployeeID INT;
DECLARE @EmployeeName VARCHAR(50);
DECLARE @Salary INT;

DECLARE EmployeeCursor CURSOR
FOR
SELECT EmployeeID, EmployeeName, Salary
FROM Employees;

OPEN EmployeeCursor;

FETCH NEXT FROM EmployeeCursor
INTO @EmployeeID, @EmployeeName, @Salary;

WHILE @@FETCH_STATUS = 0
BEGIN

    PRINT 'Employee ID: ' + CAST(@EmployeeID AS VARCHAR);
    PRINT 'Name: ' + @EmployeeName;
    PRINT 'Salary: ' + CAST(@Salary AS VARCHAR);

    FETCH NEXT FROM EmployeeCursor
    INTO @EmployeeID, @EmployeeName, @Salary;

END;

CLOSE EmployeeCursor;

DEALLOCATE EmployeeCursor;



-- Real-Time Example: Salary Increment Imagine your company wants to give employees a ₹2,000 bonus individually.

DECLARE @EmployeeID INT;
DECLARE @Salary INT;

DECLARE EmployeeCursor CURSOR
FOR
SELECT EmployeeID, Salary
FROM Employees;

OPEN EmployeeCursor;

FETCH NEXT FROM EmployeeCursor
INTO @EmployeeID, @Salary;

WHILE @@FETCH_STATUS = 0
BEGIN

    UPDATE Employees
    SET Salary = Salary + 2000
    WHERE EmployeeID = @EmployeeID;

    FETCH NEXT FROM EmployeeCursor
    INTO @EmployeeID, @Salary;

END;

CLOSE EmployeeCursor;

DEALLOCATE EmployeeCursor;




SELECT * FROM Employees;