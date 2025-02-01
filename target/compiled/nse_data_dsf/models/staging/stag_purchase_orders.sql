with source as (

    select * from DL_NORTHWIND.stage.purchase_orders
)
select * from source