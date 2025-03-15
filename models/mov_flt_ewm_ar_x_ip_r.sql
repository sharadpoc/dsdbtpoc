
{{config(
  materialized='ephemeral'
)}}

WITH mov_flt_ewm_ar_x_ip_r AS (
SELECT
            		REA_EWM_AR_X_IP_R.IP_ID AS IP_ID,
            	REA_EWM_AR_X_IP_R.SRC_DL AS SRC_DL,
            	REA_EWM_AR_X_IP_R.AR_X_IP_RLTNP_TP_CL_CD AS AR_X_IP_RLTNP_TP_CL_CD,
            	REA_EWM_AR_X_IP_R.RANK AS RANK
        FROM
            {{ ref('rea_ewm_ar_x_ip_r') }} AS REA_EWM_AR_X_IP_R 
)

SELECT * FROM mov_flt_ewm_ar_x_ip_r

