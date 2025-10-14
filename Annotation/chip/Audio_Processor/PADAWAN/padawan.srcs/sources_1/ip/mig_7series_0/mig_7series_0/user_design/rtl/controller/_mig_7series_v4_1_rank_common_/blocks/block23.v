  wire app_sr_active_ns =
    insert_maint_r1 ? maint_sre_r && ~maint_srx_r : app_sr_active_r;