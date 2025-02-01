
  create or replace   view DL_NORTHWIND.RAW_stage.stg_employees
  
   as (
    with source as (

    select * from DL_NORTHWIND.stage.employees
)
select * from source
  );

