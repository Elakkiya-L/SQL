select customer_id,order_date,
    lag(order_date) over(partition by customer_id order by order_date) as previous_order,
    datediff(order_date,lag(order_date) over(partition by customer_id order by order_date)) as gap_days
from orders;
