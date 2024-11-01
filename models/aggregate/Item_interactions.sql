-- TODO:
-- if user views a prodcut for multiple time, only the most recent view is taken to prevent model being biased by old data

{{ config(
    materialized='table'
) }}

SELECT      ot_member_id                AS USER_ID,
            CAST(product_id AS TEXT)    AS ITEM_ID,
            received_at                 AS TIMESTAMP,
            'View'                      AS EVENT_TYPE
FROM        {{ ref('stg_views') }}