
{{config(
  materialized='ephemeral'
)}}

WITH mov_ewm_ip AS (
SELECT
            		rea_EWM_IP_ORG_V_IP_IDrea_EWM_IP_IDV_V_IP_ID AS ip_id,
            	rea_EWM_IP_ORG_V_CST_RKrea_EWM_IP_IDV_V_CST_RK AS cst_rk,
            	SRC_DL AS src_dl
        FROM
            {{ ref('fnl_ewm_ip') }} AS FNL_EWM_IP 
)

SELECT * FROM mov_ewm_ip

