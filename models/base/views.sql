WITH raw_data AS (
    SELECT      *
    FROM        ({{raw_data_layer('export_views')}}) AS base_table
)
SELECT      anonymous_id,
            received_at,
            product_id,
            product_name,
            product_brand,
            shop_type,
            ot_member_id,
            CONCAT(ot_member_id, '-', product_id, '-', received_at, '-', product_brand) AS surrogate_key
FROM        raw_data
