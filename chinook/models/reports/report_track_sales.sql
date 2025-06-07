-- This model aggregates sales data up to the track/artist/genre level.
-- It's perfect for finding top-selling items and understanding product performance.

WITH invoice_lines AS (
    SELECT * FROM {{ ref('stg_invoice_line') }}
),

tracks AS (
    SELECT * FROM {{ ref('stg_track') }}
    LEFT JOIN {{ ref('stg_album') }} ON stg_track.album_id = stg_album.album_id
    LEFT JOIN {{ ref('stg_artist') }} ON stg_album.artist_id = stg_artist.artist_id
    LEFT JOIN {{ ref('stg_genre') }} ON stg_track.genre_id = stg_genre.genre_id
),

track_sales_summary AS (
    SELECT
        t.track_id,
        t.artist_id,
        t.genre_id,

        t.track_name,
        t.artist_name,
        t.album_title,
        t.genre_name,
        
        SUM(il.line_total) AS total_revenue,
        SUM(il.quantity) AS total_units_sold,
        COUNT(DISTINCT il.invoice_id) as total_orders
    FROM invoice_lines il
    LEFT JOIN tracks t ON il.track_id = t.track_id
    GROUP BY 1, 2, 3, 4, 5, 6, 7
)

SELECT 
    * 
FROM
    track_sales_summary
ORDER BY 
    total_revenue DESC