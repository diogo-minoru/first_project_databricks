create or refresh streaming live table gold.fact_orderrows
as
select a.orderkey,
       a.quantity,
       a.total_price_usd,
       a.productkey,
       b.customerkey,
       b.storekey,
       b.orderdate,
       b.deliverydate,
       extract(day from b.deliverydate - b.orderdate) as delivery_days
from stream first_project.silver.orderrows a
join stream first_project.silver.orders b on a.orderkey = b.orderkey