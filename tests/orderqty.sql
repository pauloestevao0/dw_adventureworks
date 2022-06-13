{{ config(severity = 'warn') }}

with
    orderqty as (
        select 
            count(distinct salesorderid) as qtyorders
            , orderdate
        from {{ref('fact_orders')}}
        group by orderdate
        having qtyorders = 0
    )
select *
from orderqty