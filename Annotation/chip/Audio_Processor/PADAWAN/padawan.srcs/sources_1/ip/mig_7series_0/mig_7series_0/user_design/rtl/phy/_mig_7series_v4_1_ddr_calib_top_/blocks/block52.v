generate
   if((WRLVL == "ON") && (BYPASS_COMPLEX_OCAL=="FALSE")) begin: complex_oclk_calib
    assign complex_oclkdelay_calib_start_w = complex_oclkdelay_calib_start;
    assign complex_oclkdelay_calib_done_w  = complex_oclkdelay_calib_done;
    assign complex_ocal_rd_victim_sel_w    = complex_ocal_rd_victim_sel;
    assign complex_wrlvl_final_w           = complex_wrlvl_final;
   end else begin: bypass_complex_ocal
    assign complex_oclkdelay_calib_start_w = 1'b0;
    assign complex_oclkdelay_calib_done_w  = prbs_rdlvl_done;
    assign complex_ocal_rd_victim_sel_w    = 'd0;
    assign complex_wrlvl_final_w           = 1'b0;
   end
endgenerate