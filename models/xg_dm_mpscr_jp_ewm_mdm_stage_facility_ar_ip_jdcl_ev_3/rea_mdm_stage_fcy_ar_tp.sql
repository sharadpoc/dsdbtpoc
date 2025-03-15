
{{config(
  materialized='ephemeral'
)}}

WITH rea_mdm_stage_fcy_ar_tp AS (
SELECT
            	SRC_DL,
            	LMTG_AR_MSTR_SRC_STM_KEY,
            	FCY_AR_TP,
            	OBJ_AR_ID
        FROM
            {{ ref('ora_read_ewm_mdm_stage_fcy_ar_tp') }} AS ORA_READ_EWM_MDM_STAGE_FCY_AR_TP
        ORDER BY
            SRC_DL ASC,
            OBJ_AR_ID ASC 
)

SELECT * FROM rea_mdm_stage_fcy_ar_tp

