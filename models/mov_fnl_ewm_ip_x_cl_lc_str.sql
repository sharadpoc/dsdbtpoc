
{{config(
  materialized='ephemeral'
)}}

WITH mov_fnl_ewm_ip_x_cl_lc_str AS (
SELECT
            		mov_FLT_EWM_IP_X_CL_LC_ST_R_IP_ID AS ip_id,
            	mov_FLT_EWM_IP_X_CL_LC_ST_R_EFF_DT AS eff_dt,
            	SRC_DL AS src_dl
        FROM
            {{ ref('fnl_ip_x_cl_lc_st') }} AS FNL_IP_X_CL_LC_ST 
)

SELECT * FROM mov_fnl_ewm_ip_x_cl_lc_str

