
{{config(
  materialized='ephemeral'
)}}

WITH mov_fnl_fcy_ar_tp AS (
SELECT
    REA_EWM_AR_LOAN_AR_V_SRC_DL,
    REA_EWM_AR_LOAN_AR_V_DATA_DT,
    REA_EWM_AR_LOAN_AR_V_VLD_FROM_TMS,
    REA_EWM_AR_LOAN_AR_V_MSTR_SRC_STM_CD,
    REA_EWM_AR_LOAN_AR_V_MSTR_SRC_STM_KEY,
    REA_EWM_AR_LOAN_AR_V_AR_ID,
    REA_EWM_AR_LOAN_AR_V_FCY_AR_TP
FROM
    {{ ref('fnl_fcy_ar_tp') }} AS FNL_FCY_AR_TP
)

SELECT * FROM mov_fnl_fcy_ar_tp

