use WorldCountry 

Create Table Details (
  Name varchar(15),
  age int,
  location varchar(25),
  ID int
)

INSERT INTO Details VALUES 
('Mohan',20,'Hosur',635109),
('Abisheak',20,'Tirupattur',635136),
('Vishwa',19,'Hosur',635109),
('Dhanush',20,'Tirupattur',635136) ; 
 
Select * from Details ;

SELECT Location COUNT(*) As Numbers from Details GROUP BY Location ; 