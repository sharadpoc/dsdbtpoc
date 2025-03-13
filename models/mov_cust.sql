
{{config(
  materialized='ephemeral'
)}}

WITH mov_cust AS (
SELECT
            		mov_XFM_CUSTOMER.CST_ID AS cst_id,
            	mov_XFM_CUSTOMER.DATE_FROM AS date_from,
            	mov_XFM_CUSTOMER.SRC_ID AS src_id,
            	mov_XFM_CUSTOMER.CST_RK AS cst_rk,
            	mov_XFM_CUSTOMER.GRID AS grid,
            	mov_XFM_CUSTOMER.CST_VORTEX_ID AS cst_vortex_id,
            	mov_XFM_CUSTOMER.RLTNP_STRT_DT AS rltnp_strt_dt,
            	mov_XFM_CUSTOMER.CNTPR_AC_NBR AS cntpr_ac_nbr,
            	mov_XFM_CUSTOMER.SRC_DL AS src_dl,
            	mov_XFM_CUSTOMER.DATE_TO AS date_to,
            	mov_XFM_CUSTOMER.DATA_DT AS data_dt,
            	mov_XFM_CUSTOMER.SYS_INRT_TMS AS sys_inrt_tms
        FROM
            {{ ref('mov_xfm_customer') }} AS mov_XFM_CUSTOMER 
)

SELECT * FROM mov_cust

