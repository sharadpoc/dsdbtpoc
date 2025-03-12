
{{config(
  materialized='ephemeral'
)}}

WITH rea_ewm_ip_idv_v AS (
SELECT
            	SRC_DL,
            	IP_ID,
            	CST_RK
        FROM
            {{ ref('ora_read_ewm_ip_idv_v') }} AS ORA_read_EWM_IP_IDV_V 
)

SELECT * FROM rea_ewm_ip_idv_v

