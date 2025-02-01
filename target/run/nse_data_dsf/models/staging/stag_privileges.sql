
  create or replace   view DL_NORTHWIND.RAW_stage.stag_privileges
  
   as (
    with source as (

    select * from DL_NORTHWIND.stage.privileges
)
select * from source
  );

