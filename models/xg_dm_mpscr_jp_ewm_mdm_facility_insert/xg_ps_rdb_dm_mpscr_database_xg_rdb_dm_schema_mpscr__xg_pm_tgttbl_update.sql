
{{ config(
 materialized='ephemeral',
 post_hook="
 INSERT INTO
    {{ source(
        'DM_MPSCR',
        'MDM_FACILITY_UPD_DEL'
    ) }}
(FCY_ID,
AR_ID,
DATE_FROM,
DATE_TO,
SYS_INRT_TMS,
SRC_ID,
SRC_DL,
DEL_IN_SRC_STM_F)
                                                        SELECT FCY_ID,
AR_ID,
DATE_FROM,
DATE_TO,
SYS_INRT_TMS,
SRC_ID,
SRC_DL,
DEL_IN_SRC_STM_F 
FROM
    {{ ref('wri_xfm_mdm_fcy_updt') }}
 "
)}}

SELECT 1 AS dummy_column

