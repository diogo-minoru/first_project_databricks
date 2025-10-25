create or refresh streaming live table currencyexchange
as
select * 
from stream first_project.raw_public.currencyexchange;