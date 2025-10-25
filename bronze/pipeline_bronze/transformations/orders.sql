create or refresh streaming live table orders
as
select * 
from stream first_project.raw_public.orders;