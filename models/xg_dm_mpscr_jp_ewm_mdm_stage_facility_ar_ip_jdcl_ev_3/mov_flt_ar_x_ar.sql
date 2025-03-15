
{{config(
  materialized='ephemeral'
)}}

WITH mov_flt_ar_x_ar AS (
SELECT
            		REA_EWM_AR_X_AR_R.SRC_DL AS SRC_DL,
            	REA_EWM_AR_X_AR_R.OBJ_AR_ID AS OBJ_AR_ID,
            	REA_EWM_AR_X_AR_R.SUBJ_AR_ID AS SUBJ_AR_ID,
            	REA_EWM_AR_X_AR_R.AR_X_AR_RLTNP_TP_CL_CD AS AR_X_AR_RLTNP_TP_CL_CD
        FROM
            {{ ref('rea_ewm_ar_x_ar_r_m1') }} AS REA_EWM_AR_X_AR_R 
)

SELECT * FROM mov_flt_ar_x_ar

