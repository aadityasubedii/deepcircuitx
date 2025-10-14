always @ (posedge clk_i)
begin
if ((user_burst_cnt == 2  && data_rdy_i )|| (cmd_start && bl_i == 1))
    u_bcount_2 <= #TCQ   1'b1;
else if (last_word_o)
    u_bcount_2 <= #TCQ   1'b0;
end    