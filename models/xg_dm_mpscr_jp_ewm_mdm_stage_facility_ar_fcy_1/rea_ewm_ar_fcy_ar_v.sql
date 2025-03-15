
{{config(
  materialized='ephemeral'
)}}

WITH rea_ewm_ar_fcy_ar_v AS (
SELECT
            	FCY_RK,
            	SRC_DL,
            	AR_ID,
            	MSTR_SRC_STM_CD,
            	MSTR_SRC_STM_KEY,
            	VLD_FROM_TMS,
            	VLD_TO_TMS,
            	DATA_DT
        FROM
            {{ ref('ora_read_ewm_ar_fcy_ar_v') }} AS ORA_READ_EWM_AR_FCY_AR_V 
)

SELECT * FROM rea_ewm_ar_fcy_ar_v

