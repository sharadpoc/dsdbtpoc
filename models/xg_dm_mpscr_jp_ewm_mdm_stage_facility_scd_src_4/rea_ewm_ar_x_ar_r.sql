
{{config(
  materialized='ephemeral'
)}}

WITH rea_ewm_ar_x_ar_r AS (
SELECT
            	SRC_DL,
            	OBJ_AR_ID,
            	SUBJ_AR_ID,
            	EFF_DT,
            	AR_X_AR_RLTNP_TP_CL_CD
        FROM
            {{ ref('ora_read_ewm_ar_x_ar_r') }} AS ORA_READ_EWM_AR_X_AR_R
        WHERE
            AR_X_AR_RLTNP_TP_CL_CD='SPSDG_AR' 
)

SELECT * FROM rea_ewm_ar_x_ar_r

