
{{config(
  materialized='ephemeral'
)}}

WITH rea_ewm_ip_org_v AS (
SELECT
            	SRC_DL,
            	IP_ID,
            	MSTR_SRC_STM_CD,
            	CST_RK,
            	MSTR_SRC_STM_KEY,
            	VLD_FROM_TMS,
            	VLD_TO_TMS
        FROM
            {{ ref('ora_read_ewm_ip_org_v') }} AS ORA_READ_EWM_IP_ORG_V 
)

SELECT * FROM rea_ewm_ip_org_v

