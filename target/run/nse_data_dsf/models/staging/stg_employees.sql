
  
    

        create or replace transient table DL_NORTHWIND.RAW_stage.stg_employees
         as
        (with source as (

    select * from DL_NORTHWIND.stage.employees
)
select  *  ,
 current_timestamp() as ingestion_timestamp  from source
        );
      
  