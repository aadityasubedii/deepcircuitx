always @ (posedge clk_i) begin
 if (rst_i[0])
    first_load_pulse <= #TCQ 1'b1;
 else if (mode_load_pulse)
    first_load_pulse <= #TCQ 1'b0;
 else
    first_load_pulse <= #TCQ first_load_pulse;
 end