
{{config(
  materialized='ephemeral'
)}}

WITH mov_srt_fcy_spsdg_drv AS (
SELECT
    *
FROM
    (
        SELECT
            MOV_FCY_SPSDG_AR_DRV.SPSDG_FCY_DT AS SPSDG_FCY_DT,
            MOV_FCY_SPSDG_AR_DRV.SPSDG_FCY_RK AS SPSDG_FCY_RK,
            MOV_FCY_SPSDG_AR_DRV.SRC_DL AS SRC_DL,
            MOV_FCY_SPSDG_AR_DRV.DATA_DT AS DATA_DT,
            MOV_FCY_SPSDG_AR_DRV.SYS_VLD_FROM_TMS AS SYS_VLD_FROM_TMS,
            MOV_FCY_SPSDG_AR_DRV.SYS_VLD_TO_TMS AS SYS_VLD_TO_TMS,
            MOV_FCY_SPSDG_AR_DRV.SRC_STM_ID AS SRC_STM_ID,
            MOV_FCY_SPSDG_AR_DRV.FCY_ID AS FCY_ID,
            MOV_FCY_SPSDG_AR_DRV.FCY_RK AS FCY_RK,
            MOV_FCY_SPSDG_AR_DRV.AR_ID AS AR_ID,
            MOV_FCY_SPSDG_AR_DRV.FCY_AR_TP AS FCY_AR_TP,
            MOV_FCY_SPSDG_AR_DRV.COURT_CTRLD_WRKOUT_FCY AS COURT_CTRLD_WRKOUT_FCY,
            MOV_FCY_SPSDG_AR_DRV.OUT_OF_COURT_WRKOUT_FCY AS OUT_OF_COURT_WRKOUT_FCY,
            MOV_FCY_SPSDG_AR_DRV.COURT_CTRLD_WRKOUT_FILL_DT AS COURT_CTRLD_WRKOUT_FILL_DT,
            MOV_FCY_SPSDG_AR_DRV.COURT_CTRLD_WRKOUT_CLS_DT AS COURT_CTRLD_WRKOUT_CLS_DT,
            MOV_FCY_SPSDG_AR_DRV.CR_OBLG_DFLTD AS CR_OBLG_DFLTD,
            MOV_FCY_SPSDG_AR_DRV.UNDRL_AR_ID AS UNDRL_AR_ID,
            ROW_NUMBER() OVER(
                PARTITION BY SRC_DL ,
                AR_ID 
                ORDER BY
                    SRC_DL ASC,
                    AR_ID ASC
            ) AS RN
        FROM
            {{ ref('mov_fcy_spsdg_ar_drv') }} AS MOV_FCY_SPSDG_AR_DRV
    ) t
WHERE
    RN = 1
)

SELECT * FROM mov_srt_fcy_spsdg_drv

