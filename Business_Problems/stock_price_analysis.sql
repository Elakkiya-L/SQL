select * from(
select trade_date, lead(price) over(order by trade_date) as next_day,price,lag(price) over(order by trade_date) as prev_day from stock_prices)t
where  next_day>price  and prev_day>price;
