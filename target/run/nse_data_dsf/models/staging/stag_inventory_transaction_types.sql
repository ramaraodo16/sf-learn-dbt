
  create or replace   view DL_NORTHWIND.RAW_stage.stag_inventory_transaction_types
  
   as (
    with source as (

    select * from DL_NORTHWIND.stage.inventory_transaction_types
)
select * from source
  );

