
 -- “Find customers who made their first purchase in 2024 and then purchased again in 2025”

--Approach 1: Aggreagations + Case
SELECT 
    customer_id, 
    MIN(YEAR(order_date)) as first_order_year
FROM orders
GROUP BY customer_id
HAVING MIN(YEAR(order_date)) = 2024 
   AND sum(case when(YEAR(order_date)) = 2025 then 1 else 0 end )>0;

--Approach 2: Aggregation+ Subquery
select o.customer_id from orders o
GROUP BY customer_id 
HAVING MIN(YEAR(o.order_date)) = 2024 
AND EXISTS (SELECT 1 FROM orders o2 
    WHERE o2.customer_id = o.customer_id AND YEAR(o2.order_date) = 2025);


--Approach 3: Window Function
  SELECT DISTINCT customer_id
FROM (
    SELECT 
        customer_id,
        MIN(YEAR(order_date)) OVER (PARTITION BY customer_id) AS first_year,
        MAX(CASE WHEN YEAR(order_date) = 2025 THEN 1 ELSE 0 END) OVER (PARTITION BY customer_id)
			AS has_2025
    FROM orders
) t
WHERE first_year = 2024
  AND has_2025 = 1;
  
