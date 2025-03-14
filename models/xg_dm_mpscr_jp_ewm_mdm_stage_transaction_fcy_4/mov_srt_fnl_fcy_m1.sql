
{{config(
  materialized='ephemeral'
)}}

WITH mov_srt_fnl_fcy_m1 AS (
SELECT
            		MOV_FNL_AR_SRC.FCY_RK AS FCY_RK,
            	MOV_FNL_AR_SRC.DATA_DT AS DATA_DT,
            	MOV_FNL_AR_SRC.SRC_DL AS SRC_DL,
            	MOV_FNL_AR_SRC.AR_ID AS AR_ID,
            	MOV_FNL_AR_SRC.VLD_FROM_TMS AS VLD_FROM_TMS
        FROM
            {{ ref('mov_fnl_ar_src') }} AS MOV_FNL_AR_SRC
        ORDER BY
            SRC_DL ASC,
            AR_ID ASC,
            FCY_RK ASC,
            VLD_FROM_TMS ASC 
)

SELECT * FROM mov_srt_fnl_fcy_m1

