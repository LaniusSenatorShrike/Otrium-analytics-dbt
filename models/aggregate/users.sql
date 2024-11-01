{{ config(
    materialized='table'
) }}

SELECT      ot_member_id        AS USER_ID,
            favourited_brands   AS FAVOURITE_BRANDS
FROM        {{ ref('stg_customers') }}
