
{{ config(
 materialized='table',
 post_hook="
 INSERT INTO
    {{ source('DM_MPSCR', 'EWM_MDM_STAGE_AR_TX_TRANSACTN') }}
(DATA_DT,
AR_ID,
VLD_FROM_TMS,
SRC_DL,
SYS_INRT_TMS)
SELECT DATA_DT,
AR_ID,
VLD_FROM_TMS,
SRC_DL,
SYS_INRT_TMS FROM
    {{ ref('wri_ewm_mdm_stage_ar_tx_transaction') }}
 "
)}}

SELECT 1 AS dummy_column

