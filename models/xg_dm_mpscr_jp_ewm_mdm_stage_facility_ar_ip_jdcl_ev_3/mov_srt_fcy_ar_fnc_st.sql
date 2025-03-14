
{{config(
  materialized='ephemeral'
)}}

WITH mov_srt_fcy_ar_fnc_st AS (
SELECT
            		MOV_FCY_AR_FNC_ST.AR_DEFAULT_IND AS AR_DEFAULT_IND,
            	MOV_FCY_AR_FNC_ST.SRC_DL AS SRC_DL,
            	MOV_FCY_AR_FNC_ST.AR_ID AS AR_ID,
            	MOV_FCY_AR_FNC_ST.VLD_FROM_TMS AS VLD_FROM_TMS,
            	MOV_FCY_AR_FNC_ST.VLD_TO_TMS AS VLD_TO_TMS,
            	MOV_FCY_AR_FNC_ST.MSTR_SRC_STM_CD AS MSTR_SRC_STM_CD,
            	MOV_FCY_AR_FNC_ST.MSTR_SRC_STM_KEY AS MSTR_SRC_STM_KEY,
            	MOV_FCY_AR_FNC_ST.FCY_RK AS FCY_RK,
            	MOV_FCY_AR_FNC_ST.DATA_DT AS DATA_DT,
            	MOV_FCY_AR_FNC_ST.AR_X_AR_RLTNP_TP_CL_CD AS AR_X_AR_RLTNP_TP_CL_CD,
            	MOV_FCY_AR_FNC_ST.LMTG_AR_MSTR_SRC_STM_KEY AS LMTG_AR_MSTR_SRC_STM_KEY,
            	MOV_FCY_AR_FNC_ST.FCY_AR_TP AS FCY_AR_TP,
            	MOV_FCY_AR_FNC_ST.AR_CL_CD AS AR_CL_CD
        FROM
            {{ ref('mov_fcy_ar_fnc_st') }} AS MOV_FCY_AR_FNC_ST
        ORDER BY
            SRC_DL ASC,
            AR_ID ASC 
)

SELECT * FROM mov_srt_fcy_ar_fnc_st

