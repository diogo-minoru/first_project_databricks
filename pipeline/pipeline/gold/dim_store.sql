create or refresh streaming live table gold.dim_store
as
select a.storekey,
       a.countryname,
       a.state
from stream first_project.silver.store a