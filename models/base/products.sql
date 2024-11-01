WITH raw_data AS (
    SELECT      *
    FROM        ({{raw_data_layer('export_products')}}) AS base_table
)
SELECT      ot_product_id,
            name,
            description,
            productstatus,
            seyear,
            mainseason,
            gender,
            brand_display_name,
            sizeguide,
            originalcolourname,
            pattern,
            occasion,
            style,
            color,
            active,
            productsegment,
            pricelive,
            retailpricelive,
            productid
FROM        raw_data
