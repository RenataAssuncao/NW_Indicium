with source_data as (

    select
        customer_id
        , contact_name	
        , phone
        , company_name	
        , contact_title
        , address
        , region
        , country	
        , city
        , fax
        , postal_code

        /* Stitch extration */
        , _sdc_extracted_at as last_elt_extract
        , _sdc_received_at
        , _sdc_sequence
        , _sdc_batched_at
        , _sdc_table_version
        

    from {{ source('northwind_etl','customers') }}

)

select *
from source_data
