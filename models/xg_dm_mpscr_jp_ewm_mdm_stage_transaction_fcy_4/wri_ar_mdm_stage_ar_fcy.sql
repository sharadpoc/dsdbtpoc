
{{config(
  materialized='ephemeral'
)}}

WITH wri_ar_mdm_stage_ar_fcy AS (
SELECT
    *
FROM
    (
        SELECT
            MOV_XFM_FCY_AR_SRC.FCY_RK AS FCY_RK,
            MOV_XFM_FCY_AR_SRC.SRC_DL AS SRC_DL,
            MOV_XFM_FCY_AR_SRC.AR_ID AS AR_ID,
            MOV_XFM_FCY_AR_SRC.VLD_FROM_TMS AS VLD_FROM_TMS,
            MOV_XFM_FCY_AR_SRC.DATA_DT AS DATA_DT,
            MOV_XFM_FCY_AR_SRC.SYS_INRT_TMS AS SYS_INRT_TMS,
            ROW_NUMBER() OVER(
                PARTITION BY SRC_DL,
                AR_ID,
                FCY_RK,
                VLD_FROM_TMS
                ORDER BY
                    SRC_DL,
                    AR_ID,
                    FCY_RK,
                    VLD_FROM_TMS
            ) AS RN
        FROM
            {{ ref('mov_xfm_fcy_ar_src') }} AS MOV_XFM_FCY_AR_SRC
    ) t
WHERE
    RN = 1
)

SELECT * FROM wri_ar_mdm_stage_ar_fcy

