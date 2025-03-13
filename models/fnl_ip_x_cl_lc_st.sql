
{{config(
  materialized='ephemeral'
)}}

WITH fnl_ip_x_cl_lc_st AS (
SELECT
            		mov_FLT_EWM_IP_X_CL_LC_ST_R.IP_ID AS mov_flt_ewm_ip_x_cl_lc_st_r_ip_id,
            	mov_FLT_EWM_IP_X_CL_LC_ST_R.EFF_DT AS mov_flt_ewm_ip_x_cl_lc_st_r_eff_dt,
            	mov_FLT_EWM_IP_X_CL_LC_ST_R.SRC_DL AS mov_flt_ewm_ip_x_cl_lc_st_r_src_dl,
            	mov_FLT_EWM_IP_X_CL_R.IP_ID AS mov_flt_ewm_ip_x_cl_r_ip_id,
            	mov_FLT_EWM_IP_X_CL_R.EFF_DT AS mov_flt_ewm_ip_x_cl_r_eff_dt,
            	mov_FLT_EWM_IP_X_CL_R.SRC_DL AS mov_flt_ewm_ip_x_cl_r_src_dl
        FROM
            (
                    SELECT
                         *
                    FROM
                        {{ ref('mov_flt_ewm_ip_x_cl_r') }} AS mov_FLT_EWM_IP_X_CL_R
                    UNION DISTINCT
                    SELECT
                         *
                    FROM
                        {{ ref('mov_flt_ewm_ip_x_cl_lc_st_r') }} AS mov_FLT_EWM_IP_X_CL_LC_ST_R
                ) 
)

SELECT * FROM fnl_ip_x_cl_lc_st

