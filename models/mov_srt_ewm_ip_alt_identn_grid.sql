
{{config(
  materialized='ephemeral'
)}}

WITH mov_srt_ewm_ip_alt_identn_grid AS (
SELECT
            		rea_EWM_IP_ALT_IDENTN_GRID.IP_ID AS ip_id,
            	rea_EWM_IP_ALT_IDENTN_GRID.GRID AS grid,
            	rea_EWM_IP_ALT_IDENTN_GRID.SRC_DL AS src_dl
        FROM
            {{ ref('rea_ewm_ip_alt_identn_grid') }} AS rea_EWM_IP_ALT_IDENTN_GRID
        ORDER BY
            IP_ID ASC,
            SRC_DL ASC 
)

SELECT * FROM mov_srt_ewm_ip_alt_identn_grid

