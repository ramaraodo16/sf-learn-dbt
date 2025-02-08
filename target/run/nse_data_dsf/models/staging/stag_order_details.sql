
  
    

        create or replace transient table DL_NORTHWIND.RAW_stage.stag_order_details
         as
        (with source as (

    select * from DL_NORTHWIND.stage.order_details
)
select  *  ,
 current_timestamp() as ingestion_timestamp  from source
        );
      
  