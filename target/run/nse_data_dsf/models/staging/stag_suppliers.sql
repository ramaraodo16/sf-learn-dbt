
  create or replace   view DL_NORTHWIND.RAW_stage.stag_suppliers
  
   as (
    with source as (

    select * from DL_NORTHWIND.stage.suppliers
)
select * from source
  );

