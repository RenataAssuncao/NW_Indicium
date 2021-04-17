with source_data as (

    select
        state_id
        , state_name
        , state_abbr
        , state_region
                                 
        /* Stitch extration */
        , _sdc_extracted_at as last_elt_extract
        , _sdc_received_at
        , _sdc_sequence
        , _sdc_batched_at
        , _sdc_table_version
        
    from {{ source('northwind_etl','us_states') }}

)

select *
from source_data
