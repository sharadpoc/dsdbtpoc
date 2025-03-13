
{{config(
  materialized='ephemeral'
)}}

WITH mov_rdu_ewm_ip_x_cl_lc_st_r AS (
SELECT
            		mov_SRT_EWMP_IP_X_CL_LC_ST_R.IP_ID AS ip_id,
            	mov_SRT_EWMP_IP_X_CL_LC_ST_R.EFF_DT AS eff_dt,
            	mov_SRT_EWMP_IP_X_CL_LC_ST_R.SRC_DL AS src_dl
        FROM
            {{ ref('mov_srt_ewmp_ip_x_cl_lc_st_r') }} AS mov_SRT_EWMP_IP_X_CL_LC_ST_R 
)

SELECT * FROM mov_rdu_ewm_ip_x_cl_lc_st_r

