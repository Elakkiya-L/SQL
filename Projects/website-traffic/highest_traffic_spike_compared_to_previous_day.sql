with previous_day as(
select visit_date,visitors,lag(visitors) over(order by visit_date) as prev_day
 from website_traffic),
 traffic_spike as(
 select visit_date, round(100*(visitors-prev_day)/prev_day,1) as traf_spike from previous_day) 
 select max(traf_spike)
 as highest_traffic_spike from traffic_spike
 ;
