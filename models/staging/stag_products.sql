with source as (

    select * from {{source('northwind', 'products')}}
    where supplier_ids not like '%;%'
)
select  *  ,
 current_timestamp() as ingestion_timestamp  from source