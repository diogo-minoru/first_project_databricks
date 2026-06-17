create or refresh streaming table currencyexchange
as
select *
from stream first_project.raw_public.currencyexchange;