
 -- 👉 “Customers who purchased in 2024, skipped 2025, and came back in 2026”

--Approach 1: Windows+ Case 
SELECT DISTINCT customer_id
FROM (
    SELECT 
        customer_id,
        MIN(YEAR(order_date)) OVER (PARTITION BY customer_id) AS first_year,
        MAX(CASE WHEN YEAR(order_date) = 2025 THEN 1 ELSE 0 END) 
            OVER (PARTITION BY customer_id) AS has_2025,
            
        MAX(CASE WHEN YEAR(order_date) = 2026 THEN 1 ELSE 0 END) 
            OVER (PARTITION BY customer_id) AS has_2026

    FROM orders
) t
WHERE first_year=2024
  AND has_2025 = 0
  AND has_2026 = 1;
	

-- Approach 2:  Exists and Group By
SELECT o.customer_id FROM orders o

GROUP BY customer_id 
HAVING MIN(YEAR(o.order_date)) = 2024 
AND EXISTS (SELECT 1 FROM orders o2 
    WHERE o2.customer_id = o.customer_id AND YEAR(o2.order_date) = 2026)
AND NOT EXISTS (SELECT 1 FROM orders o3
    WHERE o3.customer_id = o.customer_id AND YEAR(o3.order_date) = 2025);
