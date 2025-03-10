
{{config(
  materialized='ephemeral'
)}}

WITH shc_handle_errors_update_dropped_records_upd AS (
SELECT
            		wri_Error.rec AS wri_error_rec,
            	wri_Error.rec AS wri_error_rec,
            	wri_Error.rec AS wri_error_rec,
            	wri_Error.rec AS wri_error_rec
        FROM
            (
                    SELECT
                         *
                    FROM
                        {{ ref('wri_error') }} AS wri_Error
                ) 
)

SELECT * FROM shc_handle_errors_update_dropped_records_upd

