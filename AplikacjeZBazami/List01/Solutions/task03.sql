SELECT DISTINCT A.City, COUNT(CA.CustomerID) 'Customers', COUNT(DISTINCT C.SalesPerson) 'SalePersons'
	FROM SalesLT.CustomerAddress CA
	JOIN SalesLT.Address A ON A.AddressID = CA.AddressID
	JOIN SalesLT.Customer C ON C.CustomerID = CA.CustomerID
	GROUP BY A.City
	ORDER BY Customers DESC, SalePersons DESC;
