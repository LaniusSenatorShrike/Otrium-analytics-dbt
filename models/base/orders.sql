WITH raw_data AS (
    SELECT      *
    FROM        ({{raw_data_layer('export_orders')}}) AS base_table
)
SELECT      orderdate,
            gmv,
            shippingcountry,
            orderdomain,
            orderstate,
            ot_member_id,
            ot_product_id,
            quantity,
            saleprice,
            CONCAT(ot_member_id, '-', ot_product_id, '-', orderdate) AS surrogate_key
FROM        raw_data
