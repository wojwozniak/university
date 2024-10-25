USE AdventureWorksLT2022;
GO

CREATE OR ALTER TRIGGER UpdateCustomerModifiedDate
	ON SalesLT.Customer
	AFTER UPDATE
	AS
		BEGIN
			SET NOCOUNT ON;
			UPDATE SalesLT.Customer
				SET ModifiedDate = GETDATE()
					FROM Inserted AS i
						WHERE SalesLT.Customer.CustomerID = i.CustomerID;
		END;

GO


UPDATE SalesLT.Customer
	SET FirstName = 'Mariusz', LastName = 'Pudzianowski'
		WHERE CustomerID = 1;

SELECT CustomerID, FirstName, LastName, ModifiedDate
	FROM SalesLT.Customer
		WHERE CustomerID = 1;