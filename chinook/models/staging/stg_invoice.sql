-- Imports 

WITH source AS (
    SELECT * FROM {{ ref('raw_invoice') }}
),

-- Business logics

renamed AS (
    SELECT
        invoice_id,
        customer_id,
        invoice_date,
        billing_address,
        billing_city,
        billing_state,
        billing_country,
        billing_postal_code,
        total AS total_amount
    FROM source
)

-- Final query

SELECT * FROM renamed