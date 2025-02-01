
  create or replace   view DL_NORTHWIND.RAW_stage.stag_sales_reports
  
   as (
    with source as (

    select * from DL_NORTHWIND.stage.sales_reports
)
select * from source
  );

