-- A function in SQL Server is a reusable block of SQL code that performs a specific operation and returns a value or a table.

--SQL Server has two major categories:
--1. Built-in functions: Already provided by SQL Server, such as GETDATE(), SUM(), and UPPER().
--2. User-defined functions (UDFs): Functions that you create for your own requirements.

---Example 1  

CREATE DATABASE HRManagementDB;
USE HRManagementDB;

CREATE TABLE Employees
(
    EmployeeID INT PRIMARY KEY,
    EmployeeName VARCHAR(100),
    MonthlySalary DECIMAL(10,2) --DECIMAL(10,2) stores numbers with two decimal places, such as 30000.00
);

INSERT INTO Employees
    (EmployeeID, EmployeeName, MonthlySalary)
VALUES
    (1, 'Mohan', 33000),
    (2, 'Abhishek' ,35000),
    (3, 'Aswath', 40000),
    (4, 'Aswin', 25000),
    (5, 'Dhanush' ,35000);

SELECT * FROM Employees;
--Create the function
CREATE FUNCTION dbo.AnnualSalary
(
    @MonthlySalary DECIMAL(10,2)
)
RETURNS DECIMAL(12,2)
AS
BEGIN
    RETURN @MonthlySalary * 12;
END;

SELECT dbo.AnnualSalary(30000) AS AnnualSalary;

SELECT
    EmployeeID,
    EmployeeName,
    MonthlySalary,
    dbo.AnnualSalary(MonthlySalary) AS AnnualSalary
FROM Employees;
--1	Mohan	33000.00	396000.00
--2	Abhishek	35000.00	420000.00
--3	Aswath	40000.00	480000.00
--4	Aswin	25000.00	300000.00
--5	Dhanush	35000.00	420000.00


----Example 2  Product discount function

CREATE DATABASE ShoppingDB;
USE ShoppingDB;

CREATE TABLE Products
(
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Price DECIMAL(10,2),
    DiscountPercent DECIMAL(5,2)
);

INSERT INTO Products
    (ProductID, ProductName, Price, DiscountPercent)
VALUES
    (1, 'Keyboard', 2000, 10),
    (2, 'Mouse', 1000, 5),
    (3, 'Monitor', 15000, 15);

SELECT * FROM Products;

CREATE FUNCTION dbo.CalculateDiscount
(
    @Price DECIMAL(10,2),
    @DiscountPercent DECIMAL(5,2)
)
RETURNS DECIMAL(10,2)
AS
BEGIN
    RETURN @Price * @DiscountPercent / 100;
END;

-- @Price receives the product price.
-- @DiscountPercent receives the discount percentage.
-- The formula @Price * @DiscountPercent / 100 calculates the discount amount.
-- RETURN sends the amount back to the caller.
--For example, ₹2,000 with a 10% discount gives ₹200.
SELECT
    ProductID,
    ProductName,
    Price,
    DiscountPercent,
    dbo.CalculateDiscount(
        Price,
        DiscountPercent
    ) AS DiscountAmount,
    Price - dbo.CalculateDiscount(
        Price,
        DiscountPercent
    ) AS FinalPrice
FROM Products;
--1	Keyboard	2000.00	10.00	200.00	1800.00
--2	Mouse	1000.00	5.00	50.00	950.00
--3	Monitor	15000.00	15.00	2250.00	12750.00

----Example 3 — Convert customer names to uppercase

CREATE DATABASE CustomerDB;

USE CustomerDB;

CREATE TABLE Customers
(
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100),
    City VARCHAR(50)
);
INSERT INTO Customers
    (CustomerID, CustomerName, City)
VALUES
    (1, 'mohan', 'Chennai'),
    (2, 'aswath', 'Cuddalore'),
    (3, 'priya', 'Coimbatore');

SELECT * FROM Customers;

SELECT
    CustomerID,
    UPPER(CustomerName) AS CustomerName,
    UPPER(City) AS City
FROM Customers;

---1	MOHAN	CHENNAI
--2	ASWATH	CUDDALORE
--3	PRIYA	COIMBATORE

SELECT LOWER(CustomerName) AS LowercaseName
FROM Customers;
--mohan
--aswath
--priya


------Example 6 — Get employees by department

CREATE DATABASE CompanyDB;
USE CompanyDB;

CREATE TABLE Employees
(
    EmployeeID INT PRIMARY KEY,
    EmployeeName VARCHAR(100),
    Department VARCHAR(50),
    Salary DECIMAL(10,2)
);

INSERT INTO Employees
    (EmployeeID, EmployeeName, Department, Salary)
VALUES
    (1, 'Mohan', 'IT', 40000),
    (2, 'Aswath', 'HR', 35000),
    (3, 'Abhishek', 'IT', 45000),
    (4, 'Priya', 'Finance', 40000),
    (5, 'Divya', 'HR', 38000);

SELECT * FROM Employees;

CREATE FUNCTION dbo.GetEmployeesByDepartment
(
    @Department VARCHAR(50)
)
RETURNS TABLE
AS
RETURN
(
    SELECT
        EmployeeID,
        EmployeeName,
        Department,
        Salary
    FROM Employees
    WHERE Department = @Department
);

SELECT * FROM dbo.GetEmployeesByDepartment('IT');
--1	Mohan	IT	40000.00
--3	Abhishek	IT	45000.00

SELECT * FROM dbo.GetEmployeesByDepartment('Finance'); 
--4	Priya	Finance	40000.00

--You can also use the function in a JOIN:
SELECT
    E.EmployeeName,
    E.Department,
    E.Salary
FROM dbo.GetEmployeesByDepartment('IT') AS E
WHERE E.Salary > 40000; 
--Abhishek	IT	45000.00


--------------------------simple Example --------------------
CREATE DATABASE StudentDB;
USE StudentDB;

CREATE TABLE Students
(
    StudentID INT,
    StudentName VARCHAR(50),
    Marks INT
);
INSERT INTO Students
VALUES
(1, 'Mohan', 85),
(2, 'Aswath', 90),
(3, 'Priya', 75);

SELECT * FROM Students;

CREATE FUNCTION dbo.AddBonus
(
    @Marks INT
)
RETURNS INT
AS
BEGIN
    RETURN @Marks + 5;
END;

--CREATE FUNCTION — creates a function.
--dbo.AddBonus — the function's name.
--@Marks INT — receives the student's marks.
--RETURNS INT — returns an integer.
--RETURN @Marks + 5 — adds 5 bonus marks and returns the result.

SELECT dbo.AddBonus(85) AS FinalMarks;  --Test it with one value

SELECT
    StudentName,
    Marks,
    dbo.AddBonus(Marks) AS FinalMarks
FROM Students;
--Mohan	85	90
--Aswath 90	95
--Priya	75	80

