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

select * from territory