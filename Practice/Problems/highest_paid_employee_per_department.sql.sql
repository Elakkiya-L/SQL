--Problem: Departments highestSalary

-- Concepts: join,Subquery,WindowFunction

--Approach1: Subquery+join
select e.name, d.dept_name, e.salary
from Employees e 
join Departments d
on d.id = e.dept_id
where e.salary = (
    select max(e1.salary) 
    from Employees e1 
    where e1.dept_id = e.dept_id
);

--Approach2 : Window Function 
with highestSalary as (
    select e.name, d.dept_name, e.salary,
           dense_rank() over(
               partition by e.dept_id 
               order by e.salary desc
           ) as rnk
    from Employees e 
    join departments d 
    on d.id = e.dept_id
)
select name,dept_name,salary
from highestSalary 
where rnk = 1;
