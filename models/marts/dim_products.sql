with 
 product as(
     select *
     from {{ref('stg_products')}}
)


, products as (
    select 
        product.productid
        , product.name
        , product.productnumber
        , product.color
    from product
    
)

select * from products