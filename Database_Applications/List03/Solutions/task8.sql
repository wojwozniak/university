CREATE DATABASE RecurviseTriggerDb;
GO

Use RecurviseTriggerDb;

ALTER DATABASE RecurviseTriggerDb SET RECURSIVE_TRIGGERS ON;

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName NVARCHAR(100),
    Price DECIMAL(10, 2),
    Counter INT DEFAULT 0
);



CREATE TRIGGER trg_UpdateCounter
	ON Products
	AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    IF UPDATE(Price)
    BEGIN
        UPDATE Products
			SET Counter = Counter + 1
				WHERE ProductID IN (SELECT ProductID FROM inserted);

        UPDATE Products
			SET Price = Price * 1.01
				WHERE ProductID IN (SELECT ProductID FROM inserted);
    END
END;

INSERT INTO Products (ProductID, ProductName, Price) VALUES (1, 'Sample Product', 100.00);

UPDATE Products
	SET Price = 120.00
		WHERE ProductID = 1;

SELECT * FROM Products;

SELECT name AS 'Database name', is_recursive_triggers_on AS 'Recursive Triggers Enabled'
	FROM sys.databases
		WHERE name = 'RecurviseTriggerDb';
