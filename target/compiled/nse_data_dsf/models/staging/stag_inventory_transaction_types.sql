with source as (

    select * from DL_NORTHWIND.stage.inventory_transaction_types
)
select * from source