
{{config(
  materialized='table'
)}}

WITH wri_xfm_mdm_fcy_updt AS (
SELECT
    MOV_JNO_FACILITY.TGT_FCY_ID AS FCY_ID,
    MOV_JNO_FACILITY.TGT_AR_ID AS AR_ID,
    MOV_JNO_FACILITY.TGT_DATE_FROM AS DATE_FROM,
    CASE
        WHEN SVACTION = "D" THEN PARSE_TIMESTAMP("%Y%m%d", "{{var('xg_pm_selection_date')}}")
        ELSE MOV_JNO_FACILITY.DATE_FROM
    END AS DATE_TO,
    PARSE_TIMESTAMP("%Y%m%d", "{{var('xg_pm_selection_date')}}") AS SYS_INRT_TMS,
    MOV_JNO_FACILITY.TGT_SRC_ID AS SRC_ID,
    MOV_JNO_FACILITY.TGT_SRC_DL AS SRC_DL,
    CASE
        WHEN SVACTION = "D" THEN "1"
        ELSE "0"
    END AS DEL_IN_SRC_STM_F
FROM
    {{ ref('mov_jno_facility') }} AS MOV_JNO_FACILITY
WHERE
    SVACTION = "U"
    OR SVACTION = "D"
)

SELECT * FROM wri_xfm_mdm_fcy_updt

