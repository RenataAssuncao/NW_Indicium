with 
    customers as (
        select *
        from {{ ref('dim_customers')}}
    )
    , employees as (
        select *
        from {{ ref ('dim_employees')}}
    )
    , products as (
        select *
        from {{ ref ('dim_products')}}
    )
    , shippers as (
        select *
        from {{ ref ('dim_shippers')}}
    )
    , orders_with_sk as (
        select distinct
        orders.order_id
        , customers.customer_sk as customer_fk
        , employees.employee_sk as employee_fk
        , shippers.shipper_sk as shipper_fk
        , orders.order_date
        , orders.required_date
        , orders.shipped_date
        , orders.freight
        , orders.ship_name
        , orders.ship_via
        , orders.ship_address
        , orders.ship_city
        , orders.ship_region
        , orders.ship_country
        , orders.ship_postal_code
        
        from {{ ref('stg_orders') }} as orders
        left join customers on orders.customer_id = customers.customer_id
        left join employees on orders.employee_id = employees.employee_id
        left join shippers on orders.ship_via = shippers.shipper_id
    )
    , order_details_sk as (
        select distinct
        order_details.order_id
        , products.product_sk as product_fk
        , order_details.quantity
        , order_details.unit_price
        , order_details.discount
        from {{ ref('stg_order_details') }} as order_details 
        left join products on order_details.product_id = products.product_id
    )
    , fact_final as(
        select
        orders_with_sk.order_id
        , orders_with_sk.customer_fk
        , orders_with_sk.employee_fk
        , orders_with_sk.shipper_fk
        , order_details_sk.product_fk
        , orders_with_sk.order_date
        , orders_with_sk.required_date
        , orders_with_sk.shipped_date
        , orders_with_sk.freight
        , orders_with_sk.ship_name
        , orders_with_sk.ship_via
        , orders_with_sk.ship_address
        , orders_with_sk.ship_city
        , orders_with_sk.ship_region
        , orders_with_sk.ship_country
        , orders_with_sk.ship_postal_code
        , order_details_sk.quantity
        , order_details_sk.unit_price
        , order_details_sk.discount
        from orders_with_sk
        left join order_details_sk on orders_with_sk.order_id = order_details_sk.order_id 
    )

select *
from fact_final