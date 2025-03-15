
{{config(
  materialized='ephemeral'
)}}

WITH rea_ewm_ar_x_ar_r_m1 AS (
SELECT
            	SRC_DL,
            	OBJ_AR_ID,
            	SUBJ_AR_ID,
            	AR_X_AR_RLTNP_TP_CL_CD
        FROM
            {{ ref('ora_read_ewm_ar_x_ar_r_m1') }} AS ORA_READ_EWM_AR_X_AR_R
        WHERE
            AR_X_AR_RLTNP_TP_CL_CD='LMTG_AR' 
)

SELECT * FROM rea_ewm_ar_x_ar_r_m1

