
{{config(
  materialized='ephemeral'
)}}

WITH mov_xfm_fcy_ar_tp AS (
SELECT
            		MOV_SRT_FNL_FCY_AR_TP.AR_ID AS AR_ID,
            	MOV_SRT_FNL_FCY_AR_TP.FCY_AR_TP AS FCY_AR_TP,
            	MOV_SRT_FNL_FCY_AR_TP.SRC_DL AS SRC_DL,
            	MOV_SRT_FNL_FCY_AR_TP.DATA_DT AS DATA_DT,
            	MOV_SRT_FNL_FCY_AR_TP.VLD_FROM_TMS AS VLD_FROM_TMS,
            	MOV_SRT_FNL_FCY_AR_TP.MSTR_SRC_STM_CD AS MSTR_SRC_STM_CD,
            	MOV_SRT_FNL_FCY_AR_TP.MSTR_SRC_STM_KEY AS MSTR_SRC_STM_KEY
        FROM
            {{ ref('mov_srt_fnl_fcy_ar_tp') }} AS MOV_SRT_FNL_FCY_AR_TP 
)

SELECT * FROM mov_xfm_fcy_ar_tp

