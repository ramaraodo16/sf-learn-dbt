
  
    

        create or replace transient table DL_NORTHWIND.RAW_stage.stag_privileges
         as
        (with source as (

    select * from DL_NORTHWIND.stage.privileges
)
select  *  ,
 current_timestamp() as ingestion_timestamp  from source
        );
      
  