create or refresh streaming live table bronze.orderrows
as
select *
from stream first_project.raw_public.orderrows;