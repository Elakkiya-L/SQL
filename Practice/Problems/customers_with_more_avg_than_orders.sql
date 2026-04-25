---- Customers with more orders than average
 --  Find customers whose number of orders is greater than the average number of orders per customer

-- Concepts Used:

-- 1. GROUP BY + HAVING
-- 2. Subqueries
-- 3. CTE (WITH clause)
-- 4. Aggregation on aggregation

-- Insight:
-- First filter count by customer_id, then count per customer,Get average per customer
-- Compare each customer's count with the average order count.

--Approach1 : Subqueries +group by+Having
select customer_id 
from orders
group by customer_id
having count(*) > (
    select avg(order_count)
    from (
        select count(*) as order_count
        from orders
        group by customer_id
    ) t
);

--Approach2 : CTE (using with) + group by 
WITH order_counts AS (
    SELECT customer_id, COUNT(*) AS order_count
    FROM Orders
    GROUP BY customer_id
)
SELECT customer_id
FROM order_counts
WHERE order_count > (
    SELECT AVG(order_count) FROM order_counts
);
