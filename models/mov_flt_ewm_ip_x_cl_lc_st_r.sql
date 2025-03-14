
{{config(
  materialized='ephemeral'
)}}

WITH mov_flt_ewm_ip_x_cl_lc_st_r AS (
SELECT
            		REA_EWM_IP_X_CL_LC_ST_R.IP_ID AS IP_ID,
            	REA_EWM_IP_X_CL_LC_ST_R.EFF_DT AS EFF_DT,
            	REA_EWM_IP_X_CL_LC_ST_R.SRC_DL AS SRC_DL
        FROM
            {{ ref('rea_ewm_ip_x_cl_lc_st_r') }} AS REA_EWM_IP_X_CL_LC_ST_R 
)

SELECT * FROM mov_flt_ewm_ip_x_cl_lc_st_r

