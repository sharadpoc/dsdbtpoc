
{{config(
  materialized='ephemeral'
)}}

WITH mov_fcy_ar_fnc_st AS (
SELECT
            		MOV_XFM_AR_CL_CD_AR_DEFAULT_IND AS AR_DEFAULT_IND,
            	MOV_SRT_FCY_AR_ID_SRC_DL AS SRC_DL,
            	MOV_SRT_FCY_AR_ID_AR_ID AS AR_ID,
            	MOV_SRT_FCY_AR_ID_VLD_FROM_TMS AS VLD_FROM_TMS,
            	MOV_SRT_FCY_AR_ID_VLD_TO_TMS AS VLD_TO_TMS,
            	MOV_SRT_FCY_AR_ID_MSTR_SRC_STM_CD AS MSTR_SRC_STM_CD,
            	MOV_SRT_FCY_AR_ID_MSTR_SRC_STM_KEY AS MSTR_SRC_STM_KEY,
            	MOV_SRT_FCY_AR_ID_FCY_RK AS FCY_RK,
            	MOV_SRT_FCY_AR_ID_DATA_DT AS DATA_DT,
            	MOV_SRT_FCY_AR_ID_AR_X_AR_RLTNP_TP_CL_CD AS AR_X_AR_RLTNP_TP_CL_CD,
            	MOV_SRT_FCY_AR_ID_LMTG_AR_MSTR_SRC_STM_KEY AS LMTG_AR_MSTR_SRC_STM_KEY,
            	MOV_SRT_FCY_AR_ID_FCY_AR_TP AS FCY_AR_TP,
            	MOV_XFM_AR_CL_CD_AR_CL_CD AS AR_CL_CD
        FROM
            {{ ref('jno_cr_obl_deflt_2') }} AS JNO_CR_OBL_DEFLT_2 
)

SELECT * FROM mov_fcy_ar_fnc_st

