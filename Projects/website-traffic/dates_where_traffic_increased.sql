select  visit_date from (
select visit_date,visitors,lag(visitors) over(order by visit_date) as prev_date_visitors from website_traffic) t
where visitors> prev_date_visitors;
