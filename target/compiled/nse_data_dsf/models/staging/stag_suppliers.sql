with source as (

    select * from DL_NORTHWIND.stage.suppliers
)
select  *  ,
 current_timestamp() as ingestion_timestamp  from source