
{{config(
  materialized='ephemeral'
)}}

WITH mov_srt_ewm_ip_alt_identn_vortex AS (
SELECT
            		rea_EWM_IP_ALT_IDENTN_VORTEX.IP_ID AS ip_id,
            	rea_EWM_IP_ALT_IDENTN_VORTEX.CST_VORTEX_ID AS cst_vortex_id,
            	rea_EWM_IP_ALT_IDENTN_VORTEX.SRC_DL AS src_dl
        FROM
            {{ ref('rea_ewm_ip_alt_identn_vortex') }} AS rea_EWM_IP_ALT_IDENTN_VORTEX
        ORDER BY
            IP_ID ASC,
            SRC_DL ASC 
)

SELECT * FROM mov_srt_ewm_ip_alt_identn_vortex

