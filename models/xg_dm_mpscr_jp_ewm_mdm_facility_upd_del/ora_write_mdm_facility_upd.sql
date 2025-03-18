{{ config(
    materialized='table',
    post_hook="CALL `cognizant-pocngdap-01.DM_MPSCR.merge_target_table`(
            '{{ var('xg_pm_tgttbl') }}', 
            '{{ var('xg_pm_tgttbl_update') }}', 
            '{{ var('xg_pm_selection_date') }}', 
            '{{ var('xg_pm_src_dl') }}'
        )
    "
) }}
SELECT 1 AS dummy_column