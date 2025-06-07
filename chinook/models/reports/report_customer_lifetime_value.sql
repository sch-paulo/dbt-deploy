-- This model aggregates invoice data to find the lifetime value of each customer.
-- It builds on top of another report model, which is a powerful dbt pattern.

WITH customer_invoices AS (
    SELECT * FROM {{ ref('report_customer_invoices') }}
),

-- Calculate lifetime value and other metrics per customer
customer_summary AS (
    SELECT
        customer_id,
        customer_name,

        SUM(line_total) AS lifetime_value,
        COUNT(DISTINCT invoice_id) AS total_orders,
        MIN(invoice_date) AS first_order_date,
        MAX(invoice_date) AS latest_order_date,
        COUNT(track_name) AS total_tracks_purchased
    FROM customer_invoices
    GROUP BY 1, 2
)

SELECT * FROM customer_summary
ORDER BY lifetime_value DESC