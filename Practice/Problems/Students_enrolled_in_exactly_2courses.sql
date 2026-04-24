-- Problem: Students enrolled in exactly 2 courses

-- Approach 1: Using JOIN + GROUP BY
select s.name as Students_name from Students s
join Enrollments e 
on s.id=e.student_id
group by s.id,s.name
having count(e.course_id)=2;

-- Approach 2: Using Subquery and group by
select s.name as Students_name from Students s
where s.id in  (select e.student_id from Enrollments e
				group by e.student_id
                having count(e.course_id)=2)
           ;
-- Approach 3 :Using having  Corelated-Subquery, using exist and making the query more efficient
select s.name as Students_Name from students s
where exists (
			select 1 from enrollments e             
            where s.id=e.student_id 
            group by e.student_id
            having count(course_id)=2);
