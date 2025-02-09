{{ config(
    CLUSTER_BY={
        "filed": "Transaction_creation_date",
        "data_type": "date"
    }    
)
}}

with source as (
select  
 ID as inventory_id, TRANSACTION_TYPE, 
 date(TRANSACTION_CREATED_DATE) as Transaction_creation_date, 
 TRANSACTION_MODIFIED_DATE, PRODUCT_ID, QUANTITY, PURCHASE_ORDER_ID, CUSTOMER_ORDER_ID, COMMENTS, 
current_timestamp() as insertion_timestamp

from  {{ ref('stag_inventory_transactions')}} io 
 

),
unique_source as 
( select 
* ,
row_number() over(partition by inventory_id order by inventory_id) as row_num

from source 
)

select * exclude row_num from unique_source
where row_num =1

 
 
