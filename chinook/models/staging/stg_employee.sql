-- Imports

WITH source AS (
    SELECT * FROM {{ ref('raw_employee') }}
),

-- Business logics

renamed AS (
    SELECT
        employee_id,
        reports_to_employee_id,
        last_name,
        first_name,
        firstname || ' ' || lastname AS full_name,
        title AS employee_title,
        birth_date,
        hire_date,
        address,
        city,
        state,
        country,
        postal_code,
        phone,
        fax,
        email
    FROM source
)

-- Final query

SELECT * FROM renamed