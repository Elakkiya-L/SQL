-- Problem:
-- Find customers whose number of orders in the last 30 days 
-- is greater than the average number of orders (last 30 days) per customer.


-- Concepts Used:
-- 1. Date filtering (CURDATE() - INTERVAL)
-- 2. GROUP BY + HAVING
-- 3. Subqueries
-- 4. CTE (WITH clause)
-- 5. Aggregation on aggregation

-- Insight:
-- First filter orders from last 30 days, then count orders per customer.
-- Compare each customer's order count with the average order count.

-- Approach 1: HAVING + Subquery
SELECT customer_id
FROM Orders
WHERE order_date >= CURDATE() - INTERVAL 30 DAY
GROUP BY customer_id
HAVING COUNT(*) > (
    SELECT AVG(order_count)
    FROM (
        SELECT customer_id, COUNT(*) AS order_count
        FROM Orders
        WHERE order_date >= CURDATE() - INTERVAL 30 DAY
        GROUP BY customer_id
    ) t
);

-- Approach 2: CTE + JOIN
WITH OrderCount AS (
    SELECT customer_id, COUNT(*) AS order_count
    FROM Orders
    WHERE order_date >= CURDATE() - INTERVAL 30 DAY
    GROUP BY customer_id
),
AvgOrderCount AS (
    SELECT AVG(order_count) AS avg_count
    FROM OrderCount
)
SELECT o.customer_id, o.order_count
FROM OrderCount o
JOIN AvgOrderCount a
ON o.order_count > a.avg_count;
