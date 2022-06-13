with 
    customers as (
        SELECT *
        FROM {{ref('stg_customer')}}
    )

    , person as(
     select *
     from {{ref('stg_person')}}
)

, territory as(
     select *
     from {{ref('stg_salesterritory')}}
)

, customerinfos as (
    select
        customers.customerid
        , customers.personid
        , territory.territoryid

from customers
left join person on customers.personid = person.businessentityid
left join territory on customers.territoryid = territory.territoryid
)

select * from customerinfos