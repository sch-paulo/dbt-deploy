-- This model joins all the core tables to create a single, wide view of each invoice line.
-- It's a classic "denormalization" pattern, making it easy for analysts to query without complex joins.

WITH invoices AS (
    SELECT * FROM {{ ref('stg_invoice') }}
),

invoice_lines AS (
    SELECT * FROM {{ ref('stg_invoice_line') }}
),

customers AS (
    SELECT * FROM {{ ref('stg_customer') }}
),

tracks AS (
    SELECT * FROM {{ ref('stg_track') }}
    LEFT JOIN {{ ref('stg_album') }} ON stg_track.album_id = stg_album.album_id
    LEFT JOIN {{ ref('stg_artist') }} ON stg_album.artist_id = stg_artist.artist_id
    LEFT JOIN {{ ref('stg_genre') }} ON stg_track.genre_id = stg_genre.genre_id
),

-- Final join logic
final AS (
    SELECT 
        il.invoice_line_id,
        il.line_total,

        i.invoice_id,
        i.invoice_date,

        c.customer_id,
        c.full_name AS customer_name,
        c.country AS customer_country,

        t.track_name,
        t.album_title,
        t.artist_name,
        t.genre_name,
        t.seconds AS track_duration_seconds
        
    FROM invoice_lines il
    LEFT JOIN invoices i ON il.invoice_id = i.invoice_id
    LEFT JOIN customers c ON i.customer_id = c.customer_id
    LEFT JOIN tracks t ON il.track_id = t.track_id
)

SELECT * FROM final