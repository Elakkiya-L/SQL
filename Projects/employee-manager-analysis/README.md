# 👥 Employee Manager Analysis

## 📌 Objective

Analyze employee hierarchy and salary relationships to uncover insights about organizational structure and compensation patterns.

---

## 🧱 Dataset Overview

This project is based on a single table:

* **Employees**

  * `id` → Employee ID
  * `name` → Employee Name
  * `salary` → Employee Salary
  * `manager_id` → Manager reference (self-referencing key)

---
Note: This project uses a small sample dataset for practice and demonstration purposes.
---
## 🔗 Schema Relationship

* Each employee may have a manager
* `manager_id` refers to another employee in the same table
* This forms a **hierarchical (self-referencing) structure**

---

## 🔍 Key Queries & Analysis

### 1. Employees Earning More Than Their Manager

Identify employees whose salary exceeds their manager’s salary.

**Concepts:** SELF JOIN, Subquery

---

### 2. Employee-Manager Mapping

Display employee names along with their respective managers.

**Concepts:** SELF JOIN

---

### 3. Employees Without Managers

Find employees who do not report to anyone (top-level hierarchy).

**Concepts:** NULL filtering

---

### 4. Salary Comparison Within Hierarchy

Compare salaries between employees and their managers.

**Concepts:** JOIN, Conditional Filtering

---

### 5. Hierarchical Insights

Analyze reporting structure patterns within the organization.

**Concepts:** Self-referencing joins, Aggregation (if applicable)

---

## 📊 Key Insights

* Some employees earn more than their managers
* Top-level employees (with no managers) represent leadership roles
* Salary distribution varies across hierarchy levels
* Hierarchical structure helps identify reporting relationships

---

## 🛠️ SQL Concepts Used

* SELF JOIN
* Subqueries
* Filtering with NULL values
* Conditional comparisons
* Aggregations (if used)

---

## 📁 Files in This Project

* `schema.sql` → Table creation and sample data
* `employee manager hierarchical.sql` → Query implementations
* `insights.md` → Key findings and observations
* `README.md` → Project documentation

---

## 🚀 Learning Outcome

This project helped strengthen:

* Understanding of hierarchical data in SQL
* Writing SELF JOIN queries
* Comparing data within the same table
* Solving real-world organizational problems

---
