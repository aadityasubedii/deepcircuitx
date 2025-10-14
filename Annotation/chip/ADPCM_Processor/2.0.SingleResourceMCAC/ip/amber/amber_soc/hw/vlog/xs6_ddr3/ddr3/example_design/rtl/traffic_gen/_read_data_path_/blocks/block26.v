always @ (posedge clk_i)
begin

    cmp_data_r <= #TCQ cmp_data;
    cmp_data_r2 <= #TCQ cmp_data_r;
    cmp_data_r3 <= #TCQ cmp_data_r2;
    cmp_data_r4 <= #TCQ cmp_data_r3;
end