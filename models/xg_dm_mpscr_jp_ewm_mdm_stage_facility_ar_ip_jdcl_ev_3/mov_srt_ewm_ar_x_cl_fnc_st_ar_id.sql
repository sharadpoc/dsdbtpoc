
{{config(
  materialized='ephemeral'
)}}

WITH mov_srt_ewm_ar_x_cl_fnc_st_ar_id AS (
SELECT
    *
FROM
    (
        SELECT
            REA_EWM_AR_X_CL_FNC_ST_R.SRC_DL AS SRC_DL,
            REA_EWM_AR_X_CL_FNC_ST_R.AR_ID AS AR_ID,
            REA_EWM_AR_X_CL_FNC_ST_R.AR_CL_CD AS AR_CL_CD,
            ROW_NUMBER() OVER(
                PARTITION BY SRC_DL ,
                AR_ID 
                ORDER BY
                    SRC_DL ASC,
                    AR_ID ASC
            ) AS RN
        FROM
            {{ ref('rea_ewm_ar_x_cl_fnc_st_r') }} AS REA_EWM_AR_X_CL_FNC_ST_R
    ) t
WHERE
    RN = 1
)

SELECT * FROM mov_srt_ewm_ar_x_cl_fnc_st_ar_id

