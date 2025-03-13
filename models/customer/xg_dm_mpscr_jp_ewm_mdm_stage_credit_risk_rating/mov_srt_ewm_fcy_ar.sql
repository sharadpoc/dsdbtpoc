
{{config(
  materialized='ephemeral'
)}}

WITH mov_srt_ewm_fcy_ar AS (
SELECT
            		mov_EWM_FCY_AR.FCY_RK AS fcy_rk,
            	mov_EWM_FCY_AR.SRC_DL AS src_dl,
            	mov_EWM_FCY_AR.AR_ID AS ar_id
        FROM
            {{ ref('mov_ewm_fcy_ar') }} AS mov_EWM_FCY_AR 
        ORDER BY
            src_dl ASC, ar_id ASC
)

SELECT * FROM mov_srt_ewm_fcy_ar

