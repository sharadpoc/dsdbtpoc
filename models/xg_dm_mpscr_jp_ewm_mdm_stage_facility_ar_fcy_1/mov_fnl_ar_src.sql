
{{config(
  materialized='ephemeral'
)}}

WITH mov_fnl_ar_src AS (
SELECT
    REA_EWM_AR_FCY_AR_V_FCY_RK,
    REA_EWM_AR_FCY_AR_V_SRC_DL,
    REA_EWM_AR_FCY_AR_V_AR_ID,
    REA_EWM_AR_FCY_AR_V_MSTR_SRC_STM_CD,
    REA_EWM_AR_FCY_AR_V_MSTR_SRC_STM_KEY,
    REA_EWM_AR_FCY_AR_V_VLD_FROM_TMS,
    REA_EWM_AR_FCY_AR_V_VLD_TO_TMS,
    REA_EWM_AR_FCY_AR_V_DATA_DT
FROM
    {{ ref('fnl_ar_src') }} AS FNL_AR_SRC
)

SELECT * FROM mov_fnl_ar_src

