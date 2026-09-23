DECLARE @i INT = 1;
WHILE @i <= 5  --1 <=5
BEGIN
    PRINT 'Loop Number: ' + CAST(@i AS VARCHAR(10));
    SET @i = @i + 1; -- Important: otherwise infinite loop
END

DECLARE @counter INT = 0;
WHILE @counter < 10
BEGIN
    SET @counter = @counter + 1;
    IF @counter = 5
        CONTINUE; -- skip 5
    IF @counter = 8
        BREAK; -- stop loop at 8
    PRINT @counter;
END

DECLARE @num INT = 1;
WHILE @num <= 10
BEGIN
    IF @num = 7
    BEGIN
        RAISERROR('in lift only 7 person is allowed at a time. Over Size and Weight occured.', 16, 1);
        --Raiserror means error passing message 
        BREAK; -- exit loop
    END   
    PRINT 'Welcome to ABC Apartment Lift for person: ' + CAST(@num AS VARCHAR);
    -- INSERT INTO Table VALUES(@num);
    SET @num = @num + 1;
END

