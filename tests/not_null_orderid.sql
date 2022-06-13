{{ config(severity = 'warn') }}

with
    valid_orders as (
        select *
        from {{ref('fact_orders')}}
        where salesorderid is not null
    )
select *
from valid_orders