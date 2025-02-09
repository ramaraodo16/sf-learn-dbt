with source as (

    select * from DL_NORTHWIND.stage.products
    where supplier_ids not like '%;%'
)
select  *  ,
 current_timestamp() as ingestion_timestamp  from source