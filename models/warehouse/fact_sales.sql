{{ config(
    CLUSTER_BY={
        "filed": "order_date",
        "data_type": "date"
    }    
)
}}
with source as 
(select 
 od.ORDER_ID , 
 od.PRODUCT_ID,
 o.CUSTOMER_ID,
 o.EMPLOYEE_ID, 
 o.SHIPPER_ID ,
 od.QUANTITY, 
 od.UNIT_PRICE, 
 od.DISCOUNT ,
 od.STATUS_ID,
 od.DATE_ALLOCATED, 
 od.PURCHASE_ORDER_ID, 
 od.INVENTORY_ID, 
 date(o.ORDER_DATE) as order_date, 
 o.SHIPPED_DATE,
 o.PAID_DATE, 
 current_timestamp() as insertion_timestamp

FROM {{ref('stag_orders')}} o
 left outer join {{ref('stag_order_details')}} od
 on od.ORDER_ID = o.id
 where od.ORDER_ID is not null
),
unique_source as 
( select * , row_number() over(partition by CUSTOMER_ID,EMPLOYEE_ID,ORDER_ID,product_id,SHIPPER_ID,PURCHASE_ORDER_ID,ORDER_DATE
 order by CUSTOMER_ID,EMPLOYEE_ID,ORDER_ID,product_id,SHIPPER_ID,PURCHASE_ORDER_ID,ORDER_DATE) as row_num
from source)
select *  EXCLUDE row_num from unique_source
where row_num = 1