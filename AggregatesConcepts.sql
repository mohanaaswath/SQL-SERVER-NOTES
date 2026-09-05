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

--SELECT Location COUNT(*) As Numbers from Details GROUP BY Location ; 

CREATE TABLE IndianMovies (
    MovieID INT PRIMARY KEY,
    Title VARCHAR(100),
    Genre VARCHAR(30),
    Director VARCHAR(50),
    ReleaseYear INT,
    Rating DECIMAL(3,1), -- IMDb 0-10
    DurationMin INT,
    BudgetCr DECIMAL(10,2), -- in Crores
    BoxOfficeCr DECIMAL(10,2),
    Language VARCHAR(20)
);

INSERT INTO IndianMovies VALUES
(1, 'Dangal', 'Biography', 'Nitesh Tiwari', 2016, 8.4, 161, 70, 2024, 'Hindi'),
(2, 'KGF Chapter 2', 'Action', 'Prashanth Neel', 2022, 8.2, 168, 100, 1250, 'Kannada'),
(3, 'Baahubali 2', 'Action', 'S S Rajamouli', 2017, 8.2, 171, 250, 1810, 'Telugu'),
(4, '3 Idiots', 'Comedy', 'Rajkumar Hirani', 2009, 8.4, 170, 55, 460, 'Hindi'),
(5, 'Kantara', 'Action', 'Rishab Shetty', 2022, 8.2, 150, 16, 400, 'Kannada'),
(6, 'Drishyam 2', 'Thriller', 'Jeethu Joseph', 2021, 8.4, 152, 15, 345, 'Malayalam'),
(7, 'Jawan', 'Action', 'Atlee', 2023, 7.8, 169, 300, 1160, 'Hindi'),
(8, 'RRR', 'Action', 'S S Rajamouli', 2022, 7.9, 187, 550, 1200, 'Telugu'),
(9, 'PK', 'Comedy', 'Rajkumar Hirani', 2014, 8.1, 153, 85, 854, 'Hindi'),
(10, 'Charlie 777', 'Drama', 'Kiranraj K', 2022, 8.7, 164, 20, 105, 'Kannada'),
(11, 'Vikram', 'Action', 'Lokesh Kanagaraj', 2022, 8.3, 175, 120, 500, 'Tamil'),
(12, 'Pathaan', 'Action', 'Siddharth Anand', 2023, 7.2, 146, 250, 1050, 'Hindi'),
(13, 'Kantara A Legend', 'Action', 'Rishab Shetty', 2022, 8.0, 150, 16, 400, 'Kannada'), -- duplicate for group by
(14, 'Leo', 'Action', 'Lokesh Kanagaraj', 2023, 7.5, 164, 250, 620, 'Tamil'),
(15, 'Animal', 'Action', 'Sandeep Reddy', 2023, 7.1, 201, 100, 915, 'Hindi'),
(16, '12th Fail', 'Biography', 'Vidhu Vinod Chopra', 2023, 8.8, 147, 20, 70, 'Hindi'),
(17, 'Jailer', 'Action', 'Nelson', 2023, 7.1, 168, 120, 650, 'Tamil'),
(18, 'Hombale Film 1', 'Drama', 'Rishab Shetty', 2022, 7.0, 140, 10, 50, 'Kannada'),
(19, 'Munjya', 'Horror', 'Aditya Sarpotdar', 2024, 6.5, 123, 30, 130, 'Hindi'),
(20, 'Manjummel Boys', 'Thriller', 'Chidambaram', 2024, 8.2, 135, 20, 240, 'Malayalam'),
(21, 'Salaar', 'Action', 'Prashanth Neel', 2023, 7.5, 175, 270, 715, 'Telugu'),
(22, 'Dunki', 'Comedy', 'Rajkumar Hirani', 2023, 7.0, 161, 120, 470, 'Hindi'),
(23, 'Lucifer', 'Action', 'Prithviraj', 2019, 7.4, 163, 30, 200, 'Malayalam'),
(24, 'KGF Chapter 1', 'Action', 'Prashanth Neel', 2018, 8.2, 156, 80, 250, 'Kannada'),
(25, 'Pushpa 2', 'Action', 'Sukumar', 2024, 7.8, 180, 500, 1800, 'Telugu');


