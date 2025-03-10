
{{config(
  materialized='ephemeral'
)}}

WITH rea_ewm_ar_fcy_ar_v AS (
SELECT
            	SRC_DL,
            	AR_ID,
            	FCY_RK
        FROM
            {{ ref('ora_read_ewm_ar_fcy_ar_v') }} AS ORA_read_EWM_AR_FCY_AR_V 
)

SELECT * FROM rea_ewm_ar_fcy_ar_v

