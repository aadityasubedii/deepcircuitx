  always @(posedge i_clk) begin
    if (r_step_count == STEP-1) begin
      r_step_count <= 0;

      if (r_compare == 9'h100) begin
        r_compare <= 0;
        r_phase <= r_phase + 1;
      end else begin
        r_compare <= r_compare + 1;
      end
    end else begin
      r_step_count <= r_step_count + 1;
    end
  end