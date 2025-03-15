
{{config(
  materialized='ephemeral'
)}}

WITH mov_srt_fcy_ar AS (
SELECT
            		REA_STAGE_FCY_AR.SRC_DL AS SRC_DL,
            	REA_STAGE_FCY_AR.AR_ID AS AR_ID,
            	REA_STAGE_FCY_AR.VLD_FROM_TMS AS VLD_FROM_TMS,
            	REA_STAGE_FCY_AR.VLD_TO_TMS AS VLD_TO_TMS,
            	REA_STAGE_FCY_AR.MSTR_SRC_STM_CD AS MSTR_SRC_STM_CD,
            	REA_STAGE_FCY_AR.MSTR_SRC_STM_KEY AS MSTR_SRC_STM_KEY,
            	REA_STAGE_FCY_AR.FCY_RK AS FCY_RK,
            	REA_STAGE_FCY_AR.DATA_DT AS DATA_DT
        FROM
            {{ ref('rea_stage_fcy_ar') }} AS REA_STAGE_FCY_AR
        ORDER BY
            SRC_DL ASC,
            AR_ID ASC 
)

SELECT * FROM mov_srt_fcy_ar

