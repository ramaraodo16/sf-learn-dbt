with source as (

    select * from DL_NORTHWIND.stage.orders
)
select * from source