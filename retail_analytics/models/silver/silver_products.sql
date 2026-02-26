SELECT
        id,
        to_date(created_at) as created_at,
        title as product_name,
        category,
        ean,
        vendor,
        price
FROM 
    {{ ref('products_snapshot') }}

WHERE dbt_valid_to IS NULL