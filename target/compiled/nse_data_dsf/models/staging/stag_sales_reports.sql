with source as (

    select * from DL_NORTHWIND.stage.sales_reports
)
select * from source