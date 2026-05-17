-- “Longest consecutive purchase streak per customer”

WITH yrs AS (
    SELECT DISTINCT 
        customer_id, 
        YEAR(order_date) AS yr 
    FROM orders
),
grp AS (
    SELECT 
        customer_id,
        yr,
        yr - ROW_NUMBER() OVER (
            PARTITION BY customer_id 
            ORDER BY yr
        ) AS grp_key
    FROM yrs
),
streaks AS (
    SELECT 
        customer_id,
        COUNT(*) AS streak_len
    FROM grp
    GROUP BY customer_id, grp_key
)
SELECT 
    customer_id,
    MAX(streak_len) AS longest_streak
FROM streaks
GROUP BY customer_id;
;


--  “Find customers whose streak is exactly 2 years (not more)”
WITH yrs AS (
    SELECT DISTINCT 
        customer_id, 
        YEAR(order_date) AS yr 
    FROM orders
),
grp AS (
    SELECT 
        customer_id,
        yr,
        yr - ROW_NUMBER() OVER (
            PARTITION BY customer_id 
            ORDER BY yr
        ) AS grp_key
    FROM yrs
),
streaks AS (
    SELECT 
        customer_id,
        COUNT(*) AS streak_len
    FROM grp
    GROUP BY customer_id, grp_key
)
SELECT customer_id
FROM (
    SELECT 
        customer_id,
        MAX(streak_len) AS max_streak
    FROM streaks
    GROUP BY customer_id
) t
where max_streak=2
;
