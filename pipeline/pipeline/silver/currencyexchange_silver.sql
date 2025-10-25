create or refresh streaming live table silver.currencyexchange
as
select cast(a.date as date) as date,
       a.fromcurrency,
       a.tocurrency,
       a.exchange
from stream first_project.bronze.currencyexchange a;