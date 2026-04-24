# 🎓 Student Course Enrollment Analysis

## 📌 Objective

Analyze student-course relationships using SQL to understand enrollment patterns, identify trends, and extract meaningful insights.

---

## 🧱 Dataset Overview

The project is based on three tables:

* **Students** → Student details
* **Courses** → Course information
* **Enrollments** → Mapping between students and courses

---

## 🔗 Schema Relationship

* A student can enroll in multiple courses
* A course can have multiple students
* `Enrollments` acts as a bridge table

---
Note: This project uses a small sample dataset for practice and demonstration purposes.
---
## 🔍 Key Queries & Analysis

### 1. Student and Course Mapping

Retrieve all student-course enrollments.

**Concepts:** INNER JOIN

---

### 2. All Students (Including Non-Enrolled)

List all students, even those not enrolled in any course.

**Concepts:** LEFT JOIN

---

### 3. Students Without Any Course

Identify students who are not enrolled in any course.

**Concepts:** LEFT JOIN + NULL filtering

---

### 4. Course Popularity

Find number of students enrolled in each course.

**Concepts:** GROUP BY, COUNT

---

### 5. Student with Maximum Enrollments

Find the student(s) enrolled in the highest number of courses.

**Concepts:** GROUP BY, ORDER BY, LIMIT, Subquery

---

### 6. Students Enrolled in More Than 2 Courses

Filter students based on enrollment count.

**Concepts:** GROUP BY, HAVING

---

### 7. Students Above Average Enrollment

Find students enrolled in more courses than the average.

**Concepts:** Subquery, Aggregation, HAVING

---

## 📊 Key Insights

* Some students are enrolled in multiple courses, indicating high engagement
* Certain courses have higher enrollment, showing popularity
* A few students are not enrolled in any course
* Enrollment distribution varies across students

---

## 🛠️ SQL Concepts Used

* Joins (INNER JOIN, LEFT JOIN)
* Aggregation (COUNT, AVG)
* GROUP BY & HAVING
* Subqueries
* Filtering with NULL conditions

---

## 📁 Files in This Project

* `schema.sql` → Table creation and sample data
* `Student Course Enrollments.sql` → All queries
* `README.md` → Project documentation

---

## 🚀 Learning Outcome

This project helped strengthen:

* Understanding of table relationships
* Writing optimized JOIN queries
* Using subqueries for analytical problems
* Solving real-world SQL scenarios

---
