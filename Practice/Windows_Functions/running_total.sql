--Running Total, Calculate Cumilative sales by Date

with TotalSales as
        ( 
        select sale_date,
       sum(amount) over(order by sale_date) as TotalSalesPerDay 
       from Sales
        )
select * from totalsales;
