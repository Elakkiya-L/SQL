--  Find days where no orders happened
WITH distinct_dates AS (
    SELECT DISTINCT order_date
    FROM orders
),
date_gaps AS (
    SELECT 
        order_date,
        LAG(order_date) OVER (ORDER BY order_date) AS prev_date
    FROM distinct_dates
)

SELECT 
    DATE_ADD(prev_date, INTERVAL 1 DAY) AS gap_start,
    DATE_SUB(order_date, INTERVAL 1 DAY) AS gap_end
FROM date_gaps
WHERE DATEDIFF(order_date, prev_date) > 1;
