-- Constraint: SCRIPT CONSTRAINT AS -> CREATE TO -> New Query Editor
USE [AdventureWorksLT2022]
GO

ALTER TABLE [SalesLT].[SalesOrderHeader]  WITH NOCHECK ADD  CONSTRAINT [CK_SalesOrderHeader_ShipDate] CHECK  (([ShipDate]>=[OrderDate] OR [ShipDate] IS NULL))
GO

ALTER TABLE [SalesLT].[SalesOrderHeader] CHECK CONSTRAINT [CK_SalesOrderHeader_ShipDate]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Check constraint [ShipDate] >= [OrderDate] OR [ShipDate] IS NULL' , @level0type=N'SCHEMA',@level0name=N'SalesLT', @level1type=N'TABLE',@level1name=N'SalesOrderHeader', @level2type=N'CONSTRAINT',@level2name=N'CK_SalesOrderHeader_ShipDate'
GO


-- Constraint explained: We can't have a row with ShipDate before OrderDate

-- Try inserting illegal row:
INSERT INTO [SalesLT].[SalesOrderHeader] 
    (RevisionNumber, OrderDate, DueDate, ShipDate, Status, OnlineOrderFlag, CustomerID, ShipMethod, SubTotal, TaxAmt, Freight, ModifiedDate)
	VALUES 
		(1, '2024-10-10', '2024-10-12', '2024-10-08', 1, 1, 1, 'Standard', 100.00, 5.00, 10.00, GETDATE());

-- It bounces because of constraint. Now let's drop it:
ALTER TABLE [SalesLT].[SalesOrderHeader] NOCHECK CONSTRAINT [CK_SalesOrderHeader_ShipDate];

-- Try inserting illegal row again:
INSERT INTO [SalesLT].[SalesOrderHeader] 
    (RevisionNumber, OrderDate, DueDate, ShipDate, Status, OnlineOrderFlag, CustomerID, ShipMethod, SubTotal, TaxAmt, Freight, ModifiedDate)
	VALUES 
		(1, '2024-10-10', '2024-10-12', '2024-10-08', 1, 1, 1, 'Standard', 100.00, 5.00, 10.00, GETDATE());

-- It went through. Let's start checking it again:
ALTER TABLE [SalesLT].[SalesOrderHeader] CHECK CONSTRAINT [CK_SalesOrderHeader_ShipDate];

-- Let's look for violations:
SELECT *
	FROM [SalesLT].[SalesOrderHeader]
	WHERE ShipDate < OrderDate AND ShipDate IS NOT NULL;

-- It's here, so we see constraints work only on new rows, they don't interact with existing ones