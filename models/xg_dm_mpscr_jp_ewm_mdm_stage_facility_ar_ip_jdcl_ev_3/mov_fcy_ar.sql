
{{config(
  materialized='ephemeral'
)}}

WITH mov_fcy_ar AS (
SELECT
            		MOV_SRT_FCY_AR_OBJ_AR_SRC_DL AS SRC_DL,
            	MOV_SRT_FCY_AR_OBJ_AR_AR_ID AS AR_ID,
            	MOV_SRT_FCY_AR_OBJ_AR_VLD_FROM_TMS AS VLD_FROM_TMS,
            	MOV_SRT_FCY_AR_OBJ_AR_VLD_TO_TMS AS VLD_TO_TMS,
            	MOV_SRT_FCY_AR_OBJ_AR_MSTR_SRC_STM_CD AS MSTR_SRC_STM_CD,
            	MOV_SRT_FCY_AR_OBJ_AR_MSTR_SRC_STM_KEY AS MSTR_SRC_STM_KEY,
            	MOV_SRT_FCY_AR_OBJ_AR_FCY_RK AS FCY_RK,
            	MOV_SRT_FCY_AR_OBJ_AR_DATA_DT AS DATA_DT,
            	MOV_SRT_FCY_AR_OBJ_AR_AR_X_AR_RLTNP_TP_CL_CD AS AR_X_AR_RLTNP_TP_CL_CD,
            	MOV_SRT_FCY_AR_TP_LMTG_AR_MSTR_SRC_STM_KEY AS LMTG_AR_MSTR_SRC_STM_KEY,
            	MOV_SRT_FCY_AR_TP_FCY_AR_TP AS FCY_AR_TP
        FROM
            {{ ref('jno_fcy_ar_fcy_ar_tp') }} AS JNO_FCY_AR_FCY_AR_TP 
)

SELECT * FROM mov_fcy_ar

