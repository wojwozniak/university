-- ##### step 1: setup before first query #####

-- drop table if exists
IF OBJECT_ID('SalesLT.ProductBackup', 'U') IS NOT NULL
    DROP TABLE SalesLT.ProductBackup;

-- create table
SELECT * INTO SalesLT.ProductBackup
	FROM SalesLT.Product;

-- set identity insert on (so we can do it easily)
SET IDENTITY_INSERT SalesLT.ProductBackup ON;



-- ##### step 2: clear data before first query #####
TRUNCATE TABLE SalesLT.ProductBackup;



-- ##### step 3: stardard query timing #####
DECLARE @StartTime DATETIME = GETDATE();

INSERT INTO SalesLT.ProductBackup (ProductID, Name, ProductNumber, Color, StandardCost, 
                                   ListPrice, Size, Weight, ProductCategoryID, ProductModelID, 
                                   SellStartDate, SellEndDate, DiscontinuedDate, rowguid, 
                                   ModifiedDate)
SELECT ProductID, Name, ProductNumber, Color, StandardCost, ListPrice, Size, Weight, 
       ProductCategoryID, ProductModelID, SellStartDate, SellEndDate, DiscontinuedDate, 
       rowguid, ModifiedDate
	FROM SalesLT.Product;

DECLARE @EndTime DATETIME = GETDATE();
SELECT DATEDIFF(MILLISECOND, @StartTime, @EndTime) AS ExecutionTime_MS;




-- ##### step 4: clear data before first query #####
TRUNCATE TABLE SalesLT.ProductBackup;

-- ##### step 5: time cursor query #####
DECLARE @StartTime DATETIME = GETDATE();

SET IDENTITY_INSERT SalesLT.ProductBackup ON;


DECLARE ProductCursor CURSOR FOR
	SELECT ProductID, Name, ProductNumber, Color, StandardCost, ListPrice, Size, 
		   Weight, ProductCategoryID, ProductModelID, SellStartDate, SellEndDate, 
		   DiscontinuedDate, rowguid, ModifiedDate
		FROM SalesLT.Product;

	DECLARE @ProductID INT, @Name NVARCHAR(50), @ProductNumber NVARCHAR(25), 
			@Color NVARCHAR(15), @StandardCost DECIMAL(19, 4), @ListPrice DECIMAL(19, 4),
			@Size NVARCHAR(5), @Weight DECIMAL(8, 2), @ProductCategoryID INT, 
			@ProductModelID INT, @SellStartDate DATETIME, @SellEndDate DATETIME,
			@DiscontinuedDate DATETIME, @rowguid UNIQUEIDENTIFIER, @ModifiedDate DATETIME;

	OPEN ProductCursor;

	FETCH NEXT FROM ProductCursor INTO @ProductID, @Name, @ProductNumber, @Color, 
									   @StandardCost, @ListPrice, @Size, @Weight, 
									   @ProductCategoryID, @ProductModelID, @SellStartDate,
									   @SellEndDate, @DiscontinuedDate, @rowguid, 
									   @ModifiedDate;

	WHILE @@FETCH_STATUS = 0
		BEGIN
			INSERT INTO SalesLT.ProductBackup (ProductID, Name, ProductNumber, Color, 
											   StandardCost, ListPrice, Size, Weight, 
											   ProductCategoryID, ProductModelID, SellStartDate, 
											   SellEndDate, DiscontinuedDate, rowguid, 
											   ModifiedDate)
			VALUES (@ProductID, @Name, @ProductNumber, @Color, @StandardCost, @ListPrice,
					@Size, @Weight, @ProductCategoryID, @ProductModelID, @SellStartDate,
					@SellEndDate, @DiscontinuedDate, @rowguid, @ModifiedDate);

			FETCH NEXT FROM ProductCursor INTO @ProductID, @Name, @ProductNumber, @Color, 
											   @StandardCost, @ListPrice, @Size, @Weight, 
											   @ProductCategoryID, @ProductModelID, @SellStartDate,
											   @SellEndDate, @DiscontinuedDate, @rowguid, 
											   @ModifiedDate;
		END;

	CLOSE ProductCursor;
DEALLOCATE ProductCursor;

DECLARE @EndTime DATETIME = GETDATE();
SELECT DATEDIFF(MILLISECOND, @StartTime, @EndTime) AS ExecutionTime_MS;

-- We can see that in this example that cursor is slower
-- in this example cursor takes 10 times more time (43ms vs 4ms)
-- we have to read each row separately and process it, instead
-- of allowing database engine to optimise it so we lose a lot of time