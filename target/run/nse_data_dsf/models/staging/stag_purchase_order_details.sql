
  create or replace   view DL_NORTHWIND.RAW_stage.stag_purchase_order_details
  
   as (
    with source as (

    select * from DL_NORTHWIND.stage.purchase_order_details
)
select * from source
  );

