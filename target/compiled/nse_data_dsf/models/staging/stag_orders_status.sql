with source as (

    select * from DL_NORTHWIND.stage.orders_status
)
select  *  ,
 current_timestamp() as ingestion_timestamp  from source