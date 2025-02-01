
  create or replace   view DL_NORTHWIND.RAW_stage.stag_purchase_orders
  
   as (
    with source as (

    select * from DL_NORTHWIND.stage.purchase_orders
)
select * from source
  );

