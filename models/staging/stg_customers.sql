WITH customers_dedup AS (
    SELECT *
    FROM ({{ remove_duplicates('customers', 'ot_member_id') }}) as base_dedup
)
SELECT      ot_member_id,
            gender,
            address_country_code AS country,
            favourited_brands
FROM        customers_dedup
{# regulation: we are only allowed to reach out to opt_in users with the assumption that this recommendation will be used in CRM marketing emails #}
WHERE       opt_in is TRUE

