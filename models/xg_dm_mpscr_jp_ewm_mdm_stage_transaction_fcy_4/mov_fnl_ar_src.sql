
{{config(
  materialized='ephemeral'
)}}

WITH mov_fnl_ar_src AS (
SELECT
            		REA_EWM_AR_FCY_AR_DRV_V_FCY_RKREA_EWM_AR_FCY_AR_V_FCY_RK AS FCY_RK,
            	REA_EWM_AR_FCY_AR_DRV_V_DATA_DTREA_EWM_AR_FCY_AR_V_DATA_DT AS DATA_DT,
            	SRC_DL AS SRC_DL,
            	AR_ID AS AR_ID,
            	VLD_FROM_TMS AS VLD_FROM_TMS
        FROM
            {{ ref('fnl_ar_src') }} AS FNL_AR_SRC 
)

SELECT * FROM mov_fnl_ar_src

