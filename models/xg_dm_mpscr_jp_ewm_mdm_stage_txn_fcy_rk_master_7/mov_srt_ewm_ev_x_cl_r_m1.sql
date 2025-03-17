
{{config(
  materialized='ephemeral'
)}}

WITH mov_srt_ewm_ev_x_cl_r_m1 AS (
SELECT
    *
FROM
    (
        SELECT
            REA_EWM_AR_X_AR_R.OBJ_AR_ID AS OBJ_AR_ID,
            REA_EWM_AR_X_AR_R.SRC_DL AS SRC_DL,
            REA_EWM_AR_X_AR_R.SUBJ_AR_ID AS SUBJ_AR_ID,
            ROW_NUMBER() OVER(
                PARTITION BY SRC_DL,
                SUBJ_AR_ID
                ORDER BY
                    SRC_DL ASC,
                    SUBJ_AR_ID ASC
            ) AS RN
        FROM
            {{ ref('rea_ewm_ar_x_ar_r_m1') }} AS REA_EWM_AR_X_AR_R
    ) t
WHERE
    RN = 1
)

SELECT * FROM mov_srt_ewm_ev_x_cl_r_m1

