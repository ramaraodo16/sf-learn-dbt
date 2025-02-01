
  create or replace   view DL_NORTHWIND.RAW_stage.stag_purchase_order_status
  
   as (
    with source as (

    select * from DL_NORTHWIND.stage.purchase_order_status
)
select * from source
  );

