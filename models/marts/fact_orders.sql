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

, person as(
     select *
     from {{ref('stg_person')}}
)

, creditcard as (
     select *
     from {{ref('stg_creditcard')}}
)

, complete as (
    select 
        orders.salesorderid
        , orders.customerid
        , customer.personid
        , orders.orderdate
        , details.orderqty
        , details.salesorderdetailid
        , details.unitprice
        , details.productid
        , reason.salesreasonid
        , salesreason.name as reasonname
        , person.businessentityid
        , creditcard.cardtype

    from orders
    left join details on orders.salesorderid = details.salesorderid
    left join reason on orders.salesorderid = reason.salesorderid
    left join salesreason on reason.salesreasonid = salesreason.salesreasonid
    left join customer on orders.customerid = customer.customerid
    left join person on customer.personid = person.businessentityid
    left join creditcard on orders.creditcardid = creditcard.creditcardid
)

select * from complete