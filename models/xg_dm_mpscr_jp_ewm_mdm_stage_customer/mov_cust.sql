
{{config(
  materialized='ephemeral'
)}}

WITH mov_cust AS (
SELECT
            		MOV_XFM_CUSTOMER.CST_ID AS CST_ID,
            	MOV_XFM_CUSTOMER.DATE_FROM AS DATE_FROM,
            	MOV_XFM_CUSTOMER.SRC_ID AS SRC_ID,
            	MOV_XFM_CUSTOMER.CST_RK AS CST_RK,
            	MOV_XFM_CUSTOMER.GRID AS GRID,
            	MOV_XFM_CUSTOMER.CST_VORTEX_ID AS CST_VORTEX_ID,
            	MOV_XFM_CUSTOMER.RLTNP_STRT_DT AS RLTNP_STRT_DT,
            	MOV_XFM_CUSTOMER.CNTPR_AC_NBR AS CNTPR_AC_NBR,
            	MOV_XFM_CUSTOMER.SRC_DL AS SRC_DL,
            	MOV_XFM_CUSTOMER.DATE_TO AS DATE_TO,
            	MOV_XFM_CUSTOMER.DATA_DT AS DATA_DT,
            	MOV_XFM_CUSTOMER.SYS_INRT_TMS AS SYS_INRT_TMS
        FROM
            {{ ref('mov_xfm_customer') }} AS MOV_XFM_CUSTOMER 
)

SELECT * FROM mov_cust

