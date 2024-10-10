SELECT DISTINCT A.City
	FROM SalesLT.SalesOrderHeader SOH
	JOIN SalesLT.Address A ON SOH.ShipToAddressID = A.AddressID
	ORDER BY A.City ASC;