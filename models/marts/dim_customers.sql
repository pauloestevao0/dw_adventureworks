with 
    customers as (
        SELECT *
        FROM {{ref('stg_customer')}}
    )

select customers.customerid from customers