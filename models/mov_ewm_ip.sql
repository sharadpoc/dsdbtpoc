
{{config(
  materialized='ephemeral'
)}}

WITH mov_ewm_ip AS (
SELECT
            		REA_EWM_IP_IDV_V_IP_ID AS IP_ID,
            	REA_EWM_IP_IDV_V_CST_RK AS CST_RK,
            	REA_EWM_IP_IDV_V_VLD_TO_TMS AS VLD_TO_TMS,
            	REA_EWM_IP_IDV_V_SRC_DL AS SRC_DL,
            	REA_EWM_IP_IDV_V_MSTR_SRC_STM_CD AS MSTR_SRC_STM_CD,
            	REA_EWM_IP_IDV_V_MSTR_SRC_STM_KEY AS MSTR_SRC_STM_KEY,
            	REA_EWM_IP_IDV_V_VLD_FROM_TMS AS VLD_FROM_TMS
        FROM
            {{ ref('fnl_ewm_ip') }} AS FNL_EWM_IP 
)

SELECT * FROM mov_ewm_ip

