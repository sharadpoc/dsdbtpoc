
{{config(
  materialized='ephemeral'
)}}

WITH wri_error AS (
SELECT
            		PEEK() AS REC
        FROM
            {{ ref('rej_error') }} AS REJ_ERROR 
)

SELECT * FROM wri_error

