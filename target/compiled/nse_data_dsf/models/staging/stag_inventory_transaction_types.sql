with source as (

    select * from DL_NORTHWIND.stage.inventory_transaction_types
)
select  *  ,
 current_timestamp() as ingestion_timestamp  from source