
  create or replace   view DL_NORTHWIND.RAW_stage.stag_shippers
  
   as (
    with source as (

    select * from DL_NORTHWIND.stage.shippers
)
select * from source
  );

