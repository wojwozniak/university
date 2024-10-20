-- setup for task reruns
DROP TABLE IF EXISTS firstnames;
DROP TABLE IF EXISTS lastnames;
DROP TABLE IF EXISTS fldata;

-- Create tables
CREATE TABLE firstnames (
    id INT PRIMARY KEY,
    firstname VARCHAR(50)
);

CREATE TABLE lastnames (
    id INT PRIMARY KEY,
    lastname VARCHAR(50)
);

CREATE TABLE fldata (
    firstname VARCHAR(50),
    lastname VARCHAR(50),
    PRIMARY KEY (firstname, lastname)
);

-- insert example data
INSERT INTO firstnames (id, firstname) VALUES
(1, 'Jacek'),
(2, 'Karol'),
(3, 'Adam'),
(4, 'Mariusz'),
(5, 'Robert');

INSERT INTO lastnames (id, lastname) VALUES
(1, 'Soplica'),
(2, 'Wojty³a'),
(3, 'Mickiewicz'),
(4, 'Pudzianowski'),
(5, 'Mak³owicz');

-- check tables after insert
SELECT * FROM firstnames;
SELECT * FROM lastnames;

-- Create procedure
CREATE OR ALTER PROCEDURE GenerateRandomNamePairs
    @n INT
AS
BEGIN
    -- Clear fldata contents
    DELETE FROM fldata;

	-- Calculate the amount of possible name-surname combinations
    DECLARE @firstnamesCount INT;
    DECLARE @lastnamesCount INT;
    SELECT @firstnamesCount = COUNT(DISTINCT firstname) FROM firstnames;
    SELECT @lastnamesCount = COUNT(DISTINCT lastname) FROM lastnames;
    DECLARE @totalPairs INT = @firstnamesCount * @lastnamesCount;

    -- Check if n exceeds the total number of pairs, throw error if it does
    IF @n > @totalPairs
    BEGIN
        THROW 42, 'Error: Too many pairs requested', 1;
    END

    -- And now we generate and insert random pairs

	-- Auxilliary variables
    DECLARE @i INT = 0;
    DECLARE @randFirstname VARCHAR(50);
    DECLARE @randLastname VARCHAR(50);

	-- Table for storing already generated pairs
    DECLARE @usedPairs TABLE (firstname VARCHAR(50), lastname VARCHAR(50));

	-- Algorithm optimised for smaller values (where i is far from n)
	-- If we wanted to work on big values and for i ~ n then we could rework it to generate
	-- pairs first and then take them out randomly
    WHILE @i < @n
    BEGIN
        SELECT TOP 1 @randFirstname = firstname FROM firstnames ORDER BY NEWID();
        SELECT TOP 1 @randLastname = lastname FROM lastnames ORDER BY NEWID();

        IF NOT EXISTS (SELECT 1 FROM @usedPairs WHERE firstname = @randFirstname AND lastname = @randLastname)
        BEGIN
            INSERT INTO fldata (firstname, lastname) VALUES (@randFirstname, @randLastname);
            INSERT INTO @usedPairs (firstname, lastname) VALUES (@randFirstname, @randLastname);
            SET @i = @i + 1;
        END
    END
END;

exec GenerateRandomNamePairs 4;
SELECT * FROM fldata;