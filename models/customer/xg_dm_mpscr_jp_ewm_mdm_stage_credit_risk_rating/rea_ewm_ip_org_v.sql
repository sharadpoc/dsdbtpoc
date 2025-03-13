
{{config(
  materialized='ephemeral'
)}}

WITH rea_ewm_ip_org_v AS (
SELECT
            	SRC_DL,
            	IP_ID,
            	CST_RK
        FROM
            {{ ref('ora_read_ewm_ip_org_v') }} AS ORA_read_EWM_IP_ORG_V 
)

SELECT * FROM rea_ewm_ip_org_v

