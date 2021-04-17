with source_data as (

    select
        supplier_id
        , company_name
        , contact_name
        , contact_title
        , phone
        , fax
        , address
        , city
        , region
        , country
        , postal_code
        , homepage

        /* Stitch extration */
        , _sdc_extracted_at as last_elt_extract
        , _sdc_table_version
        , _sdc_received_at
        , _sdc_sequence
        , _sdc_batched_at
        

from {{ source('northwind_etl','suppliers') }}

)

select *
from source_data
