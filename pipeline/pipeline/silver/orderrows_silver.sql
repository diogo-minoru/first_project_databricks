create or refresh streaming live table silver.orderrows
as
select a.OrderKey,
       a.LineNumber,
       a.ProductKey,
       a.Quantity,
       b.currencycode, 
       round((a.Quantity * a.NetPrice) * c.exchange, 2) as total_price_usd
from stream first_project.bronze.orderrows a
join stream first_project.bronze.orders b on a.OrderKey = b.orderkey
join stream first_project.bronze.currencyexchange c on b.orderdate = c.date and b.currencycode = c.fromcurrency
where c.tocurrency = 'USD'