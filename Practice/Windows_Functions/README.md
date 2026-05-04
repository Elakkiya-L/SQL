
# 📊 Window Functions Practice

This folder contains problems solved using window functions.

## 📌 Topics Covered

* DENSE_RANK()
* ROW_NUMBER()
* Running totals
* Partitioning
* LAG() & LEAD()
* Date Functions: DATEDIFF(), DATE_ADD(), DATE_SUB()
* Time-based Analysis Patterns

---
## 🎯 Objectives

* Understand how to compare rows using window functions
Analyze customer behavior over time
Detect gaps, trends, and patterns in transactional data

---
## 🧠 Key Learnings

* Performing calculations across rows without grouping
* Ranking within partitions
* Efficient alternatives to complex subqueries
* Previous & Next Row Analysis
Used LAG() to get previous order details
Used LEAD() to get next order details
* Days Between Orders
* Consecutive Order Detection
Identified customers placing orders on consecutive days
Used DATEDIFF = 1 logic
*Gap Analysis (Missing Dates)
Learned difference between:
Row-level gaps (per customer)
Global gaps (overall system)
* Missing Dates (Recursive CTE)
Generated complete date series
Identified missing dates using LEFT JOIN

---


## 🚀 Key Takeaways

* Window functions help compare row-to-row behavior
Always define:
PARTITION BY → scope
ORDER BY → sequence
Separate:
Aggregation (GROUP BY)
Window functions (LAG/LEAD)
Always think:
“Am I analyzing per customer or globally?”

📈 Progress Note

Today’s session focused on mastering time-based SQL analysis, which is a core skill for data analysts working on retention, churn, and behavioral analytics.

