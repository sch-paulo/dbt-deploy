-- Imports

WITH source AS (
    SELECT * FROM {{ ref('raw_invoice_line') }}
),

-- Business logics

renamed AS (
    SELECT
        invoice_line_id,
        invoice_id,
        track_id,
        unit_price,
        quantity,
        unitprice * quantity AS line_total
    FROM source
)

-- Final query

SELECT * FROM renamed