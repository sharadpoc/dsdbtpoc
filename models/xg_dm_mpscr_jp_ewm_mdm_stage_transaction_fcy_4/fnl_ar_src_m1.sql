
{{config(
  materialized='ephemeral'
)}}

WITH fnl_ar_src_m1 AS (
SELECT
            		REA_EWM_AR_FCY_AR_V.FCY_RK AS REA_EWM_AR_FCY_AR_V_FCY_RK,
            	REA_EWM_AR_FCY_AR_V.SRC_DL AS REA_EWM_AR_FCY_AR_V_SRC_DL,
            	REA_EWM_AR_FCY_AR_V.AR_ID AS REA_EWM_AR_FCY_AR_V_AR_ID,
            	REA_EWM_AR_FCY_AR_V.VLD_FROM_TMS AS REA_EWM_AR_FCY_AR_V_VLD_FROM_TMS,
            	REA_EWM_AR_FCY_AR_V.DATA_DT AS REA_EWM_AR_FCY_AR_V_DATA_DT,
            	REA_EWM_AR_FCY_AR_DRV_V.FCY_RK AS REA_EWM_AR_FCY_AR_DRV_V_FCY_RK,
            	REA_EWM_AR_FCY_AR_DRV_V.SRC_DL AS REA_EWM_AR_FCY_AR_DRV_V_SRC_DL,
            	REA_EWM_AR_FCY_AR_DRV_V.AR_ID AS REA_EWM_AR_FCY_AR_DRV_V_AR_ID,
            	REA_EWM_AR_FCY_AR_DRV_V.VLD_FROM_TMS AS REA_EWM_AR_FCY_AR_DRV_V_VLD_FROM_TMS,
            	REA_EWM_AR_FCY_AR_DRV_V.DATA_DT AS REA_EWM_AR_FCY_AR_DRV_V_DATA_DT
        FROM
            (
                    SELECT
                         *
                    FROM
                        {{ ref('rea_ewm_ar_fcy_ar_v') }} AS REA_EWM_AR_FCY_AR_V
                    UNION DISTINCT
                    SELECT
                         *
                    FROM
                        {{ ref('rea_ewm_ar_fcy_ar_drv_v') }} AS REA_EWM_AR_FCY_AR_DRV_V
                ) 
)

SELECT * FROM fnl_ar_src_m1

