with source as (

    select * from DL_NORTHWIND.stage.strings
)
select  *  ,
 current_timestamp() as ingestion_timestamp  from source