
{{ config(
 materialized='table',
 post_hook="
 INSERT INTO
    {{ source('DM_MPSCR', 'EWM_MDM_STAGE_FCY_AR_TP') }}
(SRC_DL,
DATA_DT,
VLD_FROM_TMS,
MSTR_SRC_STM_CD,
MSTR_SRC_STM_KEY,
AR_ID,
FCY_AR_TP,
SYS_INRT_TMS)
                                                        SELECT SRC_DL,
DATA_DT,
VLD_FROM_TMS,
MSTR_SRC_STM_CD,
MSTR_SRC_STM_KEY,
AR_ID,
FCY_AR_TP,
SYS_INRT_TMS
FROM
    {{ ref('wri_fcy_ar_tp') }}
 "
)}}

SELECT 1 AS dummy_column

