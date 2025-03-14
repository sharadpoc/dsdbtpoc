
{{config(
  materialized='ephemeral'
)}}

WITH fnl_ewm_ip AS (
SELECT
            		REA_EWM_IP_ORG_V.SRC_DL AS REA_EWM_IP_ORG_V_SRC_DL,
            	REA_EWM_IP_ORG_V.IP_ID AS REA_EWM_IP_ORG_V_IP_ID,
            	REA_EWM_IP_ORG_V.MSTR_SRC_STM_CD AS REA_EWM_IP_ORG_V_MSTR_SRC_STM_CD,
            	REA_EWM_IP_ORG_V.CST_RK AS REA_EWM_IP_ORG_V_CST_RK,
            	REA_EWM_IP_ORG_V.MSTR_SRC_STM_KEY AS REA_EWM_IP_ORG_V_MSTR_SRC_STM_KEY,
            	REA_EWM_IP_ORG_V.VLD_FROM_TMS AS REA_EWM_IP_ORG_V_VLD_FROM_TMS,
            	REA_EWM_IP_ORG_V.VLD_TO_TMS AS REA_EWM_IP_ORG_V_VLD_TO_TMS,
            	REA_EWM_IP_IDV_V.SRC_DL AS REA_EWM_IP_IDV_V_SRC_DL,
            	REA_EWM_IP_IDV_V.IP_ID AS REA_EWM_IP_IDV_V_IP_ID,
            	REA_EWM_IP_IDV_V.MSTR_SRC_STM_CD AS REA_EWM_IP_IDV_V_MSTR_SRC_STM_CD,
            	REA_EWM_IP_IDV_V.CST_RK AS REA_EWM_IP_IDV_V_CST_RK,
            	REA_EWM_IP_IDV_V.MSTR_SRC_STM_KEY AS REA_EWM_IP_IDV_V_MSTR_SRC_STM_KEY,
            	REA_EWM_IP_IDV_V.VLD_FROM_TMS AS REA_EWM_IP_IDV_V_VLD_FROM_TMS,
            	REA_EWM_IP_IDV_V.VLD_TO_TMS AS REA_EWM_IP_IDV_V_VLD_TO_TMS
        FROM
            (
                    SELECT
                         *
                    FROM
                        {{ ref('rea_ewm_ip_idv_v') }} AS REA_EWM_IP_IDV_V
                    UNION DISTINCT
                    SELECT
                         *
                    FROM
                        {{ ref('rea_ewm_ip_org_v') }} AS REA_EWM_IP_ORG_V
                ) 
)

SELECT * FROM fnl_ewm_ip

