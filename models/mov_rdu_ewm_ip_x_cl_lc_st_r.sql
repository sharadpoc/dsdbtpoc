
{{config(
  materialized='ephemeral'
)}}

WITH mov_rdu_ewm_ip_x_cl_lc_st_r AS (
SELECT
            		MOV_SRT_EWMP_IP_X_CL_LC_ST_R.IP_ID AS IP_ID,
            	MOV_SRT_EWMP_IP_X_CL_LC_ST_R.EFF_DT AS EFF_DT,
            	MOV_SRT_EWMP_IP_X_CL_LC_ST_R.SRC_DL AS SRC_DL
        FROM
            {{ ref('mov_srt_ewmp_ip_x_cl_lc_st_r') }} AS MOV_SRT_EWMP_IP_X_CL_LC_ST_R 
)

SELECT * FROM mov_rdu_ewm_ip_x_cl_lc_st_r

