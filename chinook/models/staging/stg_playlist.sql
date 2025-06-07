-- Imports

WITH source AS (
    SELECT * FROM {{ ref('raw_playlist') }}
),

-- Business logics

renamed AS (
    SELECT
        playlist_id,
        name AS playlist_name
    FROM source
)

-- Final query

SELECT * FROM renamed