
{{config(
  materialized='ephemeral'
)}}

WITH mov_ewm_ip AS (
SELECT
            		rea_EWM_IP_ORG_V_IP_ID AS ip_id,
            	rea_EWM_IP_ORG_V_CST_RK AS cst_rk,
            	rea_EWM_IP_ORG_V_VLD_TO_TMS AS vld_to_tms,
            	SRC_DL AS src_dl,
            	MSTR_SRC_STM_CD AS mstr_src_stm_cd,
            	MSTR_SRC_STM_KEY AS mstr_src_stm_key,
            	VLD_FROM_TMS AS vld_from_tms
        FROM
            {{ ref('fnl_ewm_ip') }} AS FNL_EWM_IP 
)

SELECT * FROM mov_ewm_ip

