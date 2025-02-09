{{ config(
    CLUSTER_BY={
        "filed": "creation_date",
        "data_type": "date"
    }    
)
}}
with source as (
select  
c.id as customer_id,
e.id as employee_id,
pod.PURCHASE_ORDER_ID,
pod.product_id,
pod.QUANTITY,
pod.UNIT_COST,
pod.DATE_RECEIVED,
pod.POSTED_TO_INVENTORY,
pod.INVENTORY_ID,
po.SUPPLIER_ID,
po.CREATED_BY,
po.SUBMITTED_DATE,
date(po.CREATION_DATE) as creation_date,
po.STATUS_ID,
po.EXPECTED_DATE,
po.SHIPPING_FEE,
po.TAXES,
po.PAYMENT_DATE,
po.PAYMENT_AMOUNT,
po.PAYMENT_METHOD,
po.NOTES,
po.APPROVED_BY,
po.APPROVED_DATE,
po.SUBMITTED_BY,
current_timestamp() as insertion_timestamp

from  {{ ref('stag_purchase_orders')}} po 
left outer join {{ ref('stag_purchase_order_details')}} pod  
on po.id = pod.PURCHASE_ORDER_ID
left join {{ ref('stag_products')}} p 
on p.id = pod.PRODUCT_ID
left join {{ ref('stag_order_details')}} od 
on p.id = od.product_id
left join {{ ref('stag_orders')}} o
on od.ORDER_ID = o.ID
left join {{ ref('stg_employees')}} e 
on e.id = po.CREATED_BY
left join {{ ref('stag_customer')}} c
on c.id = o.customer_id
where o.customer_id is not null

),
unique_source as 
( select 
* ,
row_number() over(partition by CUSTOMER_ID,EMPLOYEE_ID,PURCHASE_ORDER_ID,product_id,inventory_id,supplier_id ,CReation_DATE 
order by CUSTOMER_ID,EMPLOYEE_ID,PURCHASE_ORDER_ID,product_id,inventory_id,supplier_id ,CReation_DATE) as row_num

from source 
)

select * exclude row_num from unique_source
where row_num =1

