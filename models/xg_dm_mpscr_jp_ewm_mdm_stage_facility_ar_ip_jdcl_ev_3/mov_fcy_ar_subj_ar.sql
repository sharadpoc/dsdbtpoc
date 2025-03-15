
{{config(
  materialized='ephemeral'
)}}

WITH mov_fcy_ar_subj_ar AS (
SELECT
            		MOV_SRT_FCY_AR_SRC_DL AS SRC_DL,
            	MOV_SRT_FCY_AR_AR_ID AS AR_ID,
            	MOV_SRT_FCY_AR_VLD_FROM_TMS AS VLD_FROM_TMS,
            	MOV_SRT_FCY_AR_VLD_TO_TMS AS VLD_TO_TMS,
            	MOV_SRT_FCY_AR_MSTR_SRC_STM_CD AS MSTR_SRC_STM_CD,
            	MOV_SRT_FCY_AR_MSTR_SRC_STM_KEY AS MSTR_SRC_STM_KEY,
            	MOV_SRT_FCY_AR_FCY_RK AS FCY_RK,
            	MOV_SRT_FCY_AR_DATA_DT AS DATA_DT,
            	MOV_SRT_AR_RLTNP_OBJ_AR_ID AS OBJ_AR_ID,
            	MOV_SRT_AR_RLTNP_SUBJ_AR_ID AS SUBJ_AR_ID,
            	MOV_SRT_AR_RLTNP_AR_X_AR_RLTNP_TP_CL_CD AS AR_X_AR_RLTNP_TP_CL_CD
        FROM
            {{ ref('jno_fcy_ar_subj_ar') }} AS JNO_FCY_AR_SUBJ_AR 
)

SELECT * FROM mov_fcy_ar_subj_ar

