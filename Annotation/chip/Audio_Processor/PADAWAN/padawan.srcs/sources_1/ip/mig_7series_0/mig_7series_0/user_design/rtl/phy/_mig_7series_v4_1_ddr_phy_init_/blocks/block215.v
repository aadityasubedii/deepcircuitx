  always @(posedge clk) begin 
    rdlvl_last_byte_done_r <= #TCQ rdlvl_last_byte_done;  
    prbs_last_byte_done_r  <= #TCQ prbs_last_byte_done;  
    rdlvl_start_dly0_r     <= #TCQ {rdlvl_start_dly0_r[14:0], 
                                     rdlvl_start_pre};
    wrcal_start_dly_r     <= #TCQ {wrcal_start_dly_r[14:0],
                                     wrcal_start_pre};
    oclkdelay_start_dly_r <= #TCQ {oclkdelay_start_dly_r[14:0],
                                   oclkdelay_calib_start_pre};
    prech_done_dly_r       <= #TCQ {prech_done_dly_r[14:0], 
                                     prech_done_pre};
  end