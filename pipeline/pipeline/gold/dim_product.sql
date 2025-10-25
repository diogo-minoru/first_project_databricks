create or refresh streaming live table gold.dim_product
as
select a.productkey,
       a.productname,
       a.manufacturer,
       a.brand,
       a.categoryname
from stream first_project.silver.product a