  always @(posedge clk) begin
    if (rst) begin
      idelay_ce_r1  <= #TCQ 1'b0;
      idelay_ce_r2  <= #TCQ 1'b0;
      idelay_inc_r1 <= #TCQ 1'b0;
      idelay_inc_r2 <= #TCQ 1'b0;
    end else begin
      idelay_ce_r1  <= #TCQ idelay_ce_int;
      idelay_ce_r2  <= #TCQ idelay_ce_r1;
      idelay_inc_r1 <= #TCQ idelay_inc_int;
      idelay_inc_r2 <= #TCQ idelay_inc_r1;
    end
  end