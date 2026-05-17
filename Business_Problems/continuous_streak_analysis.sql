WITH numbered_logins AS (
    SELECT user_id, login_date,
           ROW_NUMBER() OVER (PARTITION BY user_id ORDER BY login_date) AS rn
    FROM logins
)
SELECT user_id, 
       MIN(login_date) AS streak_start, 
       MAX(login_date) AS streak_end, 
       COUNT(*) AS consecutive_days
FROM numbered_logins
GROUP BY user_id, DATE_SUB(login_date, INTERVAL rn DAY)
HAVING COUNT(*) >= 3; 
