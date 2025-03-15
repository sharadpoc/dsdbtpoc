
{{config(
  materialized='ephemeral'
)}}

WITH ora_read_ewm_ip_alt_identn_grid AS (
SELECT
            	IP_ID,
            	IP_ID_NM AS GRID,
            	SRC_DL
        FROM
            {{ source('DM_MPSCR', 'EWM_IP_ALT_IDENTN_M') }}

)

SELECT * FROM ora_read_ewm_ip_alt_identn_grid

