-- Start with declaring type for arguments
CREATE TYPE ProductIDTable AS TABLE
(
    ProductID INT
);
GO

-- Declare procedure taking id table and a date
CREATE OR ALTER PROCEDURE SetDiscontinuedDateForProducts
    @ProductIDs dbo.ProductIDTable READONLY,
    @DiscontinuedDate DATE
AS
BEGIN
    BEGIN TRANSACTION; -- do it as a transaction - all products will be updated at once and if something goes wrong none will
		
		-- traverse product ids row by row using cursor and print message for ones that are not null
		DECLARE @ProductID INT;

		-- declare cursor
		DECLARE ProductCursor CURSOR FOR
			SELECT ProductID
				FROM SalesLT.Product
					WHERE ProductID IN (SELECT ProductID FROM @ProductIDs)
									AND DiscontinuedDate IS NOT NULL;

		-- open cursor, print message for each product that already had date set
		OPEN ProductCursor;
			FETCH NEXT FROM ProductCursor INTO @ProductID;
				WHILE @@FETCH_STATUS = 0
				BEGIN
					PRINT 'Product with ID ' + CAST(@ProductID AS VARCHAR(10)) + ' already has a DiscontinuedDate set.';
					FETCH NEXT FROM ProductCursor INTO @ProductID;
				END;
		CLOSE ProductCursor;
		DEALLOCATE ProductCursor;

		-- set discontinued date for nulls
		UPDATE SalesLT.Product
			SET DiscontinuedDate = @DiscontinuedDate
				WHERE ProductID IN (SELECT ProductID FROM @ProductIDs)
								AND DiscontinuedDate IS NULL;

    COMMIT TRANSACTION;
END;
GO

-- table
SELECT * FROM SalesLT.Product;

-- example use
USE AdventureWorksLT2022;

DECLARE @ProductIDs dbo.ProductIDTable;

INSERT INTO @ProductIDs (ProductID) VALUES (680), (708), (710), (712);

EXEC SetDiscontinuedDateForProducts 
    @ProductIDs = @ProductIDs, 
    @DiscontinuedDate = '2024-10-23';