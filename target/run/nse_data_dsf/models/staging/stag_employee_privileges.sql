
  create or replace   view DL_NORTHWIND.RAW_stage.stag_employee_privileges
  
   as (
    with source as (

    select * from DL_NORTHWIND.stage.employee_privileges
)
select * from source
  );

