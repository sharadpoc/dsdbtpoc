
{{config(
  materialized='ephemeral'
)}}

WITH mov_fnl_ewm_ip_x_cl_lc_str AS (
SELECT
            		MOV_FLT_EWM_IP_X_CL_R_IP_ID AS IP_ID,
            	MOV_FLT_EWM_IP_X_CL_R_EFF_DT AS EFF_DT,
            	MOV_FLT_EWM_IP_X_CL_R_SRC_DL AS SRC_DL
        FROM
            {{ ref('fnl_ip_x_cl_lc_st') }} AS FNL_IP_X_CL_LC_ST 
)

SELECT * FROM mov_fnl_ewm_ip_x_cl_lc_str

