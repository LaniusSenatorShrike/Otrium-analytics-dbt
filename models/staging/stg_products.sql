WITH products_dedup AS (
    SELECT *
    FROM ({{ remove_duplicates('products', 'ot_product_id') }}) as base_dedup
)
SELECT      ot_product_id,
            name,
            description,
            seyear,
            mainseason,
            CASE gender
                WHEN 'F' THEN 'female'
                WHEN 'M' THEN 'male'
                WHEN 'K' THEN 'kid'
                WHEN 'U' THEN 'unisex'
                ELSE  'NA'
            END AS gender,
            brand_display_name,
            sizeguide,
            originalcolourname,
            pattern,
            occasion,
            style,
            color,
            productsegment,
            pricelive,
            retailpricelive,
            productid
FROM        products_dedup
WHERE       productstatus = 'publish' -- only published products
            AND active is true -- only active products

