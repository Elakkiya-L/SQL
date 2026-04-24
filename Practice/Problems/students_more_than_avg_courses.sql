-- Problem: Find students enrolled in more than average number of courses
-- Concepts: GROUP BY, HAVING, Subquery,join, AVG

select s.name as Students_Name from Students s 
join Enrollments e 
on s.id=e.student_id 
group by s.id,s.name
having count(e.course_id)> (
                            select avg(counts) 
                            from
                                (
                                  Select count(student_id) as counts from enrollments 
                                  group by student_id)t )
;
