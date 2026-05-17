select distinct user_id from logins;
select * from(
select login_date,lead(login_date) over(partition by user_id order by login_date) as next_date from logins )t 
where datediff(prev_date,login_date)=1;
