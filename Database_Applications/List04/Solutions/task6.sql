USE Test;

-- setup
DROP TABLE IF EXISTS Orders;
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    OrderAmount DECIMAL(10, 2)
);

INSERT INTO Orders (OrderID, OrderAmount) VALUES (1, 100.00), (2, 150.00), (3, 200.00);

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

BEGIN TRANSACTION;
    SELECT * FROM Orders;
    EXEC sp_lock;
COMMIT;

BEGIN TRANSACTION;
    SELECT * FROM Orders WITH (NOLOCK); 
    EXEC sp_lock;
COMMIT;

-- We can see that NOLOCK overrides locks that otherwise serializable level
-- would have placed here