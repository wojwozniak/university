USE AdventureWorksLT2022;
GO

-- https://learn.microsoft.com/en-us/sql/t-sql/language-elements/save-transaction-transact-sql?view=sql-server-ver16
-- Procedure from links creates a savepoint if a procedure 
-- is called from other procedure, so if it fails,
-- it preserves work made by others


-- Simple example from me (with hardcoded values, as we
-- only use this to explain the concept)

-- Our procedure is for updating customer data and order
-- details. In our scenario, we want to update customer
-- and order header tables. If update of the second one
-- fails, we still want to preserve changes to first one

CREATE OR ALTER PROCEDURE UpdateCustomerAndOrderDetails
AS
BEGIN
    BEGIN TRANSACTION;
    BEGIN TRY
        UPDATE SalesLT.Customer
			SET LastName = 'Smith'
				WHERE CustomerID = 1;

        SAVE TRANSACTION CustomerUpdateSavepoint;

        UPDATE SalesLT.SalesOrderHeader
			SET Status = 5
				WHERE CustomerID = 1;

    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION CustomerUpdateSavepoint;
        PRINT 'Order update failed. Rolled back to customer update.';
    END CATCH;

    COMMIT TRANSACTION;
END;
GO