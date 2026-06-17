create or refresh streaming table customer
as
select *
from stream first_project.raw_public.customer;