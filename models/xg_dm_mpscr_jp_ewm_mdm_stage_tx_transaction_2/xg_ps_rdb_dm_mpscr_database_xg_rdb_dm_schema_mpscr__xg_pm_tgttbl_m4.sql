
{{ config(
 materialized='table',
 post_hook="
 INSERT INTO
    {{ source('DM_MPSCR', 'EWM_MDM_STAGE_TX_TRANSACTION') }}
(DATA_DT,
AR_ID,
VLD_FROM_TMS,
SRC_DL,
SYS_INRT_TMS)
                                                        SELECT DATA_DT,
AR_ID,
cast(VLD_FROM_TMS as datetime),
SRC_DL,
 cast(SYS_INRT_TMS as datetime)
FROM
    {{ ref('wri_ewm_mdm_stage_txn_transaction') }}
 "
)}}

SELECT 1 AS dummy_column

