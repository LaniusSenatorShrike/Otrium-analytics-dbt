WITH views_dedup AS (
    SELECT *
    FROM ({{ remove_duplicates('views', 'surrogate_key') }}) as base_dedup
)
SELECT      ot_member_id,
            product_id,
            product_name,
            product_brand,
            received_at,
            CASE
                WHEN shop_type LIKE '%women%' THEN 'female'
                WHEN shop_type LIKE '%men%' AND shop_type NOT LIKE '%women%' THEN 'male'
                WHEN shop_type LIKE '%kid%' THEN 'kid'
                WHEN shop_type LIKE '%"men","women"%' THEN 'unisex'
                ELSE 'NA'
            END AS shop_type
FROM        views_dedup
