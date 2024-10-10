-- PART 1: create test table and set identity generation
DROP TABLE IF EXISTS Test;

CREATE TABLE Test (
    TestID INT IDENTITY(1000, 10),
    TestName NVARCHAR(50)
);

INSERT INTO Test (TestName) VALUES ('Sample 1');
INSERT INTO Test (TestName) VALUES ('Sample 2');
INSERT INTO Test (TestName) VALUES ('Sample 3');

SELECT * FROM Test;

-- PART 2: show difference between @@IDENTITY and IDENT_CURRENT

-- @IDENTITY will return 1020, as it is last id generated in this session
SELECT @@IDENTITY AS 'Last Identity Value generated in this session for any table';

-- IDENT_CURRENT will also return 1020, as it is last id generated for Test table across all sessions
SELECT IDENT_CURRENT('Test') AS 'Last Identity Value for Test table across all sessions';

-- Now we show my descriptions are real - let's create another table and add element there, then see what happens
DROP TABLE IF EXISTS Test2;

CREATE TABLE Test2 (
    TestID INT IDENTITY(1000, 10),
    TestName NVARCHAR(50)
);

INSERT INTO Test2 (TestName) VALUES ('Sample 1');


-- And now we can see the difference:

-- @IDENTITY will now return 1000
SELECT @@IDENTITY AS 'Last Identity Value generated in this session for any table';

-- IDENT_CURRENT will still return 1020
SELECT IDENT_CURRENT('Test') AS 'Last Identity Value for Test table across all sessions';