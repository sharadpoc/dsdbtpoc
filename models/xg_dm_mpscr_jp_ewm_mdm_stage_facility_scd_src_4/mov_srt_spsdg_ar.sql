
{{config(
  materialized='ephemeral'
)}}

WITH mov_srt_spsdg_ar AS (
SELECT
    *
FROM
    (
        SELECT
            MOV_AR_X_RLTNP_HGR.SPSDG_FCY_DT AS SPSDG_FCY_DT,
            MOV_AR_X_RLTNP_HGR.SRC_DL AS SRC_DL,
            MOV_AR_X_RLTNP_HGR.OBJ_AR_ID AS AR_ID,
            MOV_AR_X_RLTNP_HGR.SUBJ_AR_ID AS SUBJ_AR_ID,
            ROW_NUMBER() OVER(
                PARTITION BY SRC_DL ,
                OBJ_AR_ID 
                ORDER BY
                    SRC_DL ,
                    OBJ_AR_ID 
            ) AS RN
        FROM
            {{ ref('mov_ar_x_rltnp_hgr') }} AS MOV_AR_X_RLTNP_HGR
    ) t
WHERE
    RN = 1
)

SELECT * FROM mov_srt_spsdg_ar

