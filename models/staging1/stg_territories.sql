with source_data as (

    select
        territory_id
        , region_id
        , territory_description
                                 
        /* Stitch extration */
        , _sdc_extracted_at as last_elt_extract
        , _sdc_received_at
        , _sdc_sequence
        , _sdc_batched_at
        , _sdc_table_version
        
    from {{ source('northwind_etl','territories') }}

)

select *
from source_data
