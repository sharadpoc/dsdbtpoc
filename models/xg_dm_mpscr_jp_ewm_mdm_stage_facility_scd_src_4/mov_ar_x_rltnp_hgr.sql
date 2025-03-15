
{{config(
  materialized='ephemeral'
)}}

WITH mov_ar_x_rltnp_hgr AS (
SELECT
            		REA_EWM_AR_X_AR_R.EFF_DT AS SPSDG_FCY_DT,
            	REA_EWM_AR_X_AR_R.SRC_DL AS SRC_DL,
            	REA_EWM_AR_X_AR_R.OBJ_AR_ID AS OBJ_AR_ID,
            	REA_EWM_AR_X_AR_R.SUBJ_AR_ID AS SUBJ_AR_ID
        FROM
            {{ ref('rea_ewm_ar_x_ar_r') }} AS REA_EWM_AR_X_AR_R 
)

SELECT * FROM mov_ar_x_rltnp_hgr

