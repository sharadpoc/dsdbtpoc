
{{config(
  materialized='ephemeral'
)}}

WITH mov_srt_fnl_fcy_ar_tp AS (
SELECT
    *
FROM
    (
        SELECT
            MOV_FNL_FCY_AR_TP.AR_ID AS AR_ID,
            MOV_FNL_FCY_AR_TP.FCY_AR_TP AS FCY_AR_TP,
            MOV_FNL_FCY_AR_TP.SRC_DL AS SRC_DL,
            MOV_FNL_FCY_AR_TP.DATA_DT AS DATA_DT,
            MOV_FNL_FCY_AR_TP.VLD_FROM_TMS AS VLD_FROM_TMS,
            MOV_FNL_FCY_AR_TP.MSTR_SRC_STM_CD AS MSTR_SRC_STM_CD,
            MOV_FNL_FCY_AR_TP.MSTR_SRC_STM_KEY AS MSTR_SRC_STM_KEY,
            ROW_NUMBER() OVER(
                PARTITION BY SRC_DL ASC,
                AR_ID ASC,
                VLD_FROM_TMS ASC
                ORDER BY
                    SRC_DL ASC,
                    AR_ID ASC,
                    VLD_FROM_TMS ASC
            ) AS RN
        FROM
            {{ ref('mov_fnl_fcy_ar_tp') }} AS MOV_FNL_FCY_AR_TP
    ) t
WHERE
    RN = 1
)

SELECT * FROM mov_srt_fnl_fcy_ar_tp

