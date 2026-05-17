select * from transactions;
with transactionsteps as(
select  customer_id,txn_time,lag(txn_time) over(partition by customer_id order by txn_time) as previous_time from transactions)
select customer_id,previous_time from transactionsteps 
where previous_time is not null
And txn_time <= date_add(previous_time,interval 10 Minute) ;
