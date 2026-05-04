-- For each customer, find:longest gap (in days) between their orders

WITH gaps AS (
    SELECT 
        customer_id,
        DATEDIFF(
            order_date,
            LAG(order_date) OVER (
                PARTITION BY customer_id 
                ORDER BY order_date
            )
        ) AS gap
    FROM orders
)

SELECT 
    customer_id,
    MAX(gap) AS longest_gap
FROM gaps
GROUP BY customer_id;
