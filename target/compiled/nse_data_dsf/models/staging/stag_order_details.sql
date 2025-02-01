with source as (

    select * from DL_NORTHWIND.stage.order_details
)
select * from source