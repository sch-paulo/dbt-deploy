-- Imports

WITH source AS (
    SELECT * FROM {{ ref('raw_album') }}
),

-- Business logics

renamed AS (
    SELECT
        albumid AS album_id,
        title AS album_title,
        artistid AS artist_id
    FROM source
)

-- Final query

SELECT * FROM renamed