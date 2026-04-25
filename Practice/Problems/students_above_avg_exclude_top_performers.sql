-- Problem : Students Above Average BUT Exclude Top Performer

--Problem Insight:
--We are not comparing individual marks.
--We are comparing TOTAL marks per student against:
--1. Average of total marks and Maximum total marks (to exclude top performer)

--Key thinking:
-- Step 1 → Aggregate marks per student (SUM)
-- Step 2 → Compute average of those totals (AVG)
-- Step 3 → Identify highest total (MAX)
-- Step 4 → Filter:
          -- total_marks > average_total AND total_marks < max_total


-----Concepts Used:
-- 1. GROUP BY
--2. Aggregate Functions (SUM, AVG, MAX)
-- 3. Subqueries / CTE
-- 4. Aggregation on aggregation
-- 5. Filtering aggregated data (HAVING / WHERE with CTE)
-- 6. Logical comparison across levels

-- Key Learning: 
-- Understanding the LEVEL of data is more important than writing SQL syntax.

--Optimizational Insight
--Compute totals once (CTE) → reuse for AVG and MAX

-- Approach 1: Using CTE 
WITH totals AS (
    SELECT student_id, SUM(marks) AS total_marks
    FROM marks
    GROUP BY student_id
)
SELECT student_id, total_marks
FROM totals
WHERE total_marks > (SELECT AVG(total_marks) FROM totals)
AND total_marks < (SELECT MAX(total_marks) FROM totals);


--Approach 2: Subquery
select student_id, sum(marks) as total_marks
from marks
group by student_id
having total_marks > (
    select avg(total_marks)
    from (
        select sum(marks) as total_marks
        from marks
        group by student_id
    ) t
)
and total_marks < (
    select max(total_marks)
    from (
        select sum(marks) as total_marks
        from marks
        group by student_id
    ) t
);

-- Approach3: CTE+Joins
WITH totals AS (
    SELECT student_id, SUM(marks) AS total_marks
    FROM marks
    GROUP BY student_id
),
stats AS (
    SELECT 
        AVG(total_marks) AS avg_total,
        MAX(total_marks) AS max_total
    FROM totals
)
SELECT t.student_id, t.total_marks
FROM totals t
JOIN stats s
ON t.total_marks > s.avg_total
AND t.total_marks < s.max_total;
