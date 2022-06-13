{{ config(severity = 'warn') }}

with
    products as (
        select 
            productid

        from {{ref('fact_orders')}}
        
    )

    , productname as (
        select
            productid
            , name

        from {{ref('dim_products')}}
    )

    , valid_product_test as (
    select 
        products.productid
        , productname.name

    from products
left join productname on products.productid = productname.productid)

select *
from valid_product_test
where name is null