with source as (

    select * from DL_NORTHWIND.stage.inventory_transactions
)
select * from source