with source as (

    select * from DL_NORTHWIND.stage.orders_status
)
select * from source