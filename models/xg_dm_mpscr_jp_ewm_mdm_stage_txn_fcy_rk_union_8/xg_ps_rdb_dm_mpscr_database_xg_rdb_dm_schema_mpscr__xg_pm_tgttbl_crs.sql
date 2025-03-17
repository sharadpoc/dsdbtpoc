
{{ config(
 materialized='table',
 post_hook="
 INSERT INTO
    {{ source('DM_MPSCR', 'EWM_MDM_STAGE_TXN_FCY_RK_UNION') }}
(MSTR_SRC_STM_CD,
MSTR_SRC_STM_KEY,
VLD_FROM_TMS,
VLD_TO_TMS,
PRIM_AR_ID,
TXN_BOOK_DT,
TXN_CCY_AMT,
TXN_CCY_CL_CD,
TXN_RSN_TP_CL_CD,
LDGR_CCY_AMT,
LDGR_CCY_CL_CD,
FCY_RK,
SRC_DL,
DATA_DT,
SYS_INRT_TMS)
                                                        SELECT MSTR_SRC_STM_CD,
MSTR_SRC_STM_KEY,
VLD_FROM_TMS,
VLD_TO_TMS,
PRIM_AR_ID,
TXN_BOOK_DT,
TXN_CCY_AMT,
TXN_CCY_CL_CD,
TXN_RSN_TP_CL_CD,
LDGR_CCY_AMT,
LDGR_CCY_CL_CD,
FCY_RK,
SRC_DL,
DATA_DT,
CAST(SYS_INRT_TMS AS DATETIME)
FROM
    {{ ref('wri_ar_mdm_stage_ar_fcy_creditsale') }}
 "
)}}

SELECT 1 AS dummy_column

