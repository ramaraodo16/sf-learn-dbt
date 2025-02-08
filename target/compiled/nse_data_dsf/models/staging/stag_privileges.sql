with source as (

    select * from DL_NORTHWIND.stage.privileges
)
select  *  ,
 current_timestamp() as ingestion_timestamp  from source