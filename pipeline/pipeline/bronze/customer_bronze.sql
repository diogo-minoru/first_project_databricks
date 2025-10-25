create or refresh streaming live table customer
as
select *
from stream first_project.raw_public.customer;