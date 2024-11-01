WITH orders_dedup AS (
    SELECT *
    FROM ({{ remove_duplicates('orders', 'surrogate_key') }}) as base_dedup
)
SELECT      orderdate,
            gmv,
            shippingcountry,
            orderstate,
            ot_member_id,
            ot_product_id,
            quantity,
            saleprice,
            surrogate_key
FROM        orders_dedup

