always @ (posedge clk_i)
begin
if (rst_i[9])
    cmd_fifo_rdy <= #TCQ  1'b1;
else if (xfer_cmd)
    cmd_fifo_rdy <= #TCQ  1'b0;
else if (!mcb_cmd_full)    
    cmd_fifo_rdy <= #TCQ  1'b1;
end