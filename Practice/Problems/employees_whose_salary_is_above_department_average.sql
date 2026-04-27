----Find Employees whose salary is above their department average


-- Approach 1: CorelatedSubquery 
SELECT e.name, e.salary
FROM employeedept e
WHERE e.salary > (
    SELECT AVG(x.salary)
    FROM employeedept x
    WHERE x.dept_id = e.dept_id
);


-- Approach2: Window Function
SELECT name, salary
FROM (
  SELECT 
    name,
    salary,
    AVG(salary) OVER (PARTITION BY dept_id) AS avg_salary
  FROM EmployeeDept
) t
WHERE salary > avg_salary;
