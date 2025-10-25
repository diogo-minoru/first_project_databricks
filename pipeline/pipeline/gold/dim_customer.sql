create or refresh streaming live table gold.dim_customer
as
select a.customerkey,
       a.gender,
       a.name,
       a.continent,
       a.countryfull,
       a.statefull,
       a.city,
       a.age_range
from stream first_project.silver.customer a