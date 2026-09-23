USE startup 
GO
/****** Object:  StoredProcedure [dbo].[Insert_UserDetails]    
Script Date: 05-05-2023 00:48:28 ******/
--SP USE FOR INSERT RECORD TO USER TABLE 
---Author Name:	Sameer  
---CrtdDt-12/04/2023
---Modby : Arbind,Akash,Sam,Sam123 
--moddt-03/02/2024,05/04/2024,02/07/2026,17/09/2026           
--Solving Duplicate(123),xyz(12345),sam(1234567),adding constraint(123456789)
--Improve the performance using CTE (12345),Adding priority(12)


use WorldCountry

CREATE TABLE Students
(
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(50),
    Department VARCHAR(50),
    Age INT,
    Marks INT
);

INSERT INTO Students (StudentID, StudentName, Department, Age, Marks)
VALUES
(1, 'Arun', 'CSE', 21, 85),
(2, 'Kumar', 'ECE', 22, 78),
(3, 'Priya', 'CSE', 20, 92),
(4, 'Divya', 'IT', 21, 88),
(5, 'Rahul', 'ECE', 22, 75);

SELECT * FROM Students;


--create a procedure: 

CREATE PROCEDURE GetAllStudents
AS
BEGIN
    SELECT * FROM Students;
END;

--Execute the Stored Procedure
EXEC GetAllStudents;

-----------
CREATE PROCEDURE GetStudentsByDepartment
    @Department VARCHAR(50)
AS
BEGIN
    SELECT *
    FROM Students
    WHERE Department = @Department;
END;

EXEC GetStudentsByDepartment @Department = 'CSE';

--EXEC GetStudentsByDepartment 'ECE';


CREATE PROCEDURE GetStudentsByMarks
    @MinimumMarks INT
AS
BEGIN
    SELECT *
    FROM Students
    WHERE Marks >= @MinimumMarks;
END;

EXEC GetStudentsByMarks 85;

--Procedure with INSERT

CREATE PROCEDURE AddStudent
    @StudentID INT,
    @StudentName VARCHAR(50),
    @Department VARCHAR(50),
    @Age INT,
    @Marks INT
AS
BEGIN
    INSERT INTO Students
    (
        StudentID,
        StudentName,
        Department,
        Age,
        Marks
    )
    VALUES
    (
        @StudentID,
        @StudentName,
        @Department,
        @Age,
        @Marks
    );
END;

EXEC AddStudent
    @StudentID = 6,
    @StudentName = 'Vijay',
    @Department = 'CSE',
    @Age = 21,
    @Marks = 90;

SELECT * FROM Students;  -- vijay was added

--Procedure with UPDATE

CREATE PROCEDURE UpdateStudentMarks
    @StudentID INT,
    @Marks INT
AS
BEGIN
    UPDATE Students
    SET Marks = @Marks
    WHERE StudentID = @StudentID;
END;

EXEC UpdateStudentMarks
    @StudentID = 2,
    @Marks = 85;

SELECT * FROM Students WHERE StudentID = 2;

--Procedure with DELETE

CREATE PROCEDURE DeleteStudent
    @StudentID INT
AS
BEGIN
    DELETE FROM Students
    WHERE StudentID = @StudentID;
END;

EXEC DeleteStudent @StudentID = 5; --id 5 will be deleted 



