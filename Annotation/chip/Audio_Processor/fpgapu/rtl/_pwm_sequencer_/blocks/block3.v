  always @(*) begin
    case (r_phase)
    2'd0: r_output = 9'h000;
    2'd1: r_output = r_compare;
    2'd2: r_output = 9'h100;
    2'd3: r_output = 9'h100 - r_compare;
    endcase
  end