{{ config(severity = 'warn') }}

with
    valid_orders as (
        select *
        from {{ref('fact_orders')}}
        where salesorderid != 0
    )
select *
from valid_orders