
{{config(
  materialized='ephemeral'
)}}

WITH fnl_ewm_ip AS (
SELECT
            		rea_EWM_IP_ORG_V.SRC_DL AS rea_ewm_ip_org_v_src_dl,
            	rea_EWM_IP_ORG_V.IP_ID AS rea_ewm_ip_org_v_ip_id,
            	rea_EWM_IP_ORG_V.CST_RK AS rea_ewm_ip_org_v_cst_rk,
            	rea_EWM_IP_IDV_V.SRC_DL AS rea_ewm_ip_idv_v_src_dl,
            	rea_EWM_IP_IDV_V.IP_ID AS rea_ewm_ip_idv_v_ip_id,
            	rea_EWM_IP_IDV_V.CST_RK AS rea_ewm_ip_idv_v_cst_rk
        FROM
            (
                    SELECT
                         *
                    FROM
                        {{ ref('rea_ewm_ip_org_v') }} AS rea_EWM_IP_ORG_V
                    UNION DISTINCT
                    DISTINCT
                    SELECT
                         *
                    FROM
                        {{ ref('rea_ewm_ip_idv_v') }} AS rea_EWM_IP_IDV_V
                ) 
)

SELECT * FROM fnl_ewm_ip

