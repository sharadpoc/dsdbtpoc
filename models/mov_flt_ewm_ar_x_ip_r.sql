
{{config(
  materialized='ephemeral'
)}}

WITH mov_flt_ewm_ar_x_ip_r AS (
SELECT
            		rea_EWM_AR_X_IP_R.IP_ID AS ip_id,
            	rea_EWM_AR_X_IP_R.SRC_DL AS src_dl,
            	rea_EWM_AR_X_IP_R.AR_X_IP_RLTNP_TP_CL_CD AS ar_x_ip_rltnp_tp_cl_cd,
            	rea_EWM_AR_X_IP_R.RANK AS RANK
        FROM
            {{ ref('rea_ewm_ar_x_ip_r') }} AS rea_EWM_AR_X_IP_R 
)

SELECT * FROM mov_flt_ewm_ar_x_ip_r

