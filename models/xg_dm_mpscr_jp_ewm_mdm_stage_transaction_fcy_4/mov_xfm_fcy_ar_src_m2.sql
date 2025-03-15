
{{config(
  materialized='ephemeral'
)}}

WITH mov_xfm_fcy_ar_src_m2 AS (
SELECT
            		MOV_SRT_FNL_FCY.FCY_RK AS FCY_RK,
            	MOV_SRT_FNL_FCY.DATA_DT AS DATA_DT,
            	NULL AS SYS_INRT_TMS,
            	MOV_SRT_FNL_FCY.SRC_DL AS SRC_DL,
            	MOV_SRT_FNL_FCY.AR_ID AS AR_ID,
            	MOV_SRT_FNL_FCY.VLD_FROM_TMS AS VLD_FROM_TMS
        FROM
            {{ ref('mov_srt_fnl_fcy') }} AS MOV_SRT_FNL_FCY 
)

SELECT * FROM mov_xfm_fcy_ar_src_m2

