
{{config(
  materialized='ephemeral'
)}}

WITH mov_srt_fcy_ar_obj_ar AS (
SELECT
            		MOV_FCY_AR_SUBJ_AR.SRC_DL AS SRC_DL,
            	MOV_FCY_AR_SUBJ_AR.AR_ID AS AR_ID,
            	MOV_FCY_AR_SUBJ_AR.VLD_FROM_TMS AS VLD_FROM_TMS,
            	MOV_FCY_AR_SUBJ_AR.VLD_TO_TMS AS VLD_TO_TMS,
            	MOV_FCY_AR_SUBJ_AR.MSTR_SRC_STM_CD AS MSTR_SRC_STM_CD,
            	MOV_FCY_AR_SUBJ_AR.MSTR_SRC_STM_KEY AS MSTR_SRC_STM_KEY,
            	MOV_FCY_AR_SUBJ_AR.FCY_RK AS FCY_RK,
            	MOV_FCY_AR_SUBJ_AR.DATA_DT AS DATA_DT,
            	MOV_FCY_AR_SUBJ_AR.OBJ_AR_ID AS OBJ_AR_ID,
            	MOV_FCY_AR_SUBJ_AR.SUBJ_AR_ID AS SUBJ_AR_ID,
            	MOV_FCY_AR_SUBJ_AR.AR_X_AR_RLTNP_TP_CL_CD AS AR_X_AR_RLTNP_TP_CL_CD
        FROM
            {{ ref('mov_fcy_ar_subj_ar') }} AS MOV_FCY_AR_SUBJ_AR
        ORDER BY
            SRC_DL ASC,
            OBJ_AR_ID ASC 
)

SELECT * FROM mov_srt_fcy_ar_obj_ar

