
  
    

        create or replace transient table DL_NORTHWIND.RAW_stage.stag_invoices
         as
        (with source as (

    select * from DL_NORTHWIND.stage.invoices
)
select  *  ,
 current_timestamp() as ingestion_timestamp from source
        );
      
  