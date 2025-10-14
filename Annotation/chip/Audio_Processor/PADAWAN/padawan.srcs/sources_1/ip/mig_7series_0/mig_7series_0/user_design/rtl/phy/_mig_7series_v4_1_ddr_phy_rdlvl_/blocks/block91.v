  always @(posedge clk) begin
    pi_en_stg2_f     <= #TCQ pi_en_stg2_f_timing;
    pi_stg2_f_incdec <= #TCQ pi_stg2_f_incdec_timing;
  end