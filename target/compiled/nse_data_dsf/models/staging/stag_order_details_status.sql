with source as (

    select * from DL_NORTHWIND.stage.order_details_status
)
select * from source