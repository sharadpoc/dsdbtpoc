
{{config(
  materialized='ephemeral'
)}}

WITH mov_srt_ewm_ip_alt_identn_grid AS (
SELECT
            		REA_EWM_IP_ALT_IDENTN_GRID.IP_ID AS IP_ID,
            	REA_EWM_IP_ALT_IDENTN_GRID.GRID AS GRID,
            	REA_EWM_IP_ALT_IDENTN_GRID.SRC_DL AS SRC_DL
        FROM
            {{ ref('rea_ewm_ip_alt_identn_grid') }} AS REA_EWM_IP_ALT_IDENTN_GRID
        ORDER BY
            IP_ID ASC,
            SRC_DL ASC 
)

SELECT * FROM mov_srt_ewm_ip_alt_identn_grid

