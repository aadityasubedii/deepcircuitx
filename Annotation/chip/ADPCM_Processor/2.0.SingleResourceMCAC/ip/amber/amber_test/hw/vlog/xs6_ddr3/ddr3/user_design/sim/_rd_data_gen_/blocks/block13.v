always @ (posedge clk_i)
begin
if (user_burst_cnt == 2 && data_rdy_i)
     next_count_is_one <= #TCQ 1'b1;
else
     next_count_is_one <= #TCQ 1'b0;
end