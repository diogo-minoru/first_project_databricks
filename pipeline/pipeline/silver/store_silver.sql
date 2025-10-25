create or refresh streaming live table silver.store
as
select a.storekey,
       a.geoareakey,
       a.countryname,
       a.state
from stream first_project.bronze.store a;