
{{config(
  materialized='ephemeral'
)}}

WITH mov_srt_ewmp_ip_x_cl_lc_st_r AS (
SELECT
            		MOV_FNL_EWM_IP_X_CL_LC_STR.IP_ID AS IP_ID,
            	MOV_FNL_EWM_IP_X_CL_LC_STR.EFF_DT AS EFF_DT,
            	MOV_FNL_EWM_IP_X_CL_LC_STR.SRC_DL AS SRC_DL
        FROM
            {{ ref('mov_fnl_ewm_ip_x_cl_lc_str') }} AS MOV_FNL_EWM_IP_X_CL_LC_STR
        ORDER BY
            IP_ID ASC,
            SRC_DL ASC 
)

SELECT * FROM mov_srt_ewmp_ip_x_cl_lc_st_r

