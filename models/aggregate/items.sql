{{ config(
    materialized='table'
) }}

SELECT      productid       AS ITEM_ID,
            pricelive       AS PRICE,
            productsegment  AS CATEGORY_L1,
            style           AS CATEGORY_L2,
            pattern         AS CATEGORY_L3,
            description     AS PRODUCT_DESCRIPTION,
            gender          AS GENDER
FROM        {{ ref('stg_products') }}
