
{{config(
  materialized='ephemeral'
)}}

WITH ora_read_ewm_ar_x_ip_r_m2 AS (
SELECT
            	IP_ID,
            	AR_X_IP_RLTNP_TP_CL_CD,
            	SRC_DL,
            	RANK
        FROM
            {{ source('DM_MPSCR', 'EWM_AR_X_IP_R') }}

)

SELECT * FROM ora_read_ewm_ar_x_ip_r_m2

