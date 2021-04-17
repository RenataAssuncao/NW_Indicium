with
    validation as (
        select sum (quantity) as qtdade
        from {{ ref('fact_orders') }}
        where order_date between '1997-05-01' and '1997-05-31'
)

select * from validation where qtdade != 173887