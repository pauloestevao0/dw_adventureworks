with 
 orders as(
     select *
     from {{ref('stg_salesorderheader')}}
)
, details as(
     select *
     from {{ref('stg_salesorderdetail')}}
)
, reason as(
     select *
     from {{ref('stg_salesorderheadersalesreason')}}
)
, customer as(
     select *
     from {{ref('stg_customer')}}
)

, complete as (
    select 
        orders.salesorderid
        , orders.orderdate
        , details.orderqty
        , details.salesorderdetailid
        , details.unitprice
        , details.productid
        , reason.salesreasonid
    from orders
    left join details on orders.salesorderid = details.salesorderid
    left join reason on orders.salesorderid = reason.salesorderid
)

select * from complete