with source as (

    select * from DL_NORTHWIND.stage.invoices
)
select * from source