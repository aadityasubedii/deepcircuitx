  always @ (posedge clk)
    wrlvl_final_mux <= #TCQ complex_oclkdelay_calib_start_w? complex_wrlvl_final_w: wrlvl_final;
