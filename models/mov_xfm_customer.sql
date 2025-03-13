
{{config(
  materialized='ephemeral'
)}}

WITH mov_xfm_customer AS (
SELECT
            		mov_JNO_IP_STRT_DT.MSTR_SRC_STM_KEY AS cst_id,
            	mov_JNO_IP_STRT_DT.CST_RK AS cst_rk,
            	mov_JNO_IP_STRT_DT.GRID AS grid,
            	mov_JNO_IP_STRT_DT.CST_VORTEX_ID AS cst_vortex_id,
            	mov_JNO_IP_STRT_DT.EFF_DT AS rltnp_strt_dt,
            	mov_JNO_IP_STRT_DT.VLD_TO_TMS AS cntpr_ac_nbr,
            	mov_JNO_IP_STRT_DT.VLD_FROM_TMS AS date_from,
            	mov_JNO_IP_STRT_DT.MSTR_SRC_STM_CD AS src_id,
            	mov_JNO_IP_STRT_DT.SRC_DL AS src_dl,
            	PARSE_TIMESTAMP(
                    "%Y%m%d%H%M%S",
                    CONCAT(
                            '{{var("xg_pm_selection_date")}}',
                            '{{var("xg_pm_business_tms")}}'
                        )
                ) AS data_dt,
            	TIMESTAMP('{{ run_started_at }}') AS sys_inrt_tms
        FROM
            {{ ref('mov_jno_ip_strt_dt') }} AS mov_JNO_IP_STRT_DT 
)

SELECT * FROM mov_xfm_customer

