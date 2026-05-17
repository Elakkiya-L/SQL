select * from (
    select emp_id, salary_month,salary,
        lag(salary) over(partition by emp_id order by salary_month) as previous_salary
    from employee_salary
) t
where salary > previous_salary;
