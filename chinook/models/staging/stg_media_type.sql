-- Imports

WITH source AS (
    SELECT * FROM {{ ref('raw_media_type') }}
),

-- Business logics

renamed AS (
    SELECT
        media_type_id,
        name AS media_type_name
    FROM source
)

-- Final query

SELECT * FROM renamed