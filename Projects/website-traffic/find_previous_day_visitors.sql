select visit_date,visitors,lag(visitors) over(order by visit_date) as difference from website_traffic;
