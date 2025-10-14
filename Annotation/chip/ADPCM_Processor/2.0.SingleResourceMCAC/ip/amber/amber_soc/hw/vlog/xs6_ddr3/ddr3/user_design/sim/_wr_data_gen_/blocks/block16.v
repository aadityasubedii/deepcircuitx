always @( posedge clk_i)
begin
if ((user_burst_cnt == 2 || (cmd_start && bl_i == 1 && FAMILY == "VIRTEX6")) && (fifo_not_full))
    data_wr_end_o <= #TCQ  1'b1;
else
    data_wr_end_o <= #TCQ  1'b0;
end