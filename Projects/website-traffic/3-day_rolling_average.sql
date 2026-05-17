 select visit_date, visitors , 
 round(
        avg(visitors) over(order by visit_date
        rows between 2 preceding and current row),2) as rolling_avg_3days
    from website_traffic;
