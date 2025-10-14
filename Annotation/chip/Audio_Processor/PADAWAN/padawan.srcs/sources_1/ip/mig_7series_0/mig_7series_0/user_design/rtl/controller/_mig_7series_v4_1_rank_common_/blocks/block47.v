  generate begin : sr_cntrl
      
      
      begin : sre_request_logic

        reg sre_request_r;
        wire sre_clears_sre_request = insert_maint_r1 && maint_sre_r_lcl;

        wire sre_request_ns = ~rst && ((sre_request_r && ~sre_clears_sre_request)
                              || (app_sr_req && init_calib_complete && ~maint_sre_r_lcl));
        