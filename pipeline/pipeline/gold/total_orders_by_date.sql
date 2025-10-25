--drop table if exists gold.total_orders_by_date
create or refresh live table gold.total_orders_by_date
select a.orderdate,
      count(*) as total_order_by_date,
      count(distinct a.customerkey) as total_distinct_customer_by_date,
      count(distinct b.ProductKey) as total_distinct_product_by_date,
      count(c.customerkey) as total_new_customers_by_date,
      round(sum(b.total_price_usd), 2) as total_revenue_usd_by_date,
      sum(b.quantity) as total_quantity_by_date
from first_project.silver.orders a
join first_project.silver.orderrows b on a.orderkey = b.OrderKey
left join (
    select a.customerkey,
          min(orderdate) as first_buy_date
    from first_project.silver.orders a
    group by a.customerkey
  ) c on a.customerkey = c.customerkey and a.orderdate = c.first_buy_date
group by a.orderdate