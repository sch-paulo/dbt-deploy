-- Imports

WITH source AS (
    SELECT * FROM {{ ref('raw_genre') }}
),

-- Business logics

renamed AS (
    SELECT
        genre_id,
        name AS genre_name
    FROM source
)

-- Final query

SELECT * FROM renamed