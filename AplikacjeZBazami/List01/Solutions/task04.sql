-- not leaf -> has children
-- node X has children if any row Y considers X as it's parent

SELECT P.Name, PC.Name 'CategoryName'
	FROM SalesLT.ProductCategory PC
	JOIN SalesLT.Product P ON PC.ProductCategoryID = P.ProductID
	WHERE PC.ProductCategoryID IN 
		( SELECT DISTINCT PC.ParentProductCategoryID FROM SalesLT.ProductCategory PC );


-- our query returns no rows because of current rows

-- we can check it by running this:
SELECT *
	FROM SalesLT.ProductCategory PC
	WHERE PC.ProductCategoryID IN 
		( SELECT DISTINCT PC.ParentProductCategoryID FROM SalesLT.ProductCategory PC );

-- this query shows us there are only four categories that has children 
-- (we can also check entire ProductCategory -> then we can see that all ParentProductCategoryID values lie between 1-4 (inc.))
-- so we have very simple tree -> 4 roots that have only leaves