--Students Scoring Above Average Marks


-- Concepts Used:

-- 1. GROUP BY + HAVING
-- 2. Subqueries
-- 3. CTE (WITH clause)
-- 4. Aggregation on aggregation



-- Insight:
-- First filter totalmarks by student_id,Get average per student
-- Compare each student's totalmarks with the average of totalmarks.



--Approach1: Subqueries+ Having+Group by
select student_id, sum(marks) as TotalMarks
from marks
group by student_id
having sum(marks) > (
    select avg(totalmarks) 
    from (
        select sum(marks) as totalmarks 
        from Marks 
        group by student_id
    ) t
);

--Approach 2: With CTE+Join 
with total_marks as (
    select student_id, sum(marks) as total
    from Marks
    group by student_id
),
avg_marks as (
    select avg(total) as avg_total
    from total_marks
)
select t.student_id, t.total
from total_marks t
join avg_marks a
on t.total > a.avg_total;
