📊 SQL Business Analytics Project
🧾 Project Overview

This project focuses on solving real-world customer behavior analytics problems using SQL.
It simulates how data analysts answer business questions related to:

Customer retention
Churn & reactivation
Purchase patterns
Loyalty (streak analysis)
Customer segmentation

The goal is to translate business questions → SQL logic → actionable insights.

🎯 Business Objective

Understand customer behavior over time to answer questions like:

Who are our loyal customers?
Who stopped purchasing (churned)?
Who came back after inactivity?
How consistent are customer purchases?
Who are the top contributors to revenue?

🛠️ Dataset Description
🧾 Tables Used
| Column      | Description         |
| ----------- | ------------------- |
| id          | Order ID            |
| customer_id | Customer identifier |
| order_date  | Date of purchase    |

Customers 
| Column | Description   |
| ------ | ------------- |
| id     | Customer ID   |
| name   | Customer name |

📊 Key Analysis Performed

🔹 1. Customer Retention Analysis
SELECT customer_id
FROM orders
GROUP BY customer_id
HAVING 
    SUM(CASE WHEN YEAR(order_date)=2024 THEN 1 ELSE 0 END) > 0
    AND SUM(CASE WHEN YEAR(order_date)=2025 THEN 1 ELSE 0 END) > 0;

  🔹 2. Churn Analysis

Customers who stopped purchasing after 2024.
SELECT customer_id
FROM orders
GROUP BY customer_id
HAVING 
    SUM(CASE WHEN YEAR(order_date)=2024 THEN 1 ELSE 0 END) > 0
    AND SUM(CASE WHEN YEAR(order_date)=2025 THEN 1 ELSE 0 END) = 0;

    🔹 3. Reactivation Analysis

Customers who returned after inactivity.

SELECT customer_id
FROM orders
GROUP BY customer_id
HAVING 
    SUM(CASE WHEN YEAR(order_date)=2024 THEN 1 ELSE 0 END) > 0
    AND SUM(CASE WHEN YEAR(order_date)=2025 THEN 1 ELSE 0 END) = 0
    AND SUM(CASE WHEN YEAR(order_date)=2026 THEN 1 ELSE 0 END) > 0;
    
🔹 4. Consecutive Purchase Pattern

Detect continuous yearly engagement.
WITH yrs AS (
    SELECT DISTINCT customer_id, YEAR(order_date) AS yr
    FROM orders
),
grp AS (
    SELECT *,
           yr - ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY yr) AS grp_key
    FROM yrs
)
SELECT customer_id, COUNT(*) AS streak_length
FROM grp
GROUP BY customer_id, grp_key;

🔹 5. Longest Purchase Streak (Loyalty Score)

SELECT customer_id, MAX(streak_len) AS longest_streak
FROM (
    SELECT customer_id, grp_key, COUNT(*) AS streak_len
    FROM (
        SELECT *,
               YEAR(order_date) - ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY YEAR(order_date)) AS grp_key
        FROM (SELECT DISTINCT customer_id, YEAR(order_date) AS order_year FROM orders) t
    ) x
    GROUP BY customer_id, grp_key
) final
GROUP BY customer_id;

🧠 Key Concepts Applied
Customer lifecycle analysis
Retention vs churn vs reactivation
Cohort-style thinking
Window functions (ROW_NUMBER, RANK)
Conditional aggregation (CASE WHEN)
Time-based analysis (year-level patterns)
📈 Business Insights Derived

This analysis helps identify:

🔁 Loyal customers (consistent buyers)
❌ Churned customers (inactive users)
🔄 Reactivated users (returned after gap)
📊 High engagement customers (long streaks)
💰 Revenue-driving customers

🚀 Skills Demonstrated
Advanced SQL querying
Business problem interpretation
Data storytelling using SQL
Analytical thinking (not just syntax)
Window function mastery

🎯 Conclusion

This project demonstrates the ability to:

Convert raw business questions into structured SQL solutions and derive meaningful customer insights.


Customers who purchased in consecutive years.
