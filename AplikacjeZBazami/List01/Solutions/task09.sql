-- add column
ALTER TABLE SalesLT.Customer
	ADD CreditCardNumber NVARCHAR(50);

-- set anything to CreditCardApprovalCode in 3 random rows
UPDATE TOP(3) SalesLT.SalesOrderHeader
	SET CreditCardApprovalCode = 'APPROVED'
	WHERE CreditCardApprovalCode IS NULL; 

-- set CreditCardNumber to X in rows with CreditCardApprovalCode
UPDATE SalesLT.Customer
	SET CreditCardNumber = 'X' 
	WHERE CustomerID IN (
		SELECT DISTINCT SOH.CustomerID
		FROM SalesLT.SalesOrderHeader SOH
		WHERE SOH.CreditCardApprovalCode IS NOT NULL
	);

SELECT DISTINCT *
		FROM SalesLT.SalesOrderHeader SOH
		WHERE SOH.CreditCardApprovalCode IS NOT NULL;