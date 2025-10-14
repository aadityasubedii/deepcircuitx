always @ (posedge clk_i)
begin
    data_mode_r_a <= #TCQ data_mode_i;
    data_mode_r_b <= #TCQ data_mode_i;
    data_mode_r_c <= #TCQ data_mode_i;
end