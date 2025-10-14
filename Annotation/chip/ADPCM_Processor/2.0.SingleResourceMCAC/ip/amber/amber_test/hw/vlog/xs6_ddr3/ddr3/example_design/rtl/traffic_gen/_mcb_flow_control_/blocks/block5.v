always @ (posedge clk_i)
begin
if (rst_i[0])
    cmd_wr_pending_r1 <= #TCQ 1'b0;



else if ( last_word_wr_i )


    cmd_wr_pending_r1 <= #TCQ 1'b1;
else if (push_cmd)
    cmd_wr_pending_r1 <= #TCQ 1'b0;
end    