
  create or replace   view DL_NORTHWIND.RAW_stage.stag_orders
  
   as (
    with source as (

    select * from DL_NORTHWIND.stage.orders
)
select * from source
  );

