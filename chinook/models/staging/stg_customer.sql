-- Imports

WITH sources AS (
    SELECT * FROM {{ ref('raw_customer') }}
),

-- Business logics

WITH renamed_and_cleaning AS (
    SELECT 
        customer_id,
        first_name,
        last_name,
        company,
        address,
        city,
        state,
        country,
        postal_code,
        phone,
        fax,
        email,
        support_rep_id
    FROM
        sources
)

-- FInal query

SELECT * FROM renamed_and_cleaning