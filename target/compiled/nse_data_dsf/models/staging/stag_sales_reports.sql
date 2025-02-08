with source as (

    select * from DL_NORTHWIND.stage.sales_reports
)
select  *  ,
 current_timestamp() as ingestion_timestamp  from source