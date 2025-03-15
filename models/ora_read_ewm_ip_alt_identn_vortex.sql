
{{config(
  materialized='ephemeral'
)}}

WITH ora_read_ewm_ip_alt_identn_vortex AS (
SELECT
            	SRC_DL,
            	IP_ID,
            	IP_ID_NM AS CST_VORTEX_ID
        FROM
            {{ source('DM_MPSCR', 'EWM_IP_ALT_IDENTN_M') }}

)

SELECT * FROM ora_read_ewm_ip_alt_identn_vortex

