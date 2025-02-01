with source as (

    select * from DL_NORTHWIND.stage.purchase_order_status
)
select * from source