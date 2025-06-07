-- Imports

WITH source AS (
    SELECT * FROM {{ ref('raw_playlist_track') }}
),

-- Business logics

renamed AS (
    SELECT
        playlist_id,
        track_id
    FROM source
)

-- Final query

SELECT * FROM renamed