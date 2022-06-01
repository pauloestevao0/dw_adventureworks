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
, salesreason as(
     select *
     from {{ref('stg_salesreason')}}
)

, complete as (
    select 
        orders.salesorderid
        , orders.customerid
        , orders.orderdate
        , details.orderqty
        , details.salesorderdetailid
        , details.unitprice
        , details.productid
        , reason.salesreasonid
        , salesreason.name as reasonname

    from orders
    left join details on orders.salesorderid = details.salesorderid
    left join reason on orders.salesorderid = reason.salesorderid
    left join salesreason on reason.salesreasonid = salesreason.salesreasonid
)

select * from complete