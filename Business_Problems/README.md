# 📊 SQL Business Analytics Portfolio

## 🚀 Overview
This repository contains SQL solutions focused on real-world business analytics problems.  
The goal is to translate business questions into SQL logic using joins, subqueries, window functions, and conditional aggregation.

---

## 🎯 Business Problems Solved

### 1. Customer Retention Analysis
Identify customers who purchased in 2024 and again in 2025.

```sql
SELECT customer_id
FROM orders
GROUP BY customer_id
HAVING 
    SUM(CASE WHEN YEAR(order_date)=2024 THEN 1 ELSE 0 END) > 0
    AND SUM(CASE WHEN YEAR(order_date)=2025 THEN 1 ELSE 0 END) > 0;
