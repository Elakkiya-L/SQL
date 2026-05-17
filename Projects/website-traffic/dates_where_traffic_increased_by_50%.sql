 with daily_traffic as(
select visit_date ,sum(visitors) as total_visitors 
from website_traffic
group by visit_date )
,previous_day_traffic as (
select visit_date,total_visitors, lag(total_visitors) over(order by visit_date) as prev_day_visitors
 from daily_traffic)
 select  visit_date,round ((total_visitors-prev_day_visitors)/prev_day_visitors*100 ,2)
 from previous_day_traffic
where (total_visitors-prev_day_visitors) / prev_day_visitors >=0.50
 ;
