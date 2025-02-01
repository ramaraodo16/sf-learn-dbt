with source as (

    select * from DL_NORTHWIND.stage.orders_tax_status
)
select * from source