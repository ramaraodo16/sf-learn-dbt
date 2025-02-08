
  
    

        create or replace transient table DL_NORTHWIND.RAW_stage.stag_strings
         as
        (with source as (

    select * from DL_NORTHWIND.stage.strings
)
select  *  ,
 current_timestamp() as ingestion_timestamp  from source
        );
      
  