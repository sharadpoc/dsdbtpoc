
-- {{config(
--   materialized='ephemeral'
-- )}}

-- WITH shc_handle_errors_update_dropped_records_ins AS (
-- SELECT
--             	rec
--         FROM
--             {{ ref('wri_error') }} 
-- )

-- SELECT * FROM shc_handle_errors_update_dropped_records_ins

