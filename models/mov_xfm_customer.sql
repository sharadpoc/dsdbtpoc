
{{config(
  materialized='ephemeral'
)}}

WITH mov_xfm_customer AS (
SELECT
            		MOV_JNO_IP_STRT_DT.MSTR_SRC_STM_KEY AS CST_ID,
            	MOV_JNO_IP_STRT_DT.CST_RK AS CST_RK,
            	MOV_JNO_IP_STRT_DT.GRID AS GRID,
            	MOV_JNO_IP_STRT_DT.CST_VORTEX_ID AS CST_VORTEX_ID,
            	MOV_JNO_IP_STRT_DT.EFF_DT AS RLTNP_STRT_DT,
            	MOV_JNO_IP_STRT_DT.VLD_TO_TMS AS CNTPR_AC_NBR,
            	MOV_JNO_IP_STRT_DT.VLD_FROM_TMS AS DATE_FROM,
            	MOV_JNO_IP_STRT_DT.MSTR_SRC_STM_CD AS SRC_ID,
            	MOV_JNO_IP_STRT_DT.SRC_DL AS SRC_DL,
                NULL as DATE_TO,
            	PARSE_TIMESTAMP(
                    "%Y%m%d%H%M%S",
                    CONCAT(
                            '{{var("xg_pm_selection_date")}}',
                            '{{var("xg_pm_business_tms")}}'
                        )
                ) AS DATA_DT,
            	TIMESTAMP('{{ run_started_at }}') AS SYS_INRT_TMS
        FROM
            {{ ref('mov_jno_ip_strt_dt') }} AS MOV_JNO_IP_STRT_DT 
)

SELECT * FROM mov_xfm_customer

