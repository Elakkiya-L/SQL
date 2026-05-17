select * from(
select order_date,lead(order_date) over(partition by customer_id order by order_date) as prev_date from orders )t 
where datediff(prev_date,order_date)>30;
