SELECT
        id,
        to_date(created_at) as created_at,
        title as product_name,
        category,
        ean,
        vendor,
        price
FROM 
    {{ ref('bronze_products') }}
