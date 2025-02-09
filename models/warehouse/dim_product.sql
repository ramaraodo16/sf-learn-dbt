with dim_prod as 
(select 
 p.id as PROduct_ID, 
 p.product_code,
 p.product_name,
 p.description, 
 s.company as supplier_company,
 p.standard_cost, 
 p.list_price, 
 p.reorder_level ,
 p.target_level,
 p.QUANTITY_PER_UNIT, 
 p.DISCONTINUED, 
 p.MINIMUM_REORDER_QUANTITY, 
 p.CATEGORY, 
 p.ATTACHMENTS, 
 current_timestamp() as insertion_timestamp

FROM {{ref('stag_products')}} p
 left outer join {{ref('stag_suppliers')}} s 
 on s.id = p.supplier_ids
),
unique_source as 
( select * , row_number() over(partition by product_id order by product_id) as row_num
from dim_prod)
select *  EXCLUDE row_num from unique_source
where row_num = 1
