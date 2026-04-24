-- Problem: Employees whose salary is greater than atleast one employee in their department
-- Concepts: Subquery,Joins


select e.name from Employees e
where e.salary in (
                    select e1.salary 
                    from employees e1 
                    join departments d on e1.dept_id=d.id);
