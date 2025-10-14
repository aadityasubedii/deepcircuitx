always @ (posedge clk_i)
begin
if ((user_burst_cnt == 2 && data_port_fifo_rdy && FAMILY == "SPARTAN6")
    || (user_burst_cnt == 2 && data_port_fifo_rdy &&  FAMILY == "VIRTEX6")
   )

     user_bl_cnt_is_1 <= #TCQ 1'b1;
else
     user_bl_cnt_is_1 <= #TCQ 1'b0;
end