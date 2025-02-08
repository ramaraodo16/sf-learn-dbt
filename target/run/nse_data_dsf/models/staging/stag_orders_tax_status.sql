
  
    

        create or replace transient table DL_NORTHWIND.RAW_stage.stag_orders_tax_status
         as
        (with source as (

    select * from DL_NORTHWIND.stage.orders_tax_status
)
select  *  ,
 current_timestamp() as ingestion_timestamp  from source
        );
      
  