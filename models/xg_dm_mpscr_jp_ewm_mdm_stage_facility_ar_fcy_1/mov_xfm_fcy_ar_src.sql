
{{config(
  materialized='ephemeral'
)}}

WITH mov_xfm_fcy_ar_src AS (
SELECT
            		MOV_SRT_FNL_FCY.FCY_RK AS FCY_RK,
            	MOV_SRT_FNL_FCY.DATA_DT AS DATA_DT,
            	MOV_SRT_FNL_FCY.SRC_DL AS SRC_DL,
            	MOV_SRT_FNL_FCY.AR_ID AS AR_ID,
            	MOV_SRT_FNL_FCY.MSTR_SRC_STM_CD AS MSTR_SRC_STM_CD,
            	MOV_SRT_FNL_FCY.MSTR_SRC_STM_KEY AS MSTR_SRC_STM_KEY,
            	MOV_SRT_FNL_FCY.VLD_FROM_TMS AS VLD_FROM_TMS,
            	MOV_SRT_FNL_FCY.VLD_TO_TMS AS VLD_TO_TMS
        FROM
            {{ ref('mov_srt_fnl_fcy') }} AS MOV_SRT_FNL_FCY 
)

SELECT * FROM mov_xfm_fcy_ar_src

