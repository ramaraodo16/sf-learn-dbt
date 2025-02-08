with source as (

    select * from DL_NORTHWIND.stage.purchase_orders
)
select  *  ,
 current_timestamp() as ingestion_timestamp  from source