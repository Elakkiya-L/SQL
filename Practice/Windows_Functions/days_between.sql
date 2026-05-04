-- For each order, find:next order date of the same customer & days between orders

WITH ordered_orders AS (
    SELECT 
        customer_id,
        order_date,
        LEAD(order_date) OVER (
            PARTITION BY customer_id 
            ORDER BY order_date
        ) AS next_order_date
    FROM orders
)

SELECT 
    customer_id,
    order_date AS current_order_date,
    next_order_date,
    DATEDIFF(next_order_date, order_date) AS days_between
FROM ordered_orders;
