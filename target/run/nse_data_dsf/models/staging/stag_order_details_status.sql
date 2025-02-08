
  
    

        create or replace transient table DL_NORTHWIND.RAW_stage.stag_order_details_status
         as
        (with source as (

    select * from DL_NORTHWIND.stage.order_details_status
)
select  *  ,
 current_timestamp() as ingestion_timestamp  from source
        );
      
  