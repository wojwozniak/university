-- create test db
CREATE DATABASE ProductPricingDB;
GO

-- use correct db
USE ProductPricingDB;
GO


-- i am assuming that task is a "recalculator" of currency prices
-- after currency rates have been updated



-- ### Step 1: setup ###
IF OBJECT_ID('dbo.Prices', 'U') IS NOT NULL DROP TABLE dbo.Prices;
IF OBJECT_ID('dbo.Rates', 'U') IS NOT NULL DROP TABLE dbo.Rates;
IF OBJECT_ID('dbo.Products', 'U') IS NOT NULL DROP TABLE dbo.Products;

CREATE TABLE Products (
    ID INT PRIMARY KEY,
    ProductName NVARCHAR(100)
);

CREATE TABLE Rates (
    Currency NVARCHAR(10) PRIMARY KEY,
    PricePLN DECIMAL(18, 2)
);

CREATE TABLE Prices (
    ProductID INT REFERENCES Products(ID),
    Currency NVARCHAR(10), --REFERENCES Rates(Currency), -- commented out so we can add bad data instantly and check it
    Price DECIMAL(18, 2)
);

INSERT INTO Products (ID, ProductName) VALUES
	(1, 'Product A'),
	(2, 'Product B'),
	(3, 'Product C');

INSERT INTO Rates (Currency, PricePLN) VALUES
	('PLN', 1.00),
	('USD', 4.00), -- update this rate to see difference in outputed values
	('EUR', 4.40), -- -,,-
	('CHF', 5.00);

INSERT INTO Prices (ProductID, Currency, Price) VALUES
	(1, 'PLN', 30.00),
	(2, 'PLN', 20.00),
	(3, 'PLN', 35.00),
	(1, 'USD', 10.00),
	(2, 'EUR', 20.00),
	(3, 'JPY', 15.00); -- this should get deleted by our cursor



-- ### Step 2: Cursor ###
DECLARE @ProductID INT,
        @Currency NVARCHAR(10),
        @Price DECIMAL(10, 2),
		@PricePLN DECIMAL(10, 2);

DECLARE price_cursor CURSOR FOR
	SELECT ProductID, Currency, Price
		FROM Prices
			WHERE Currency <> 'PLN'; -- skip pln as we do not update those prices

	OPEN price_cursor;
		FETCH NEXT FROM price_cursor INTO @ProductID, @Currency, @Price;
		WHILE @@FETCH_STATUS = 0
		BEGIN
			-- delete the row that has no corresponding currency in Currency table
			IF NOT EXISTS (SELECT 1 FROM Rates WHERE Currency = @Currency)
				BEGIN
					DELETE FROM Prices
						WHERE ProductID = @ProductID AND Currency = @Currency;
				END
			-- recalculate rate for rows which have their currency in Currency table
			ELSE
				BEGIN
					-- get PLN price
					SELECT @PricePLN = Price
						FROM Prices
							WHERE ProductID = @ProductID AND Currency = 'PLN';

					-- update
					UPDATE Prices
						SET Price = @PricePLN * (SELECT PricePLN FROM Rates WHERE Currency = @Currency)
							WHERE ProductID = @ProductID AND Currency = @Currency;
				END

				FETCH NEXT FROM price_cursor INTO @ProductID, @Currency, @Price;
			END
		CLOSE price_cursor;
	DEALLOCATE price_cursor;



-- ### Step 3: Check ###
SELECT * FROM Prices;