
{{config(
  materialized='ephemeral'
)}}

WITH mov_srt_ip_fnc_st AS (
SELECT
            		REA_EWM_IP_X_CL_FNC_ST_R.SRC_DL AS SRC_DL,
            	REA_EWM_IP_X_CL_FNC_ST_R.IP_ID AS IP_ID,
            	REA_EWM_IP_X_CL_FNC_ST_R.IP_CL_CD AS IP_CL_CD
        FROM
            {{ ref('rea_ewm_ip_x_cl_fnc_st_r') }} AS REA_EWM_IP_X_CL_FNC_ST_R
        ORDER BY
            SRC_DL ASC,
            IP_ID ASC 
)

SELECT * FROM mov_srt_ip_fnc_st

