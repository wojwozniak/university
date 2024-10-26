Use AdventureWorksLT2022;


-- price history table to store data generated in this task
CREATE TABLE SalesLT.ProductPriceHistory (
    ProductID INT NOT NULL,
    StandardCost DECIMAL(18, 4),
    ListPrice DECIMAL(18, 4),
    ChangeDate DATETIME NOT NULL,
    CONSTRAINT PK_ProductPriceHistory PRIMARY KEY (ProductID, ChangeDate),
    CONSTRAINT FK_ProductPriceHistory_Product FOREIGN KEY (ProductID) 
        REFERENCES SalesLT.Product(ProductID)
);


-- trigger inserting into our table after price change
CREATE TRIGGER trg_ProductPriceChange
	ON SalesLT.Product
	AFTER UPDATE
AS
BEGIN
    INSERT INTO SalesLT.ProductPriceHistory (ProductID, StandardCost, ListPrice, ChangeDate)
		SELECT 
			i.ProductID,
			i.StandardCost,
			i.ListPrice,
			GETDATE()
				FROM 
					inserted i
				INNER JOIN 
					deleted d ON i.ProductID = d.ProductID
				WHERE 
					i.StandardCost <> d.StandardCost OR i.ListPrice <> d.ListPrice;
END;


-- function for displaying price history periods
WITH PriceHistory AS (
    SELECT 
        ProductID,
        StandardCost,
        ListPrice,
        ChangeDate,
        LEAD(ChangeDate) OVER (PARTITION BY ProductID ORDER BY ChangeDate) AS NextChangeDate
			FROM 
				SalesLT.ProductPriceHistory
)
SELECT 
    ProductID,
    StandardCost,
    ListPrice,
    ChangeDate AS EffectiveFrom,
    ISNULL(NextChangeDate, GETDATE()) AS EffectiveTo
		FROM 
			PriceHistory
		ORDER BY 
			ProductID, EffectiveFrom;



-- we should also save current prices (so we know what we started with)
-- we should have insert/delete trigger so we get start and end prices when we add or remove a product


SELECT * FROM SalesLT.Product;

-- ### TEST ###
UPDATE SalesLT.Product
	SET StandardCost = 12.00
		WHERE ProductID = 680;

SELECT * FROM SalesLT.ProductPriceHistory;

UPDATE SalesLT.Product
	SET StandardCost = 14.00
		WHERE ProductID = 680;

SELECT * FROM SalesLT.ProductPriceHistory;