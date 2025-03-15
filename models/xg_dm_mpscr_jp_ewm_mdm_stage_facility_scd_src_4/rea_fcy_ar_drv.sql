
{{config(
  materialized='ephemeral'
)}}

WITH rea_fcy_ar_drv AS (
SELECT
            	SRC_DL,
            	AR_ID,
            	FCY_RK
        FROM
            {{ ref('ora_read_ewm_mdm_stage_fcy_ar') }} AS ORA_READ_EWM_MDM_STAGE_FCY_AR 
)

SELECT * FROM rea_fcy_ar_drv

