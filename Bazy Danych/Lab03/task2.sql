-- bez nulli
WITH customer_order_total AS (
    SELECT c_custkey, c_name, n_name, SUM(o_totalprice) AS total_price
    FROM orders
    JOIN customer ON c_custkey = o_custkey
    JOIN nation ON n_nationkey = c_nationkey
    WHERE EXTRACT(YEAR FROM o_orderdate) = '1997'
    GROUP BY c_custkey, c_name, n_name
),
max_total_per_country AS (
    SELECT n_name, MAX(total_price) AS highest_total_price
    FROM customer_order_total
    GROUP BY n_name
)
SELECT cot.c_name, cot.n_name, cot.total_price
FROM customer_order_total cot
JOIN max_total_per_country mtc ON cot.n_name = mtc.n_name AND cot.total_price = mtc.highest_total_price;

-- by zachowac nulle selectujemy z nation
-- i left joinujemy z max_total_per_country zjoinowanym z customer_order_total 