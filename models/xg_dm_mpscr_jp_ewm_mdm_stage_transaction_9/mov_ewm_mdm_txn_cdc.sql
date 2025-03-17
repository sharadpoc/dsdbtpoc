{{ config(materialized='table') }}

with mov_ewm_mdm_txn_cdc AS (
SELECT
  mov_ROU_TXN_TRANSACTION.SRC_DL AS SRC_DL,
  mov_ROU_TXN_TRANSACTION.VLD_FROM_TMS AS DATE_FROM,
  mov_ROU_TXN_TRANSACTION.VLD_TO_TMS AS DATE_TO,
  mov_ROU_TXN_TRANSACTION.MSTR_SRC_STM_CD AS SRC_ID,
  mov_ROU_TXN_TRANSACTION.TXN_BOOK_DT AS BOOK_DT,
  mov_ROU_TXN_TRANSACTION.TXN_CCY_AMT AS TXN_AMT,
  mov_ROU_TXN_TRANSACTION.LDGR_CCY_AMT AS TXN_LDGR_AMT,
  mov_ROU_TXN_TRANSACTION.LDGR_CCY_CL_CD AS LDGR_CCY_ID,
  mov_ROU_TXN_TRANSACTION.TXN_CCY_CL_CD AS CCY_ID,
  '{{ var("svtr") }}' AS TXN_TP,
  mov_ROU_TXN_TRANSACTION.TXN_RSN_TP_CL_CD AS TXN_RSN,
  mov_ROU_TXN_TRANSACTION.TXN_RK AS TXN_RK,
  mov_ROU_TXN_TRANSACTION.MSTR_SRC_STM_KEY AS TXN_ID,
  mov_ROU_TXN_TRANSACTION.FCY_RK AS FCY_RK,
  {% if var("svtr") == "R" %}
    mov_ROU_TXN_TRANSACTION.CL_CD AS REC_SRC,
  {% else %}
    NULL AS REC_SRC,
  {% endif %}
  mov_ROU_TXN_TRANSACTION.SNDR_TO_RCVR_INF AS COST_AND_REC_TR_TXN_NOTE,
  -- Convert selection date passed as a variable (assumed in YYYYMMDD format)
  PARSE_DATETIME("%Y%m%d", '{{ var("xg_pm_selection_date") }}') AS DATA_DT,
      TIMESTAMP('{{ run_started_at }}')  AS SYS_INRT_TMS,
  CASE
    WHEN mov_ROU_TXN_TRANSACTION.TXN_RSN_TP_CL_CD IN ("FNC_SVC_PYMT", "FNC_SVC_CHRG") THEN
      {% if var("svDetailedSplitInd") == "N" %}
        mov_ROU_TXN_TRANSACTION.TXN_CCY_AMT
      {% else %}
        mov_ROU_TXN_TRANSACTION.PNP_TXN_CCY_AMT
      {% endif %}
    ELSE NULL
  END AS PNP_TXN_AMT,
  CASE
    WHEN mov_ROU_TXN_TRANSACTION.TXN_RSN_TP_CL_CD = "FNC_SVC_PYMT" THEN "PNP_PYMT"
    WHEN mov_ROU_TXN_TRANSACTION.TXN_RSN_TP_CL_CD = "FNC_SVC_CHRG" THEN "PNP_ADVNC"
    ELSE NULL
  END AS PNP_TXN_RSN,
  CASE
    WHEN mov_ROU_TXN_TRANSACTION.TXN_RSN_TP_CL_CD IN ("FNC_SVC_PYMT", "FNC_SVC_CHRG") THEN
      {% if var("svDetailedSplitInd") == "Y" %}
        mov_ROU_TXN_TRANSACTION.INT_TXN_CCY_AMT
      {% else %}
        NULL
      {% endif %}
    ELSE NULL
  END AS INT_TXN_AMOUNT,
  {% if var("svDetailedSplitInd") == "Y" %}
    CASE
      WHEN mov_ROU_TXN_TRANSACTION.TXN_RSN_TP_CL_CD = "FNC_SVC_PYMT" THEN "INT_PYMT"
      WHEN mov_ROU_TXN_TRANSACTION.TXN_RSN_TP_CL_CD = "FNC_SVC_CHRG" THEN "INT_CHRG"
      ELSE NULL
    END AS INT_TXN_RSN,
  {% else %}
    NULL AS INT_TXN_RSN,
  {% endif %}
  CASE
    WHEN mov_ROU_TXN_TRANSACTION.TXN_RSN_TP_CL_CD IN ("FNC_SVC_PYMT", "FNC_SVC_CHRG") THEN
      {% if var("svDetailedSplitInd") == "Y" %}
        mov_ROU_TXN_TRANSACTION.TXN_FEE_TXN_CCY_AMT
      {% else %}
        NULL
      {% endif %}
    ELSE NULL
  END AS FEE_TXN_AMOUNT,
  {% if var("svDetailedSplitInd") == "Y" %}
    CASE
      WHEN mov_ROU_TXN_TRANSACTION.TXN_RSN_TP_CL_CD = "FNC_SVC_PYMT"
           AND mov_ROU_TXN_TRANSACTION.TXN_FEE_CMPT_EV_ID > 0 THEN "FEE_CMSN_PYMT"
      WHEN mov_ROU_TXN_TRANSACTION.TXN_RSN_TP_CL_CD = "FNC_SVC_CHRG"
           AND mov_ROU_TXN_TRANSACTION.TXN_FEE_CMPT_EV_ID > 0 THEN "FEE_CMSN_CHRG"
      ELSE NULL
    END AS FEE_TXN_RSN,
  {% else %}
    NULL AS FEE_TXN_RSN,
  {% endif %}
  CASE
    WHEN mov_ROU_TXN_TRANSACTION.TXN_RSN_TP_CL_CD IN ("FNC_SVC_PYMT", "FNC_SVC_CHRG") THEN
      {% if var("svDetailedSplitInd") == "Y" %}
        mov_ROU_TXN_TRANSACTION.TXN_FEE_CCY_CL_CD
      {% else %}
        NULL
      {% endif %}
    ELSE NULL
  END AS FEE_TXN_AMT_CCY_ID,
  CASE
    WHEN mov_ROU_TXN_TRANSACTION.TXN_RSN_TP_CL_CD IN ("FNC_SVC_PYMT", "FNC_SVC_CHRG") THEN
      {% if var("svDetailedSplitInd") == "N" %}
        "DEFAULTED_TO_PRINCIPAL"
      {% else %}
        "SPLIT_SOURCED"
      {% endif %}
    ELSE NULL
  END AS TXN_AMT_TRANSF_ACTION

FROM {{ ref('mov_rou_txn_transaction') }} AS mov_ROU_TXN_TRANSACTION

)

SELECT * FROM mov_ewm_mdm_txn_cdc
