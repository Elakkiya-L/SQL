
-- Problem: Get the students enrolled in more than one course
-- Concepts: joins, Aggregation

select s.name from Students s 
left join Enrollments e on s.id=e.student_id
group by s.name
having count(e.course_id)>2;
