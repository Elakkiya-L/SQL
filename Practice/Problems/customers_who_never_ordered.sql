
--Problem:
-- Customers Who Never Ordered

--Approach1 : Subquery
select c.name from customers c 
where c.id not in 
              (
              select o.customer_id 
                from Orders o 
              );
--Approach2:Left join
select c.name from customers c
left join orders o 
on o.customer_id=c.id 
where o.customer_id is null;

--Approach3:Not exists for better efficiency and handling null
select c.name from customers c 
where not exists( 
                  select 1 from orders o 
                  where o.customer_id=c.id
                );
