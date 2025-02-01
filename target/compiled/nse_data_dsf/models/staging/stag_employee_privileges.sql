with source as (

    select * from DL_NORTHWIND.stage.employee_privileges
)
select * from source