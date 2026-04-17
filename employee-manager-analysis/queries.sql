-- Show employee name and manager name
SELECT m.name as Manager_Name,e.name Employee_Name
FROM Employees e
JOIN Employees m ON e.manager_id = m.id;

-- Only employees who have a manager 
select name from Employees where manager_id is Not Null;

-- Top Level Employees  (No manager)
select name from Employees where manager_id is Null;

-- Employees who are Managers
Select Distinct m.name as ManagerName
from Employees e
join employees m 
on e.manager_id=m.id
;

-- Employees who are not Managers
select name 
from employees 
where id not in 
(
select manager_id from employees 
where manager_id is not null
);

-- Employees earning more than their manager
select e.name 
from Employees e
Join Employees m
ON e.manager_id = m.id
where e.salary > m.salary;

-- Pair of Employees who work under same Manager / Managers with at least 2 direct reports
select m.name as Manager_Name,count(e.id) as Employee_count from Employees e
join Employees m
on e.manager_id=m.id
group by m.id,m.name
having count(e.id)>=2;

-- Find the number of employees under each manager.
select m.name as Manager_Name,count(e.id) as Team_Members
from employees e
join employees m 
on e.manager_id=m.id
group by m.name;

-- manager with the highest team size
select m.name as Manager_Name,count(e.id) as Team_Members
from employees e
join employees m 
on e.manager_id=m.id
group by m.name
order by Team_Members desc
Limit 1;

-- manager whose team has the highest total salary
select m.id, m.name as Manager_Name,sum(e.salary) as Total_Salary
from employees e
join employees m 
on e.manager_id=m.id
group by m.id, m.name
order by Total_salary desc
Limit 1;

-- manager's name with average salary of their Employees
Select m.id, m.name as Manager_Name, avg(e.salary) as Average_Salary,
Rank () over(order by avg(e.salary) DESC)  as rnk
from Employees e
Join Employees m
ON e.manager_id = m.id
group by m.id,m.name
;

-- Employees who are in the same department as their manager
select e.name from Employees e
join Employees m 
on e.manager_id=m.id
where e.department=m.department;
