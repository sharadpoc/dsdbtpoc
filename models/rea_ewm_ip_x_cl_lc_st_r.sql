
{{config(
  materialized='ephemeral'
)}}

WITH rea_ewm_ip_x_cl_lc_st_r AS (
SELECT
            	IP_ID,
            	EFF_DT,
            	CL_CD,
            	SRC_DL
        FROM
            {{ ref('ora_read_ewm_ip_x_cl_lc_st_r') }} AS ORA_READ_EWM_IP_X_CL_LC_ST_R
        WHERE
            CL_CD='CST' 
)

SELECT * FROM rea_ewm_ip_x_cl_lc_st_r

