
  create or replace   view DL_NORTHWIND.RAW_stage.stag_customer
  
   as (
    with source as (

    select * from DL_NORTHWIND.stage.customer
)
select * from source
  );

