create or refresh streaming live table silver.customer
as
select a.customerkey,
       initcap(a.gender) as gender,
       left(a.givenname, 1) || '.' || a.middleinitial || '.' || left(a.surname, 1) as name,
       a.geoareakey,
       a.continent,
       a.countryfull,
       a.statefull,
       a.city,
       a.birthday,
       a.age,
       (floor((a.age / 5)) * 5) || ' to ' || (floor((a.age / 5)) * 5 + 4) as age_range,
       a.occupation,
       a.latitude,
       a.longitude
from  stream first_project.bronze.customer a