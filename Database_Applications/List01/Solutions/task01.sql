SELECT DISTINCT A.City
	FROM SalesLT.SalesOrderHeader SOH
	JOIN SalesLT.Address A ON SOH.ShipToAddressID = A.AddressID
	WHERE SOH.ShipDate is not null
	ORDER BY A.City ASC;