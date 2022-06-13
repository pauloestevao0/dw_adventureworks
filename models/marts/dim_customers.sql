with 
    customers as (
        SELECT *
        FROM {{ref('stg_customer')}}
    )

    , person as (
     select *
     from {{ref('stg_person')}}
)

, businessentityaddress as (
    select *
    from {{ref('stg_businessentityaddress')}}
)

, address as (
    select *
    from{{ref('stg_address')}}
)

, stateprovince as (
    select *
    from {{ref('stg_stateprovince')}}
)

, countryregion as (
    select *
    from {{ref('stg_countryregion')}}
)

, customerinfos as (
    select distinct
        customers.customerid
        , customers.personid
        , customers.territoryid
        , person.businessentityid
        , businessentityaddress.addressid
        , address.city
        , stateprovince.name as state
        , countryregion.name as country
        , concat (person.firstname,' ',person.lastname) as customername

from customers
left join person on customers.personid = person.businessentityid
left join businessentityaddress on person.businessentityid = businessentityaddress.businessentityid
left join address on businessentityaddress.addressid = address.addressid
left join stateprovince on address.stateprovinceid = stateprovince.stateprovinceid
left join countryregion on stateprovince.countryregioncode = countryregion.countryregioncode
)

select * from customerinfos