-- LineTotal = UnitPrice * OrderQty * (1 - discount)

-- Variant A - all rows
SELECT 
    SOH.SalesOrderID, 
    SOH.SalesOrderNumber, 
    SOH.PurchaseOrderNumber, 
    SOD.ProductID,
    (SOD.UnitPrice * SOD.OrderQty) AS PriceNoDiscounts,
    SOD.LineTotal AS PriceDiscounts,
    SUM(SOD.UnitPrice * SOD.OrderQty) OVER (PARTITION BY SOH.SalesOrderID) AS TotalOrderPriceNoDiscounts,
    SUM(SOD.LineTotal) OVER (PARTITION BY SOH.SalesOrderID) AS TotalOrderPriceWithDiscounts
		FROM SalesLT.SalesOrderHeader SOH
		JOIN SalesLT.SalesOrderDetail SOD ON SOD.SalesOrderID = SOH.SalesOrderID
		ORDER BY SOH.SalesOrderID;


-- Variant B - only rows from order with highest discount
SELECT 
    SOH.SalesOrderID, 
    SOH.SalesOrderNumber, 
    SOH.PurchaseOrderNumber, 
    SOD.ProductID,
    (SOD.UnitPrice * SOD.OrderQty) AS PriceNoDiscounts,
    SOD.LineTotal AS PriceDiscounts,
    SUM(SOD.UnitPrice * SOD.OrderQty) OVER (PARTITION BY SOH.SalesOrderID) AS TotalOrderPriceNoDiscounts,
    SUM(SOD.LineTotal) OVER (PARTITION BY SOH.SalesOrderID) AS TotalOrderPriceWithDiscounts
		FROM SalesLT.SalesOrderHeader SOH
		JOIN SalesLT.SalesOrderDetail SOD ON SOD.SalesOrderID = SOH.SalesOrderID
		WHERE SOH.SalesOrderID IN 
		(
			SELECT TOP 1 SOD.SalesOrderID
			FROM SalesLT.SalesOrderDetail SOD
			GROUP BY SOD.SalesOrderID
			ORDER BY SUM(SOD.UnitPrice * SOD.OrderQty * SOD.UnitPriceDiscount) DESC;
		)
		ORDER BY SOH.SalesOrderID;

-- Total discount per order
SELECT SOD.SalesOrderID, SUM(SOD.UnitPrice * SOD.OrderQty * SOD.UnitPriceDiscount) 'TotalDiscount'
		FROM SalesLT.SalesOrderDetail SOD
		GROUP BY SOD.SalesOrderID
		ORDER BY 'TotalDiscount' DESC;

-- ID of order with highest discount
SELECT TOP 1 SOD.SalesOrderID
		FROM SalesLT.SalesOrderDetail SOD
		GROUP BY SOD.SalesOrderID
		ORDER BY SUM(SOD.UnitPrice * SOD.OrderQty * SOD.UnitPriceDiscount) DESC;