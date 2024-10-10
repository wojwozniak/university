-- Using WITH (and selecting additional ID column inside) 
-- to avoid funny stuff happening to people with same name and surname
WITH CustomerDiscounts AS (
    SELECT 
        C.LastName, 
        C.FirstName, 
        C.CustomerID, 
        SUM(SOD.UnitPrice * SOD.UnitPriceDiscount * SOD.OrderQty) AS Discounts
			FROM SalesLT.Customer C
			JOIN SalesLT.SalesOrderHeader SOH ON C.CustomerID = SOH.CustomerID
			JOIN SalesLT.SalesOrderDetail SOD ON SOH.SalesOrderID = SOD.SalesOrderID
			GROUP BY C.LastName, C.FirstName, C.CustomerID
			-- we could also put HAVING here so we show only people that have gotten any discount at all
			-- HAVING SUM(SOD.UnitPrice * SOD.UnitPriceDiscount * SOD.OrderQty) > 0
) 
SELECT LastName, FirstName, Discounts
	FROM CustomerDiscounts
	ORDER BY Discounts DESC;