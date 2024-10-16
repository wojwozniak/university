SELECT PM.Name, COUNT(PM.ProductModelID) 'Count'
	FROM SalesLT.ProductModel PM
	JOIN SalesLT.Product P ON P.ProductModelID = PM.ProductModelID
	GROUP BY PM.Name
	HAVING COUNT('Count') > 1
	ORDER BY 'Count' DESC;
	-- -> counting by id and not names to avoid potential problems
	-- -> like risk of grouping different products with same name