
{{config(
  materialized='ephemeral'
)}}

WITH fnl_ewm_fcy_ar AS (
SELECT
            		rea_EWM_AR_FCY_AR_DRV_V.SRC_DL AS rea_ewm_ar_fcy_ar_drv_v_src_dl,
            	rea_EWM_AR_FCY_AR_DRV_V.AR_ID AS rea_ewm_ar_fcy_ar_drv_v_ar_id,
            	rea_EWM_AR_FCY_AR_DRV_V.FCY_RK AS rea_ewm_ar_fcy_ar_drv_v_fcy_rk,
            	rea_EWM_AR_FCY_AR_V.SRC_DL AS rea_ewm_ar_fcy_ar_v_src_dl,
            	rea_EWM_AR_FCY_AR_V.AR_ID AS rea_ewm_ar_fcy_ar_v_ar_id,
            	rea_EWM_AR_FCY_AR_V.FCY_RK AS rea_ewm_ar_fcy_ar_v_fcy_rk
        FROM
            (
                    SELECT
                         *
                    FROM
                        {{ ref('rea_ewm_ar_fcy_ar_drv_v') }} AS rea_EWM_AR_FCY_AR_DRV_V
                    UNION DISTINCT
                    DISTINCT
                    SELECT
                         *
                    FROM
                        {{ ref('rea_ewm_ar_fcy_ar_v') }} AS rea_EWM_AR_FCY_AR_V
                ) 
)

SELECT * FROM fnl_ewm_fcy_ar

