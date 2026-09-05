Create database ClassTest;

use ClassTest;

Alter database ClassTest modify name = ClassTestSQL 
--sp_rename ClassTest , ClassTestsql;
use ClassTestSQL

BACKUP DATABASE ClassTestSQL 
TO DISK ='D:\Dev c++\ClassTestSQL.BAK'

--USE Startup;
DROP DATABASE ClassTestSQL;

USE ClassTestSQL;

Create table StudentsTable(
[Student_ID] varchar(20),
[Student_Name]varchar(20),
[Course] varchar(20),
[Yearofpassing]date,
[Address] varchar(50)
);

Create Table CourseDetails(
Course varchar(25),
Fees decimal,
Duration varchar(30),
Review varchar(max)
);


DROP TABLE Placement;

CREATE TABLE Placement (
    AttendPlacement VARCHAR(10),
    [Date] DATE,
    Course VARCHAR(20),
    PlacedOnInterview VARCHAR(10)
);
 --ALTER TABLE Placement ALTER COLUMN AttendPlacement char(10)
 --ALTER TABLE Placement ALTER COLUMN PlacedOnInterview char(10)


INSERT INTO StudentsTable 
VALUES ('101','MohanaAswath','AIandML','2026-5-5','No 3 Ganapathy Nagar Thally Road Hosur '),
       ('102','Abhishek','PythonFullStack','2026-5-5','No 30 Indhra Nagar Thally Road Tirupattur'),
       ('103','AnbuSelvan','PythonFullStack','2026-5-5','No 50 SkillkBoard Thally Road ');

SELECT * FROM StudentsTable


INSERT INTO  CourseDetails
VALUES ('AIandML','20000','5Months','Greate Academy'),
       ('PythonFullStackL','20000','5Months','Greate Academy'),
       ('PythonFullStackL','20000','5Months','Greate Academy')

 SELECT * FROM CourseDetails    
 --sp_help CourseDetails 

INSERT INTO Placement
VALUES 
    ('Yes', '2026-05-05', 'AIandML', 'yes'),
    ('Yes', '2026-05-10', 'PythonFullStack', 'yes'),
    ('Yes', '2026-05-15', 'PythonFullStack', 'yes');

SELECT * From Placement 


SELECT * INTO StudentsTableArchive from StudentsTable WHERE 1<>1 ; 
INSERT INTO StudentSTableArchive SELECT * FROM StudentsTable; 
SELECT * FROM StudentsTableArchive;
SELECT * FROM StudentsTable;

SELECT * INTO CourseDetailsArchive from CourseDetails WHERE 1<>1 ; 
INSERT INTO CourseDetailsArchive SELECT * FROM CourseDetails; 
SELECT * FROM CourseDetailsArchive;
SELECT * FROM CourseDetails;

SELECT * INTO PlacementArchive from Placement WHERE 1<>1 ; 
INSERT INTO PlacementArchive SELECT * FROM Placement; 
SELECT * FROM PlacementArchive;
SELECT * FROM Placement;