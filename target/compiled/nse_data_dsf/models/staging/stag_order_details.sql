with source as (

    select * from DL_NORTHWIND.stage.order_details
)
select  *  ,
 current_timestamp() as ingestion_timestamp  from source