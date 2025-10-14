  always @(posedge clk) begin
    if (rst) begin
      pi_en_stg2_f_timing     <= #TCQ 'b0;
      pi_stg2_f_incdec_timing <= #TCQ 'b0;
    end else if (prbs_tap_en_r) begin

      pi_en_stg2_f_timing     <= #TCQ 1'b1;  
      pi_stg2_f_incdec_timing <= #TCQ prbs_tap_inc_r;
    end else begin
      pi_en_stg2_f_timing     <= #TCQ 'b0;
      pi_stg2_f_incdec_timing <= #TCQ 'b0;
    end
  end