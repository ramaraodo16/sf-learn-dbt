
  create or replace   view DL_NORTHWIND.RAW_stage.stag_orders_status
  
   as (
    with source as (

    select * from DL_NORTHWIND.stage.orders_status
)
select * from source
  );

