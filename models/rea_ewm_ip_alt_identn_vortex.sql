
{{config(
  materialized='ephemeral'
)}}

WITH rea_ewm_ip_alt_identn_vortex AS (
SELECT
            		CST_VORTEX_ID,
            	IP_ID,
            	SRC_DL
        FROM
            {{ ref('ora_read_ewm_ip_alt_identn_vortex') }} AS ORA_READ_EWM_IP_ALT_IDENTN_VORTEX
        ORDER BY
            IP_ID ASC,
            SRC_DL ASC 
)

SELECT * FROM rea_ewm_ip_alt_identn_vortex

