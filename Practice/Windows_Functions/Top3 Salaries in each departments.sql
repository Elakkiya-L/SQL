------------------------------------------------------------------------------------------------
--problem : Slect Top3 Employees Salaries in each Department
--Approach: Using Common Table Expression with Window Functions
-------------------------------------------------------------------------

WITH top3 AS ( 
    SELECT 
        name as e.Employee_Name,e.dept_id,d.dept_name as Department_Name, e.salary,
        DENSE_RANK() OVER (
                           PARTITION BY dept_id 
                            ORDER BY salary DESC
                            ) AS rnk
        FROM EmployeeDept e
        JOIN department d ON e.dept_id = d.id
)
SELECT * 
FROM top3 
WHERE rnk <= 3;
