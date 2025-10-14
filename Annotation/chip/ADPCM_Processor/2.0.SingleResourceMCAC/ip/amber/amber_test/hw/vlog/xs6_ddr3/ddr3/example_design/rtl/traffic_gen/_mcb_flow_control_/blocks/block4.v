always @ (posedge clk_i)
begin
if (cmd_rd & push_cmd)
    cmd_rd_pending_r1 <= #TCQ 1'b1;
else if (xfer_cmd)
    cmd_rd_pending_r1 <= #TCQ 1'b0;

end    