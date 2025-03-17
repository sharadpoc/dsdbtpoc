
{{ config(
 materialized='table',
 post_hook="
 INSERT INTO
    {{ source('DM_MPSCR', 'EWM_MDM_STAGE_FCY_AR') }}
 (FCY_RK,
SRC_DL,
AR_ID,
MSTR_SRC_STM_CD,
MSTR_SRC_STM_KEY,
VLD_FROM_TMS,
VLD_TO_TMS,
DATA_DT,
SYS_INRT_TMS)
                                                        SELECT FCY_RK,
SRC_DL,
AR_ID,
MSTR_SRC_STM_CD,
MSTR_SRC_STM_KEY,
CAST(VLD_FROM_TMS AS DATETIME) AS VLD_FROM_TMS,
CAST(VLD_TO_TMS AS DATETIME)  AS VLD_TO_TMS,
CAST(DATA_DT AS DATETIME)  AS DATA_DT,

CAST(SYS_INRT_TMS AS DATETIME)    as SYS_INRT_TMS
FROM
    {{ ref('wri_ar_mdm_stage_ar_fcy') }}
 "
)}}

SELECT 1 AS dummy_column

