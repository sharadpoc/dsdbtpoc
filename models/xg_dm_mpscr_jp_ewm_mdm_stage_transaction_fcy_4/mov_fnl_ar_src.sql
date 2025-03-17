
{{config(
  materialized='ephemeral'
)}}

WITH mov_fnl_ar_src AS (
SELECT
    rea_EWM_AR_FCY_AR_V_FCY_RK AS FCY_RK,
rea_EWM_AR_FCY_AR_V_SRC_DL AS SRC_DL,
rea_EWM_AR_FCY_AR_V_AR_ID AS AR_ID,
rea_EWM_AR_FCY_AR_V_VLD_FROM_TMS AS VLD_FROM_TMS,
rea_EWM_AR_FCY_AR_V_DATA_DT AS DATA_DT
FROM
    {{ ref('fnl_ar_src') }} AS FNL_AR_SRC
)

SELECT * FROM mov_fnl_ar_src

