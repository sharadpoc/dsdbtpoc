
{{config(
  materialized='ephemeral'
)}}

WITH mov_rdu_txn_fcy_rk AS (
SELECT
            		MOV_SRT_TXN_FCY_RK.EV_ID AS EV_ID,
            	MOV_SRT_TXN_FCY_RK.MSTR_SRC_STM_CD AS MSTR_SRC_STM_CD,
            	MOV_SRT_TXN_FCY_RK.MSTR_SRC_STM_KEY AS MSTR_SRC_STM_KEY,
            	MOV_SRT_TXN_FCY_RK.VLD_FROM_TMS AS VLD_FROM_TMS,
            	MOV_SRT_TXN_FCY_RK.VLD_TO_TMS AS VLD_TO_TMS,
            	MOV_SRT_TXN_FCY_RK.PRIM_AR_ID AS PRIM_AR_ID,
            	MOV_SRT_TXN_FCY_RK.FCY_RK AS FCY_RK,
            	MOV_SRT_TXN_FCY_RK.TXN_BOOK_DT AS TXN_BOOK_DT,
            	MOV_SRT_TXN_FCY_RK.TXN_CCY_AMT AS TXN_CCY_AMT,
            	MOV_SRT_TXN_FCY_RK.TXN_CCY_CL_CD AS TXN_CCY_CL_CD,
            	MOV_SRT_TXN_FCY_RK.TXN_RSN_TP_CL_CD AS TXN_RSN_TP_CL_CD,
            	MOV_SRT_TXN_FCY_RK.LDGR_CCY_AMT AS LDGR_CCY_AMT,
            	MOV_SRT_TXN_FCY_RK.LDGR_CCY_CL_CD AS LDGR_CCY_CL_CD,
            	MOV_SRT_TXN_FCY_RK.SRC_DL AS SRC_DL,
            	MOV_SRT_TXN_FCY_RK.DATA_DT AS DATA_DT
        FROM
            {{ ref('mov_srt_txn_fcy_rk') }} AS MOV_SRT_TXN_FCY_RK 
)

SELECT * FROM mov_rdu_txn_fcy_rk

