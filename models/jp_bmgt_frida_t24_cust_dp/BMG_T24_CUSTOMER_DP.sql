{{ config(
    materialized='incremental',
    pre_hook="""
        DELETE FROM {{ this }}
        WHERE ODS_BUSINESS_DATE >= '{{ var(\"cb_pm_strt_busdate\") }}'
        AND ODS_BUSINESS_DATE <= '{{ var(\"cb_pm_end_busdate\") }}'
    """
) }}

SELECT *
FROM {{ ref("lnk_ifl_cust") }}
