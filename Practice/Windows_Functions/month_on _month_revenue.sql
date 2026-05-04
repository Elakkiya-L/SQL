
with month_rev as 
  (
  select sum(amount) as total_rev,
  date_format(order_date, '%y%m') as extract_month 
  from orders
  group by date_format(order_date, '%y%m')
  )
select extract_month, total_rev,
lag(total_rev) over(order by extract_month) as prev_rev,
total_rev - lag(total_rev) over(order by extract_month) * 100.0 / lag(total_rev) over(order by extract_month) as revenue
from month_rev;
