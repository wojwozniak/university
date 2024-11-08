USE Test;

-- Setup tables for examples
DROP TABLE IF EXISTS Orders;
DROP TABLE IF EXISTS Accounts;

-- Create the Accounts table
CREATE TABLE Accounts (
    AccountID INT PRIMARY KEY,
    AccountName NVARCHAR(50),
    Balance DECIMAL(18, 2)
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerName NVARCHAR(50),
    Status NVARCHAR(20)
);

INSERT INTO Accounts (AccountID, AccountName, Balance)
VALUES 
    (1, 'Robert Mak³owicz', 3000.00),
    (2, 'Mariusz Pudzianowski', 5000.00),
    (3, 'Karol Wojty³a', 10000.00),
    (4, 'Ksi¹dz Robak', 7000.00),
    (5, 'Jacek Soplica', 4000.00);

INSERT INTO Orders (OrderID, CustomerName, Status)
VALUES
    (2001, 'Robert Mak³owicz', 'Pending'),
    (2002, 'Mariusz Pudzianowski', 'Pending'),
    (2003, 'Karol Wojty³a', 'Completed'),
    (2004, 'Ksi¹dz Robak', 'Pending'),
    (2005, 'Jacek Soplica', 'Completed');

-- Disable protection
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

-- # Example 1 - dirty read - reading uncommited data
-- Transaction A:
BEGIN TRANSACTION;
UPDATE Accounts SET Balance = Balance + 500 WHERE AccountID = 1;

-- Transaction B:
SELECT Balance FROM Accounts WHERE AccountID = 1;

-- Transaction A:
ROLLBACK TRANSACTION;

-- # Example 2 - non-repeatable read - data in a row changes
-- Transaction A:
BEGIN TRANSACTION;
SELECT Balance FROM Accounts WHERE AccountID = 1;

-- Transaction B:
BEGIN TRANSACTION;
UPDATE Accounts SET Balance = Balance + 500 WHERE AccountID = 1;
COMMIT TRANSACTION;

-- Transaction A:
SELECT Balance FROM Accounts WHERE AccountID = 1;
COMMIT TRANSACTION;

-- # Example 3 - phantom read - different rows by same query
-- Transaction A:
BEGIN TRANSACTION;
SELECT * FROM Orders WHERE Status = 'Pending';

-- Transaction B:
BEGIN TRANSACTION;
INSERT INTO Orders (OrderID, Status) VALUES (1006, 'Pending');
COMMIT TRANSACTION;

-- Transaction A:
SELECT * FROM Orders WHERE Status = 'Pending';
COMMIT TRANSACTION;
