with source as (

    select * from DL_NORTHWIND.stage.employee_privileges
)
select *  ,
 current_timestamp() as ingestion_timestamp from source