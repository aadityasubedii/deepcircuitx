  always @(posedge i_clk) begin
    case (r_vibrato_adjust_index)
      3'd00: r_vibrato_adjust <= 0;
      3'd01: r_vibrato_adjust <= -r_vibrato_depth_1;
      3'd02: r_vibrato_adjust <= -r_vibrato_depth_2;
      3'd03: r_vibrato_adjust <= -r_vibrato_depth_1;
      3'd04: r_vibrato_adjust <= 0;
      3'd05: r_vibrato_adjust <= r_vibrato_depth_1;
      3'd06: r_vibrato_adjust <= r_vibrato_depth_2;
      3'd07: r_vibrato_adjust <= r_vibrato_depth_1;

      default: r_vibrato_adjust <= 0;
    endcase
  end