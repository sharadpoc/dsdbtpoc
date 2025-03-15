
{{config(
  materialized='ephemeral'
)}}

WITH mov_srt_fcy_ar_id AS (
SELECT
            		MOV_FCY_AR.SRC_DL AS SRC_DL,
            	MOV_FCY_AR.AR_ID AS AR_ID,
            	MOV_FCY_AR.VLD_FROM_TMS AS VLD_FROM_TMS,
            	MOV_FCY_AR.VLD_TO_TMS AS VLD_TO_TMS,
            	MOV_FCY_AR.MSTR_SRC_STM_CD AS MSTR_SRC_STM_CD,
            	MOV_FCY_AR.MSTR_SRC_STM_KEY AS MSTR_SRC_STM_KEY,
            	MOV_FCY_AR.FCY_RK AS FCY_RK,
            	MOV_FCY_AR.DATA_DT AS DATA_DT,
            	MOV_FCY_AR.AR_X_AR_RLTNP_TP_CL_CD AS AR_X_AR_RLTNP_TP_CL_CD,
            	MOV_FCY_AR.LMTG_AR_MSTR_SRC_STM_KEY AS LMTG_AR_MSTR_SRC_STM_KEY,
            	MOV_FCY_AR.FCY_AR_TP AS FCY_AR_TP
        FROM
            {{ ref('mov_fcy_ar') }} AS MOV_FCY_AR
        ORDER BY
            SRC_DL ASC,
            AR_ID ASC 
)

SELECT * FROM mov_srt_fcy_ar_id

