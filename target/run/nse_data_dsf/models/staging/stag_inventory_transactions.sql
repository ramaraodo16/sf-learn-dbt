
  
    

        create or replace transient table DL_NORTHWIND.RAW_stage.stag_inventory_transactions
         as
        (with source as (

    select * from DL_NORTHWIND.stage.inventory_transactions
)
select  *  ,
 current_timestamp() as ingestion_timestamp  from source
        );
      
  