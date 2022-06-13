with 
    customers as (
        SELECT *
        FROM {{ref('stg_customer')}}
    )

    , person as(
     select *
     from {{ref('stg_person')}}
)

select * from person