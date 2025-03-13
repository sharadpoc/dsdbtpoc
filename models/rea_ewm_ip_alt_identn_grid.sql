
{{config(
  materialized='ephemeral'
)}}

WITH rea_ewm_ip_alt_identn_grid AS (
SELECT
            	GRID,
            	IP_ID,
            	SRC_DL
        FROM
            {{ ref('ora_read_ewm_ip_alt_identn_grid') }} AS ORA_read_EWM_IP_ALT_IDENTN_GRID
        ORDER BY
            IP_ID ASC,
            SRC_DL ASC 
)

SELECT * FROM rea_ewm_ip_alt_identn_grid

