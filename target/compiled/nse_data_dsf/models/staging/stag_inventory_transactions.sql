with source as (

    select * from DL_NORTHWIND.stage.inventory_transactions
)
select  *  ,
 current_timestamp() as ingestion_timestamp  from source