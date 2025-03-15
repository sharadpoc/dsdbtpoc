
{{config(
  materialized='ephemeral'
)}}

WITH mov_srt_ewm_ar_x_ar_r AS (
SELECT
            		REA_EWM_AR_X_AR_R.OBJ_AR_ID AS OBJ_AR_ID,
            	REA_EWM_AR_X_AR_R.SRC_DL AS SRC_DL,
            	REA_EWM_AR_X_AR_R.SUBJ_AR_ID AS SUBJ_AR_ID
        FROM
            {{ ref('rea_ewm_ar_x_ar_r') }} AS REA_EWM_AR_X_AR_R
        ORDER BY
            SRC_DL ASC,
            OBJ_AR_ID ASC 
)

SELECT * FROM mov_srt_ewm_ar_x_ar_r

