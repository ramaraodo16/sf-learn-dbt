
  
    

        create or replace transient table DL_NORTHWIND.RAW_stage.stag_shippers
         as
        (with source as (

    select * from DL_NORTHWIND.stage.shippers
)
select  *  ,
 current_timestamp() as ingestion_timestamp  from source
        );
      
  