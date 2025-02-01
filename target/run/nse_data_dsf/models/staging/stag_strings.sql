
  create or replace   view DL_NORTHWIND.RAW_stage.stag_strings
  
   as (
    with source as (

    select * from DL_NORTHWIND.stage.strings
)
select * from source
  );

