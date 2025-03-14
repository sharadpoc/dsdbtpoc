
{{config(
  materialized='ephemeral'
)}}

WITH mov_srt_ewm_ip_alt_identn_vortex AS (
SELECT
            		REA_EWM_IP_ALT_IDENTN_VORTEX.IP_ID AS IP_ID,
            	REA_EWM_IP_ALT_IDENTN_VORTEX.CST_VORTEX_ID AS CST_VORTEX_ID,
            	REA_EWM_IP_ALT_IDENTN_VORTEX.SRC_DL AS SRC_DL
        FROM
            {{ ref('rea_ewm_ip_alt_identn_vortex') }} AS REA_EWM_IP_ALT_IDENTN_VORTEX
        ORDER BY
            IP_ID ASC,
            SRC_DL ASC 
)

SELECT * FROM mov_srt_ewm_ip_alt_identn_vortex

