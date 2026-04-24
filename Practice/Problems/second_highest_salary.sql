-- Problem:Find the Second highest Salary from Employee Table


--Approach1 : Using Limit and offset
SELECT DISTINCT Salary
FROM Employee
ORDER BY Salary DESC
LIMIT 1 OFFSET 1;

--Approach 2: Using Subquery
SELECT MAX(Salary)
FROM Employee
WHERE Salary < (SELECT MAX(Salary) FROM Employee);

--Approach 3:  Using Window Function
SELECT Salary FROM (
    SELECT Salary, DENSE_RANK() OVER (ORDER BY Salary DESC) as rnk
    FROM Employee
) tmp
WHERE rnk = 2;


