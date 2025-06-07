-- Imports

WITH source AS (

    SELECT * FROM {{ ref('raw_artist') }}

),

-- Business logics

renamed AS (

    SELECT
        artist_id,
        name AS artist_name
    FROM source

)

-- Final query

SELECT * FROM renamed