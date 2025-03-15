
{{config(
  materialized='ephemeral'
)}}

WITH rea_ewm_mps_ar AS (
SELECT
            	SRC_DL,
            	AR_ID,
            	VLD_FROM_TMS
        FROM
            {{ ref('ora_read_ewm_ar') }} AS ORA_READ_EWM_AR 
)

SELECT * FROM rea_ewm_mps_ar

