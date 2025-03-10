
{{config(
  materialized='ephemeral'
)}}

WITH wri_error AS (
SELECT
            		PEEK() AS rec
        FROM
            {{ ref('pek_write_update_error_dropped_records_upd') }} AS PEK_Write_Update_Error_dropped_records_Upd 
)

SELECT * FROM wri_error

