
{{config(
  materialized='ephemeral'
)}}

WITH mov_srt_fcy_ar_tp AS (
SELECT
            		REA_MDM_STAGE_FCY_AR_TP.OBJ_AR_ID AS OBJ_AR_ID,
            	REA_MDM_STAGE_FCY_AR_TP.SRC_DL AS SRC_DL,
            	REA_MDM_STAGE_FCY_AR_TP.LMTG_AR_MSTR_SRC_STM_KEY AS LMTG_AR_MSTR_SRC_STM_KEY,
            	REA_MDM_STAGE_FCY_AR_TP.FCY_AR_TP AS FCY_AR_TP
        FROM
            {{ ref('rea_mdm_stage_fcy_ar_tp') }} AS REA_MDM_STAGE_FCY_AR_TP
        ORDER BY
            SRC_DL ASC,
            OBJ_AR_ID ASC 
)

SELECT * FROM mov_srt_fcy_ar_tp

