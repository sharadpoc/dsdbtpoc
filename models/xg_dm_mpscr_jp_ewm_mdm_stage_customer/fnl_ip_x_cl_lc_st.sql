
{{config(
  materialized='ephemeral'
)}}

WITH fnl_ip_x_cl_lc_st AS (
SELECT
                    		MOV_FLT_EWM_IP_X_CL_LC_ST_R AS MOV_FLT_EWM_IP_X_CL_LC_ST_R_,
                    	MOV_FLT_EWM_IP_X_CL_LC_ST_R.IP_ID AS MOV_FLT_EWM_IP_X_CL_LC_ST_R_IP_ID,
                    	MOV_FLT_EWM_IP_X_CL_LC_ST_R.EFF_DT AS MOV_FLT_EWM_IP_X_CL_LC_ST_R_EFF_DT,
                    	MOV_FLT_EWM_IP_X_CL_LC_ST_R AS MOV_FLT_EWM_IP_X_CL_LC_ST_R_,
                    	MOV_FLT_EWM_IP_X_CL_LC_ST_R.SRC_DL AS MOV_FLT_EWM_IP_X_CL_LC_ST_R_SRC_DL
                FROM
                    {{ ref('mov_flt_ewm_ip_x_cl_lc_st_r') }} AS MOV_FLT_EWM_IP_X_CL_LC_ST_R
                UNION DISTINCT
                SELECT
                    		MOV_FLT_EWM_IP_X_CL_R AS MOV_FLT_EWM_IP_X_CL_R_,
                    	MOV_FLT_EWM_IP_X_CL_R.IP_ID AS MOV_FLT_EWM_IP_X_CL_R_IP_ID,
                    	MOV_FLT_EWM_IP_X_CL_R.EFF_DT AS MOV_FLT_EWM_IP_X_CL_R_EFF_DT,
                    	MOV_FLT_EWM_IP_X_CL_R AS MOV_FLT_EWM_IP_X_CL_R_,
                    	MOV_FLT_EWM_IP_X_CL_R.SRC_DL AS MOV_FLT_EWM_IP_X_CL_R_SRC_DL
                FROM
                    {{ ref('mov_flt_ewm_ip_x_cl_r') }} AS MOV_FLT_EWM_IP_X_CL_R
            ) 
)

SELECT * FROM fnl_ip_x_cl_lc_st

