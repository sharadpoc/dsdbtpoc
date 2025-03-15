
{{config(
  materialized='ephemeral'
)}}

WITH wri_ar_mdm_stage_ar_fcy AS (
SELECT
            		MOV_XFM_FCY_AR_SRC.FCY_RK AS FCY_RK,
            	MOV_XFM_FCY_AR_SRC.SRC_DL AS SRC_DL,
            	MOV_XFM_FCY_AR_SRC.AR_ID AS AR_ID,
            	MOV_XFM_FCY_AR_SRC.MSTR_SRC_STM_CD AS MSTR_SRC_STM_CD,
            	MOV_XFM_FCY_AR_SRC.MSTR_SRC_STM_KEY AS MSTR_SRC_STM_KEY,
            	MOV_XFM_FCY_AR_SRC.VLD_FROM_TMS AS VLD_FROM_TMS,
            	MOV_XFM_FCY_AR_SRC.VLD_TO_TMS AS VLD_TO_TMS,
            	MOV_XFM_FCY_AR_SRC.DATA_DT AS DATA_DT,
            	MOV_XFM_FCY_AR_SRC.SYS_INRT_TMS AS SYS_INRT_TMS
        FROM
            {{ ref('mov_xfm_fcy_ar_src') }} AS MOV_XFM_FCY_AR_SRC 
)

SELECT * FROM wri_ar_mdm_stage_ar_fcy

