
{{ config(
 materialized='table',
 post_hook="
 INSERT INTO
    {{ source('DM_MPSCR', 'EWM_MDM_STAGE_TRANSACTION_FCY') }}
(FCY_RK,
SRC_DL,
AR_ID,
VLD_FROM_TMS,
DATA_DT,
SYS_INRT_TMS)
                                                        SELECT 
                                                        FCY_RK,
SRC_DL,
AR_ID,
CAST(VLD_FROM_TMS AS DATETIME),
DATA_DT,
CAST(SYS_INRT_TMS AS DATETIME)
FROM
    {{ ref('wri_ar_mdm_stage_ar_fcy') }}
 "
)}}

SELECT 1 AS dummy_column

