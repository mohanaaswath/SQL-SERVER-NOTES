--Sub Query


USE WorldCountry;


-- Create MovieDetails table
CREATE TABLE MovieDetails
(
    MovieID INT IDENTITY(1,1) PRIMARY KEY,
    MovieName VARCHAR(100) NOT NULL,
    Genre VARCHAR(50) NOT NULL,
    ReleaseYear INT,
    Director VARCHAR(100),
    Rating DECIMAL(3,1),
    GrossCollectionCr DECIMAL(10,2)
);


-- Insert Movie Details
INSERT INTO MovieDetails
(
    MovieName,
    Genre,
    ReleaseYear,
    Director,
    Rating,
    GrossCollectionCr
)
VALUES

-- Action
('Leo', 'Action', 2023, 'Lokesh Kanagaraj', 8.0, 620.00),
('Jailer', 'Action', 2023, 'Nelson Dilipkumar', 7.1, 605.00),
('Vikram', 'Action', 2022, 'Lokesh Kanagaraj', 8.3, 500.00),
('Master', 'Action', 2021, 'Lokesh Kanagaraj', 7.3, 300.00),
('Beast', 'Action', 2022, 'Nelson Dilipkumar', 5.2, 250.00),
('Valimai', 'Action', 2022, 'H. Vinoth', 5.6, 200.00),
('Thunivu', 'Action', 2023, 'H. Vinoth', 6.1, 220.00),

-- Drama
('96', 'Drama', 2018, 'C. Prem Kumar', 8.5, 50.00),
('Jai Bhim', 'Drama', 2021, 'T. J. Gnanavel', 9.0, 100.00),
('Soorarai Pottru', 'Drama', 2020, 'Sudha Kongara', 8.7, 120.00),
('Pariyerum Perumal', 'Drama', 2018, 'Mari Selvaraj', 8.7, 30.00),
('Karnan', 'Drama', 2021, 'Mari Selvaraj', 8.0, 65.00),
('Asuran', 'Drama', 2019, 'Vetrimaaran', 8.5, 75.00),
('Vada Chennai', 'Drama', 2018, 'Vetrimaaran', 8.7, 60.00),

-- Comedy
('Doctor', 'Comedy', 2021, 'Nelson Dilipkumar', 7.4, 100.00),
('Good Night', 'Comedy', 2023, 'Vinayak Chandrasekaran', 7.8, 20.00),
('Love Today', 'Comedy', 2022, 'Pradeep Ranganathan', 7.4, 80.00),
('Don', 'Comedy', 2022, 'Cibi Chakaravarthi', 6.9, 100.00),
('Beast Comedy', 'Comedy', 2023, 'Test Director', 6.5, 60.00),
('Varuthapadatha Valibar Sangam', 'Comedy', 2013, 'Ponram', 6.9, 45.00),
('Remo', 'Comedy', 2016, 'Bakkiyaraj Kannan', 6.0, 70.00),

-- Thriller
('Ratsasan', 'Thriller', 2018, 'Ram Kumar', 8.3, 50.00),
('Por Thozhil', 'Thriller', 2023, 'Vignesh Raja', 8.0, 40.00),
('Dhuruvangal Pathinaaru', 'Thriller', 2016, 'Karthick Naren', 8.2, 25.00),
('Maanadu', 'Thriller', 2021, 'Venkat Prabhu', 8.1, 100.00),
('Thegidi', 'Thriller', 2014, 'P. Ramesh', 7.8, 30.00),
('Imaikkaa Nodigal', 'Thriller', 2018, 'R. Ajay Gnanamuthu', 7.3, 60.00),
('Dhurai', 'Thriller', 2022, 'Test Director', 6.8, 35.00),

-- Romance
('Vinnaithaandi Varuvaayaa', 'Romance', 2010, 'Gautham Vasudev Menon', 8.1, 40.00),
('Alaipayuthey', 'Romance', 2000, 'Mani Ratnam', 8.3, 35.00),
('OK Kanmani', 'Romance', 2015, 'Mani Ratnam', 7.4, 50.00),
('Sillunu Oru Kadhal', 'Romance', 2006, 'N. Krishna', 7.1, 30.00),
('Raja Rani', 'Romance', 2013, 'Atlee', 7.6, 60.00),
('96 Romance', 'Romance', 2018, 'C. Prem Kumar', 8.5, 55.00),
('Kadhalum Kadandhu Pogum', 'Romance', 2016, 'Nalan Kumarasamy', 7.7, 25.00);


-- Check the table
SELECT * FROM MovieDetails;

--highest grosser overall
SELECT MovieName, Genre, Director, GrossCollectionCr
FROM MovieDetails
WHERE GrossCollectionCr =
(
    SELECT MAX(GrossCollectionCr)
    FROM MovieDetails
);

--Top movie in each genre

SELECT MovieName, Genre, Director, GrossCollectionCr
FROM MovieDetails M1
WHERE GrossCollectionCr =
(
    SELECT MAX(GrossCollectionCr)
    FROM MovieDetails M2
    WHERE M2.Genre = M1.Genre
)
ORDER BY Genre;

--1st to 5th highest in each genre

SELECT 
    (
        SELECT COUNT(DISTINCT M2.GrossCollectionCr)
        FROM MovieDetails M2
        WHERE M2.Genre = M1.Genre
          AND M2.GrossCollectionCr >= M1.GrossCollectionCr
    ) AS RankInGenre,
    MovieName,
    Genre,
    Director,
    GrossCollectionCr
FROM MovieDetails M1
WHERE
(
    SELECT COUNT(DISTINCT M2.GrossCollectionCr)
    FROM MovieDetails M2
    WHERE M2.Genre = M1.Genre
      AND M2.GrossCollectionCr >= M1.GrossCollectionCr
) BETWEEN 1 AND 5
ORDER BY Genre, GrossCollectionCr DESC;

--Above-average movie in each genre

SELECT MovieName, Genre, GrossCollectionCr
FROM MovieDetails M1
WHERE GrossCollectionCr >
(
    SELECT AVG(GrossCollectionCr)
    FROM MovieDetails M2
    WHERE M2.Genre = M1.Genre
)
ORDER BY Genre, GrossCollectionCr DESC;


