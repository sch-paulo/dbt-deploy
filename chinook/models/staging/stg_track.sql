-- Imports

WITH source AS (
    SELECT * FROM {{ ref('raw_track') }}
),

-- Business logics

renamed AS (
    SELECT
        track_id,
        album_id,
        media_type_id,
        genre_id,
        name AS track_name,
        composer,
        milliseconds,
        milliseconds / 1000 AS seconds,
        bytes,
        unit_price       
    FROM source
)

-- Final query

SELECT * FROM renamed