select Genre,* from IndianMovies

SELECT COUNT(*) AS TotalMovies FROM IndianMovies;

SELECT COUNT(DISTINCT Genre) AS TotalGenres 
FROM IndianMovies;

SELECT Genre, COUNT(*) AS MovieCount
FROM IndianMovies GROUP BY Genre;

SELECT SUM(BoxOfficeCr) AS TotalBoxOffice 
FROM IndianMovies;
-- Result: 15643.00 Cr

SELECT Director, SUM(BoxOfficeCr) AS TotalCollection
FROM IndianMovies GROUP BY Director 
ORDER BY TotalCollection DESC;

SELECT AVG(Rating) AS AvgRating, 
AVG(DurationMin) AS AvgDuration FROM IndianMovies;


SELECT Genre, AVG(Rating) AS AvgRating, 
AVG(BoxOfficeCr) AS AvgCollection
FROM IndianMovies GROUP BY Genre;

SELECT 
    MIN(Rating) AS LowestRating,
    MAX(Rating) AS HighestRating,
    MIN(BoxOfficeCr) AS LowestCollection,
    MAX(BoxOfficeCr) AS HighestCollection,
    MIN(ReleaseYear) AS FirstMovieYear,
    MAX(ReleaseYear) AS LatestMovieYear
FROM IndianMovies;

SELECT 
    Director,
    COUNT(*) AS TotalMovies,
    AVG(Rating) AS AvgRating,
    SUM(BoxOfficeCr) AS TotalBoxOffice,
    MAX(BoxOfficeCr) AS BiggestHit,
    MIN(ReleaseYear) AS DebutYear
FROM IndianMovies
GROUP BY Director
ORDER BY TotalBoxOffice DESC;

SELECT Director, COUNT(*) AS Movies, 
SUM(BoxOfficeCr) AS Total
FROM IndianMovies
GROUP BY Director
HAVING COUNT(*) > 1 
AND SUM(BoxOfficeCr) > 500
ORDER BY Total DESC;


SELECT 
    Title,
    BoxOfficeCr - BudgetCr AS ProfitCr,
    CAST((BoxOfficeCr - BudgetCr) / BudgetCr * 100 AS INT) AS ProfitPercent
FROM IndianMovies
ORDER BY ProfitCr DESC;

SELECT 
    ReleaseYear,
    COUNT(*) AS MoviesReleased,
    AVG(Rating) AS AvgRating,
    SUM(BoxOfficeCr) AS YearCollection,
    MAX(BoxOfficeCr) AS TopMovieCollection
FROM IndianMovies
GROUP BY ReleaseYear
HAVING COUNT(*) >= 2
ORDER BY ReleaseYear;

--WHERE = Filters ROWS before GROUP BY
--HAVING = Filters GROUPS after GROUP BY

SELECT Title, Genre, ReleaseYear, Rating
FROM IndianMovies
WHERE Genre = 'Action' AND ReleaseYear > 2020;

SELECT Genre, COUNT(*) AS TotalMovies, 
AVG(Rating) AS AvgRating
FROM IndianMovies
GROUP BY Genre
HAVING AVG(Rating) > 8.0;


SELECT Genre, AVG(Rating) 
FROM IndianMovies WHERE AVG(Rating) > 8.0 
GROUP BY Genre;


SELECT Genre, COUNT(*) AS MovieCount,
AVG(BoxOfficeCr) AS AvgCollection
FROM IndianMovies
WHERE ReleaseYear > 2015  -- Step 1: Filter rows first, remove old movies (3 Idiots, PK removed)
GROUP BY Genre            -- Step 2: Group remaining rows by Genre
HAVING COUNT(*) > 2       -- Step 3: Filter groups, only keep genres with >2 movies
ORDER BY MovieCount DESC;


SELECT Genre, SUM(BoxOfficeCr) AS Total
FROM IndianMovies
WHERE Rating > 7.5          -- Row filter: Only good movies
GROUP BY Genre
HAVING SUM(BoxOfficeCr) > 1000 -- Group filter: Only rich genres

-------------------------------------------------------------------------------------------------
