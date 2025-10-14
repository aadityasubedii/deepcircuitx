  always @(posedge clk) begin
    if (rst) begin
      pi_en_stg2_f_timing     <= #TCQ 'b0;
      pi_stg2_f_incdec_timing <= #TCQ 'b0;
    end else if (pi_cnt_dec) begin
      pi_en_stg2_f_timing     <= #TCQ 'b1;
      pi_stg2_f_incdec_timing <= #TCQ 'b0;
    end else if (cal1_dlyce_cpt_r) begin
      if ((SIM_CAL_OPTION == "NONE") ||
          (SIM_CAL_OPTION == "FAST_WIN_DETECT")) begin
        
        pi_en_stg2_f_timing     <= #TCQ 1'b1;
        pi_stg2_f_incdec_timing <= #TCQ cal1_dlyinc_cpt_r;
      end else if (SIM_CAL_OPTION == "FAST_CAL") begin
        
        
        
        pi_en_stg2_f_timing     <= #TCQ 1'b1;
        pi_stg2_f_incdec_timing <= #TCQ cal1_dlyinc_cpt_r;
      end
    end else begin
      pi_en_stg2_f_timing     <= #TCQ 'b0;
      pi_stg2_f_incdec_timing <= #TCQ 'b0;
    end
  end