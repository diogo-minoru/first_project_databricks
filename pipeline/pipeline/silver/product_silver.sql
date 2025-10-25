create or refresh streaming live table silver.product
as
select a.productkey,
       a.productcode,
       a.productname,
       a.manufacturer,
       a.brand,
       a.color,
       a.categoryname,
       a.subcategoryname
from stream first_project.bronze.product a