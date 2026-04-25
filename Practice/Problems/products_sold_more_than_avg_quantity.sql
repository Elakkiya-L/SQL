
-- Problem: Products Sold More Than Average Quantity
-- Find product_id where total quantity sold is greater than average quantity sold per product

---- Concepts Used:
-- 1. GROUP BY + HAVING
-- 2.. Subqueries
-- 3. CTE (WITH clause)
-- 4. Aggregation on aggregation

-----Insights:
-- First find the sum of the quantity productwise and get the average of it
-- Compare each sum of the quantity with the average of the quantity.


--Approach1 : Subquery+having 
select product_id,sum(quantity) as total_quantity 
    from sales1 
    group by product_id 
    having sum(quantity)>(
							select avg(total_quantity) as avg_quantity from (
													select product_id,sum(quantity) as total_quantity from sales1
                                                    group by product_id
                                                    )t
							);


	--Approach2: CTE(with clause) +Join+Group by
    with totalquantity as( select product_id,sum(quantity) as total_quantity
													from sales1
                          group by product_id),
		avgquantity as (select avg(total_quantity) as avg_quantity 
                    from totalquantity
                    )
        
	select product_id,t.total_quantity from totalquantity t
  join avgquantity a 
  on t.total_quantity>a.avg_quantity;
