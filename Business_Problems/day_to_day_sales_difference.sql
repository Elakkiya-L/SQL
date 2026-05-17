select
    sale_date,
    sales,
    lag(sales) over(order by sale_date) as previous_day_sales,
    sales - lag(sales) over(order by sale_date) as difference
from daily_sales;
