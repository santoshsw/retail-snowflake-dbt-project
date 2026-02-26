SELECT 
        * 
FROM 
    {{ source('landing','orders') }}

WHERE unit_price < 0 and quantity < 0
