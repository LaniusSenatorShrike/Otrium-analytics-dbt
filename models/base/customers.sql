WITH raw_data AS (
    SELECT      *
    FROM        ({{raw_data_layer('export_customers')}}) AS base_table
)
SELECT      ot_member_id,
            gender,
            locale,
            address_country_code,
            opt_in,
            favourited_brands
FROM        raw_data
