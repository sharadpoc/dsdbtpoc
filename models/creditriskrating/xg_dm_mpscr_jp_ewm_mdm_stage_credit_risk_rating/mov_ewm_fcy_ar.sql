
{{config(
  materialized='ephemeral'
)}}

WITH mov_ewm_fcy_ar AS (
SELECT
            		rea_EWM_AR_FCY_AR_DRV_V_FCY_RKrea_EWM_AR_FCY_AR_V_FCY_RK AS fcy_rk,
            	SRC_DL AS src_dl,
            	AR_ID AS ar_id
        FROM
            {{ ref('fnl_ewm_fcy_ar') }} AS FNL_EWM_FCY_AR 
)

SELECT * FROM mov_ewm_fcy_ar

