
{{config(
  materialized='ephemeral'
)}}

WITH mov_srt_ar_rltnp AS (
SELECT
    *
FROM
    (
        SELECT
            MOV_AR_RLTNP.AR_ID AS AR_ID,
            MOV_AR_RLTNP.SRC_DL AS SRC_DL,
            MOV_AR_RLTNP.OBJ_AR_ID AS OBJ_AR_ID,
            MOV_AR_RLTNP.SUBJ_AR_ID AS SUBJ_AR_ID,
            MOV_AR_RLTNP.AR_X_AR_RLTNP_TP_CL_CD AS AR_X_AR_RLTNP_TP_CL_CD,
            ROW_NUMBER() OVER(
                PARTITION BY SRC_DL ,
                AR_ID 
                ORDER BY
                    SRC_DL ASC,
                    AR_ID ASC
            ) AS RN
        FROM
            {{ ref('mov_ar_rltnp') }} AS MOV_AR_RLTNP
    ) t
WHERE
    RN = 1
)

SELECT * FROM mov_srt_ar_rltnp

