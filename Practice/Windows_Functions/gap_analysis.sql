-- Gap Analysis (Missing Dates)

Row-level gaps (per customer)
Global gaps (overall system)
WITH distinct_dates AS (
    SELECT DISTINCT order_date
    FROM orders
),
gap_check AS (
    SELECT 
        order_date,
        LAG(order_date) OVER (ORDER BY order_date) AS prev_date
    FROM distinct_dates
)
SELECT 
    DATE_ADD(prev_date, INTERVAL 1 DAY) AS gap_start,
    DATE_SUB(order_date, INTERVAL 1 DAY) AS gap_end
FROM gap_check
WHERE DATEDIFF(order_date, prev_date) > 1;
🔹 5. Missing Dates (Recursive CTE)
