create or refresh streaming live table silver.orders
as
select a.orderkey,
       a.customerkey,
       a.storekey,
       cast(a.orderdate as date) as orderdate,
       cast(a.deliverydate as date) as deliverydate,
       a.currencycode
from stream first_project.bronze.orders a