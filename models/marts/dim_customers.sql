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
, personaddress as(
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
, salesperson as(
     select *
     from {{ref('stg_salesperson')}}
)
, complete as (
    select 
        customers.customerid
        , person.businessentityid
        , concat(person.firstname,' ',person.lastname) as customername
        , creditcard.cardtype
        , territory.territoryid
        , personaddress.city
        , stateprovince.name as state
        , territory.name as country

    from customers
    left join person on customers.customerid = person.businessentityid
    left join personcreditcard on person.businessentityid = personcreditcard.businessentityid
    left join creditcard on personcreditcard.creditcardid = creditcard.creditcardid
    left join salesperson on person.businessentityid = salesperson.businessentityid
    left join territory on salesperson.territoryid = territory.territoryid
    left join businessentityadress on person.businessentityid = businessentityadress.businessentityid
    left join personaddress on businessentityadress.addressid = personaddress.addressid
    left join stateprovince on personaddress.stateprovinceid = stateprovince.stateprovinceid
)

select * from complete