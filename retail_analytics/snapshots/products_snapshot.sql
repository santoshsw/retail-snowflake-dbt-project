{% snapshot products_snapshot %}
    {{
        config(
            target_schema='bronze',
            strategy='timestamp',
            unique_key='id',
            updated_at='created_at'
        )
    }}

    SELECT 
            *,
            to_timestamp_ntz(created_at) AS updated_at
    FROM 
        {{ source('landing','products') }}

{% endsnapshot %}
