
{{config(
  materialized='ephemeral'
)}}

WITH mov_ewm_ip AS (
SELECT
            		REA_EWM_IP_ORG_V_IP_IDREA_EWM_IP_IDV_V_IP_ID AS IP_ID,
            	REA_EWM_IP_ORG_V_CST_RKREA_EWM_IP_IDV_V_CST_RK AS CST_RK,
            	REA_EWM_IP_ORG_V_VLD_TO_TMSREA_EWM_IP_IDV_V_VLD_TO_TMS AS VLD_TO_TMS,
            	SRC_DL AS SRC_DL,
            	MSTR_SRC_STM_CD AS MSTR_SRC_STM_CD,
            	MSTR_SRC_STM_KEY AS MSTR_SRC_STM_KEY,
            	VLD_FROM_TMS AS VLD_FROM_TMS
        FROM
            {{ ref('fnl_ewm_ip') }} AS FNL_EWM_IP 
)

SELECT * FROM mov_ewm_ip

