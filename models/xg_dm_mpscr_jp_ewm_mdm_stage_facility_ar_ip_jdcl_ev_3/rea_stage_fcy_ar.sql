
{{config(
  materialized='ephemeral'
)}}

WITH rea_stage_fcy_ar AS (
SELECT
            	SRC_DL,
            	AR_ID,
            	VLD_FROM_TMS,
            	VLD_TO_TMS,
            	MSTR_SRC_STM_CD,
            	MSTR_SRC_STM_KEY,
            	FCY_RK,
            	DATA_DT
        FROM
            {{ ref('ora_read_ewm_mdm_stage_fcy_ar') }} AS ORA_READ_EWM_MDM_STAGE_FCY_AR
        ORDER BY
            SRC_DL ASC,
            AR_ID ASC 
)

SELECT * FROM rea_stage_fcy_ar

