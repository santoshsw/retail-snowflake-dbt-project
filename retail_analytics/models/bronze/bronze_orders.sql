{{
  config(
    materialized = 'incremental',
    unique_key = 'id'
    )
}}

SELECT 
        * 
FROM 
    {{ source('landing', 'orders_incremental') }}

{% if is_incremental() %}

WHERE created_at > (SELECT coalesce(max(created_at),'1900-01-01') FROM {{ this }})

{% endif %}
