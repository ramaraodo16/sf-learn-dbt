
  create or replace   view DL_NORTHWIND.RAW_stage.stag_products
  
   as (
    with source as (

    select * from DL_NORTHWIND.stage.products
)
select * from source
  );

