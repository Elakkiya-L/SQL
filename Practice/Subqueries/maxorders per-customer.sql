
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Problem: Find maximun orders per customer
-- Concept: Subquery,max,having,groupby
-- Approach:Diving the problem into smaller parts 
-- Calculate number of orders per customer and then find highest order placed by customer and Filter the grouped results, keeping only those customers whose count(*) matches the maximum value calculated.
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

select customer_id,count(*) from Orders
group by customer_id 
having count(*) =  (select max(ordercount) from 
(select count(*) as OrderCount from orders group by customer_id)t);
