-- Problem : Departments With Above Average Salary BUT Only If They Have 3+ Employees

----Key thinking
--Step 1:Filter departments with enough employees COUNT(*) >= 3
--Step 2:Calculate average salary per department
--Step 3:Compare with overall average salary (entire table)

select dept_id
from employees
group by dept_id
having count(*) >= 3
and avg(salary) > (
    select avg(salary)
    from employees
);
