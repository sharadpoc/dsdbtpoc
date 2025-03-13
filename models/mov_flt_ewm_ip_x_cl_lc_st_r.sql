
{{config(
  materialized='ephemeral'
)}}

WITH mov_flt_ewm_ip_x_cl_lc_st_r AS (
SELECT
            		rea_EWM_IP_X_CL_LC_ST_R.IP_ID AS ip_id,
            	rea_EWM_IP_X_CL_LC_ST_R.EFF_DT AS eff_dt,
            	rea_EWM_IP_X_CL_LC_ST_R.SRC_DL AS src_dl
        FROM
            {{ ref('rea_ewm_ip_x_cl_lc_st_r') }} AS rea_EWM_IP_X_CL_LC_ST_R 
)

SELECT * FROM mov_flt_ewm_ip_x_cl_lc_st_r

