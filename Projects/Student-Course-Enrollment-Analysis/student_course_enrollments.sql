
-- 1.student name and course name for all enrollments.
SELECT s.name AS student_name, c.course_name
FROM students s
JOIN Enrollments e ON s.id = e.student_id
JOIN courses c ON e.course_id = c.id;


--2.All students and their course names, including students not enrolled in any course.
SELECT s.name AS Students_Name, c.course_name AS Course_Name
FROM Students s
LEFT JOIN Enrollments e ON s.id = e.student_id
LEFT JOIN Courses c ON c.id = e.course_id;

--3. Students who are not enrolled in any course.
SELECT s.name
FROM Students s
LEFT JOIN Enrollments e ON s.id = e.student_id
WHERE e.student_id IS NULL;

--4. Course names and number of students enrolled in each course
SELECT c.course_name AS Course_Name,
       COUNT(e.student_id) AS total_students
FROM Courses c
LEFT JOIN enrollments e ON c.id = e.course_id
GROUP BY c.id, c.course_name;

--5. Student who is enrolled in the most courses.
select s.name,count(e.student_id) from Students s
left join enrollments e on s.id=e.student_id
group by s.id
limit 1 ;

--6.student(s) enrolled in the maximum number of courses (If 2 students have the same number of enrollments use subquery)
select s.name as Students_Name ,count(e.course_id)
from Students s left join Enrollments e on s.id= e.student_id
group by s.id,s.name
having count(e.course_id)=
						(SElect max(course_count) from (select count(course_id) as course_count from enrollments group by course_id) as cts);

--7. students who are enrolled in more than 2 courses
select s.name from Students s 
left join Enrollments e on s.id=e.student_id
group by s.name
having count(e.course_id)>2;

-- 8.Students enrolled in more than average number of courses
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
