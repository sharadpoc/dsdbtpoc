
{{config(
  materialized='ephemeral'
)}}

WITH mov_flt_rank AS (
SELECT
            		REA_EWM_AR_X_IP_R.SRC_DL AS SRC_DL,
            	REA_EWM_AR_X_IP_R.AR_ID AS AR_ID,
            	REA_EWM_AR_X_IP_R.IP_ID AS IP_ID
        FROM
            {{ ref('rea_ewm_ar_x_ip_r_m1') }} AS REA_EWM_AR_X_IP_R 
)

SELECT * FROM mov_flt_rank

