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
     from {{ref('stg_businessentity')}}
)
, address as(
     select *
     from {{ref('stg_address')}}
)
, businessentityadress as(
     select *
     from {{ref('stg_businessentityaddress')}}
)
, stateprovince as(
     select *
     from {{ref('stg_stateprovince')}}
)
, complete as (
    select 
        customers.customerid
        , person.personid

    from customers
    left join person on customers.personid = person.personid
    
)

select * from complete