--Like operator

use WorldCountry
CREATE TABLE CountryDetails (
    CountryID INT PRIMARY KEY,
    CountryName VARCHAR(50) 
)

--Truncate table CountryDetails ;
INSERT INTO CountryDetails VALUES 
(1,'India'), (2,'USA'), (3,'UK'), (4,'Germany'), (5,'India') , (6,'Germany'), (7,'India');

select * from CountryDetails

SELECT * FROM CountryDetails
WHERE CountryName LIKE '_ndia';


SELECT * FROM CountryDetails
WHERE CountryName LIKE 'I_d_a';

SELECT * FROM CountryDetails     ---[charlist],%,_,---[!charlist]
WHERE CountryName LIKE '[In]%';


SELECT * FROM CountryDetails
WHERE CountryName LIKE '[A-n]%'; 

SELECT * FROM CountryDetails
WHERE CountryName  NOT LIKE '[!a]%'; 

SELECT * FROM CountryDetails
WHERE CountryName  NOT LIKE '[a]%'; 


SELECT * FROM CountryDetails
WHERE CountryName  NOT LIKE '[a-I]%';