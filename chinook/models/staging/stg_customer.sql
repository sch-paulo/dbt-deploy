-- Imports

WITH sources AS (
    SELECT * FROM {{ ref('raw_customer') }}
),

-- Business logics

WITH renamed AS (
    SELECT 
        customer_id,
        first_name,
        last_name,
        first_name || ' ' || last_name AS full_name,
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

-- Final query

SELECT * FROM renamed