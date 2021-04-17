with source_data as (

    select
        order_id
        , customer_id
        , employee_id
        , order_date
        , required_date
        , shipped_date
        , freight
        , ship_name
        , ship_via
        , ship_address
        , ship_city
        , ship_region
        , ship_country
        , ship_postal_code
                 
        /* Stitch extration */
        , _sdc_extracted_at as last_elt_extract
        , _sdc_received_at
        , _sdc_sequence
        , _sdc_batched_at
        , _sdc_table_version
        
    from {{ source('northwind_etl','orders') }}

)

select *
from source_data
