
{{config(
  materialized='ephemeral'
)}}

WITH rea_ewm_ip_x_cl_fnc_st_r AS (
SELECT
            	SRC_DL,
            	IP_ID,
            	IP_CL_CD
        FROM
            {{ ref('ora_read_ewm_ip_x_cl_fnc_st_r') }} AS ORA_READ_EWM_IP_X_CL_FNC_ST_R
        ORDER BY
            SRC_DL ASC,
            IP_ID ASC 
)

SELECT * FROM rea_ewm_ip_x_cl_fnc_st_r

