with 
 customers as(
     select *
     from {{ref('stg_customer')}}
)
, person as(
     select *
     from {{ref('stg_person')}}
)
, territory as(
     select *
     from {{ref('stg_salesterritory')}}
)
, personcreditcard as(
     select *
     from {{ref('stg_personcreditcard')}}
)
, creditcard as(
     select *
     from {{ref('stg_creditcard')}}
)
, businessentity as(
     select *
     from {{ref('stg_personcreditcard')}}
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