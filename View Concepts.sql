use Course 

Create Table employee(
  id INT PRIMARY KEY,
  Name Text Not Null ,
  Department_ID INT,
  Salary INT,
  Hire_Date TEXT
)

CREATE TABLE departments (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    location TEXT
);

INSERT INTO departments (id, name, location)
VALUES
    (1, 'Engineering', 'Bengalore'),
    (2, 'Marketing', 'Hosur'),
    (3, 'Sales', 'Chennai');


INSERT INTO employee (id, name, Department_ID, Salary, Hire_Date)
VALUES
    (1, 'Mohan', 1, 95000, '2020-03-15'),
    (2, 'Aswath', 1, 88000, '2021-06-01'),
    (3, 'Abhishek', 2, 72000, '2019-11-20'),
    (4, 'Mythili', 2, 68000, '2022-01-10'),
    (5, 'Shamini', 3, 65000, '2023-04-05'),
    (6, 'Anupriya', 3, 71000, '2020-08-22'),
    (7, 'Rupa', 1, 102000, '2018-07-14');


--Syntax: Create View name

CREATE VIEW Employee_Details AS
SELECT e.id,
    e.Name,
    d.name AS department,
    d.location,
    e.Salary,
    e.Hire_Date 
FROM employee e
INNER JOIN departments d ON e.Department_id = d.id;

Select * From Employee_Details 


--drop view Employee_Details


--Alter VIEW Employee_Details AS      just create replace alter 
SELECT e.id,
    e.Name,
    d.name AS department,
    d.location,
    e.Salary,
    e.Hire_Date 
FROM employee e
INNER JOIN departments d ON e.Department_id = d.id;

--SP_HELP Employee_Details

--EXEC sp_rename 'Employee_Details' ,'VIEW_Employee_Details';
--Select * From VIEW_Employee_Details 

