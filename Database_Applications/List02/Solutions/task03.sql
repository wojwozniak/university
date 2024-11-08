CREATE OR ALTER PROCEDURE AddReader
    @PESEL CHAR(11),
    @Nazwisko NVARCHAR(30),
    @Miasto NVARCHAR(30),
    @Data_Urodzenia NVARCHAR(30)
	AS
BEGIN
    -- Validating PESEL - 11 digits
    IF @PESEL NOT LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'
    BEGIN
        THROW 50001, 'Error: PESEL must be exactly 11 digits.', 1;
    END

	-- Validate PESEL control sum
	DECLARE @sum INT;
    DECLARE @controlDigit INT = CAST(SUBSTRING(@PESEL, 11, 1) AS INT);

    SET @sum = 
        1 * CAST(SUBSTRING(@PESEL, 1, 1) AS INT) +
        3 * CAST(SUBSTRING(@PESEL, 2, 1) AS INT) +
        7 * CAST(SUBSTRING(@PESEL, 3, 1) AS INT) +
        9 * CAST(SUBSTRING(@PESEL, 4, 1) AS INT) +
        1 * CAST(SUBSTRING(@PESEL, 5, 1) AS INT) +
        3 * CAST(SUBSTRING(@PESEL, 6, 1) AS INT) +
        7 * CAST(SUBSTRING(@PESEL, 7, 1) AS INT) +
        9 * CAST(SUBSTRING(@PESEL, 8, 1) AS INT) +
        1 * CAST(SUBSTRING(@PESEL, 9, 1) AS INT) +
        3 * CAST(SUBSTRING(@PESEL, 10, 1) AS INT);

    SET @sum = @sum % 10;
    SET @sum = CASE WHEN @sum = 0 THEN 0 ELSE 10 - @sum END;

    IF @sum != @controlDigit
    BEGIN
        THROW 50004, 'Error: Invalid PESEL control sum.', 1;
    END

    -- Surname of length at least 2 and starting with capital letter
    IF @Nazwisko COLLATE Latin1_General_BIN NOT LIKE '[A-Z]%' OR LEN(@Nazwisko) < 2
    BEGIN
        THROW 50002, 'Error: Last name must start with a capital letter and contain at least 2 letters.', 1;
    END

    -- Correct birth date format
    BEGIN TRY
        DECLARE @validDate DATE;
        SET @validDate = CAST(@Data_Urodzenia AS DATE);
    END TRY
    BEGIN CATCH
        THROW 50003, 'Error: Invalid birth date format.', 1;
    END CATCH

    -- If all tests pass, insert into table
    INSERT INTO Czytelnik (PESEL, Nazwisko, Miasto, Data_Urodzenia)
    VALUES (@PESEL, @Nazwisko, @Miasto, @Data_Urodzenia);

    PRINT 'Reader added successfully.';
END;


-- insert good ones
EXEC AddReader @PESEL = '44051401359', @Nazwisko = 'Nowak', @Miasto = 'Wroclaw', @Data_Urodzenia = '1985-05-15';
EXEC AddReader @PESEL = '55122510230', @Nazwisko = 'Zielinski', @Miasto = 'Wroclaw', @Data_Urodzenia = '1955-12-25';

select * from Czytelnik;

-- try inserting bad ones
EXEC AddReader @PESEL = '1234567890', @Nazwisko = 'Nowak', @Miasto = 'Wroclaw', @Data_Urodzenia = '1985-05-15'; -- invalid PESEL length
EXEC AddReader @PESEL = '12345678900', @Nazwisko = 'Zielinski', @Miasto = 'Wroclaw', @Data_Urodzenia = '1970-08-15'; -- invalid PESEL control sum
EXEC AddReader @PESEL = '44051401359', @Nazwisko = 'nowak', @Miasto = 'Wroclaw', @Data_Urodzenia = '1985-05-15'; -- lowercasse last name
EXEC AddReader @PESEL = '44051401359', @Nazwisko = 'N', @Miasto = 'Wroclaw', @Data_Urodzenia = '1985-05-15'; -- too short last name
EXEC AddReader @PESEL = '44051401359', @Nazwisko = 'Nowak', @Miasto = 'Wroclaw', @Data_Urodzenia = '15-05-1985'; -- invalid date format (not yyyy-mm-dd)

-- delete good ones for test purposes (insert again)
DELETE FROM Czytelnik WHERE PESEL = '44051401359';
DELETE FROM Czytelnik WHERE PESEL = '55122510230';