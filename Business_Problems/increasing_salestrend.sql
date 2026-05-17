with daily_revenue as(
select sale_date,sum(sales) as total_revenue from daily_sales group by sale_date)
select * from (select sale_date,total_revenue,lag(total_revenue,1) over(order by sale_date) as sale_inc from daily_revenue)t
where total_revenue > sale_inc;
