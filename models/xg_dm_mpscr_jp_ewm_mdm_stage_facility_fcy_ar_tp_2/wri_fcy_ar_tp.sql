
{{config(
  materialized='ephemeral'
)}}

WITH wri_fcy_ar_tp AS (
SELECT
            		MOV_XFM_FCY_AR_TP.SRC_DL AS SRC_DL,
            	MOV_XFM_FCY_AR_TP.DATA_DT AS DATA_DT,
            	MOV_XFM_FCY_AR_TP.VLD_FROM_TMS AS VLD_FROM_TMS,
            	MOV_XFM_FCY_AR_TP.MSTR_SRC_STM_CD AS MSTR_SRC_STM_CD,
            	MOV_XFM_FCY_AR_TP.MSTR_SRC_STM_KEY AS MSTR_SRC_STM_KEY,
            	MOV_XFM_FCY_AR_TP.AR_ID AS AR_ID,
            	MOV_XFM_FCY_AR_TP.FCY_AR_TP AS FCY_AR_TP,
            	MOV_XFM_FCY_AR_TP.SYS_INRT_TMS AS SYS_INRT_TMS
        FROM
            {{ ref('mov_xfm_fcy_ar_tp') }} AS MOV_XFM_FCY_AR_TP 
)

SELECT * FROM wri_fcy_ar_tp

