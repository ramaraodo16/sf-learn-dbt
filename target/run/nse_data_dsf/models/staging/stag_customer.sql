
  
    

        create or replace transient table DL_NORTHWIND.RAW_stage.stag_customer
         as
        (with source as (

    select * from DL_NORTHWIND.stage.customer
)
select
 * ,
 current_timestamp() as ingestion_timestamp
from source
        );
      
  