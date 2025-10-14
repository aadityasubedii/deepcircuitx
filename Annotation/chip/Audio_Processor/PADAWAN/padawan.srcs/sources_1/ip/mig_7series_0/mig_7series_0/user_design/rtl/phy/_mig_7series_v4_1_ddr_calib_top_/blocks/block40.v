  always @(posedge clk) begin
    if (rst) begin
      tempmon_pi_f_inc_r      <= #TCQ 1'b0;
      tempmon_pi_f_en_r       <= #TCQ 1'b0;
      tempmon_sel_pi_incdec_r <= #TCQ 1'b0;
    end else begin
      tempmon_pi_f_inc_r      <= #TCQ tempmon_pi_f_inc;
      tempmon_pi_f_en_r       <= #TCQ (tempmon_pi_f_inc | tempmon_pi_f_dec);
      tempmon_sel_pi_incdec_r <= #TCQ tempmon_sel_pi_incdec;
    end
  end