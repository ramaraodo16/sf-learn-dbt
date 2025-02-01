
  create or replace   view DL_NORTHWIND.RAW_stage.stag_order_details
  
   as (
    with source as (

    select * from DL_NORTHWIND.stage.order_details
)
select * from source
  );

