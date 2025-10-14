always @ (posedge clk_i)
begin
    mode_load_pulse_r1 <= #TCQ  mode_load_pulse;

end