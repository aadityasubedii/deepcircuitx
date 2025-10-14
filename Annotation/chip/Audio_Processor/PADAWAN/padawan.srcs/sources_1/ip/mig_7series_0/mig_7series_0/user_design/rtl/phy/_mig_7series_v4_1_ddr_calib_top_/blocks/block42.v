  always @(posedge clk) begin
    if (rst) begin
      dbg_pi_f_inc_r      <= #TCQ 1'b0;
      dbg_pi_f_en_r       <= #TCQ 1'b0;
      dbg_sel_pi_incdec_r <= #TCQ 1'b0;
    end else begin
      dbg_pi_f_inc_r      <= #TCQ dbg_pi_f_inc;
      dbg_pi_f_en_r       <= #TCQ (dbg_pi_f_inc | dbg_pi_f_dec);
      dbg_sel_pi_incdec_r <= #TCQ dbg_sel_pi_incdec;
    end
  end