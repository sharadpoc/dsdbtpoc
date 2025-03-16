
{{config(
  materialized='ephemeral'
)}}

WITH mov_srt_ewm_ev_x_cl_r AS (
SELECT
    *
FROM
    (
        SELECT
            REA_EWM_EV_X_CL_R.SRC_DL AS SRC_DL,
            REA_EWM_EV_X_CL_R.EV_ID AS EV_ID,
            REA_EWM_EV_X_CL_R.CL_CD AS CL_CD,
            ROW_NUMBER() OVER(
                PARTITION BY EV_ID ASC,
                SRC_DL ASC
                ORDER BY
                    EV_ID ASC,
                    SRC_DL ASC
            ) AS RN
        FROM
            {{ ref('rea_ewm_ev_x_cl_r') }} AS REA_EWM_EV_X_CL_R
    ) t
WHERE
    RN = 1
)

SELECT * FROM mov_srt_ewm_ev_x_cl_r

