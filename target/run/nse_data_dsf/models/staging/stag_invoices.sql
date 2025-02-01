
  create or replace   view DL_NORTHWIND.RAW_stage.stag_invoices
  
   as (
    with source as (

    select * from DL_NORTHWIND.stage.invoices
)
select * from source
  );

